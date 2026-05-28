#TODO: give conditions for running fast api
from fastapi import FastAPI
import asyncio

from fastapi.middleware.cors import CORSMiddleware

import uvicorn

from dotenv import load_dotenv
from app.ai_service import get_suggestions
from app.task_model import SuggestionRequest
asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())


app=FastAPI(title='Flowo backend')

# url=os.getenv(""),
app.add_middleware(
   CORSMiddleware,
   
   allow_origins=["*"],
   allow_methods=["*"],
   allow_headers=["*"]
),

@app.get("/")

def health_check():
   '''
   health check for fastapi authentication
   '''
   return{"status": "flowo backend running away"}

# @app.post('/suggestion')
@app.post("/suggestions")
def run(suggestion:SuggestionRequest):
   return  get_suggestions(tasks=suggestion.tasks)


