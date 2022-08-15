<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmMyTeam_Grid.aspx.cs" Inherits="BasketBallRegistration.frmMyTeam_Grid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
    <script>
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
                SkinID="Title" Text="My Team"></asp:Label><br />
            <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
                Text="Select an entry to view by clicking on the hyperlink or clicking the icon & pressing the edit button."></asp:Label>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Button ID="cmdClose" runat="server" Text="Close" Width="120px" class="btn btn-primary" OnClick="cmdClose_Click" />
                </div>
            </div>

            <table class="table">
                <tr>
                    <td>
                        Team</td>
                    <td>
                        <asp:DropDownList ID="cmbCustomer" runat="server" Width="200px" AutoPostBack="True" class="form-control" DataSourceID="TeamsData" DataTextField="TeamName" DataValueField="TeamId" OnSelectedIndexChanged="cmbCustomer_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="TeamsData" runat="server" ConnectionString="<%$ ConnectionStrings:CascadersRegDBConnectionString %>" SelectCommand="SELECT [TeamId], [TeamName], [PlayerAge] FROM [Setup_PlayerTeams]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>

            <asp:GridView ID="grdPlayers" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="PlayerId" CssClass="table table-hover table-striped" DataSourceID="PlayersData" AllowPaging="True" AllowSorting="true" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="BI_PIN" HeaderText="BI_PIN" SortExpression="BI_PIN" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="MedicalConditions" HeaderText="MedicalConditions" SortExpression="MedicalConditions" />
                    <asp:BoundField DataField="EmergencyContactNumber" HeaderText="EmergencyContactNumber" SortExpression="EmergencyContactNumber" />
                    <asp:BoundField DataField="EmergencyContactRelationship" HeaderText="EmergencyContactRelationship" SortExpression="EmergencyContactRelationship" />
                    <asp:BoundField DataField="Allergies" HeaderText="Allergies" SortExpression="Allergies" />
                    <asp:BoundField DataField="MedicalNotes" HeaderText="MedicalNotes" SortExpression="MedicalNotes" />
                    <asp:BoundField DataField="CountryOfBirth" HeaderText="CountryOfBirth" SortExpression="CountryOfBirth" />
                    <asp:BoundField DataField="ParentName" HeaderText="ParentName" SortExpression="ParentName" />
                    <asp:BoundField DataField="ParentPhoneNumber" HeaderText="ParentPhoneNumber" SortExpression="ParentPhoneNumber" />
                    <asp:BoundField DataField="DateRegistered" HeaderText="DateRegistered" SortExpression="DateRegistered" />
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
        </div>
    </div>
    &nbsp;<asp:ObjectDataSource
        ID="PlayersData" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PlayersTableAdapter" DeleteMethod="Delete">
        <DeleteParameters>
            <asp:Parameter Name="Original_PlayerId" Type="Int32" />
        </DeleteParameters>
</asp:ObjectDataSource>
</asp:Content>


