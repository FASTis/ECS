<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogInKind.aspx.cs" Inherits="ECS.LogInKind" %>

<asp:Content id="ContentLogInKind" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <!-- When using a Master Page File, you must put your content inside of a content block. [Cici]-->

        <!-- form to enter in-kind information -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="logInKindForm">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Enter Your In-kind Hours</legend>

                        <!-- select center -->
                       <div class="form-group">
                            <asp:Label ID="lblCenter" runat="server" Text="Select A Center" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddCenters" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>                              
                            </div> 
                        </div>

                        <!-- select activity -->
                       <div class="form-group">
                            <asp:Label ID="lblTask" runat="server" Text="Select An Activity" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddTasks" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList><br />
                            <asp:CheckBox ID="chkTask" runat="server" Text="&nbsp;&nbsp;Select if you've read<br>&nbsp;&nbsp;the activity description." AutoPostBack="False"></asp:CheckBox>                          
                            </div>
                        </div>

                        <!-- date volunteered -->
                        <div class="form-group">
                            <asp:Label ID="lblDateMonth" runat="server" Text="Select the date you volunteered:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
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
                            <asp:Label ID="Label1" runat="server" Text="Enter the hours you volunteered that day:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddHours" runat="server"  CssClass="form-control ddl" AutoPostBack="False"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Enter the minutes you volunteered that day:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddMinutes" runat="server"  CssClass="form-control ddl" AutoPostBack="False"></asp:DropDownList>
                            </div>
                        </div>

                        <!-- submit/cancel buttons -->
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
</asp:Content>