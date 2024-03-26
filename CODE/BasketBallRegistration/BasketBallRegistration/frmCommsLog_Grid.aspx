<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCommsLog_Grid.aspx.cs" Inherits="BasketBallRegistration.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--4. Start of Main Body-->
   <br />
        <div class="panel panel-default">
          <div class="panel-heading">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
        SkinID="Title" Text="Comms Log"></asp:Label><br />
    <asp:Label ID="Label5" runat="server"
            Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle" Text="Review communications sent."
            Width="600px"></asp:Label>
                </div>
                <div class="panel-body">
                    <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Button ID="cmdClose" runat="server" Text="Close" Width="120px" class="btn btn-primary" OnClick="cmdClose_Click" />
                </div>
            </div>
  
  

    <asp:GridView ID="grdCommsLog" runat="server" AutoGenerateColumns="False" DataKeyNames="CommsLogId"
        DataSourceID="CommsLog"  AllowPaging="True" AllowSorting="True" CssClass="table table-hover table-striped" HeaderStyle-BackColor="#337AB7" HeaderStyle-ForeColor="White" Width="100%" 
        ClientIDMode="Static" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CommsLogId" HeaderText="CommsLogId" InsertVisible="False" ReadOnly="True" SortExpression="CommsLogId" />
            <asp:BoundField DataField="CommsDate" HeaderText="CommsDate" SortExpression="CommsDate" />
            <asp:BoundField DataField="CommsType" HeaderText="CommsType" SortExpression="CommsType" />
            <asp:BoundField DataField="CommsTo" HeaderText="CommsTo" SortExpression="CommsTo" />
            <asp:BoundField DataField="CommsContent" HeaderText="CommsContent" SortExpression="CommsContent" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle Font-Bold="true" BackColor="#D1DDF1" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
  
    <asp:ObjectDataSource ID="CommsLog" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.CommsLogTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_CommsLogId" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>

</asp:Content>
