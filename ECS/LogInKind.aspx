<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogInKind.aspx.cs" Inherits="ECS.LogInKind" %>

<asp:Content id="ContentLogInKind" contentplaceholderid="ContentPlaceHolder1" runat="server">
<!-- When using a Master Page File, you must put your content inside of a content block. [Cici]-->
        <!-- form to enter in-kind information -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="logInKindForm">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Enter Your In-kind</legend>

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
                            <asp:CheckBox ID="chkTask" runat="server" Text="Select the checkbox if you've read the activity description." AutoPostBack="True"></asp:CheckBox>                          
                            </div>
                        </div>

                        <!-- date of volunteering -->
                        <br />
                        <div class="form-group">
                            <asp:Label ID="lblDate" runat="server" Text="Enter the date you volunteered:" CssClass="control-label"></asp:Label><br />
                            <asp:Label ID="lblMonth" runat="server" Text="Month" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtMonth" runat="server" placeholder="Month" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Label ID="lblDay" runat="server" Text="Day" CssClass="col-md-offset-2 col-md-3 control-label"></asp:Label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtDay" runat="server" placeholder="Day" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <!-- enter time -->
                        <br />
                       <div class="form-group">
                           <asp:Label ID="lblTime" runat="server" Text="Enter the amount of time you volunteered:" CssClass="control-label"></asp:Label><br />
                           <asp:Label ID="lblHours" runat="server" Text="Volunteer Hours" CssClass="col-md-3 control-label"></asp:Label>
                           <div class="col-md-2">
                               <asp:TextBox ID="txtHours" runat="server" placeholder="Hours" CssClass="form-control"></asp:TextBox>
                           </div>
                           <asp:Label ID="lblMinutes" runat="server" Text="Volunteer Minutes" CssClass="col-md-offset-2 col-md-3 control-label"></asp:Label>
                           <div class="col-md-2">
                               <asp:TextBox ID="txtMinutes" runat="server" placeholder="Minutes" CssClass="form-control"></asp:TextBox>
                           </div>
                        </div>


                        <!-- submit/cancel buttons -->
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-offset-7 col-md-2">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="col-md-offset-1 col-md-2">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
</asp:Content>