<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="confirmationpage.aspx.cs" Inherits="Foodies.confirmationpage" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>

<head>
  <title>Confirmation Page</title>
  <!-- <link rel="stylesheet" href="css.css"> -->
  <style>
    /* Nav bar styling */
    header {
      background-color: #333;
      color: 333;
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
      background-color: #333;
      text-decoration: none;
      font-size: 18px;
      font-weight: bold;
      padding: 10px;
    }

    nav a:hover {
      background-color: black;
      color: white;
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

    .container {
      width: 50%;
      margin: 50px auto;
    }

    form {
      border: 1px solid #ccc;
      padding: 20px;
      border-radius: 5px;
    }

    h1 {
      text-align: center;
      margin-bottom: 30px;
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    select,
    input[type="text"],
    input[type="file"],
    input[type="number"] {
      display: block;
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 16px;
      outline: none;
    }

    select:focus,
    input[type="text"]:focus,
    input[type="file"]:focus,
    input[type="number"]:focus {
      border-color: #000;
    }

    button[type="button"] {
      background-color: #007bff;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button[type="button"]:hover {
      background-color: #0062cc;
    }
    body {
  font-family: Arial, sans-serif;
  margin: 0;
  padding: 0;
}

h1 {
  margin: 20px 0;
  text-align: center;
}

.ordered-items,
.delivery-address,
.loyalty-points {
  margin: 20px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

.ordered-items h2,
.delivery-address h2,
.loyalty-points h2 {
  margin: 0;
}

.ordered-items ul {
  list-style: none;
  padding: 0;
}

.ordered-items li {
  margin-bottom: 10px;
}

#order-total-price {
  font-weight: bold;
}

.delivery-address label {
  display: block;
  margin-top: 10px;
}

#address-textbox {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}

.loyalty-points p {
  margin-top: 10px;
}

#confirm-order-button {
  display: block;
  margin: 20px auto;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background-color: #007bff;
  color: #fff;
  font-size: 16px;
  cursor: pointer;
}

#confirm-order-button:disabled {
  background-color: #ccc;
  cursor: not-allowed;
}

  </style>
</head>
<header>
  <header>
    <nav>
      <ul>
        <li><a href="homepage.aspx">Home</a></li>
        <li><a href="Myaccount.aspx">My Account</a></li>
        <li><a href="login.aspx">Logout</a></li>
      </ul>
    </nav>
  </header>
</header>

<body>
  <h1>Confirmation Page</h1>
  <div class="ordered-items">
    <h2>Ordered Items:</h2>
    <ul id="ordered-items-list">
      <!-- dynamic content from JavaScript -->
    </ul>
    <p>Total Price: <span id="order-total-price">0</span> EGP</p>
  </div>
  <div class="delivery-address">
    <h2>Delivery Address:</h2>
    <p>City: <span id="delivery-city"></span></p>
    <p>Area: <span id="delivery-area"></span></p>
    <label for="address-textbox">Address:</label>
    <input type="text" id="address-textbox" placeholder="Enter your address">
  </div>

  <button id="confirm-order-button" disabled>Confirm Order</button>
  <script src="./assets/js/js.js"></script>
</body>

</html>
