<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCenters.aspx.cs" Inherits="ECS.ManageCenters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>Manage Centers</legend>
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Centers</li>
    </ul>

    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Center" OnClientClick="window.location.href='EditCenter.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvCenters" runat="server" CssClass="table table-striped table-hover" 
        AllowPaging="true" PageSize="15" OnPageIndexChanging="gvCenters_Paging" AutoGenerateColumns="false" 
        Width="100%" >
        <Columns>
            <asp:BoundField DataField="CenterName" HeaderText="Center" />
            <asp:BoundField DataField="StreetAddress" HeaderText="Address" />
            <asp:BoundField DataField="City" HeaderText="City" />
            <asp:BoundField DataField="Zip" HeaderText="Zip" />
            <asp:HyperLinkField DataNavigateUrlFields="CenterID" HeaderText=" " DataNavigateUrlFormatString="EditCenter.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="CenterID" HeaderText=" " DataNavigateUrlFormatString="EditCenter.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <pagerstyle ></pagerstyle>
        <PagerSettings />
    </asp:GridView>

    <!-- I found the below at https://msdn.microsoft.com/en-us/library/aa479347.aspx -->
        <i>You are viewing page
        <%=gvCenters.PageIndex + 1%>
        of
        <%=gvCenters.PageCount%>
        </i>

</asp:Content>

