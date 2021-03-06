﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ECS.Default" %>
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
                        <div class="form-group">
                            <asp:Button ID="btnVolunteers" runat="server" Width="200" Text="Manage Volunteers" CssClass="btn btn-info" OnClick="btnVolunteers_Click"/>
                        </div>  

                        <div class="form-group">
                            <asp:Button ID="btnEditTables" runat="server" Width="200" Text="Edit Lookup Tables" CssClass="btn btn-info" OnClick="btnEditTables_Click" />
                        </div>
        
                        <div class="form-group">
                            <asp:Button ID="btnRunReports" runat="server" Width="200" Text="Run Reports" CssClass="btn btn-info" OnClick="btnRunReports_Click" />
                        </div>
                </div>                
            </td>
            <td width="100px">&nbsp;</td>
            <td valign="middle" style="border: 5px solid black; border-radius: 10px;">

                    <table width="375">
                        <tr><td colspan="3">&nbsp</td></tr>
                        <tr>
                            <td width="20">&nbsp;</td>
                            <td align="center">
                                <asp:Label Font-Bold="true" Font-Size="Large" runat="server" ID="lblHeadingForHoursForCurrentMonth">
                                    Volunteer Hours for Current Month:
                                </asp:Label>
                            </td>
                            <td width="20">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">
                                <br /><asp:Label Font-Bold="true" Font-Size="Large" runat="server" ID="lblHoursForCurrentMonth"></asp:Label><br /><br />
                                <asp:Label Font-Bold="true" Font-Size="Medium" runat="server" ID="lblNonHomeHours"></asp:Label><br /><br />
                                <asp:Label Font-Bold="true" Font-Size="Smaller" runat="server" ID="lblWarning" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr><tr><td colspan="3">&nbsp</td></tr></tr>

                    </table>
                
            </td>
        </tr>
    </table>





</asp:Content>
