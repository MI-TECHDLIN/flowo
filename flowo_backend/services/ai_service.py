import os
import json
from dotenv import load_dotenv
from models import task_model
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

groq_object=Groq(api_key=os.getenv("api_key"))