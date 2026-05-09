import os
import json
from dotenv import load_dotenv
from task_model import TaskInput,SuggestionRequest,SuggestionResponse,RankedTask
from groq import Groq

'''
package: 
-went for a leeser free ai module because of
for a start making use of groq
'''

load_dotenv()
'''
env path: flowo_backend/app/.env
'''

todo_task=TaskInput.is_completed=False



completed_task=TaskInput.is_completed=True


groq_object=Groq(api_key=os.getenv("api_key"))



def prompt_func(tasks: list[TaskInput])->str:
   
   ''' 
   this functions basically fetches list of taskINput and iterates 
   through it and comprehensively return and formating the list as string
   in a straight line
   '''
   listtasks=[]
   liner=list

   for task in tasks:
       if task.is_completed != completed_task:
          listtasks.append(f'Taskid:{task.id} | taskTitle:{task.title} | taskdescription: {task.description} | taskprority {task.priority} | iscompleted: {task.is_completed}')
          liner='\n'.join(listtasks)
       
        
       

       if liner=='':
           liner='No task Provided'
       
        
       


   print(liner)

   return f"""
    You are Flowo, an AI productivity assistant.
    Analyze the following tasks and return a JSON response ranking them
    by importance.
    if task is completed or is equal to true reomve task or if no task provided return no task provided
    Tasks:
    {liner}

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

  -Rank by impact and urgency, not just the user's original priority number
  -Keep reasonning short, helpful and encouraginng 
  -estimated_effort should be realisitic
  -impact_level must be one of: High, Medium, Low
  -Return ONLY tbe JSON objrct, no extra text

  """
def get_suggestions(tasks:list[TaskInput])->SuggestionResponse:
   
    prompt=prompt_func(tasks)
    

    groq_response=groq_object.chat.completions.create(
        model='llama-3.3-70b-versatile',
        messages=[
            {
                "role":"system",
                "content":"you are helpful productivity assisitant respond only in a valid JSON only"
            },
            {
                "role":"user",
                "content":prompt
            }
        ],
        response_format={"type":"json_object"}

    )

    raw=groq_response.choices[0].message.content
    response_data=json.loads(raw)
    

    return SuggestionResponse(
        #return list of task......
        ranked_tasks=[RankedTask(**t) for t in response_data["ranked_tasks"]
                  
                      ],
        daily_focus=response_data["daily_focus"],
        disclaimer=response_data["disclaimer"]
    )

