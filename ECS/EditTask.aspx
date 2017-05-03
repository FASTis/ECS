<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditTask.aspx.cs" Inherits="ECS.EditTask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li><a href="ManageTasks.aspx">Manage Tasks</a></li>
        <li class="active">Edit Task</li>
    </ul>

    <div class="form-horizontal">
        <fieldset>
            <legend>Add/Edit Task</legend>

            <!-- form entry -->
            <div class="form-group">
                <asp:Label ID="lblTaskDescr" runat="server" Text="Task Description:" CssClass="col-lg-2 control-label"></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtTaskDescription" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPricePerMinute" runat="server" Text="Price Per Minute:" CssClass="col-lg-2 control-label"></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtPricePerMinute" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblRestrictToTypes" runat="server" Text="RestrictToTypes (ex: 1,2):" CssClass="col-lg-2 control-label"></asp:Label>
                <div class="col-lg-10">
                    <asp:TextBox ID="txtRestrictToTypes" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
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
