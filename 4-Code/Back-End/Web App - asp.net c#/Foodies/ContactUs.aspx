<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Foodies.ContactUs" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <style>
      /* Header styles */
      header {
        background-color: #f2f2f2;
        padding: 10px;
        display: flex;
        justify-content: space-between;
        align-items: center;
      }
      .logo {
        font-size: 28px;
        font-weight: bold;
        color: #333;
        text-decoration: none;
      }
      nav {
        display: flex;
        align-items: center;
      }
      nav a {
        display: inline-block;
        padding: 10px;
        color: #333;
        text-decoration: none;
        font-size: 16px;
        font-weight: bold;
      }
      nav a:hover {
        background-color: #333;
        color: #fff;
      }
      /* Contact Us styles */
      h1 {
        text-align: center;
        margin-top: 50px;
      }
      form {
        width: 50%;
        margin: 50px auto;
      }
      input[type=text], textarea {
        width: 100%;
        padding: 12px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
        margin-top: 6px;
        margin-bottom: 16px;
        resize: vertical;
      }
      label {
        font-weight: bold;
      }
      input[type=submit] {
        background-color: #333;
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      input[type=submit]:hover {
        background-color: #555;
      }
    </style>
  </head>
  <body>
    <header>
      <a href="homepage.aspx" class="logo">Food App</a>
      <nav>
        <a href="homepage.aspx">Home</a>
        <a href="MyAccount.aspx">My Account</a>
        <a href="login.aspx">Logout</a>
      </nav>
    </header>
    <h1>Contact Us</h1>
    <form>
      <label for="name">Name</label>
      <input type="text" id="name" name="name" required>

      <label for="email">Email</label>
      <input type="text" id="email" name="email" required>

      <label for="message">Message</label>
      <textarea id="message" name="message" required></textarea>

      <input type="submit" value="Submit">
    </form>
  </body>
</html>

