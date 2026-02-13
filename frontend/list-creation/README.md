# List Creation

A standalone demo app for creating shopping lists, which in a real deployment would be part of the supermarket's website. Shopping lists created with this functionality can be loaded onto the cart dashboard. Built with React (Vite and Tailwind CSS).

## Structure

```
list-creation/
├── index.html
├── vite.config.js
├── package.json
├── eslint.config.js
├── .env.example
└── src/
    ├── main.jsx          # Entry point
    ├── App.jsx           # Routes
    ├── pages/            # Screens
    ├── layouts/          # Screen layouts
    ├── components/       # UI components
    ├── services/         # Connection to the backend
    ├── config/           # Settings
    ├── utils/            # Helpers
    └── assets/           # Styles
```

| File | Purpose |
|---|---|
| `index.html` | HTML entry point |
| `vite.config.js` | Build settings and the `@` import alias for `src/` |
| `package.json` | Dependencies and scripts |
| `eslint.config.js` | Linting rules |
| `.env.example` | Required environment variables: backend address |
| `src/main.jsx` | Loads the fonts and icons and renders the app |
| `src/App.jsx` | Routes: the login screens and the list page. Any other address leads to the login |

### `pages/`

| File | Purpose |
|---|---|
| `PhoneInputPage.jsx` | Phone number entry |
| `OtpInputPage.jsx` | SMS code entry and verification. Keeps the user logged in for the browser session |
| `ListCreationPage.jsx` | Product search and the shopping list, saved to the backend |

### `layouts/`

| File | Purpose |
|---|---|
| `AuthLayout.jsx` | Login screens layout |

### `components/`

| File | Purpose |
|---|---|
| `list/SearchBar.jsx` | Product search, sent after the user stops typing |
| `list/ProductCard.jsx` | Search result |
| `list/ShoppingList.jsx` | All the items on the list |
| `list/ShoppingListItem.jsx` | Item on the list, with quantity controls |
| `ui/Modal.jsx` | Reusable dialog |
| `ui/ConfirmModal.jsx` | Confirmation dialog, such as before clearing the list |
| `ui/Toast.jsx` | Success and error messages |
| `ui/LoadingSpinner.jsx` | Loading indicator |
| `icons/Icon.jsx`, `icons/icons.config.js` | Icon component (Material Symbols) and icon names |

### `services/`

| File | Purpose |
|---|---|
| `authService.js` | Sending, resending and verifying login codes |
| `productService.js` | Product search |
| `shoppingListService.js` | Loading and saving the shopping list |

### `config/`, `utils/` and `assets/`

| File | Purpose |
|---|---|
| `config/api.js` | Backend address, and conversion of phone numbers between local and international format |
| `config/auth.js` | Phone number and login code settings |
| `utils/FontsLoader.js`, `utils/IconsLoader.js` | Load the fonts and icons |
| `utils/formatters.js` | Formatting of phone numbers, times and prices |
| `assets/global.css` | Global styles |
