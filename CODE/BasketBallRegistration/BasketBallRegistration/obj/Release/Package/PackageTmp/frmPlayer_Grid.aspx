<%@ Page Title="Players" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPlayer_Grid.aspx.cs" Inherits="BasketBallRegistration.frmPlayer_Grid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="Server">
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
    <asp:Panel runat="server" DefaultButton="cmdGo">
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
                    <asp:Button ID="cmdDelete" runat="server" Text="Delete" Width="120px" class="btn btn-primary" OnClick="cmdDelete_Click" />
                    <asp:Button ID="cmdClose" runat="server" Text="Close" Width="120px" class="btn btn-primary" OnClick="cmdClose_Click" />
                </div>
            </div>

            <table class="table">
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Role" Width="96px" SkinID="NormalLabel"></asp:Label></td>
                    <td>
                        <asp:DropDownList ID="ddRole" runat="server" Width="200px" AutoPostBack="True" class="form-control" DataSourceID="ObjectDataSource1" DataTextField="Role" DataValueField="RoleId" OnSelectedIndexChanged="ddRole_SelectedIndexChanged">
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
            
             <td style="width: 82px;  text-align: left;">
             <asp:Label ID="Label2" runat="server" SkinID="NormalLabel" Text="Global Search Employee" Width="160px"></asp:Label></td>
             <td><asp:TextBox ID="txtSearch" runat="server" Width="200px" class="form-control"></asp:TextBox></td>
            <td> <asp:Button ID="cmdGo" runat="server"  Text="Search" width="120px" class="btn btn-primary" OnClick="cmdGo_Click" /></td>
        </tr>
            </table>
            
            <asp:GridView ID="grdPlayers" runat="server" ClientIDMode="Static" AutoGenerateColumns="False" DataKeyNames="PlayerId" CssClass="table table-hover table-striped" DataSourceID="PlayersData" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="PlayerId" HeaderText="PlayerId" SortExpression="PlayerId" InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="BI_PIN" HeaderText="BI_PIN" SortExpression="BI_PIN" />
                      <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" SortExpression="DateOfBirth" />
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
                    <asp:BoundField DataField="ParentEmail" HeaderText="ParentEmail" SortExpression="ParentEmail" />
                    <asp:BoundField DataField="RoleId" HeaderText="RoleId" SortExpression="RoleId" />
                    <asp:BoundField DataField="ParentPhoneNumber" HeaderText="ParentPhoneNumber" SortExpression="ParentPhoneNumber" />
                    <asp:BoundField DataField="RegistrarEmail" HeaderText="RegistrarEmail" SortExpression="RegistrarEmail" />
                    <asp:BoundField DataField="DateRegistered" HeaderText="DateRegistered" SortExpression="DateRegistered" />
                    <asp:CheckBoxField DataField="Payed" HeaderText="Payed" SortExpression="Payed" />
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

    </asp:Panel>
    </asp:Content>


