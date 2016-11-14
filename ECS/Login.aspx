<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ECS.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- When using a Master Page File, you must put your content inside of a content block. [Cici]-->
    <div>
        <div class="registrationform">
            <div class="form-horizontal">
                <fieldset>
                    <legend>Please Log On.<i class="fa fa-pencil pull-right"></i></legend>
                    <div class="form-group">
                        <asp:Label ID="Label7" runat="server" Text="Username:" CssClass="col-lg-2 control-label"></asp:Label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtUserName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>

                    </div>
                    <div class="form-group">
                        <asp:Label ID="Label8" runat="server" Text="Password:" CssClass="col-lg-2 control-label"></asp:Label>
                        <div class="col-lg-10">
                            <asp:TextBox ID="txtPIN" runat="server" TextMode="Password" placeholder="" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Log On" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-warning" Text="Register" OnClick="btnRegister_Click" />
                            <br />
                            <h6><a href="#">Forgot Password</a><br />
                                <a href="#">Forgot Username</a><br />
                                <a href="#">Admin Logon</a><br />
                            </h6>
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
</asp:Content>
