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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            lblRetVal.Text = "";
            Bll bll = new Bll();
            bool retVal = bll.ValidateLogin(txtUserName.Text, txtPIN.Text);
            if (retVal)
            {
                User user = bll.GetUserInfo(txtUserName.Text);
                Session["FirstName"] = user.FirstName;
                Session["LastName"] = user.LastName;
                Session["VolunteerType"] = user.VolunteerTypeDescr;
                Session["Username"] = user.UserID;
                Session["VolunteerID"] = user.VolunteerID;
                txtUserName.Text = "";
                txtPIN.Text = "";
                //lblRetVal.Text = String.Format("Welcome, {0}! Your last name is {1}, and you are a {2}.", Session["FirstName"], Session["LastName"], Session["VolunteerType"]);
                Response.Redirect("Default.aspx");
            }
            else
                lblRetVal.Text = "There was a problem logging in.";
        }
    }
}