<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogInKind.aspx.cs" Inherits="ECS.LogInKind" %>

<asp:Content ID="ContentLogInKind" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- When using a Master Page File, you must put your content inside of a content block. [Cici]-->

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Log In Kind Hours</li>
    </ul>

    <!-- form to enter in-kind information -->
        <div>
            <div class="form-horizontal">
                <fieldset>
                <legend>Enter Your In-kind Hours</legend>

                <!-- select center -->
                <div class="form-group">
                    <asp:Label ID="lblCenter" runat="server" Text="Select a Center:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:DropDownList ID="ddCenters" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- select activity -->
                <div class="form-group">
                    <asp:Label ID="lblTask" runat="server" Text="Select an Activity:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:DropDownList ID="ddTasks" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList><br />
                        <asp:CheckBox ID="chkTask" runat="server" AutoPostBack="False"></asp:CheckBox>&nbsp;&nbsp;I have read the <a href="#">activity description</a> for the activity above.
                    </div>
                </div>

                <!-- select child (only show this section if children exist for this volunteer!) -->
                <div class="form-group" id="divSelectChild" runat="server">
                    <asp:Label ID="Label3" runat="server" Text="Select a Child:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:DropDownList ID="ddChildren" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList><br />
                    </div>
                </div>

                <!-- date volunteered -->
                <div class="form-group">
                    <asp:Label ID="lblDateMonth" runat="server" Text="Select the date you volunteered:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-4">
                        <asp:Calendar ID="calendarInKind" runat="server" BackColor="#f8f8f8" BorderColor="#aea79f" Font-Size="9pt" ForeColor="#333333" Height="200px" Width="90%" BorderWidth="1px" DayNameFormat="Shortest" ShowGridLines="True">
                            <DayHeaderStyle Font-Bold="True" Height="1px" BackColor="#741f72" ForeColor="#f7f7f7" />
                            <NextPrevStyle Font-Size="9pt" ForeColor="#333333" />
                            <OtherMonthDayStyle ForeColor="#c6c6c6" />
                            <SelectedDayStyle BackColor="#e95420" Font-Bold="True" />
                            <SelectorStyle BackColor="#e7a413" />
                            <TitleStyle BackColor="#e7a413" Font-Bold="True" Font-Size="11pt" ForeColor="#333333" />
                            <TodayDayStyle BackColor="#e7a413" ForeColor="White" />
                        </asp:Calendar>
                    </div>
                </div>

                <!-- enter time -->
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Enter the total time you volunteered that day:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:DropDownList ID="ddHours" runat="server" CssClass="form-control ddl" AutoPostBack="False"></asp:DropDownList><br />
                        <asp:DropDownList ID="ddMinutes" runat="server" CssClass="form-control ddl" AutoPostBack="False"></asp:DropDownList>
                    </div>
                </div>

                <!-- submit/cancel buttons -->
                <br />
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>
</asp:Content>
