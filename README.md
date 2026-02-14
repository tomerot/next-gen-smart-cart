<p align="center">
  <img width="300" alt="The Smart Cart" src="https://github.com/user-attachments/assets/a5ab928c-8e59-492f-a4ac-7fdbef46b86b" />
</p>

<p align="center">
  A proof of concept of what can be the next generation of smart carts.<br>
  Carts that guide each shopper, speeding up the entire trip, not just the checkout.<br>
  Developed as our capstone project for the Software Engineering degree.
</p>

## Contents

- [The Problem](#the-problem)
- [Proposed Solution](#proposed-solution)

## The Problem

A trip to the supermarket takes longer than it needs to:

- **Reading Labels** - Shoppers with allergies or dietary needs, and anyone who wants to know what they are buying, stop at every product to read small, dense ingredient lists and nutrition labels.
- **Searching for Products** - When shoppers cannot find a product, they search the aisles and then look for a staff member to ask, sometimes only to learn it is out of stock.
- **Walking Back and Forth** - Products are picked up in a scattered order, especially when the shopper is unfamiliar with the supermarket.
- **Making Extra Trips** - Shoppers who forget their shopping list at home, or bring it but still forget to buy something they need, have to return for another trip.

## Proposed Solution

As smart carts already speed up the checkout by scanning products during shopping, they are a natural base to build on. On top of them, we added features that address each of the factors stated above that make shopping time-consuming.

### Smart Companion

An AI-powered voice assistant that saves shoppers from reading labels and searching for products. They can ask it to:

- Explain the ingredients and nutritional values of the last scanned product
- Suggest alternatives for the last scanned product that meet a request such as "less sugar" or "keeps me full". If there are any, the shopper can replace it with one of them
- Watch for their allergies and dietary needs. From then on, any scanned product that conflicts with these needs triggers a warning, along with safe alternatives to replace it with
- Mark where a product or a category is on a map of the supermarket. If the product is out of stock, the assistant says so instead of sending the shopper to an empty shelf

### List-Based Route Guidance

Shoppers prepare their shopping list in advance on the supermarket's website and load it onto the cart at any point, so there is no list to forget at home. The cart orders the list into a near-optimal route through the supermarket, draws it on a map and guides the shopper from one stop to the next, instead of picking up products in a scattered order. At checkout, it warns about list items that are not in the cart, so no product on the list is forgotten.

### Habit-Based Product Suggestions

At checkout, the cart suggests regularly bought products that the shopper is likely to need again, based on how often they usually buy each one and when they last bought it, so products missing from the list are not forgotten either. Each suggestion can be added to the cart directly.
