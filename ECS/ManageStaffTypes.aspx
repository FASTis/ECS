<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageStaffTypes.aspx.cs" Inherits="ECS.AdminManageStaffTypes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Staff Types</li>
    </ul>
    
    <legend>Manage Staff Types</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Staff Type" OnClientClick="window.location.href='/EditStaffTypes.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvStaffTypes" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false" Width="50%">
        <Columns>
            <asp:BoundField DataField="StaffTypeDescr" HeaderText="Staff Type" />
            <asp:HyperLinkField DataNavigateUrlFields="StaffTypeId" HeaderText=" " DataNavigateUrlFormatString="/EditStaffTypes.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" />
            <asp:HyperLinkField DataNavigateUrlFields="StaffTypeId" HeaderText=" " DataNavigateUrlFormatString="/EditStaffTypes.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" />
        </Columns>
    </asp:GridView>
</asp:Content>
