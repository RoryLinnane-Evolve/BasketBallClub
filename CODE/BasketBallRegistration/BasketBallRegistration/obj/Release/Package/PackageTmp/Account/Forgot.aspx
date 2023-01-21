<%@ Page Title="Forgot password" Language="C#" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="BasketBallRegistration.Account.ForgotPassword" Async="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Forgot password</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i&amp;display=swap">
    <link rel="stylesheet" href="assets/fonts/simple-line-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/vanilla-zoom.min.css">
</head>
<body style="background-color:#f6f6f6;">
    <main class="page login-page">
        <section class="clean-block clean-form dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">Forgot your password?</h2>
                </div>
                <asp:PlaceHolder ID="loginForm" runat="server">
                    <form id="form" runat="server">
                        <div class="mb-3">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />

                        </div>

                        <asp:Button runat="server" OnClick="Forgot" Text="Email Link" CssClass="btn btn-primary" /><asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <asp:Literal runat="server" ID="FailureText" />
                        </asp:PlaceHolder>
                    </form>
                </asp:PlaceHolder>
                <asp:PlaceHolder runat="server" ID="DisplayEmail" Visible="false">
                    <p class="text-info">
                        Please check your email to reset your password.
                    </p>
                </asp:PlaceHolder>
            </div>
        </section>





    </main>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.11.1/baguetteBox.min.js"></script>
    <script src="assets/js/vanilla-zoom.js"></script>
    <script src="assets/js/theme.js"></script>

</body>
</html>
