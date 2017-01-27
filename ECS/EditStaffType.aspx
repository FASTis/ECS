﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditStaffType.aspx.cs" Inherits="ECS.EditStaffType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li><a href="ManageStaffTypes.aspx">Manage Staff Types</a></li>
        <li class="active">Edit Staff Type</li>
    </ul>
    
        <div class="form-horizontal">
            <fieldset>
                <legend>Edit Staff Type</legend>

                <!-- username -->
                <div class="form-group">
                    <asp:Label ID="lblStaffType" runat="server" Text="Staff Type:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtStaffType" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
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
</asp:Content>
