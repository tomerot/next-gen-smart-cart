# Barcode Scanner Controller

The cart's barcode scanner service. Exclusively reads barcode scans and processes them. Built with Python (asyncio, WebSockets and evdev).

## Structure

```
bs_controller/
├── bs_controller.py      # Entry point
├── config.py             # Settings
├── logger.py             # Logging
├── client/               # Connection to the kiosk
├── scanner/              # Connection to the barcode scanner
├── requirements.txt
└── .env.example
```

| File | Purpose |
|---|---|
| `bs_controller.py` | Starts the controller, routes the kiosk's commands to the scanner and forwards scanner events to the kiosk. Disables scanning if the kiosk's session ends while scanning is on |
| `config.py` | Local WebSocket address and the scanner's USB vendor and product IDs. Reads the log folder from `.env` |
| `logger.py` | Logs to the console and to a separate log file for each kiosk session |
| `requirements.txt` | Python dependencies |
| `.env.example` | Required environment variables: log folder |

### `client/`

| File | Purpose |
|---|---|
| `client_handler.py` | Local WebSocket server (`localhost:8766`) that the kiosk connects to: receives commands and sends events |
| `client_message_handler.py` | Converts the kiosk's JSON messages into typed commands |
| `commands.py` | Commands the kiosk can send: enable scanning, disable scanning, end the session |

### `scanner/`

| File | Purpose |
|---|---|
| `scanner_handler.py` | Finds the scanner by its USB vendor and product IDs and takes exclusive access to it, so scans do not reach the kiosk's browser as keyboard input. While scanning is enabled, one task converts the scanner's key presses into barcodes, rejecting any with unrecognized characters, and another passes them on |
| `events.py` | Events sent to the kiosk: barcode scanned, invalid barcode, scanner failure |
