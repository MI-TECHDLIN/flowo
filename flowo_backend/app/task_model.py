from pydantic import BaseModel
from fastapi import FastAPI
from typing import Optional

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


class rankedist(BaseModel):
    id:str
    title:str
    suggested_rank:str
    reasoninig:str
    estimated_effort:str
    impact_level:str



class SuggestionRequest(BaseModel):
    tasks:list[TaskInput]





class suggestionResponse(BaseModel):
    rankedlist:list[rankedist]
    reasons:str
    disclameer:str




# time:str #required
#     duration:int #required