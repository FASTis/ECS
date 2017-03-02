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
            ValidEntry();
        }

        private bool ValidEntry()
        {
            string username = txtUserName.Text;
            string last4 = txtPhone.Text;

            bool valid = false;
            if (!String.IsNullOrEmpty(last4) && !String.IsNullOrEmpty(username))
            {
                
                valid = true;
            }
            else
            {
                //TODO Display error msg (not all info filled in)
            }

            return valid;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}