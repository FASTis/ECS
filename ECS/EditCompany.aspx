<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditCompany.aspx.cs" Inherits="ECS.EditCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ul class="breadcrumb">
        <li><a href="Default.aspx">Home</a></li>
        <li><a href="EditTables.aspx">Edit Tables</a></li>
        <li><a href="ManageStaffTypes.aspx">Manage Companies</a></li>
        <li class="active">Edit Company</li>
    </ul>
    
        <div class="form-horizontal">
            <fieldset>
                <legend>Edit Company</legend>

                <!-- form entry -->
                <div class="form-group">
                    <asp:Label ID="lblCompany" runat="server" Text="Company:" CssClass="col-lg-2 control-label"></asp:Label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="txtCompany" runat="server" placeholder="" CssClass="form-control"></asp:TextBox>
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
