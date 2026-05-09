from pydantic import BaseModel
from fastapi import FastAPI
from typing import Optional
import json
#task_model

class TaskInput(BaseModel):

    '''
    this basic blueprint of taskmodel
    '''
    id:str
    title:str #reuired
    description:Optional[str]=''
    priority:int #requireed
    is_completed:bool #required


class RankedTask(BaseModel):
    id:str
    title:str
    suggested_rank:int
    reasoning:str
    estimated_effort:str
    impact_level:str



class SuggestionRequest(BaseModel):
    tasks:list[TaskInput]


class SuggestionResponse(BaseModel):
    ranked_tasks:Optional[list[RankedTask]]='No task provided'
    daily_focus:str
    disclaimer:str




# time:str #required
#     duration:int #required


