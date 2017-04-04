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


        //check info entered into text boxes, if info missing display error
        //if all there, check db for match (UserLogon.UserID & Volunteer.Last4DigitsOfPhone)
        //if match in db redirect to pass reset, else display error
        private void ValidEntry()
        {
            lblRetVal.Text = "";
            Bll bll = new Bll();
            bool retVal = bll.ValidateUserInfo(txtUserName.Text, txtPhone.Text);
            string username = txtUserName.Text;

            if (retVal)
            {
                Response.Redirect("ResetPassword.aspx?username="+username.Trim());
            }            


            else
            {
                lblRetVal.Text = "Invalid username or last four digits of phone number.";

            }
        }

    protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }
    }
}