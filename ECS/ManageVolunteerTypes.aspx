<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageVolunteerTypes.aspx.cs" Inherits="ECS.ManageVolunteerTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Volunteer Types</li>
    </ul>
    
    <legend>Manage Volunteer Types</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Volunteer Type" OnClientClick="window.location.href='EditVolunteerType.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvVolunteerTypes" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false" Width="50%">
        <Columns>
            <asp:BoundField DataField="VolunteerTypeDescr" HeaderText="Volunteer Type" />
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerTypeID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteerType.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" />
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerTypeID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteerType.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" />
        </Columns>
    </asp:GridView>
</asp:Content>
