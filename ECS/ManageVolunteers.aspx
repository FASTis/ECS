<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageVolunteers.aspx.cs" Inherits="ECS.ManageVolunteers" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <!--[if lt IE 7]> <html class="no-js ie6 oldie" lang="en"> <![endif]-->
    <!--[if IE 7]>    <html class="no-js ie7 oldie" lang="en"> <![endif]-->
    <!--[if IE 8]>    <html class="no-js ie8 oldie" lang="en"> <![endif]-->
    <!--[if IE 9]> <html class="no-js ie9 oldie" lang="en"> <![endif]-->
    <meta charset="utf-8">
    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="description" content="">
    <title>ECS Volunteer Tracking System</title>
    <!-- ============ Google fonts ============ -->
    <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet'
        type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300,800'
        rel='stylesheet' type='text/css' />
    <!-- ============ Add custom CSS here ============ -->
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
        <div>
            <form id="form1" runat="server">
                <div>
                    <h3>Manage Volunteers</h3>
                    <br />
                    <div>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" />
                    <asp:Button ID="btnEdit" runat="server" CssClass="btn btn-primary" Text="Edit"  />                           
                    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-warning" Text="Delete"  />
                    </div>
                    <br />
                    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
                    </asp:ScriptManager>
                    <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
                    <telerik:RadGrid ID="RadGrid1" Width="75%" runat="server"
                        OnNeedDataSource="RadGrid1_NeedDataSource"
                        selecteditemstyle="Si" AllowMultiRowSelection="True" itemstyle="Wrap" AllowSorting="True">
                        <MasterTableView DataKeyNames="VolunteerID" TableLayout="Fixed">
                            <Columns>
                                <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn">
                                    <HeaderStyle Width="30px"></HeaderStyle>
                                </telerik:GridClientSelectColumn>
                            </Columns>
                        </MasterTableView>
                        <ClientSettings>
                            <Scrolling AllowScroll="True" UseStaticHeaders="true" />
                            <Selecting AllowRowSelect="True" />
                        </ClientSettings>
                    </telerik:RadGrid>
                </div>
            </form>
        </div>
    </div>
    
</body>
</html>
