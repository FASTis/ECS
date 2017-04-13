using System;
using ECS.BLL;
using System.Data;

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

                GetHoursForCurrentMonth();
            }
        }
        protected void GetHoursForCurrentMonth()
        {
            DateTime startDate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, 1);
            DateTime endDate = startDate.AddMonths(1).AddDays(-1);
            int volunteerID = Convert.ToInt32(Session["VolunteerID"]);
            decimal hrs = 0;

            Bll bll = new Bll();
            DataTable dt = bll.GetHoursForCurrentMonth(startDate, endDate, volunteerID);

            foreach (DataRow row in dt.Rows)
            {
                lblHoursForCurrentMonth.Text = row[0].ToString() + " Total Hours";
                lblNonHomeHours.Text = "(" + row[1].ToString() + " In Center Hours)";
                hrs = Convert.ToDecimal(row[1]);
            }

            //Alert when hours exceed 9 non-home hours.
            hrs = Convert.ToInt32(dt.Rows[0][1]);
            if (hrs > new decimal(10.00))
            {
                lblNonHomeHours.BackColor = System.Drawing.Color.Yellow;
                lblWarning.Text = "WARNING: You have exceeded the maximum of 10 in center volunteer hours allowed per month.";
            }
            else if (hrs >= new decimal(9.00))
            {
                lblNonHomeHours.BackColor = System.Drawing.Color.Yellow;
                lblWarning.Text = "WARNING: You are close to the maximum of 10 in center volunteer hours allowed per month.";
            }
            else
            {
                lblNonHomeHours.ForeColor = lblHoursForCurrentMonth.ForeColor;
                lblWarning.Text = "";
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