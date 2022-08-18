<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmHome.aspx.cs" Inherits="BasketBallRegistration.frmHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function welcome(name) {
            document.getElementById("welcomeHeader").innerText = name;
        }
    </script>
    <h1 id ="welcomeHeader"></h1>
</asp:Content>
