<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="ECS.ResetPassword" %>

<asp:Content id="ContentResetPassword" contentplaceholderid="ContentPlaceHolder1" runat="server">

        <div class="resetPassword">
        <div class="form-horizontal">
            <fieldset>
                <legend>Reset Password</legend>

                <!-- new password -->
                <div class="form-group">
                    <asp:Label ID="lblNewPass" runat="server" Text="New Password:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtNewPass" runat="server" placeholder=""  TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- confirm password -->
                <div class="form-group">
                    <asp:Label ID="lblConPass" runat="server" Text="Confirm Password:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtConPass" runat="server" placeholder=""  TextMode="Password" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- submit/cancel button -->
                <br />
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                            <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </fieldset>
        </div>
    </div>

</asp:Content>