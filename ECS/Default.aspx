<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ECS.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>Main Menu</legend>
    
    <table>
        <tr>
            <td valign="top">           
                <div class="form-group">
                    <asp:Button ID="btnInkind" runat="server" Width="200" Text="Log In-Kind Hours" CssClass="btn btn-primary" OnClick="btnInkind_Click"/>
                </div>

                <div class="form-group">
                    <asp:Button ID="btnEditProfile" runat="server" Width="200" Text="View/Edit Profile" CssClass="btn btn-primary" OnClick="btnEditProfile_Click" />
                </div>
                <div class="form-group">
                    <asp:Button ID="btnLogoff" runat="server" Width="200" Text="Log Off" CssClass="btn btn-primary" OnClick="btnLogoff_Click" />
                </div>
            </td>
            <td width="100px">&nbsp;</td>
            <td valign="top">    
                <div id="divAdmin" runat="server">
                    <asp:Panel runat="server" GroupingText="Admin Tools">
                        <div class="form-group">
                            <asp:Button ID="btnEditTables" runat="server" Width="200" Text="Edit Lookup Tables" CssClass="btn btn-info" OnClick="btnEditTables_Click" />
                        </div>
        
                        <div class="form-group">
                            <asp:Button ID="btnRunReports" runat="server" Width="200" Text="Run Reports" CssClass="btn btn-info" OnClick="btnRunReports_Click" />
                        </div>
                    </asp:Panel>
                </div>                
            </td>
        </tr>
    </table>





</asp:Content>
