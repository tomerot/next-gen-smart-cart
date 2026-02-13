# Setup

The complete installation and runtime configuration of the cart's software stack, using Bash scripts, systemd services and a cron job.

## Structure

```
setup/
├── install/      # First-time installation
├── scripts/      # Update, kiosk browser and log cleanup
├── systemd/      # Services started on boot
└── autostart/    # Desktop autostart entry
```

### `install/`

| File | Purpose |
|---|---|
| `prod-install.sh` | Sets up a new cart: creates its deploy key, clones a private deployment repository (the kiosk's production build, the controllers and this folder), creates a virtual environment for each controller, asks for the VAPI credentials and writes the controllers' `.env` files, installs the services and the kiosk autostart, schedules the nightly update and reboots |

### `scripts/`

| File | Purpose |
|---|---|
| `update.sh` | Nightly update, at 3 AM: pulls the deployment repository, updates the controllers' dependencies, refreshes the service and autostart files and reboots |
| `kiosk.sh` | Opens the kiosk in Chromium in kiosk mode, and reopens it if the browser closes |
| `cleanup-logs.sh` | Deletes controller log files older than 3 days |

### `systemd/`

| File | Purpose |
|---|---|
| `va-controller.service` | Runs the voice assistant controller, with access to the desktop user's audio server. Restarted on failure |
| `bs-controller.service` | Runs the barcode scanner controller. Restarted on failure |
| `kiosk-server.service` | Serves the kiosk's production build on port 8000. Restarted on failure |
| `cleanup-logs.service` | Runs the log cleanup on every boot |

### `autostart/`

| File | Purpose |
|---|---|
| `kiosk.desktop` | Starts `kiosk.sh` when the desktop session starts |
