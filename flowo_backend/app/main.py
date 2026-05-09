#TODO: give conditions for running fast api
from fastapi import FastAPI
import asyncio

from fastapi.middleware.cors import CORSMiddleware

import uvicorn

from dotenv import load_dotenv
from ai_service import get_suggestions
from task_model import SuggestionRequest
asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())


app=FastAPI(title='Flowo backend')

# url=os.getenv(""),
app.add_middleware(
   CORSMiddleware,
   allow_origins=["*"],
   allow_methods=["*"],
   allow_headers=["*"]
)

@app.get("/")

def health_check():
   '''
   health check for fastapi authentication
   '''
   return{"status": "flowo backend running away"}

# @app.post('/suggestion')
@app.post("/suggestions")
async def run(suggestion:SuggestionRequest):
   return  get_suggestions(tasks=suggestion.tasks)







if __name__ == "__main__":
   import uvicorn
   uvicorn.run("main:app",host="127.0.0.1",port=8000,reload=True)



