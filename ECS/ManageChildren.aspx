<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageChildren.aspx.cs" Inherits="ECS.AddChildren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="Profile.aspx">My Profile</a></li>
        <li class="active">Manage Children</li>
    </ul>
    
    <legend>Manage Children for <asp:Label ID="lblVolunteerName" runat="server"></asp:Label></legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Child" OnClientClick="window.location.href='EditChild.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvChildren" runat="server" CssClass="table table-striped table-hover" 
        AllowPaging="true" PageSize="15" OnPageIndexChanging="gvChildren_Paging" AutoGenerateColumns="false" 
        Width="100%" >
        <Columns>
            <asp:BoundField DataField="Child" HeaderText="Child's Name" />
            <asp:BoundField DataField="DOB" HeaderText="Date of Birth" />
            <asp:BoundField DataField="Relationship" HeaderText="Relationship" />
            <asp:HyperLinkField DataNavigateUrlFields="ChildID, VolunteerID" SortExpression="Child"
                HeaderText=" " DataNavigateUrlFormatString="EditChild.aspx?id={0}&volId={1}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <pagerstyle ></pagerstyle>
        <PagerSettings />
    </asp:GridView>

    <!-- I found the below at https://msdn.microsoft.com/en-us/library/aa479347.aspx -->
        <i>You are viewing page
        <%=gvChildren.PageIndex + 1%>
        of
        <%=gvChildren.PageCount%>
        </i>
</asp:Content>
