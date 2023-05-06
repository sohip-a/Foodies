<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addOffer.aspx.cs" Inherits="Foodies.addOffer" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Add Offer</title>
    <link rel="stylesheet" href="cs.css">
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
    </style>
  </head>
  <body>
    <!-- Header with Nav Bar -->
    <header>
      <nav>
        <ul>
          <li><a href="homepage.aspx">Home</a></li>
          <li><a href="adminPage.aspx">Admin Panel</a></li>
          <li><a href="login.aspx">Logout</a></li>
        </ul>
      </nav>
    </header>
    
    <!-- Main Content -->
    <div class="container">
    <main>
      <h1>Add Offer</h1>
      <form id="addOfferForm" runat="server">
        <label for="restaurant">Restaurant:</label>
        <select id="restaurant" name="restaurant" runat="server">
          <option value="restaurant1">Restaurant 1</option>
          <option value="restaurant2">Restaurant 2</option>
          <option value="restaurant3">Restaurant 3</option>
          <option value="restaurant4">Restaurant 4</option>
        </select>
        <br>
        <label for="offer-name">Offer Name:</label>
        <input type="text" id="offerName" name="offer-name" runat="server">
        <br>
        <label for="offer-description">Offer Description:</label>
        <textarea id="offerDescription" name="offer-description" runat="server"></textarea>
        <br>
        <button type="submit" id="addOfferBtn" runat="server" onserverclick="addOfferBtnClick">Add</button>
      </form>
    </main>
  </div>
  </body>
</html>

