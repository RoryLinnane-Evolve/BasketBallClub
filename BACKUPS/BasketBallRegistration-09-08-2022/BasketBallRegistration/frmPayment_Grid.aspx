<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPayment_Grid.aspx.cs" Inherits="BasketBallRegistration.frmPayment_Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
        $(document).ready(function () {
            $('#<% = grdPlayers.ClientID %>').DataTable({
                "paging": false
            });
        });
    </script>
    <style>
        .dataTables_wrapper .dataTables_filter {
            float: right;
            text-align: right;
        }

        #grdSchemes_filter > label > input {
            margin-left: 5px;
        }

        span#Label2, #lblStatusMessage {
            color: black !important;
        }
    </style>
    <!--4. Start of Main Body-->
    <br />
    <div class="panel panel-default">
        <div class="panel-heading">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
                SkinID="Title" Text="Schemes"></asp:Label><br />
            <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
                Text="Select an entry to view by clicking on the hyperlink or clicking the icon & pressing the edit button."></asp:Label>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Button ID="cmdAdd" runat="server" Text="Add" Width="120px" class="btn btn-primary" />
                    <asp:Button ID="cmdEdit" runat="server" Text="Edit" Width="120px" class="btn btn-primary" />
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" Width="120px" class="btn btn-primary" />
                    <asp:Button ID="cmdClose" runat="server" Text="Close" Width="120px" class="btn btn-primary" />
                </div>
            </div>

            <table class="table">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Role" Width="96px" SkinID="NormalLabel"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="cmbCustomer" runat="server" Width="200px" AutoPostBack="True" class="form-control">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Status"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="cmbStatus" runat="server" Width="200px" AutoPostBack="True" class="form-control">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="grdPlayers" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="PaymentId" CssClass="table table-hover table-striped" DataSourceID="Players">
                <Columns>
                    <asp:BoundField DataField="PaymentId" HeaderText="PaymentId" SortExpression="PaymentId" ReadOnly="True" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CustomerId" SortExpression="CustomerId" />
                    <asp:BoundField DataField="PaymentTypeId" HeaderText="PaymentTypeId" SortExpression="PaymentTypeId" />
                      <asp:BoundField DataField="Client" HeaderText="Client" SortExpression="Client" />
                      <asp:BoundField DataField="PaymentDate" HeaderText="PaymentDate" SortExpression="PaymentDate" />
                      <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                      <asp:BoundField DataField="PaymentReference" HeaderText="PaymentReference" SortExpression="PaymentReference" />
                </Columns>
                <SelectedRowStyle Font-Bold="true" />
            </asp:GridView>
        </div>
    </div>
    &nbsp;<asp:ObjectDataSource
        ID="Payments" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PaymentsTableAdapter" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_PaymentId" Type="Int32" />
        </DeleteParameters>
    </asp:ObjectDataSource>
    </asp:Content>
