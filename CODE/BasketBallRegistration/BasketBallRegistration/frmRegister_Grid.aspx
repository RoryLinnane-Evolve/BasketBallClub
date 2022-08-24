<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegister_Grid.aspx.cs" Inherits="BasketBallRegistration.frmRegister_Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<% = grdPlayers.ClientID %>').DataTable({
                "paging": false
            });
        });
    </script>
    <style type="text/css">
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
                SkinID="Title">Players List: Please ensure you have Baskball Ireland PIN numbers of all players.</asp:Label><br /><br />
            <a href="https://membership.mygameday.app/regoform.cgi?aID=28209&pKey=e2899b7cb9f8185f55a6c21866bef27a&formID=95139" target="_blank">Basketball Ireland Registration</a>
            <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
                Text="Please add the players you want to register."></asp:Label>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Button ID="cmdAdd" runat="server" Text="Add" Width="120px" class="btn btn-primary" OnClick="cmdAdd_Click1" />
                    <asp:Button ID="cmdEdit" runat="server" Text="Edit" Width="120px" class="btn btn-primary" OnClick="cmdEdit_Click" />
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" Width="120px" class="btn btn-primary" OnClick="cmdDelete_Click" />
                    <asp:Button ID="cmdContinue" runat="server" OnClientClick="target ='_blank';" CausesValidation="False" Text="Continue to payment" width="160px" class="btn btn-success" OnClick="cmdContinue_Click" />
                </div>
            </div>

            <asp:GridView ID="grdPlayers" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" CssClass="table table-hover table-striped" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="PlayerId" DataSourceID="Cart">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="PlayerId" HeaderText="PlayerId" InsertVisible="False" ReadOnly="True" SortExpression="PlayerId" />
                    <asp:BoundField DataField="BI_PIN" HeaderText="BI Pin" ReadOnly="True" SortExpression="BI_PIN" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
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
    
            <br />
            <asp:SqlDataSource ID="Cart" runat="server" ConnectionString="<%$ ConnectionStrings:CascadersRegDBConnectionString %>" SelectCommand="SELECT [PlayerId], [BI_PIN], [Name], [DateOfBirth], [Gender] FROM [Players] WHERE (([Payed] = @Payed) AND ([RegistrarEmail] = @RegistrarEmail))">
                <SelectParameters>
                    <asp:Parameter Name="Payed" DefaultValue="0" Type="Boolean" />
                    <asp:Parameter Name="RegistrarEmail" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    &nbsp;
</asp:Content>
