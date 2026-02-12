# Voice Assistant Controller

The cart's audio service. Controls the cart's microphone and speaker to run the voice assistant: live conversations through VAPI and pre-recorded audio such as warnings. Built with Python (asyncio, WebSockets and PyAudio).

## Structure

```
va_controller/
├── va_controller.py      # Entry point
├── config.py             # Settings
├── logger.py             # Logging
├── client/               # Connection to the kiosk
├── vapi/                 # Connection to VAPI
├── utils/                # Pre-recorded audio and volume control
├── requirements.txt
└── .env.example
```

| File | Purpose |
|---|---|
| `va_controller.py` | Starts the controller, routes the kiosk's commands to VAPI, the audio player or the volume control, and forwards VAPI's events to the kiosk |
| `config.py` | Audio format (16 kHz mono PCM), VAPI call settings and the local WebSocket address. Reads the VAPI API key and assistant ID from `.env` |
| `logger.py` | Logs to the console and to a separate log file for each kiosk session |
| `requirements.txt` | Python dependencies |
| `.env.example` | Required environment variables: VAPI API key, VAPI assistant ID and log folder |

### `client/`

| File | Purpose |
|---|---|
| `client_handler.py` | Local WebSocket server (`localhost:8765`) that the kiosk connects to: receives commands and sends events |
| `client_message_handler.py` | Converts the kiosk's JSON messages into typed commands |
| `commands.py` | Commands the kiosk can send: start a call, stop a call, end the session, play an audio file, set and get the volume |

### `vapi/`

| File | Purpose |
|---|---|
| `vapi_handler.py` | Manages the call with VAPI: creates it through the VAPI API, streams audio over the call's WebSocket connection, sends the recent conversation and the user's details when the call starts, so the assistant keeps context between calls, and ends the call after 5 seconds of user silence |
| `audio_handler.py` | Microphone and speaker streams. Mutes the microphone while the assistant speaks, so it does not hear itself |
| `control_message_handler.py` | Converts VAPI's messages about the conversation into events |
| `events.py` | Events sent to the kiosk, which shows the conversation as a chat: call started or ended, assistant speaking, user transcript, assistant output, tool call and its result, user activity |

### `utils/`

| File | Purpose |
|---|---|
| `audio/audio_player.py` | Plays pre-recorded audio files on the speaker |
| `audio/assets/warning.wav` | Warning sound, played when a scanned product conflicts with the user's allergies or dietary needs |
| `volume/volume_handler.py` | Reads and sets the system volume through PulseAudio |
