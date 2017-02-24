<%@ page title="" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true" codebehind="RunReports.aspx.cs" inherits="ECS.RunReports" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Run Reports</li>
    </ul>

    <legend>Run Reports</legend>
    <table>
        <tr>
            <td>
                <asp:DropDownList ID="ddMonths" runat="server" CssClass="form-control" AutoPostBack="true">
        <asp:ListItem Value="0">Select a Month</asp:ListItem>
        <asp:ListItem Value="1">January</asp:ListItem>
        <asp:ListItem Value="2">February</asp:ListItem>
        <asp:ListItem Value="3">March</asp:ListItem>
        <asp:ListItem Value="4">April</asp:ListItem>
        <asp:ListItem Value="5">May</asp:ListItem>
        <asp:ListItem Value="6">June</asp:ListItem>
        <asp:ListItem Value="7">July</asp:ListItem>
        <asp:ListItem Value="8">August</asp:ListItem>
        <asp:ListItem Value="9">September</asp:ListItem>
        <asp:ListItem Value="10">October</asp:ListItem>
        <asp:ListItem Value="11">November</asp:ListItem>
        <asp:ListItem Value="12">December</asp:ListItem>
                </asp:DropDownList>

            </td>
            <td>&nbsp; &nbsp; &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Export To Excel" class="btn btn-success" OnClick = "ExportToExcel" />
            </td>
        </tr>
    </table>

    <br /><br />   
    
     <asp:GridView ID="gvReportData" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false" Width="90%"
         PageSize="5" AllowPaging="true" OnPageIndexChanging="gvReportData_Paging">
        <Columns>
            <asp:BoundField DataField="FirstName" HeaderText="First Name" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" />
            <asp:BoundField DataField="CenterName" HeaderText="Center" />
            <asp:BoundField DataField="DateTimeLogged" HeaderText="Timestamp" />
            <asp:BoundField DataField="TaskDescr" HeaderText="Task" />
            <asp:BoundField DataField="NumberMinutes" HeaderText="Minutes" />
            <asp:BoundField DataField="PricePerMinute" HeaderText="Price Per Minute" />
        </Columns>
       
        <pagerstyle BackColor="#d34615" ForeColor="White" HorizontalAlign="Center" />
    </asp:GridView>


</asp:content>
