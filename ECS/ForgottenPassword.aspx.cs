using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;
using ECS.Model;

namespace ECS
{
    public partial class ForgottenPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (ValidEntry())
            {
                string username = txtUserName.Text;
                string last4ofPhone = txtPhone.Text;

                Response.Redirect("ResetPassword.aspx");

                //Bll bll = new Bll();
                //string pin = bll.GetPIN(username, last4ofPhone);
                //string returnedValue = "Your PIN is: " + pin;
                //string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedValue + "', 300, 100, 'ECS Volunteer App: Forgot Password'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                //Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);

            }

        }

        private bool ValidEntry()
        {
            bool valid = false;
            if (!String.IsNullOrEmpty(txtPhone.Text) && !String.IsNullOrEmpty(txtUserName.Text))
                valid = true;

            return valid;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}