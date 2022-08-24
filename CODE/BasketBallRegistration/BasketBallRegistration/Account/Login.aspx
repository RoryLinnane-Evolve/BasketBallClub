﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BasketBallRegistration.Account.logon1" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login - Brand</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i&amp;display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/vanilla-zoom.min.css">
</head>

<body style="background-color:white">
    <asp:Image ID="Image1" runat="server" Height="138px" ImageUrl="~/images/ClareCascadersLogo.png" Width="162px" />
    <main class="page login-page" >
        <section class="clean-block clean-form dark" style="background-color:white;height:100%">
            <div class="container">
                
                <div class="block-heading">
                    <h2 class="text-info">Log In</h2>
                </div>
                <form runat="server">
                    <div class="mb-3">                
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="form-label" >Email</asp:Label>
                        <asp:TextBox runat="server" ID="Email" CssClass="form-control item" TextMode="Email" />
                    </div>
                    <div class="mb-3">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="form-label">Password</asp:Label>
                        <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control item" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />                
                    </div>
                    <div class="mb-3">
                        <div class="form-check">
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me</asp:Label>
                        </div>
                    </div>                    
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                    <br />
                    <br />
                    <asp:Button runat="server" ID="ResendConfirm"  OnClick="SendEmailConfirmationToken" Text="Resend confirmation" Visible="false" CssClass="btn btn-default" />
                    <br />
                    <div class="mb-3">
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                    </div>
                </form>
            </div>
            <p>
                    <%-- Enable this once you have account confirmation enabled for password reset functionality --%>
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                </p>
        </section>
    </main>
    
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
    <script src="assets/js/vanilla-zoom.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
