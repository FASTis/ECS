using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;

namespace ECS
{
    public partial class LogInKindThankYou : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string signatureReceived = Request.QueryString["signature"]; //this is passed by saveButton.addEventListener in app.js [Cici]            
            if (signatureReceived == "true")
            {
                divSignatureBox.Visible = false;
                divThankYouBox.Visible = true;
            }
            else
            {
                divSignatureBox.Visible = true;
                divThankYouBox.Visible = false;
                GetSignature();
            }
        }

        private void GetSignature()
        {
            string s;
            string center = Session["Center"].ToString();
            string task = Session["Task"].ToString();

            string readDescr = Session["ReadDescr"].ToString();
            if (readDescr == "True")
                readDescr = "Yes";
            else
                readDescr = "No";

            string dateVal = Session["Date"].ToString();
            string hoursVal = Session["Hours"].ToString();
            string minVal = Session["Minutes"].ToString();

            s = String.Format(@"<b>Center:</b> {0}
                                <br /><b>Task:</b> {1}
                                <br /><b>Read Description?</b> {2}
                                <br /><b>Date:</b> {3}</td>
                                <br /><b>Time Logged:</b> {4} hours : {5} minutes",
                              center, task, readDescr, dateVal, hoursVal, minVal);

            divConfirmation.InnerHtml = s;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}