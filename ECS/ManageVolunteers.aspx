<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ManageVolunteers.aspx.cs" Inherits="ECS.ManageVolunteers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Manage Volunteers</li>
    </ul>
    
    <legend>Manage Volunteers</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Volunteer" OnClientClick="window.location.href='EditVolunteer.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvVolunteers" runat="server" CssClass="table table-striped table-hover" 
        AllowPaging="true" PageSize="15" OnPageIndexChanging="gvVolunteers_Paging" AutoGenerateColumns="false" 
        Width="100%" >
        <Columns>
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="VolunteerTypeDescr" HeaderText="Volunteer Type" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company" />
            <asp:BoundField DataField="UserID" HeaderText="User ID" />
            <asp:BoundField DataField="Last4DigitsOfPhone" HeaderText="Last 4 of Phone" />
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteer.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="VolunteerID" HeaderText=" " DataNavigateUrlFormatString="EditVolunteer.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <pagerstyle ></pagerstyle>
        <PagerSettings />
    </asp:GridView>

    <!-- I found the below at https://msdn.microsoft.com/en-us/library/aa479347.aspx -->
        <i>You are viewing page
        <%=gvVolunteers.PageIndex + 1%>
        of
        <%=gvVolunteers.PageCount%>
        </i>
</asp:Content>
