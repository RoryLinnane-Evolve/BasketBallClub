<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPlayer.aspx.cs" Inherits="BasketBallRegistration.frmPlayer" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
        <div class="panel panel-default">
          <div class="panel-heading">
           <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
        SkinID="Title" Text="Player Detail"></asp:Label><br />
          <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
        Text="Edit, Add, View  an entry - Close or Save to exit." Width="328px"></asp:Label>
                </div>
                <div class="panel-body">
  
    <table class="table table-striped">
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label20" runat="server" Text="BI_PIN" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtBI_PIN" runat="server" Width="160px" />
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 25px">
                Name</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtName" AutoCompleteType="FirstName" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                Date of birth</td>
            <td style="width: 118px; height: 26px">
                <cc1:GMDatePicker ID="dteOfBirth" runat="server" class="form-control">
                </cc1:GMDatePicker>
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 20px">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Gender"></asp:Label>
            </td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="ddGender" runat="server"  Width="200px" class="form-control">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                    <asp:ListItem Value="O">Other</asp:ListItem>
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label11" runat="server" Text="Address" Font-Bold="True"></asp:Label>
            </td>
            <td style="width: 118px; height: 20px">
                <asp:TextBox ID="txtAddress" runat="server" Width="200px" class="form-control"/>
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmail" AutoCompleteType="Email" runat="server" Width="264px" Enabled="True" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label16" runat="server" Text="Phone Number" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtPhoneNumber" AutoCompleteType="BusinessPhone" runat="server" Width="160px" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label17" runat="server" Text="Medical Conditions" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtMedicalConditions" runat="server" Width="160px" />
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label12" runat="server" Text="Emergency contact number" Width="160px" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmergencyContactNumber" runat="server" Width="232px" />
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label13" runat="server" Text="Emergency Contact Relationship" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmergencyContactRel" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label1" runat="server" Text="Allergies" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtAllergies" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label2" runat="server" Text="MedicalNotes" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtMedicalNotes" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label4" runat="server" Text="Country of birth" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtCountryOfBirth" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label7" runat="server" Text="Parent name" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentName" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label8" runat="server" Text="Parent Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentEmail" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label9" runat="server" Text="Parent Phone Number" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentPhoneNumber" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 20px">
                <asp:Label ID="Label14" runat="server" Font-Bold="True" Text="Role"></asp:Label>
            </td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="DropDownList1" runat="server"  Width="200px" class="form-control" DataSourceID="Roles" DataTextField="Role" DataValueField="RoleId">
                </asp:DropDownList>
                <asp:SqlDataSource ID="Roles" runat="server" ConnectionString="<%$ ConnectionStrings:CascadersRegDBConnectionString %>" SelectCommand="SELECT [RoleId], [Role] FROM [Setup_PlayerRoles]"></asp:SqlDataSource>
            </td>
            
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label15" runat="server" Text="Registrar Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtRegistrarEmail" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label18" runat="server" Text="Date Registered" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <cc1:GMDatePicker ID="dteRegistered" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 20px">
                <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Payed"></asp:Label>
            </td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="ddPayed" runat="server"  Width="200px" class="form-control">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
            
        </tr>
    </table>
    &nbsp;
    <asp:Button ID="cmdSave" runat="server" Text="Save" width="100px" class="btn btn-primary" OnClick="cmdSave_Click" />
    <asp:Button ID="cmdClose" runat="server" CausesValidation="False" Text="Close" width="100px" class="btn btn-primary" OnClick="cmdClose_Click" />
        <asp:ObjectDataSource ID="Players_PK" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData_PK" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PlayersTableAdapter">
            <SelectParameters>
                <asp:RouteParameter DefaultValue="10" Name="PK" RouteKey="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData_PK" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PlayersTableAdapter" UpdateMethod="Update">
                        <DeleteParameters>
                            <asp:Parameter Name="Original_PlayerId" Type="Int32" />
                        </DeleteParameters>
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
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="10" Name="PK" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
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

    <asp:RequiredFieldValidator ID="manName" runat="server" ControlToValidate="txtName"
        Display="None" ErrorMessage="Scheme Name is required "></asp:RequiredFieldValidator>
    &nbsp;
    &nbsp;&nbsp;<br />
    &nbsp;
</div>
    </div>
</asp:Content>
