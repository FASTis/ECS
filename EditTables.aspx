<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTables.aspx.cs" Inherits="ECS.EditTables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>Edit Tables</legend>

    <table>
        <tr>
            <td valign="top">           
                <div class="form-group">
                    <asp:Button ID="btnStaffTypes" runat="server" Width="200" Text="Manage Staff Types" CssClass="btn btn-primary" OnClick="btnStaffTypes_Click"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCompanies" runat="server" Width="200" Text="Manage Companies" CssClass="btn btn-primary"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnVolunteerTypes" runat="server" Width="200" Text="Manage Volunteer Types" CssClass="btn btn-primary" />
                </div>
            </td>
            <td width="100px">&nbsp;</td>
            <td valign="top">    
                <div class="form-group">
                    <asp:Button ID="btnCenters" runat="server" Width="200" Text="Manage Centers" CssClass="btn btn-primary"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnTasks" runat="server" Width="200" Text="Manage Tasks" CssClass="btn btn-primary"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnAccounts" runat="server" Width="200" Text="Manage Accounts" CssClass="btn btn-primary"/>
                </div>                             
            </td>
        </tr>
    </table>

</asp:Content>
