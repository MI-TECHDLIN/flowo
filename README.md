# flowo

A sugesstions produtivity tool that helps in every day task,  make use of a ai features that sugeests daily todos and rank them in priority and importance,

flowo you suggestion engine...

<img width="2426" height="1080" alt="Flowo — Banner 1080x1080" src="https://github.com/user-attachments/assets/a2a7e04d-8bbe-48af-be24-0008b5f6d896" />


## idea
 This project is inspired by my old school todo book that keeps tracks of my daily rountine;

this basically transfers your dailytasks to a SPA meaning Structured,Proitized and a Actionable plan in given end users full control of decision, in a synopsis it a intelligent suggestion engine

## how it works

- User adds tasks with a title description, and priority i.e descripton is oprional

- tasks sync in real time to Firestore

- user can request AI suggestions at any time

- AI analyzes active tasks and returns a ranked list with reasoning, effort estimates, and impact levels as suggestions

- for each tasks comes with a focus session for productivity it optional 

- optionally generates a structured daily plan (morning, focus block, light tasks)


- progress is tracked over time — daily, weekly, monthly,yearly
  
## video demo

Uploading flowo.mp4…

## Project Stack
- FLutter(Andriod)
- Firebase firestore + Auth
- FastAPI (Ai request)
- Groq (LLM)


## requirement 
- Flutter SDK 3.x 
- Python 3.10++ 
- firebase project 
- Groq API key (free version for now)


### Ui App design 
```bash
$ https://www.figma.com/design/0XSGJwBGhE4XLPOfOMFOqd/flowo
```

### Project structure

```r
flowo/
│
├── andriod/                              # andriod dependicies and config files
├── flowo_backend/                        # backend source code
├── images/                               # images for setup code
├── ios/                                  # ios dependicies and config files 
├── lib/                                  # frontend source code
├── macos/                                # macos dependicies and config files
├── test/                                 # unit tests for flutter build config files
├── web/                                  # web dependicies and config files
├── windows/                              # windows dependicies and config files
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── devtools_options.yaml
├── firebase.json
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

### Flutter app
```bash
$ git clone https://github.com/MI_TECHDLIN/flowo.git

$ cd flowo

flutter pub get
```

get your `google-servicees.json` from firebase to `andriod.app/`. 


Run the app:
```bash
flutter run
```

### Backend
```bash
cd flowo_backend
python -m venv venv
venv\Scripts\activate       
pip install -r requirements.txt
```

Create a `.env` file in `flowo_backend/`:
```
GROQ_API_KEY=your_key_here
```

Start the server:
```bash
use  python run in the main.py it already configured to start running
```


Update the base url in `lib/data/services/ai_service.dart` to point to your backend.

---


## NB

this version v1.0.0 has a hardcoded test user ID it would be modified firestore Authentication in v2.0 all task are stored in firestore 

if you want to test update the `lib/main.dart`:

```dart
const String kTestUserId = 'any_custom_id_here';
```


## Build APK

```bash
flutter build apk --debug
```

the app would be at `build/app/outputs/flutter-apk/app-debug.apk`.

Ai was used to generate UI design and for error debugging in firestore setup and groq skill implementation for strict rule
