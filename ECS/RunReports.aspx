<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RunReports.aspx.cs" Inherits="ECS.RunReports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li class="active">Run Reports</li>
    </ul>
    
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div class="form-horizontal">
            <fieldset>
                <legend>Run Reports</legend>

                <!-- select center -->
                <div class="form-group">
                    <asp:Label ID="lblCenter" runat="server" Text="Select A Center" CssClass="col-md-3 control-label"></asp:Label>
                    <div class="col-md-offset-1 col-md-8">
                        <asp:DropDownList ID="ddCenters" runat="server" CssClass="form-control ddl" AutoPostBack="False">
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
        
            </fieldset>
        </div>
    </div>

</asp:Content>
