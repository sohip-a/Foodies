<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Foodies.FAQ" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>FAQ - Food Web App</title>
  <style>
    /* Nav bar styles */
    nav {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #F2F2F2;
      height: 60px;
      padding: 0 20px;
    }
    nav a {
      text-decoration: none;
      color: #333333;
      font-weight: bold;
      margin: 0 10px;
    }
    nav a:hover {
      color: #FFA500;
    }
    nav img {
      height: 40px;
    }

    /* FAQ section styles */
    #faq-section {
      padding: 50px 20px;
      max-width: 800px;
      margin: 0 auto;
    }
    #faq-section h2 {
      text-align: center;
      font-size: 36px;
      margin-bottom: 50px;
    }
    .question {
      margin-bottom: 20px;
      font-size: 24px;
      font-weight: bold;
    }
    .answer {
      margin-bottom: 50px;
      font-size: 18px;
      line-height: 1.5;
    }
  </style>
</head>
<body>
  <!-- Nav bar -->
  <nav>
    <a href="#">Food Web App</a>
    <div>
      <a href="homepage.aspx">Home</a>
      <a href="MyAccount.aspx">My Account</a>
      <a href="loyaltypoints.aspx">Loyalty Points</a>
      <a href="login.aspx">Logout</a>
    </div>
  </nav>

  <!-- FAQ section -->
  <section id="faq-section">
    <h2>Frequently Asked Questions</h2>
   <!-- <div class="question">What is Food Web App?</div>
    <div class="answer">Food Web App is a platform for finding and ordering food from restaurants in your area.</div>

    <div class="question">How does it work?</div>
    <div class="answer">Users can search for nearby restaurants using the search feature, select their desired items from the restaurant's menu, and place an order for delivery or pickup.</div>

    <div class="question">Is there a minimum order amount?</div>
    <div class="answer">It depends on the restaurant's policy. Some restaurants may have a minimum order amount for delivery or pickup.</div>

    <div class="question">How can I pay for my order?</div>
    <div class="answer">Food Web App accepts various payment methods, including credit card, debit card, and online payment services such as PayPal.</div>
    -->
    <h2>
        The Frequently Asked Questions with their Answers should appear here
    </h2>
  </section>
</body>
</html>

