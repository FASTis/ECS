using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ECS.BLL;
using ECS.Model;
using System.Web.SessionState;


namespace ECS
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ValidateEntry()
        {
            lblRetVal.Text = "";
            Bll bll = new Bll();
            bool retVal = bll.ValidateLogin(txtUserName.Text, txtPIN.Text);
            if (retVal)
            {
                User user = bll.GetUserInfo(txtUserName.Text);
                SetSessionVariablesForUser(user);
                txtUserName.Text = "";
                txtPIN.Text = "";
                Response.Redirect("Default.aspx");
            }
            else
                lblRetVal.Text = "Invalid username or password.";
        }

        private void SetSessionVariablesForUser(User user)
        {
            Session.Clear(); // remove anything set by a previous logon
            Session["FirstName"] = user.FirstName;
            Session["LastName"] = user.LastName;
            Session["VolunteerType"] = user.VolunteerTypeDescr;
            Session["Username"] = user.UserID;
            Session["VolunteerID"] = user.VolunteerID;
            Session["Last4OfPhone"] = user.Last4DigitsOfPhone;
            Session["PIN"] = user.PIN;
            Session["IsAdmin"] = user.IsAdmin.ToString().ToLower();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ValidateEntry();
        }
    }
}