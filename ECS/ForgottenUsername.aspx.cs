using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class ForgottenUsername : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ValidEntry();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private void ValidEntry()
        {
            //lblRetVal.Text = "";
            //Bll bll = new Bll();
            //bool retVal = bll.ValidateUserInfo(txtUserName.Text, txtPhone.Text);
            //string username = txtUserName.Text;

            //if (retVal)
            //{
            //    lblRetVal.Text = "Your username is";
            //}


            //else
            //{
            //    lblRetVal.Text = "Unable to find a username that matches the information.";

            //}
        }
    }
}