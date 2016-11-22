using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;


namespace ECS
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sessionUser = "";
            try
            {
                sessionUser = Session["Username"].ToString();
            }
            catch (NullReferenceException)
            {
                sessionUser = "";
            }

            if (String.IsNullOrEmpty(sessionUser))
                Response.Redirect("Login.aspx");
        }

        protected void btnInkind_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogInKind.aspx");
        }

        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void btnLogoff_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx", false);
        }
    }
}