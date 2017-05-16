<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditVolunteer.aspx.cs" Inherits="ECS.EditVolunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="ManageVolunteers.aspx">Manage Volunteers</a></li>
        <li class="active">Edit Volunteer</li>
    </ul>

    <div>
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Add/Edit Volunteer<i class="fa fa-pencil pull-right"></i></legend>
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
                            <asp:TextBox ID="txtLast4ofPhoneNumber" runat="server" placeholder="Last 4 of Phone Number" CssClass="form-control"></asp:TextBox><br />
                            <asp:Button ID="btnManageChildren" runat="server" CssClass="btn btn-info" Width="300" Text="Manage Children" OnClick="btnManageChildren_Click" />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnSubmit" Width="97" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnReset" Width="97" runat="server" CssClass="btn btn-primary" Text="Reset" OnClick="btnReset_Click" />
                            <asp:Button ID="btnCancel" Width="97" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                            <br />
                            <h5><strong>
                                <asp:Label ID="lblRetVal" ForeColor="Orange" runat="server"></asp:Label></strong></h5>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>


</asp:Content>
