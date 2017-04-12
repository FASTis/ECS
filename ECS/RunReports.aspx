<%@ page title="" language="C#" masterpagefile="~/Site.Master" autoeventwireup="true" codebehind="RunReports.aspx.cs" inherits="ECS.RunReports" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Run Reports</li>
    </ul>

    <legend>Run Reports</legend>
    <table cellspacing="5">
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
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddTask" runat="server" CssClass="form-control" AutoPostBack="true" >
                </asp:DropDownList>               
            </td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddVolunteerType" runat="server" CssClass="form-control" AutoPostBack="true" >
                </asp:DropDownList>               
            </td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:DropDownList ID="ddCenter" runat="server" CssClass="form-control" AutoPostBack="true">
                </asp:DropDownList>               
            </td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>
                <asp:Button ID="btnExport" runat="server" Text="Export Grid To Excel" class="btn btn-success" OnClick="btnExport_Click" />                
            </td>
            <td>&nbsp;&nbsp;&nbsp;</td>
            <td>                
                <asp:Button ID="btnMonthlySummary" runat="server" Text="Export Monthly Summary Report" class="btn btn-success" OnClick="btnMonthlySummary_Click" />
            </td>
        </tr>
    </table>

    <br /><br />   
    
     <asp:GridView ID="gvReportData" runat="server" CssClass="table table-striped table-hover" AutoGenerateColumns="false" Width="100%"
         PageSize="5" AllowPaging="true" OnPageIndexChanging="gvReportData_Paging">
        <Columns>
            <asp:BoundField DataField="Volunteer" HeaderText="Volunteer" />
            <asp:BoundField DataField="VolunteerTypeDescr" HeaderText="Volunteer Type" />
            <asp:BoundField DataField="CenterName" HeaderText="Center" />
            <asp:BoundField DataField="DateTimeLogged" HeaderText="Date" />
            <asp:BoundField DataField="TaskDescr" HeaderText="Task" />
            <asp:BoundField DataField="Child" HeaderText="Child" />
            <asp:BoundField DataField="NumberMinutes" HeaderText="Minutes" />
            <asp:BoundField DataField="PricePerMinute" HeaderText="Price Per Minute" />
            <asp:BoundField DataField="TotalValue" HeaderText="Total Value" />
        </Columns>
       
        <pagerstyle />
        <PagerSettings />
    </asp:GridView>

        <!-- I found the below at https://msdn.microsoft.com/en-us/library/aa479347.aspx -->
        <i>You are viewing page
        <%=gvReportData.PageIndex + 1%>
        of
        <%=gvReportData.PageCount%>
        </i>

    <div id="divMonthlyRpt" runat="server"><asp:GridView ID="gvMonthlySummaryReport" runat="server" Visible="true"></asp:GridView></div>

</asp:content>
