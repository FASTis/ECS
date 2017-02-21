<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCompanies.aspx.cs" Inherits="ECS.ManageCompanies" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Companies</li>
    </ul>
    
    <legend>Manage Companies</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Company" OnClientClick="window.location.href='EditCompany.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvCompanies" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false" Width="50%">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
            <asp:HyperLinkField DataNavigateUrlFields="CompanyId" HeaderText=" " DataNavigateUrlFormatString="EditCompany.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" />
            <asp:HyperLinkField DataNavigateUrlFields="CompanyId" HeaderText=" " DataNavigateUrlFormatString="EditCompany.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" />
        </Columns>
    </asp:GridView>
</asp:Content>

