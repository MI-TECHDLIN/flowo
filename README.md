# flowo

Flowo 
core idea:

this is a sugesstions produtivity tool that helps in every day task,track progress instead of blaming, make use of a ai features that sugeests daily todos and rank them in priority and importance, this project is inspired by my old school todo book that keeps tracks of my daily rountine;

this basically transfers your dailytasks to a SPA meaning Structured,Proitized and a Actionable plan in which users have full control of decision, in synopsis it a intelligent suggestion engine..........

How It Works

-User adds tasks with a title, description, and priority
-Tasks sync in real time to Firestore
-User can request AI suggestions at any time
-AI analyzes active tasks and returns a ranked list with reasoning, effort estimates, and impact levels
-User decides what to accept, modify, or ignore
-Optionally generates a structured daily plan (morning, focus block, light tasks)
-Progress is tracked over time — daily, weekly, monthly,yearly


tech stack:
langauage:Dart
framework:flutter
database:firestore
AI backend:fastApi
Ai  Model: OpenAi
State Manageement Provide+ChangeNotifer



Database:
colllection-user
       ↓
tasks



Addtask:Functionality
when a user adda new task......context.read updates the sub collection of

flowo Aritechture
Flutter App
    ↓ CRUD operations
Firebase Firestore (real-time sync)

Flutter App
    ↓ sends active task list
FastAPI Backend
    ↓ builds structured prompt
OpenAI GPT-4o Mini
    ↓ returns ranked suggestions + reasoning
FastAPI Backend
    ↓ parses and validates response
Flutter App
    ↓ displays suggestions (user decides)