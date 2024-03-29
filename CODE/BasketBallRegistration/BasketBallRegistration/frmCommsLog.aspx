<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="frmCommsLog.aspx.cs" Inherits="BasketBallRegistration.frmCommsLog" %>


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
            <td style="width: 115px; height: 25px">
                CustomerId</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtCustomerId" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 25px">
                CommsStatusId</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtCommsStatusId" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 25px">
                CommsTo</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtCommsTo" AutoCompleteType="Email" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
        <td style="width: 115px; height: 25px">
            CommsCopy</td>
        <td style="width: 118px; height: 25px">
            <asp:TextBox ID="txtCommsCopy" AutoCompleteType="Email" runat="server" Width="264px" class="form-control"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 25px">
                CommsContent</td>
            <td style="width: 118px; height: 25px">
                <asp:TextBox ID="txtCommsContent" runat="server" Width="264px" class="form-control" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="width: 115px; height: 26px">
                CommsDate</td>
            <td style="width: 118px; height: 26px">
                <cc1:GMDatePicker ID="dteCommsDate" runat="server" class="form-control">
                </cc1:GMDatePicker>
            </td>
        </tr>
       
    </table>
    &nbsp;
    <asp:Button ID="cmdSave" runat="server" Text="Save" width="100px" class="btn btn-primary" OnClick="cmdSave_Click" />
    <asp:Button ID="cmdClose" runat="server" CausesValidation="False" Text="Close" width="100px" class="btn btn-primary" OnClick="cmdClose_Click" />
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData_PK" TypeName="BasketBallRegistration.DAL.BasketBallTableAdapters.PaymentsTableAdapter">
                        <SelectParameters>
                            <asp:QueryStringParameter DefaultValue="1" Name="PK" QueryStringField="PK" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
    &nbsp;
    &nbsp;&nbsp;<br />
    &nbsp;
</div>
    </div>
</asp:Content>
