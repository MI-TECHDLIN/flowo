#TODO: give conditions for running fast api
from fastapi import FastAPI
import asyncio
from task_model import SuggestionRequest
from fastapi.middleware.cors import CORSMiddleware
asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
import uvicorn

from groq import Groq
from dotenv import load_dotenv
import os



app=FastAPI(title='Flowo backend')

load_dotenv()



apikey=os.getenv("api_key")
# url=os.getenv(""),
app.add_middleware(
   CORSMiddleware,
   allow_origins=["*"],
   allow_methods=["*"],
   allow_headers=["*"],
),
client=Groq(
      api_key=apikey,
   )

@app.get("/")

def health_check():
   '''
   health check for fastapi authentication
   '''
   return{"status": "flowo backend running"}


@app.post("/suggestion")
async def getsuggesttion(suggestion:SuggestionRequest ):
  ra= client.chat.completions.create(
      messages=[
         {
            'role':"system",
            'content':"""
you are a that helps in every day task and todo in a Structured,Proitized and a Actionable plan based on importance and priority and other input. you should return only list of tasks in this in a json format no extra text

{
ranked_tasks:[
    {
        "id": "test01",
        "title": "read books in the morning",
        "description": "try to read ",
        "priority": 3,
        "is_completed": false
      }
    {
        "id": "test02",
        "title": "go to school in the morning",
        "description": "try to waake up early ",
        "priority": 3,
        "is_completed": false
      }
]
    daily_focus:str
    disclaimer:str
}
"""
         },
                 
{
   "role":"user",
   "content":f'{suggestion}'
}
      ],
      model='llama-3.3-70b-versatile',
   )
 
  return {'response': {ra.choices[0].message.content}}


 






if __name__ == "__main__":
   import uvicorn
   uvicorn.run("main:app",host="127.0.0.1",port=8000,reload=True)



