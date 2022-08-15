<%@ Page Title="Players" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPlayer_Grid.aspx.cs" Inherits="BasketBallRegistration.frmPlayer_Grid" %>
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
                SkinID="Title" Text="Players List"></asp:Label><br />
            <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
                Text="Select an entry to view by clicking on the hyperlink or clicking the icon & pressing the edit button."></asp:Label>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <asp:Button ID="cmdAdd" runat="server" Text="Add" Width="120px" class="btn btn-primary" OnClick="cmdAdd_Click1" />
                    <asp:Button ID="cmdEdit" runat="server" Text="Edit" Width="120px" class="btn btn-primary" OnClick="cmdEdit_Click" />
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" Width="120px" class="btn btn-primary" />
                    <asp:Button ID="cmdClose" runat="server" Text="Close" Width="120px" class="btn btn-primary" />
                </div>
            </div>

            <table class="table">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Role" Width="96px" SkinID="NormalLabel"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="cmbCustomer" runat="server" Width="200px" AutoPostBack="True" class="form-control" DataSourceID="ObjectDataSource1" DataTextField="Role" DataValueField="RoleId" OnSelectedIndexChanged="cmbCustomer_SelectedIndexChanged">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.SetupsTableAdapters.Setup_PlayerRolesTableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_RoleId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="RoleId" Type="Int32" />
                                <asp:Parameter Name="Role" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Role" Type="String" />
                                <asp:Parameter Name="Original_RoleId" Type="Int32" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

            <asp:GridView ID="grdPlayers" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="PlayerId" CssClass="table table-hover table-striped" DataSourceID="Players">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="PlayerId" HeaderText="PlayerId" SortExpression="PlayerId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                      <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
                      <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                      <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                      <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                      <asp:BoundField DataField="MedicalConditions" HeaderText="MedicalConditions" SortExpression="MedicalConditions" />
                      <asp:BoundField DataField="EmergencyContactNumber" HeaderText="EmergencyContactNumber" SortExpression="EmergencyContactNumber" />
                      <asp:BoundField DataField="EmergencyContactRelationship" HeaderText="EmergencyContactRelationship" SortExpression="EmergencyContactRelationship" />
                      <asp:BoundField DataField="Allergies" HeaderText="Allergies" SortExpression="Allergies" />
                      <asp:BoundField DataField="MedicalNotes" HeaderText="MedicalNotes" SortExpression="MedicalNotes" />
                      <asp:BoundField DataField="ParentName" HeaderText="ParentName" SortExpression="ParentName" />
                </Columns>
                <SelectedRowStyle Font-Bold="true" />
            </asp:GridView>
        </div>
    </div>
    &nbsp;<asp:ObjectDataSource
        ID="Players" runat="server" OldValuesParameterFormatString="original_{0}"
        SelectMethod="GetDataBy_Grid" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PlayersTableAdapter" InsertMethod="Insert" UpdateMethod="Update">
        <InsertParameters>
            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="MedicalConditions" Type="String" />
            <asp:Parameter Name="EmergencyContactNumber" Type="String" />
            <asp:Parameter Name="EmergencyContactRelationship" Type="String" />
            <asp:Parameter Name="Allergies" Type="String" />
            <asp:Parameter Name="MedicalNotes" Type="String" />
            <asp:Parameter Name="CountryOfBirth" Type="String" />
            <asp:Parameter Name="ParentName" Type="String" />
            <asp:Parameter Name="ParentEmail" Type="String" />
            <asp:Parameter Name="RoleId" Type="Int32" />
            <asp:Parameter Name="ParentPhoneNumber" Type="String" />
            <asp:Parameter Name="RegistrarEmail" Type="String" />
            <asp:Parameter Name="DateRegistered" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="MedicalConditions" Type="String" />
            <asp:Parameter Name="EmergencyContactNumber" Type="String" />
            <asp:Parameter Name="EmergencyContactRelationship" Type="String" />
            <asp:Parameter Name="Allergies" Type="String" />
            <asp:Parameter Name="MedicalNotes" Type="String" />
            <asp:Parameter Name="CountryOfBirth" Type="String" />
            <asp:Parameter Name="ParentName" Type="String" />
            <asp:Parameter Name="ParentEmail" Type="String" />
            <asp:Parameter Name="RoleId" Type="Int32" />
            <asp:Parameter Name="ParentPhoneNumber" Type="String" />
            <asp:Parameter Name="RegistrarEmail" Type="String" />
            <asp:Parameter Name="DateRegistered" Type="DateTime" />
            <asp:Parameter Name="Original_PlayerId" Type="Int32" />
        </UpdateParameters>
    </asp:ObjectDataSource>
    </asp:Content>

