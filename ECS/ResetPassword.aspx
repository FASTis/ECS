<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="ECS.ResetPassword" %>

<asp:Content ID="ContentResetPassword" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="resetPassword">
        <div class="form-horizontal">
            <fieldset>
                <legend>Reset Password</legend>

                <!-- new password -->
                <div class="form-group">
                    <asp:Label ID="lblNewPass" runat="server" Text="New Password:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtNewPass_TextChanged" MaxLength="4"></asp:TextBox>
                    </div>
                </div>

                <!-- confirm password -->
                <div class="form-group">
                    <asp:Label ID="lblConPass" runat="server" Text="Confirm Password:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtConPass" runat="server" TextMode="Password" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtConPass_TextChanged" MaxLength="4"></asp:TextBox>
                    </div>
                </div>

                <!-- submit/cancel button -->
                <br />
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                        <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                        <br />
                        <br />
                        <h5><strong>
                            <asp:Label ID="lblRetVal" ForeColor="Orange" runat="server"></asp:Label></strong></h5>
                    </div>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>
