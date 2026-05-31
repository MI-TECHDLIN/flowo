# flowo

flowo this is a productivity tool that re ranks daily tasks based on importance and priority not everyone is good at decision, i created a feature for decision fatigue by re-ranking tasks

<img width="2426" height="1080" alt="Flowo — Banner 1080x1080" src="https://github.com/user-attachments/assets/a2a7e04d-8bbe-48af-be24-0008b5f6d896" />

## idea
 This project is inspired by my old school todo book that keeps tracks of my daily rountine

## how flowo works

- create a task
  <img width="720" height="1604" alt="Screenshot_20260531-170043" src="https://github.com/user-attachments/assets/c23ea4c7-5725-4d20-b477-2f96eef312f5" />

- task session for different objectives
  <img width="720" height="1604" alt="Screenshot_20260531-170459" src="https://github.com/user-attachments/assets/cab63e8c-6c6c-41e3-a4d7-5fc150f4229f" />

- for each tasks there is a focus session for producitivity
  <img width="720" height="1604" alt="Screenshot_20260531-170340" src="https://github.com/user-attachments/assets/00cd4fe7-9a49-45dd-b18a-0db7025eeef5" />

- re ranked tasks
  <img width="720" height="1604" alt="Screenshot_20260531-170424" src="https://github.com/user-attachments/assets/1b192594-f4c4-4e0c-9ec7-ae67664850ba" />

## video demo 
https://github.com/user-attachments/assets/c19748f7-da30-49cb-b9c5-3a6af87bafc8

for a better quality check out this drive:
https://drive.google.com/drive/folders/1RBh110BnmArqj2y9kWEB6pQ_tPiUc8NA?usp=drive_link

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
## Note
- for v1.0.0 the app size is 144mb because of a local server and complex functionality
- for v1.1.0 which used render for backend rending and api services, the app size is optimized to 50mb and refractored
- for delete feature for task card would be implemented in v.2.0.0
- custom authentication involving login and complex authentication state would be implemented in v2.0.0

Create a `.env` file in `flowo_backend/`:
```
GROQ_API_KEY='key.....'
```

Ai was used to generate UI design and for error debugging in firestore setup and groq skill implementation for strict rule
