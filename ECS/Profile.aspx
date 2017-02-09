<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="ECS.Profile" %>

<asp:content id="Content3" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <!-- When using a Master Page File, you must put your content inside of a content block. [Cici]-->
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">My Profile</li>
    </ul>
        <div>
            <div class="registrationform">
                <div class="form-horizontal">
                    <fieldset>
                       <legend>My Profile<i class="fa fa-pencil pull-right"></i></legend>
                       <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtFirstName" runat="server" placeholder="First Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       <div class="form-group">
                            <asp:Label ID="Label6" runat="server" Text="Last Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtLastName" runat="server" placeholder="Last Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       <div class="form-group">
                            <asp:Label ID="Label7" runat="server" Text="User Name" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtUserName" runat="server" placeholder="User Name" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                       <div class="form-group">
                            <asp:Label ID="Label8" runat="server" Text="4-Digit PIN" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtPIN" runat="server" placeholder="PIN" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                          <asp:Label ID="Label5" runat="server" Text="Volunteer Type" CssClass="col-lg-2 control-label"></asp:Label>                          
                            <div class="col-lg-10">
                                <asp:DropDownList ID="ddVolunteerType" runat="server" CssClass="form-control" AutoPostBack="False">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>                              
                            </div>
                        </div>
                       <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Last 4 Digits of Phone" CssClass="col-lg-2 control-label"></asp:Label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="txtLast4ofPhoneNumber" runat="server" placeholder="Last 4 of Phone Number" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-10 col-lg-offset-2">
                                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-info" Text="Reset" OnClick="btnReset_Click" />   
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click"  />                                                         
                            <br />
                            <br />
                            <h5><strong>
                                <asp:Label ID="lblRetVal" ForeColor="Orange" runat="server"></asp:Label></strong></h5>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
</asp:content>

