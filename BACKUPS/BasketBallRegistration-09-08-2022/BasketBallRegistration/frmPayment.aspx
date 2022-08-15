<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmPayment.aspx.cs" Inherits="BasketBallRegistration.frmPayment" %>
<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Assembly="GMDatePicker" Namespace="GrayMatterSoft" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!--4. Start of Main Body-->
   <br />
        <div class="panel panel-default">
          <div class="panel-heading">
           <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Red"
        SkinID="Title" Text="Schemes"></asp:Label><br />
          <asp:Label ID="Label5" runat="server" Font-Size="Smaller" ForeColor="Black" SkinID="SubTitle"
        Text="Edit, Add, View  an entry - Close or Save to exit." Width="328px"></asp:Label>
                </div>
                <div class="panel-body">
  
    <table class="table table-striped">
        <tr>
            <td style="width: 115px; height: 25px">
                <asp:Label ID="Label1" runat="server"  Text="Scheme Name"
                    Width="160px" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtSchemeName" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Start Date"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <cc1:GMDatePicker ID="dteStartDate" runat="server" class="form-control">
                </cc1:GMDatePicker>
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 20px">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="End Date"></asp:Label></td>
            <td style="width: 118px; height: 20px">
                <cc1:GMDatePicker ID="dteEndDate" runat="server" Enabled="True" class="form-control">
                </cc1:GMDatePicker>
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label8" runat="server" Text="Points Based" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="cmbPointsBased" runat="server" Width="200px" DataSourceID="PointsBased" DataTextField="PointsSystem" DataValueField="PointsId" class="form-control">
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label9" runat="server" Text="Scheme Status" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="cmbSchemeStatus" runat="server" Width="200px" DataSourceID="SchemeStatus" DataTextField="Status" DataValueField="SchemeStatusId" class="form-control">
                </asp:DropDownList>&nbsp;
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label11" runat="server" Text="Duration" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:DropDownList ID="cmbDuration" runat="server" DataSourceID="Duration" DataTextField="Duration"
                    DataValueField="DurationId" Width="200px" class="form-control">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label10" runat="server" Text="Scheme Logo" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:TextBox ID="txtCompanyLogo" runat="server" Width="264px" Enabled="False" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label16" runat="server" Text="Gift Message" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:CheckBox ID="chkGiftMessage" runat="server" Width="160px" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label17" runat="server" Text="Gift Address" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:CheckBox ID="chkGiftAddress" runat="server" Width="160px" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label12" runat="server" Text="Permission To Select" Width="160px" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:CheckBox ID="chkPermissionToSelect" runat="server" Width="232px" /></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                <asp:Label ID="Label13" runat="server" Text="Security Question" Font-Bold="True"></asp:Label></td>
            <td style="width: 118px; height: 26px">
                <asp:CheckBox ID="chkSecurityQuestion" runat="server" Width="208px" Enabled="False" /></td>
        </tr>
    </table>
    &nbsp;
    <asp:Button ID="cmdSave" runat="server" Text="Save" width="100px" class="btn btn-primary" />
    <asp:Button ID="cmdImport" runat="server" Text="Import" width="100px" class="btn btn-primary"/>
    <asp:Button ID="cmdExport" runat="server" Text="Export" width="100px" class="btn btn-primary"/>
    <asp:Button ID="cmdViewScheme" runat="server" Text="View Scheme" width="100px" class="btn btn-primary" />
    <asp:Button ID="cmdInstructions" runat="server" Text="Instructions" width="100px" class="btn btn-primary" />
    <asp:Button ID="cmdEmployees" runat="server" Text="Selected Employees" width="140px" class="btn btn-primary" />
    <asp:Button
        ID="cmdProducts" runat="server" Text="Selected Products" width="140px" class="btn btn-primary" />&nbsp;
    <asp:Button ID="cmdSchemeLogo" runat="server" Text="Scheme Logo" width="100px" class="btn btn-primary" />
    <asp:Button ID="cmdClose" runat="server"
        CausesValidation="False" Text="Close" width="100px" class="btn btn-primary" />
        <asp:ObjectDataSource ID="SchemeType"
            runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetDataBy_Grid" TypeName="Setups_SchemeType" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_SchemeTypeId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="Type" Type="String" />
                <asp:Parameter Name="Original_SchemeTypeId" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Type" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="PointsBased" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="Setups_PointsSystem"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_PointsId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="PointsSystem" Type="String" />
            <asp:Parameter Name="Original_PointsId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="PointsSystem" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="Duration" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="Setups_Duration"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_DurationId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Duration" Type="String" />
            <asp:Parameter Name="Original_DurationId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Duration" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:ObjectDataSource ID="SchemeStatus" runat="server" DeleteMethod="Delete" InsertMethod="Insert"
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBy_Grid" TypeName="Setups_SchemeStatus"
        UpdateMethod="Update">
        <DeleteParameters>
            <asp:Parameter Name="Original_SchemeStatusId" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Original_SchemeStatusId" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Status" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>
    <asp:RequiredFieldValidator ID="manName" runat="server" ControlToValidate="txtSchemeName"
        Display="None" ErrorMessage="Scheme Name is required "></asp:RequiredFieldValidator>
    &nbsp;
    &nbsp;&nbsp;
    <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtSchemeName"
        Display="None" ErrorMessage="Scheme Name must be between 1 and 100 characters."
        ValidationExpression=".{1,100}"></asp:RegularExpressionValidator><br />
    &nbsp;
</asp:Content>
