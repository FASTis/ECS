using System;


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
            else
            {
                if (Session["IsAdmin"].ToString().Equals("true"))
                    divAdmin.Visible = true;
                else
                    divAdmin.Visible = false;
            }
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

        protected void btnEditTables_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditTables.aspx");
        }

        protected void btnRunReports_Click(object sender, EventArgs e)
        {
            Response.Redirect("RunReports.aspx");
        }
    }
}