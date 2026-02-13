# Kiosk

The cart's dashboard, optimized for touchscreen use with a locked-down kiosk mode, touch scrolling and on-screen keypads. Built with React (Vite and Tailwind CSS).

## Structure

```
kiosk/
├── index.html
├── vite.config.js
├── package.json
├── eslint.config.js
└── src/
    ├── main.jsx          # Entry point
    ├── App.jsx           # Routes and shared state
    ├── pages/            # Screens
    ├── layouts/          # Screen layouts
    ├── features/         # Dashboard sections
    ├── components/       # Reusable UI components
    ├── context/          # Shared state
    ├── services/         # Connection to the backend and the controllers
    ├── hooks/            # Barcode scanning
    ├── config/           # Settings
    ├── data/             # Static data
    ├── utils/            # Helpers
    └── assets/           # Styles and images
```

| File | Purpose |
|---|---|
| `index.html` | HTML entry point, loads the fonts and icons |
| `vite.config.js` | Build settings, the `@` import alias for `src/`, and a development proxy to the backend |
| `package.json` | Dependencies and scripts |
| `eslint.config.js` | Linting rules |
| `src/main.jsx` | Turns on kiosk mode and renders the app |
| `src/App.jsx` | Routes, the shared state providers and the animated background of the start screens |

### `pages/`

| File | Purpose |
|---|---|
| `LandingPage.jsx` | Welcome screen |
| `PhoneInputPage.jsx` | Phone number entry |
| `OtpInputPage.jsx` | SMS code entry and verification |
| `DashboardLoadingPage.jsx` | After login: loads the user's status (saved cart, saved list) and connects to the controllers |
| `DashboardPage.jsx` | Main screen. Keeps reconnecting to the controllers while it is open |

### `layouts/`

| File | Purpose |
|---|---|
| `LandingLayout.jsx` | Welcome screen layout |
| `AuthLayout.jsx` | Login screens layout |
| `LoadingLayout.jsx` | Loading screen layout |
| `DashboardLayout.jsx` | The dashboard: navigation rail, the active view (grocery list or Smart Companion) and the cart. Also starts barcode scanning and cart auto-save |

### `features/`

| Folder | Purpose |
|---|---|
| `dashboard/` | All dashboard dialogs, and hooks for checkout, leaving the session, the shopping route, profile, help and audio settings |
| `grocery-list/` | The loaded shopping list: next stop, items to collect, collected and skipped items |
| `navigation/` | The dashboard's navigation rail, its views and the fade between them |
| `smart-companion/` | The voice assistant view: the chat and the button that starts and stops a conversation |

### `components/`

| Folder | Purpose |
|---|---|
| `cart/` | Cart with touch scrolling, product cards with quantity controls, checkout bar |
| `chat/` | Chat and its bubbles, start and stop bar, product location, conflicts and alternatives, loading text |
| `map/` | Store map with location and route markers |
| `modal/` | Dialogs: barcode entry, checkout suggestions, checkout success, warning, message, profile, shopping route, audio settings, help |
| `navrail/` | Navigation rail and its buttons |
| `numpad/`, `digitInput/` | On-screen numpad and digit boxes for phone, code and barcode entry |
| `icons/` | Icon component (Material Symbols) and icon names |
| `shadergradient/` | Animated gradient background of the start screens |

### `context/`

| File | Purpose |
|---|---|
| `UserContext.jsx` | Logged-in user: allergies, dietary needs, saved cart and saved list |
| `CartContext.jsx` | Cart items, quantities and total, and whether the cart changed since it was last saved |
| `VoiceAssistantContext.jsx` | Voice conversations: messages, tool calls, conflicts and alternatives, the highlighted product and alert sounds |

### `services/`

| File | Purpose |
|---|---|
| `authService.js` | Sending and verifying login codes |
| `userStatusService.js` | User status after login |
| `productService.js` | Product scanning and data |
| `shoppingListService.js` | Loading the shopping list |
| `checkoutService.js` | Checkout and suggestions |
| `cartAutoSaveService.js` | Saves the cart to the backend every 3 minutes if it changed, so it can be restored after a crash |
| `barcodeControllerService.js` | WebSocket connection to the barcode scanner controller, with automatic reconnection |
| `voiceControllerService.js` | WebSocket connection to the voice assistant controller, with automatic reconnection |
| `controllerService.js` | Connects to and disconnects from both controllers together |

### `hooks/`, `config/`, `data/`, `utils/` and `assets/`

| File | Purpose |
|---|---|
| `hooks/useBarcodeScanner.js` | Turns scanned barcodes into cart items: fetches the product with the user's allergy and diet check, or increases the quantity of a product already in the cart |
| `config/api.config.js` | Backend address and endpoints |
| `config/auth.config.js` | Phone number and login code settings |
| `config/preferences.config.js` | Display names of allergies and dietary needs |
| `config/ui.config.js` | Animation timings |
| `data/storeLayout.json` | Store grid drawn by the store map |
| `data/toolCallMessages.js` | Messages shown while the voice assistant runs a tool |
| `utils/KioskMode.js` | Blocks keyboard input, text selection and the context menu |
| `utils/formatters.js` | Formatting of phone numbers, times, prices, allergies and dietary needs |
| `assets/global.css` | Global styles and animations |
| `assets/smart-cart-bg.png` | Welcome screen background |
| `assets/help_imgs/` | Help guide images |
