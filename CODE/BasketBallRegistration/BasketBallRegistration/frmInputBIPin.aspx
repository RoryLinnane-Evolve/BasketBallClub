<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmInputBIPin.aspx.cs" Inherits="BasketBallRegistration.frmInputBIPin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>Please go to the link <a href="https://membership.mygameday.app/regoform.cgi?aID=28209&pKey=e2899b7cb9f8185f55a6c21866bef27a&formID=95139">here</a> and input the Basketball Ireland pin (BI Pin) you get after registration</p>
    <asp:TextBox ID="txtBI_PIN" runat="server" TextMode="Number"></asp:TextBox>
    <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click"/>
</asp:Content>
