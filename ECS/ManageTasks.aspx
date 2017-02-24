<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageTasks.aspx.cs" Inherits="ECS.ManageTasks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>Manage Tasks</legend>
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li class="active">Manage Tasks</li>
    </ul>
    
    <legend>Manage Tasks</legend>
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add New Task" OnClientClick="window.location.href='EditTask.aspx?mode=A';return false;"/>
    <br />
    <br />
    <asp:GridView ID="gvTasks" runat="server" CssClass="table table-striped table-hover" 
        AllowPaging="true" PageSize="5" OnPageIndexChanging="gvTasks_Paging" AutoGenerateColumns="false" 
        Width="100%" >
        <Columns>
            <asp:BoundField DataField="TaskDescr" HeaderText="Task" />
            <asp:BoundField DataField="PricePerHour" HeaderText="Hourly Rate" />
            <asp:BoundField DataField="PricePerMinute" HeaderText="Per Minute Rate" />
            <asp:HyperLinkField DataNavigateUrlFields="TaskID" HeaderText=" " DataNavigateUrlFormatString="EditTask.aspx?id={0}&mode=E" Text="Edit" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
            <asp:HyperLinkField DataNavigateUrlFields="TaskID" HeaderText=" " DataNavigateUrlFormatString="EditTask.aspx?id={0}&mode=D" Text="Delete" ItemStyle-HorizontalAlign="center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
            </asp:HyperLinkField>
        </Columns>
        <pagerstyle ></pagerstyle>
        <PagerSettings />
    </asp:GridView>

    <!-- I found the below at https://msdn.microsoft.com/en-us/library/aa479347.aspx -->
        <i>You are viewing page
        <%=gvTasks.PageIndex + 1%>
        of
        <%=gvTasks.PageCount%>
        </i>
</asp:Content>
