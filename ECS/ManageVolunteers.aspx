<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ManageVolunteers.aspx.cs" Inherits="ECS.ManageVolunteers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <legend>Manage Volunteers</legend>
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Volunteers</li>
    </ul>
    
    <legend>Manage Volunteers</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Volunteer" OnClientClick="window.location.href='EditVolunteer.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvVolunteers" runat="server" CssClass="table table-striped table-hover" 
        AllowPaging="true" PageSize="10" OnPageIndexChanging="gvVolunteers_Paging" AutoGenerateColumns="false" Width="100%">
        <Columns>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="VolunteerTypeDescr" HeaderText="Volunteer Type" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="Last4DigitsOfPhone" HeaderText="Last 4 of Phone" />
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteer.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" />
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteer.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" />
        </Columns>
        <pagerstyle></pagerstyle>
    </asp:GridView>
</asp:Content>
