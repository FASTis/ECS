using System;
using ECS.BLL;

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

                lblHoursForCurrentMonth.Text = GetHoursForCurrentMonth().ToString();
            }
        }
        protected decimal GetHoursForCurrentMonth()
        {
            DateTime startDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            DateTime endDate = startDate.AddMonths(1).AddDays(-1);
            int volunteerID = Convert.ToInt32(Session["VolunteerID"]);

            Bll bll = new Bll();
            return bll.GetHoursForCurrentMonth(startDate, endDate, volunteerID);
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