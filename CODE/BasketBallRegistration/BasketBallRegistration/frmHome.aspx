<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmHome.aspx.cs" Inherits="BasketBallRegistration.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function welcome(name) {
            document.getElementById("welcomeHeader").innerText = name;
        }
    </script>
    <h1 id ="welcomeHeader"></h1>
    <%if (Context.User.Identity.IsAuthenticated){%>
        <p id="loggedout" visible="false" runat="server">Please <a href="Account/Login.aspx">Log in</a> or <a href="Account/Register.aspx">Sign up</a> to register a player</p>
     <%}else{%>
        <p id="loggedin" visible="false" runat="server">To register a player click <a href="frm_register.aspx">here</a>.</p>
    <%} %>
</asp:Content>
