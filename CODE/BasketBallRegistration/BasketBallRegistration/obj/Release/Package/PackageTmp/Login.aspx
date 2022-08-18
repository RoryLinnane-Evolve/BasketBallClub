<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BasketBallRegistration.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>RewardNet - Rewards & Recognition Portal</title>
    <meta name="Description" content="Easy-to-use reward and recognition programmes from Gift Innovations designed to increase employee motivation and engagement."/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"/>
    <script type="text/jscript" src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <script type="text/jscript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script type="text/jscript" src="js/backstretch.min.js"></script>
    <script  type="text/jscript">
        jQuery(document).ready(function ($) {
            $.backstretch([
      "App_Themes/Images/homepageBackground.jpg"
  	], { duration: 2500, fade: 1000 });
        });
    </script>
    <script  type="text/jscript">
        function Error() {
            alert("Your UserName or passowrd is incorrect.")
        }
    </script>
    <style type="text/css">

       #frmDataP{margin-right:20px;}               

        @import url(https://fonts.googleapis.com/css?family=PT+Sans:400,700|Lato:100,300,400);
        
        html
        {
            height: 100%;
        }
        
        body
        {
            background: url(App_Themes/Images/homepageBackground.jpg) no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }
        @media (min-width: 979px)
        {
            body
            {
                padding-top: 80px;
            }
        }
        
        .navbar .brand
        {
            margin-top: 20px;
            padding-bottom: 8px;
            max-height: 40px;
            width: auto;
        }
        
        .navbar .navbar-inner
        {
            height: 100px;
            background: white;
            filter: none;
        }
        
        .navbar .nav
        {
            margin-top: 20px;
        }
        
        .wrapper
        {
            margin-top: 150px;
            margin-bottom: 20px;
        }
        
        .form-signin
        {
            max-width: 420px;
            padding: 30px 38px 66px;
            margin: 0 auto;
            background-color: #eee;
            border: 3px dotted rgba(0,0,0,0.1);
            box-shadow: 0px 0px 15px #000;
        }
        
        .form-signin-heading
        {
            text-align: center;
            font-weight:bold;
        }
        
        .form-control
        {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
        }
        
        input[type="text"]
        {
            margin-bottom: 0px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }
        
        input[type="password"]
        {
            margin-bottom: 20px;          
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
        
        .colorgraph
        {
            height: 7px;
            border-top: 0;
            background: #c4e17f;
            border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
        
        footer.white
        {
            padding-top: 20px;
            height: 50px;
            background: white;
            text-align: center;
        }
        
        .login-form legend
        {
            font-family: 'Lato' , Helvetica, sans-serif;
            font-size: 36px;
            font-weight: 300;
            color: #333333;
            -webkit-font-smoothing: subpixel-antialiased;
        }
        
        .login-form label
        {
            font-family: 'Lato' , Helvetica, sans-serif;
            font-size: 20px;
            color: #333333;
            font-weight: 300;
        }
        
        footer.navbar-fixed-bottom
        {
            font-size: 16px;
            font-family: "PT Sans" , Arial, Helvetica, sans-serif;
            line-height: 18px;
            height: 55px;
            font-weight: 400;
        }
        
        @media (max-width: 980px)
        {
        
            .navbar
            {
                height: auto;
                margin-bottom: 0;
            }
        
            .navbar .brand
            {
                margin-top: 0;
            }
        
            .navbar .navbar-inner
            {
                height: auto;
            }
        
        
            .navbar .nav > li > a:hover
            {
                color: white;
            }
        
        
            #login-wraper
            {
                position: relative;
                top: 0;
                margin-top: 25px;
            }
        }
        @media (max-width: 495px)
        {
            #login-wraper
            {
                width: auto;
                height: auto;
                margin-left: 0;
                margin-right: 0;
                left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <form id="Form2" runat="server">
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"><span
                    class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </a><!-- <a class="brand" href="frmLogon.aspx">
                   <img  src="App_Themes/Images/RewardNet_2021.png" alt="RewardNet" style="margin-top:8px;"></a> -->
                <ul class="nav navbar-nav navbar-right">
                    <li><a  id="frmDataP"  href="frmDataProtection.aspx">Privacy Policy </a></li>
                </ul>
            </div>
        </div>

        

        <div class="wrapper">
            <div class="form-signin">
                <form action="" method="post" name="Login_Form" class="form-signin">
                <h4 class="form-signin-heading">
                    Please login </h4>
                <hr class="colorgraph">
                 <h5>Username</h5>
                <asp:TextBox ID="txtUserName" class="form-control" runat="server" placeholder="Username"></asp:TextBox>
                <h5>Password</h5>
                <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
                <asp:Button ID="cmdLogon" runat="server" Text="Login" class="btn btn-lg btn-primary btn-block" OnClick="cmdLogon_Click" />
                </form>
                <div style="text-align:center;padding-top:20px;"> This is a secure site. Please use the username &amp; password that you created<br />
        </div>
            </div>
        </div>
        <footer class="white navbar-fixed-bottom">
     &nbsp;</footer>
        </form>
    </div>
</body>
</html>
