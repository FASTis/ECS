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
                                <asp:DropDownList ID="ddCenters" runat="server" CssClass="form-control ddl" AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>                              
                            </div> 
                        </div>

                        <!-- select activity -->
                       <div class="form-group">
                            <asp:Label ID="lblTask" runat="server" Text="Select An Activity" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddTasks" runat="server" CssClass="form-control ddl" AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList><br />
                            <asp:CheckBox ID="chkTask" runat="server" Text="&nbsp;&nbsp;Select if you've read the activity description." AutoPostBack="True"></asp:CheckBox>                          
                            </div>
                        </div>

                        <!-- date volunteered -->
                        <div class="form-group">
                            <asp:Label ID="lblDateMonth" runat="server" Text="Select the date you volunteered:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:Calendar ID="calendarInKind" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                    <DayStyle BackColor="#CCCCCC" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                </asp:Calendar>
                            </div>
                        </div>
                       
                       <!-- enter time -->
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Enter the hours you volunteered that day:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddHours" runat="server"  CssClass="form-control ddl" AutoPostBack="True"></asp:DropDownList>
                            </div>
                        </div>

                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Enter the minutes you volunteered that day:" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddMinutes" runat="server"  CssClass="form-control ddl" AutoPostBack="True"></asp:DropDownList>
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