<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogInKind.aspx.cs" Inherits="ECS.LogInKind" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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

    <!-- navigation bar -->
    <form id="form1" runat="server">
    <div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
        <div class="container">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">ECS Head Start</a>
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-menubuilder">
                    <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
                        class="icon-bar"></span><span class="icon-bar"></span>
                </button>
            </div>
            
            <!-- log out button - need to change from registration form to volunteer home page once created -->
            <div class="collapse navbar-collapse navbar-menubuilder">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Default.aspx">Log Out</a> </li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container">
        <!-- clock image thingy -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-center">
            <div id="banner">
                <h1><strong>Volunteer Tracking System</strong></h1>
                <h5><strong><asp:Label ID="lblRetVal" runat="server"></asp:Label></strong></h5>
            </div>
        </div>

        <!-- form to enter in-kind information -->
        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
            <div class="logInKindForm">
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Enter Your In-kind <i class="fa fa-pencil pull-right"></i></legend>

                        <!-- select center -->
                       <div class="form-group">
                            <asp:Label ID="lblCenter" runat="server" Text="Select A Center" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddCenters" runat="server" CssClass="form-control ddl" AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>                              
                            </div> 
                        </div>

                        <!-- select activity -->
                       <div class="form-group">
                            <asp:Label ID="lblTask" runat="server" Text="Select An Activity" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-offset-1 col-md-8">
                                <asp:DropDownList ID="ddTasks" runat="server" CssClass="form-control ddl" AutoPostBack="True">
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList><br />
                            <asp:CheckBox ID="chkTask" runat="server" Text="Select the checkbox if you've read the activity description." AutoPostBack="True"></asp:CheckBox>                          
                            </div>
                        </div>

                        <!-- date of volunteering -->
                        <br />
                        <div class="form-group">
                            <asp:Label ID="lblDate" runat="server" Text="Enter the date you volunteered:" CssClass="control-label"></asp:Label><br />
                            <asp:Label ID="lblMonth" runat="server" Text="Month" CssClass="col-md-3 control-label"></asp:Label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtMonth" runat="server" placeholder="Month" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Label ID="lblDay" runat="server" Text="Day" CssClass="col-md-offset-2 col-md-3 control-label"></asp:Label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtDay" runat="server" placeholder="Day" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <!-- enter time -->
                        <br />
                       <div class="form-group">
                           <asp:Label ID="lblTime" runat="server" Text="Enter the amount of time you volunteered:" CssClass="control-label"></asp:Label><br />
                           <asp:Label ID="lblHours" runat="server" Text="Volunteer Hours" CssClass="col-md-3 control-label"></asp:Label>
                           <div class="col-md-2">
                               <asp:TextBox ID="txtHours" runat="server" placeholder="Hours" CssClass="form-control"></asp:TextBox>
                           </div>
                           <asp:Label ID="lblMinutes" runat="server" Text="Volunteer Minutes" CssClass="col-md-offset-2 col-md-3 control-label"></asp:Label>
                           <div class="col-md-2">
                               <asp:TextBox ID="txtMinutes" runat="server" placeholder="Minutes" CssClass="form-control"></asp:TextBox>
                           </div>
                        </div>


                        <!-- submit/cancel buttons -->
                        <br />
                        <div class="form-group">
                            <div class="row">
                                <div class="col-md-offset-7 col-md-2">
                                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmit_Click" />
                                </div>
                                <div class="col-md-offset-1 col-md-2">
                                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-warning" Text="Cancel" OnClick="btnCancel_Click" />
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/jquery.backstretch.js" type="text/javascript"></script>
    <script type="text/javascript">
        'use strict';
        /* ========================== */
        /* ::::::: Backstrech ::::::: */
        /* ========================== */
        // You may also attach Backstretch to a block-level element
        $.backstretch(
        [
            "img/44.jpg",
            "img/colorful.jpg",
            "img/34.jpg",
            "img/images.jpg"
        ],
        {
            duration: 4500,
            fade: 1500
        }
    );
    </script>
    </form>
</body>
</html>