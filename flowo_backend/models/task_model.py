from  pydantic import BaseModel
from typing import List, Optional

# Blueprint
class TaskInput (BaseModel):
    '''
    this is blueprint class that fetches data from flutter
    descripiton would be optional so it not required


    '''
    id: str
    title: str
    description:Optional[str]=''
    
    priority:int=2
    is_completed: bool=False

class SuggestionRequest (BaseModel):
    tasks: List[TaskInput]

# what the backend sends back to flutter
class RankedTask (BaseModel):
    id:str
    title:str
    suggested_rank:int
    reasoning:str
    estimated_effort:str
    impact_level:str

class SuggestionsResponse(BaseModel):
    ranked_tasks:List[RankedTask]
    daily_focus:str
    disclamier:str #disclaimer
