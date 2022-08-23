<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmRegister.aspx.cs" Inherits="BasketBallRegistration.frmRegister" %>
<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <link rel="stylesheet"
    href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
       $(function () {
           $("#
            <%= dteOfBirth.ClientID %>").datepicker();
            });
       </script>
    <script>
        $('#dteOfBirth').datetimepicker().on('dp.change', function (event) {
            __doPostBack('<%= Page.ClientID %>');
        });
    </script>
    <br />
        <div class="panel panel-default">
          <div class="panel-heading">
           <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
        SkinID="Title" Text="Player Detail"></asp:Label><br />
          <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
        Text="Edit, Add, View  an entry - Close or Save to exit." Width="328px"></asp:Label>
                </div>
                <div class="panel-body">
  
    <p id="BIPinInstruction" runat="server" visible="false">
        To get your BI pin go to <a href="https://membership.mygameday.app/regoform.cgi?aID=28209&pKey=e2899b7cb9f8185f55a6c21866bef27a&formID=95139">Baskeball Ireland registration</a> and fill out the form.
    </p>
    <table class="table table-striped">
        <%--<tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label20" runat="server" Text="BI_PIN" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtBI_PIN" runat="server" Width="160px" />
            </td>
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
            
        </tr>--%>
        <div id="Fields" runat="server">
        <tr>
            <td style="width: 115px; height: 25px">
                Name</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtName" AutoCompleteType="FirstName" runat="server" Width="264px" class="form-control" ></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                Date of birth</td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="dteOfBirth"
                   autopostback="true"
                   runat="server"
                   Width="135px"
                   TabIndex="1"
                   placeholder="dd/mm/yyyy"
                   MaxLength="10" OnTextChanged="dteOfBirth_TextChanged"></asp:TextBox>
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
            <td style="width: 115px; height: 28px">
                <asp:Label ID="Label17" runat="server" Text="Medical Conditions" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 28px">
                <asp:TextBox ID="txtMedicalConditions" runat="server" Width="160px" />
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label" runat="server" Text="Medical Notes" Font-Bold="true"/></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtMedicalNotes" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label1" runat="server" Text="Allergies" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtAllergies" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        
        <tr id="EmailRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmail" AutoCompleteType="Email" runat="server" Width="264px" Enabled="True" class="form-control"></asp:TextBox></td>
        </tr>
        <tr id="PhoneNumberRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label16" runat="server" Text="Phone Number" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtPhoneNumber" AutoCompleteType="BusinessPhone" runat="server" Width="160px" /></td>
        </tr>
        <tr id="EmContactRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label12" runat="server" Text="Emergency contact number" Width="160px" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmergencyContactNumber" runat="server" Width="232px" />
            </td>
        </tr>
        <tr id="EmContactRelRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label13" runat="server" Text="Emergency Contact Relationship" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtEmergencyContactRel" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        
        <tr id="CountryRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label4" runat="server" Text="Country of birth" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtCountryOfBirth" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr id="ParentNameRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label7" runat="server" Text="Parent name" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentName" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr id="ParentEmailRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label8" runat="server" Text="Parent Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentEmail" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        <tr id="ParentPhoneRow" runat="server">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label9" runat="server" Text="Parent Phone Number" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtParentPhoneNumber" runat="server" Width="208px" Enabled="True" /></td>
        </tr>
        </div>
        
        <tr id="BIPinRow" runat="server" visible="false">
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Labela" runat="server" Text="BI Pin" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtBIPin" runat="server" Width="208px" Enabled="True" MaxLength="7" /></td>
        </tr>
        
        <%--<tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label15" runat="server" Text="Registrar Email" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtRegistrarEmail" runat="server" Width="208px" Enabled="True" /></td>
        </tr>--%>        <%--<tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label18" runat="server" Text="Date Registered" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <cc1:GMDatePicker ID="dteRegistered" runat="server" Width="208px" Enabled="True" /></td>
        </tr>--%>        <%--<tr>
            <td style="width: 115px; height: 20px">
                <asp:Label ID="Label19" runat="server" Font-Bold="True" Text="Payed"></asp:Label>
            </td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="ddPayed" runat="server"  Width="200px" class="form-control">
                    <asp:ListItem Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
            
        </tr>--%>
    </table>
    &nbsp;
    <asp:Button ID="cmdSave" runat="server" Text="Save" width="100px" class="btn btn-primary" OnClick="cmdSave_Click" />
    <asp:Button ID="cmdFinish" Visible="false" runat="server" Text="Save" width="100px" class="btn btn-primary" OnClick="cmdFinish_Click" />
    <asp:Button ID="cmdClose" runat="server" CausesValidation="False" Text="Close" width="100px" class="btn btn-primary" OnClick="cmdClose_Click" />
        <asp:ObjectDataSource ID="Players_PK" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData_PK" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PlayersTableAdapter">
            <SelectParameters>
                <asp:RouteParameter DefaultValue="10" Name="PK" RouteKey="ID" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>

    
    &nbsp;
    &nbsp;&nbsp;<br />
    &nbsp;
</div>
    </div>
     <asp:CompareValidator ID="CompareValidator1"
                    runat="server"
                    ControlToValidate="dteOfBirth"
                    Operator="DataTypeCheck"
                    Type="Date"
                    ForeColor="#FF3300">Date invalid, please check format.</asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ControlToValidate="txtName" ErrorMessage="Please fill in all required fields." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtAddress" ErrorMessage="Please fill in all required fields." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddGender" ErrorMessage="Please fill in all required fields." ForeColor="Red"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtBIPin" ErrorMessage="BI Pin is in incorrect format." ForeColor="Red"></asp:RequiredFieldValidator>
</asp:Content>
