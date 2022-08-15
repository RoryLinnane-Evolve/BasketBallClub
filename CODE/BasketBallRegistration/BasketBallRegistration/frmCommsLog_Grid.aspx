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
        DataSourceID="CommsLog"  AllowPaging="True" AllowSorting="True" CssClass="table table-hover table-striped" HeaderStyle-BackColor="#337AB7" HeaderStyle-ForeColor="White">
        <Columns>
            <asp:BoundField DataField="CommsLogId" HeaderText="CommsLogId" InsertVisible="False" ReadOnly="True"
                SortExpression="CommsLogId" />
            <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
            <asp:BoundField DataField="CommsDate" HeaderText="CommsDate" SortExpression="CommsDate" />
            <asp:BoundField DataField="CommsStatusId" HeaderText="CommsStatusId" SortExpression="CommsStatusId" />
            <asp:BoundField DataField="CommsType" HeaderText="CommsType" SortExpression="CommsType" />
            <asp:BoundField DataField="CommsTo" HeaderText="CommsTo" SortExpression="CommsTo" />
            <asp:BoundField DataField="CommsCopy" HeaderText="CommsCopy" SortExpression="CommsCopy" />
            <asp:BoundField DataField="CommsContent" HeaderText="CommsContent" SortExpression="CommsContent" />
        </Columns>

<HeaderStyle BackColor="#337AB7" ForeColor="White"></HeaderStyle>
    </asp:GridView>
  
    <asp:ObjectDataSource ID="CommsLog" runat="server" DeleteMethod="Delete"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.CommsLogTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_CommsLogId" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>

</asp:Content>
