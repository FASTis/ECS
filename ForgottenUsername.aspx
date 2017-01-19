<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ForgottenUsername.aspx.cs" Inherits="ECS.ForgottenUsername" %>

<asp:Content id="ContentForgotUsername" contentplaceholderid="ContentPlaceHolder1" runat="server">

    <div class="forgottenUsername">
        <div class="form-horizontal">
            <fieldset>
                <legend>Forgotten Username</legend>

                <!-- first name -->
                <div class="form-group">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtFirstName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- last name -->
                <div class="form-group">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtLastName" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- last 4 of phone -->
                <div class="form-group">
                    <asp:Label ID="lblPhone" runat="server" Text="Last 4 Digits of Phone Number:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtPhone" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>

                <!-- submit/cancel button -->
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

</asp:Content>