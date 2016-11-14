<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="ManageVolunteers.aspx.cs" Inherits="ECS.ManageVolunteers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                    <h3>Manage Volunteers</h3>
                    <br />
                    <div class="col-lg-10 col-lg-offset-2">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" />
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Text="Edit"  />                           
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-warning" Text="Delete"  />
                    </div>
                    <br />
                    <asp:GridView ID="gvVolunteers" runat="server"></asp:GridView>
</asp:Content>
