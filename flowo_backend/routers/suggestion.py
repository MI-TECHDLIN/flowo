from fastapi import APIRouter, HTTPException
from models.task_model import SuggestionsRequest, SuggestionsResponse

import os 
import json
from openai import OpenAI
from  dotenv import load_dotenv
from models.task_model import TaskInput,SuggestionsResponse,RankedTask

load_dotenv()
client=OpenAI(api_key=os.getenv
              ("OPENNAI_API_KEY"))

def build_prompt(task:list[TaskInput])-> str:
    task_list = "\n".join([
       f"- ID: {t.id} | Title: {t.title} | Description: {t.description} | Priority: {t.priority}"
        for t in task
  ])
    return f"""
You are Flowo, an AI productivity assistant. 
Analyze the following tasks and return a JSON response ranking them by importance.
Tasks:
{task_list}

Return ONLY a valid JSON object in this exact format:
{{
  "ranked_tasks": [
    {{
      "id": "task_id_here",
      "title": "task title here",
      "suggested_rank": 1,
      "reasoning": "Clear explanation of why this task should be done first",
      "estimated_effort": "30 mins",
      "impact_level": "High"
    }}
  ],
  "daily_focus": "One sentence summarizing what the user should focus on today",
  "disclaimer": "These are suggestions only — you are always in control of your priorities."
}}

Rules:
- Rank by impact and urgency, not just the user's original priority number
- Keep reasoning short, helpful, and encouraging
- estimated_effort should be realistic
- impact_level must be one of: High, Medium, Low
- Return ALL tasks in the ranked list
- Return ONLY the JSON object, no extra text
"""


async def get_suggestions(tasks: list[TaskInput]) -> SuggestionsResponse:
    prompt = build_prompt(tasks)

    response = client.chat.completions.create(
        model="gpt-4o-mini",  # fast and cheap, perfect for this
        messages=[
            {
                "role": "system",
                "content": "You are a helpful productivity assistant. Always respond with valid JSON only."
            },
            {
                "role": "user",
                "content": prompt
            }
        ],
        temperature=0.3,  # lower = more consistent, less random
        response_format={"type": "json_object"}  # forces JSON output
    )

    raw =response.choices[0].message.content,
    data=json.loads(raw),
#ranked sort it based on index

    return SuggestionsResponse(
        ranked_tasks=[RankedTask(**t) for t in data["ranked_tasks"]],
        
        daily_focus=data["daily_focus"],
        disclamier=data["disclaimer"],
    )




router = APIRouter()

@router.post("/suggestions", response_model=SuggestionsResponse)
async def suggest_priorities(request: SuggestionsRequest):
    if not request.tasks:
        raise HTTPException(status_code=400, detail="No tasks provided")

    # Filter out completed tasks — no point ranking finished work
    active_tasks = [t for t in request.tasks if not t.is_completed]

    if not active_tasks:
        raise HTTPException(
            status_code=400,
            detail="No active tasks to rank"
        )

    try:
        result = await get_suggestions(active_tasks)
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))