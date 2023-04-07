<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="Foodies.homepage" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta name="description" content="Web Design Agency ">
  <meta name="keywords" content="HTML, CSS, JavaScript">
  <title>homepage</title>
  <!-- Bootstrap CDN link -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <!-- Font Awesom Css file -->
  <link rel="stylesheet" href="assets/css/all.min.css">
  <!-- Main Style File -->
  <link rel="stylesheet" href="assets/css/home.css">
  <!-- Google Fonts Open sans font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;700&display=swap" rel="stylesheet">

</head>

<body>
    <form id="homePageForm" runat="server">
    <!-- Start Header -->
    <div class="home" id="home">
        <header class="layer">
            <nav class="navbar navbar-expand-lg sticky-top ">
                <div class="container">
                    <!-- Website logo -->
                    <!-- Website logo -->
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main"
                            aria-controls="main" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa-solid fa-bars-staggered"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="main">
                        <div class="navbar-nav mx-auto">
                            <a class="nav-link active mx-3" aria-current="page" href="homepage.aspx">Home</a>
                            <a class="nav-link mx-3" runat="server" onserverclick="myAccClick">My Account</a>
                            <a class="nav-link mx-3" runat="server" onserverclick="loyaltyClick">loyalty points</a>
                            <a class="nav-link mx-3" href="login.aspx">Logout</a>

                        </div>

                    </div>
                </div>
            </nav>
            <div class="landing">
                <div class="text-center">
                    <div class="">

                            <asp:DropDownList ID="areaList" runat="server" AutoPostBack="True" onselectedindexchanged="afterAreaSelection"></asp:DropDownList>
                    </div>
                    <div class="">

                         <asp:DropDownList ID="neighborhoodList" runat="server" AutoPostBack="True"></asp:DropDownList>
                    </div>
                    <button class="btn btn-primary ms-2 px-5" runat="server" onserverclick="goBtnClicked" type="submit">Go!</button>                
                </div>
            </div>
        </header>
    </div>
    <!-- End Header -->





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"></script>
  </form>
</body>

</html>
