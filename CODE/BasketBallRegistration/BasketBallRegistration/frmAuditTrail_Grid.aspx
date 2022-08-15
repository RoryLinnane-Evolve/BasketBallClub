<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmAuditTrail_Grid.aspx.cs" Inherits="BasketBallRegistration.frmAuditTrail_Grid" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <script>
        $(document).ready(function () {
            $('#<%= grdAudits.ClientID %>').DataTable();
        });
    </script>
    <style>
        .dataTables_wrapper .dataTables_filter {
            float: right;
            text-align: right;
        }

       #grdAudits_filter > label > input {
            margin-left: 5px;
        }
    </style>
<!--4. Start of Main Body-->
   <br />
        <div class="panel panel-default">
          <div class="panel-heading">
           <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
        SkinID="Title" Text="Audit Trail"></asp:Label><br />
    <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
        Text="Click on the columns to sort the grid." Width="600px"></asp:Label>
                </div>
                <div class="panel-body">


    <asp:GridView ID="grdAudits" clientIdMode="Static" runat="server" AutoGenerateColumns="False" DataKeyNames="AuditTrailId"
        DataSourceID="AuditTrail"  CssClass="table table-hover table-striped"  >
        <Columns>
            <asp:BoundField DataField="AuditTrailId" HeaderText="AuditTrailId" InsertVisible="False"
                ReadOnly="True" SortExpression="AuditTrailId" />
            <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
            <asp:BoundField DataField="ClientId" HeaderText="ClientId" SortExpression="ClientId" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="DateTime" HeaderText="DateTime" SortExpression="DateTime" />
            <asp:BoundField DataField="AuditCode" HeaderText="AuditCode" SortExpression="AuditCode" />
            <asp:BoundField DataField="Annotation" HeaderText="Annotation" SortExpression="Annotation" />
        </Columns>
    </asp:GridView>

       <asp:Button ID="cmdClose" runat="server" Text="Close" width="120px" class="btn btn-primary" OnClick="cmdClose_Click"/>
       <asp:ObjectDataSource
        ID="AuditTrail" runat="server" DeleteMethod="Delete" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.AuditTrailTableAdapter">
        <DeleteParameters>
            <asp:Parameter Name="Original_AuditTrailId" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    <br />
</asp:Content>


