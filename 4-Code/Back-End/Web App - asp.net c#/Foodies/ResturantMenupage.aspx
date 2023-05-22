<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResturantMenupage.aspx.cs" Inherits="Foodies.ResturantMenupage" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Restaurant Menu</title>
    <style>
        /* Nav bar styling */
        header {
            background-color: #333;
            color: white;
            height: 60px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        nav ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin: 0 10px;
        }

        nav a {
            color: white;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            padding: 10px;
        }

        nav a:hover {
            background-color: white;
            color: #333;
        }

        /* Body styling */
        main {
            max-width: 800px;
            margin: 50px auto;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="file"],
        input[type="submit"] {
            padding: 10px;
            font-size: 16px;
            border: 2px solid black;
            border-radius: 5px;
            margin-bottom: 20px;
            width: 100%;
            max-width: 400px;
        }

        input[type="submit"] {
            background-color: #333;
            color: white;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
        }

        input[type="submit"]:hover {
            background-color: #444;
        }

        /* Default styles for all screen sizes */
        .container {
            max-width: 800px;
            margin: 0 auto;
        }

        .form-group {
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="file"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button[type="button"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }

        /* Media queries for smaller screens */
        @media screen and (max-width: 600px) {
            .container {
                max-width: 100%;
                padding: 0 10px;
            }

            input[type="text"],
            input[type="file"],
            input[type="number"] {
                padding: 5px;
                font-size: 14px;
            }

            button[type="button"] {
                padding: 5px 10px;
                font-size: 14px;
            }
        }

        /* Global styles */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5;
        }

        /* Styles for Offers and Menu Items sections */

        section {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }

        h2 {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .offer-item,
        .menu-item {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
        }

        .offer-item h3,
        .menu-item h3 {
            font-size: 18px;
            margin-bottom: 5px;
        }

        .offer-item p,
        .menu-item p {
            font-size: 14px;
            margin-bottom: 5px;
        }

        .unit-price {
            font-weight: bold;
        }

        .quantity {
            display: flex;
            align-items: center;
            margin-top: 10px;
        }

        .quantity-input {
            width: 50px;
            text-align: center;
            border: none;
            border-bottom: 1px solid #ccc;
        }

        .plus-btn,
        .minus-btn {
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background-color: #ccc;
            color: #fff;
            font-size: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 5px;
            cursor: pointer;
        }

        .plus-btn:hover,
        .minus-btn:hover {
            color: #fff;
            background-color: #333;
        }

        .place-order-btn {
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 20px;
        }

        .place-order-btn:hover {
            background-color: #555;
        }

        footer {
            background-color: #333;
            color: #fff;
            text-align: center;
            padding: 20px;
        }
    </style>
</head>
<body>
    <header>
        <div class="restaurant-name">
            <h1>Restaurant Name</h1>
        </div>
        <div class="restaurant-logo">
            <!-- <img src="logo.png" alt="Restaurant Logo"> -->
        </div>
        <nav>
            <ul>
                <li><a href="homepage.aspx">Home</a></li>
                <li><a href="Myaccount.aspx">My Account</a></li>
                <li><a href="login.aspx">Logout</a></li>
    
            </ul>
        </nav>
    </header>
    
    
    <div class="container">
            <section class="offer-items">
                <h2>Offers</h2>
                <div class="offer-item">
                    <h3>Offer Item Name</h3>
                    <p>Offer Item Description</p>
                    <p>Unit Price: <span class="unit-price">50 EGP</span></p>
                    <div class="quantity">
                        <button class="minus-btn" type="button" >-</button>
                        <span class="quantity-value">1</span>
                        <button class="plus-btn" type="button">+</button>
                    </div>
                </div>
            </section>

            <div class="quantity">
                <!-- <button class="minus-btn" type="button">-</button>
                <input class="quantity-input" type="text" value="1" min="1" max="100">
                <button class="plus-btn" type="button">+</button> -->
            </div>

            <section class="menu-items">
                <h2>Menu Items</h2>
                <div class="menu-item">
                    <h3>Menu Item Name</h3>
                    <p>Menu Item Description</p>
                    <p>Unit Price: <span class="unit-price">100 EGP</span></p>
                    <div class="quantity">
                        <button class="minus-btn" type="button">-</button>
                        <span class="quantity-value">1</span>
                        <button class="plus-btn" type="button">+</button>
                    </div>
                </div>
            </section>

        <button class="place-order-btn" type="button">Place Order</button>
    
    
    </div> <br> <br>
    <footer>
        <p>&copy; 2023 Restaurant Name. All rights reserved.</p>
    </footer>  
    <script src="./assets/js/add.js"></script>
</body>


</html>
