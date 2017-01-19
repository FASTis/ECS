﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signatureForm.aspx.cs" Inherits="ECS.signatureForm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en">
<head>
  <meta charset="utf-8">
  <title></title>
  <meta name="description" content="Signature Pad - HTML5 canvas based smooth signature drawing using variable width spline interpolation.">

  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">

  <link rel="stylesheet" href="css/signature-pad.css">
  <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />

  <script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-39365077-1']);
      _gaq.push(['_trackPageview']);

      (function () {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();
  </script>
</head>
<body onselectstart="return false">
<!--  <a id="github" href="https://github.com/szimek/signature_pad">
    <img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png" alt="Fork me on GitHub">
  </a>-->
          <div id="signature-pad" class="m-signature-pad">
              <div class="m-signature-pad--body">
                  <canvas></canvas>
              </div>
              <form id="sigForm" runat="server">
                  <div class="m-signature-pad--footer">
                      <div class="description">Sign above</div>
                      <asp:Button ID="btnSubmit" runat="server" class="button save" data-action="save" CssClass="btn btn-primary" Text="Save" />
                      <asp:Button ID="btnCancel" runat="server" class="button clear" data-action="clear" CssClass="btn btn-warning" Text="Clear" />
                  </div>
              </form>

          </div>
  <script src="js/signature_pad.js"></script>
  <script src="js/app.js"></script>
</body>
</html>
