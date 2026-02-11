# VAPI Configuration

The definition of the voice assistant hosted on VAPI: the system prompt that shapes its behavior and the tools it can call. Tool calls are handled by the backend through the `/vapi-webhook` endpoint.

## Files

| File | Purpose |
|---|---|
| `system_prompt.txt` | The assistant's instructions: its role, how to recognize the most recently scanned product, when to ask for clarification and when to end the call |
| `get_product_info.json` | Location and availability of a product, searched by name |
| `get_nutrition_details.json` | Ingredients and nutritional values of the most recent product |
| `get_ai_alternatives.json` | Alternatives to the most recent product that meet the shopper's request and respect their allergies and dietary needs |
| `add_allergies.json`, `remove_allergies.json` | Update the shopper's allergies |
| `add_dietary_needs.json`, `remove_dietary_needs.json` | Update the shopper's dietary needs |
| `end_call.json` | Ends the call when the request is unrelated to shopping, to prevent spam |
