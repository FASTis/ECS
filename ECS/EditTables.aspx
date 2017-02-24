<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTables.aspx.cs" Inherits="ECS.EditTables" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Edit Tables</li>
    </ul>
    
    <legend>Edit Tables</legend>

    <table>
        <tr>
            <td valign="top">           
                <div class="form-group">
                    <asp:Button ID="btnStaffTypes" runat="server" Width="200" Text="Manage Staff Types" CssClass="btn btn-info" OnClick="btnStaffTypes_Click"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCompanies" runat="server" Width="200" Text="Manage Companies" CssClass="btn btn-info" OnClick="btnCompanies_Click"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnVolunteerTypes" runat="server" Width="200" Text="Manage Volunteer Types" CssClass="btn btn-info" OnClick="btnVolunteerTypes_Click" />
                </div>
            </td>
            <td width="100px">&nbsp;</td>
            <td valign="top">    
                <div class="form-group">
                    <asp:Button ID="btnCenters" runat="server" Width="200" Text="Manage Centers" CssClass="btn btn-info"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnTasks" runat="server" Width="200" Text="Manage Tasks" CssClass="btn btn-info"/>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnVolunteers" runat="server" Width="200" Text="Manage Volunteers" CssClass="btn btn-info" OnClick="btnVolunteers_Click"/>
                </div>                             
            </td>
        </tr>
    </table>

</asp:Content>
