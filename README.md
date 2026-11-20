# Flowo

flowo this is a productivity tool that re ranks daily tasks based on importance and priority not everyone is good at decision, i created a feature for decision fatigue by re-ranking tasks

<img width="2426" height="1080" alt="Flowo — Banner 1080x1080" src="https://github.com/user-attachments/assets/a2a7e04d-8bbe-48af-be24-0008b5f6d896" />

## Idea
 This project is inspired by my old school todo book that keeps tracks of my daily rountine

## How flowo works

-onboarding screen
<img width="720" height="1604" alt="Screenshot_20261120-225539" src="https://github.com/user-attachments/assets/421e0b13-6b66-460f-a40e-b6871daedce1" />

- create a task
  <img width="720" height="1604" alt="Screenshot_20260531-170043" src="https://github.com/user-attachments/assets/c23ea4c7-5725-4d20-b477-2f96eef312f5" />

- task session for different objectives
  <img width="720" height="1604" alt="Screenshot_20260531-170459" src="https://github.com/user-attachments/assets/cab63e8c-6c6c-41e3-a4d7-5fc150f4229f" />

- for each tasks there is a focus session for producitivity
  <img width="720" height="1604" alt="Screenshot_20260531-170340" src="https://github.com/user-attachments/assets/00cd4fe7-9a49-45dd-b18a-0db7025eeef5" />

- re ranked tasks
 <img width="720" height="1604" alt="Screenshot_20261120-224038" src="https://github.com/user-attachments/assets/6bb89955-178d-48b9-a2cd-af36778e564f" />

- profile screen
  <img width="720" height="1604" alt="Screenshot_20261120-224042" src="https://github.com/user-attachments/assets/03021173-c3d5-4702-8b85-0ef3db93006e" />

- task field 
- <img width="720" height="1604" alt="Screenshot_20261120-224016" src="https://github.com/user-attachments/assets/06817bdd-31bd-45fe-b97f-8525f310890a" />



## Video demo 
https://github.com/user-attachments/assets/b6490832-5e9c-4fa9-b013-f754637a351d


for a better quality check out this drive:
https://drive.google.com/file/d/1vi-dZl1CBHU4Kbnb84zYIqjaoj4mQYyC/view?usp=sharing

## Stack 
- Flutter SDK 
- Python 3.10++ 
- firebase project 
- Groq API key
- Render
  
### Ui App design 
```bash
$ https://www.figma.com/design/0XSGJwBGhE4XLPOfOMFOqd/flowo
```

### Flutter app
```bash
$ git clone https://github.com/MI_TECHDLIN/flowo.git

$ cd flowo

flutter pub get
```
Run the app:
```bash
flutter run
```


## Installation
- when installing a pop up shows 'install from unknown sources' this must be allowed


## Note
- minimum SDK - 35 for andriod 
- for v1.2.0 the app size is 144mb because of a local server and complex functionality
- for v1.2.0 which used render for backend rending and api services, the app size is optimized to 56mb and refractored
- delete feature is configured
- changed ai model from ollama to gpt-0SS
- Login and auth system functional and a full auth system
- profile screen feature with color selctor
  
  

Create a `.env` file in `flowo_backend/`:
```
GROQ_API_KEY='key.....'
```
## Ai usuage 
Ai was used to generate UI design and for error debugging in firestore setup and groq skill implementation for strict rule
