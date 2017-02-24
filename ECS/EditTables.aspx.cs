using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class EditTables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string s = Session["IsAdmin"].ToString(); // test to make sure user is an Admin.
                if (s.Equals("false"))
                    Response.Redirect("Default.aspx");
            }
            catch (NullReferenceException)
            {
                Response.Redirect("Default.aspx"); // if the IsAdmin flag is null, redirect to Default page.
            }
        }

        protected void btnStaffTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageStaffTypes.aspx");
        }

        protected void btnVolunteerTypes_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageVolunteerTypes.aspx");
        }

        protected void btnCompanies_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCompanies.aspx");
        }

        protected void btnVolunteers_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageVolunteers.aspx");
        }

        protected void btnCenters_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageCenters.aspx");
        }

        protected void btnTasks_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageTasks.aspx");
        }
    }
}