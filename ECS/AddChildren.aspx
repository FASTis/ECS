<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddChildren.aspx.cs" Inherits="ECS.AddChildren" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="Profile.aspx">My Profile</a></li>
        <li class="active">Add/Edit Children</li>
    </ul>
    <table>
        <tr>
            <td>Child's First Name</td><td>&nbsp</td><td>Child's Last Name</td><td>&nbsp;</td><td>Date of Birth</td><td></td>
        </tr>
        <tr>
            <td><asp:TextBox ID="txtFirstName" CssClass="form-control" runat="server"></asp:TextBox></td><td></td><td><asp:TextBox ID="txtLastName" CssClass="form-control"  runat="server"></asp:TextBox></td><td></td><td><asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" ></asp:TextBox></td><td><asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Add Child" OnClick="btnSubmit_Click" /></td>
        </tr>
    </table>
    <br />
    <asp:ListBox runat="server" ID="lstChildren" Font-Size="Larger" CssClass="form-control"></asp:ListBox>
</asp:Content>
