#TODO: give conditions for running fast api
from fastapi import FastAPI
import asyncio
from fastapi.middleware.cors import CORSMiddleware
asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
import uvicorn

from groq import Groq
from dotenv import load_dotenv
import os



app=FastAPI(title='Flowo backend')

load_dotenv()



apikey=os.getenv("API_KEY")
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



@app.post("/generate")
async def generate(prompt:str):
   
   response=   client.chat.completions.create(
      messages=[

         {
            "role":"system",
            "content":"you are matchmatics teacher aided asssitant you are to attend to only maths related problems, strictly dont go beyound "

         


         },
         {
            "role":"user",
            "content":prompt,

         }

      ],
      model="llama-3.3-70b-versatile",

   )
   answer=response.choices[0].message.content
   return{
      "response":answer
   }


if __name__ == "__main__":
   import uvicorn
   uvicorn.run("main:app",host="127.0.0.1",port=8000,reload=True)

