<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LogInKindThankYou.aspx.cs" Inherits="ECS.LogInKindThankYou" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="divSignatureBox" align="center" runat="server" >
        <h3>By signing below, you assert that the information here is correct.</h3>
        <div id="divConfirmation" runat="server"></div>
        <iframe src="signatureForm.aspx" width="70%" height="350px" scrolling="no" frameborder="0"></iframe>
    </div>
    <div id="divThankYouBox" runat="server" align="center">
    <h3>Thank You!</h3>
    <p>Your in-kind hours have been logged, and your signature has been captured.</p>
    </div>
</asp:Content>
