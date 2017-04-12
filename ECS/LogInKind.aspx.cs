using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ECS.BLL;
using ECS.Model;


namespace ECS
{
    public partial class LogInKind : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int volunteerId = Convert.ToInt32(Session["VolunteerID"]);
                LoadHours();
                LoadMinutes();
                LoadCenters();
                LoadTasks();                
                LoadChildren(volunteerId);
                calendarInKind.SelectedDate = DateTime.Today;
            }
        }
        protected void calendarInKind_DayRender(object sender, DayRenderEventArgs e)
        { // found this via Google: https://forums.asp.net/t/1230073.aspx?How+to+disable+future+dates+in+a+calendar+control+
            if (e.Day.Date > DateTime.Today)
            {
                e.Day.IsSelectable = false;
            }
        }

        private void LoadChildren(int volunteerId)
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetChildren(volunteerId);
            ddChildren.DataTextField = "Child";
            ddChildren.DataValueField = "ChildID";
            ddChildren.DataSource = dt;
            ddChildren.DataBind();
        }

        private void LoadHours()
        {
            for (int i = 0; i <= 8; i++)
            {
                ddHours.Items.Add(new ListItem(i.ToString() + " hours", i.ToString()));
            }
        }
        private void LoadMinutes()
        {
            for (int i = 0; i <= 59; i++)
            {
                ddMinutes.Items.Add(new ListItem(i.ToString() + " minutes", i.ToString()));
            }
        }
        private void LoadCenters()
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetCenters(true);
            ddCenters.DataTextField = "CenterName";
            ddCenters.DataValueField = "CenterID";
            ddCenters.DataSource = dt;
            ddCenters.DataBind();
        }

        private void LoadTasks()
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetTasks(true);
            ddTasks.DataTextField = "TaskDescr";
            ddTasks.DataValueField = "TaskID";
            ddTasks.DataSource = dt;
            ddTasks.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate entries before saving.
            if (ddCenters.SelectedIndex == 0)
            {
                string radalertscript = "<script language='javascript'>function f(){radalert('You must select a center.', 300, 100, 'ECS Volunteer App: In-Kind'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
            }
            else if (ddTasks.SelectedIndex == 0)
            {
                string radalertscript = "<script language='javascript'>function f(){radalert('You must select an activity.', 300, 100, 'ECS Volunteer App: In-Kind'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
            }
            else if (!chkTask.Checked)
            {
                string radalertscript = "<script language='javascript'>function f(){radalert('You must click the checkbox indicating that you have read the activity description.', 300, 100, 'ECS Volunteer App: In-Kind'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
            }
            else if (ddHours.SelectedIndex == 0 && ddMinutes.SelectedIndex == 0)
            {
                string radalertscript = "<script language='javascript'>function f(){radalert('Please enter hours, minutes, or both.', 300, 100, 'ECS Volunteer App: In-Kind'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
            }
            else
            {
                SaveToSession();
                LogToDb();
            }
        }

        private void LogToDb()
        {
            int volunteerId = Convert.ToInt32(Session["VolunteerID"]);
            int childId = Convert.ToInt32(Session["ChildID"]);
            int taskId = Convert.ToInt32(Session["TaskID"]);
            int centerId = Convert.ToInt32(Session["CenterId"]);
            int hoursVal = Convert.ToInt32(Session["Hours"]);
            int minVal = Convert.ToInt32(Session["Minutes"]);
            DateTime logDate = calendarInKind.SelectedDate;

            Bll bll = new Bll();
            string returnedValue = bll.LogInKind(volunteerId, childId, taskId, centerId, hoursVal, minVal, logDate);

            if (!returnedValue.Contains("success"))
            {
                string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedValue + "', 300, 100, 'ECS Volunteer App: In-Kind'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
                Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
            }
            else
                Response.Redirect("LogInKindThankYou.aspx");
        }

        private void SaveToSession()
        {
            // Save all data in session variables for use later.[Cici]
            Session["Center"] = ddCenters.SelectedItem.ToString();
            Session["CenterId"] = ddCenters.SelectedValue;
            Session["Task"] = ddTasks.SelectedItem.ToString();
            Session["TaskId"] = ddTasks.SelectedValue;
            Session["Child"] = ddChildren.SelectedItem.ToString();
            Session["ChildId"] = ddChildren.SelectedValue;
            Session["ReadDescr"] = chkTask.Checked;
            Session["Date"] = calendarInKind.SelectedDate.ToString().Replace(" 12:00:00 AM", ""); // remove the midnight text! argh!
            Session["Hours"] = ddHours.SelectedValue;
            Session["Minutes"] = ddMinutes.SelectedValue;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        private void ClearForm()
        {
            ddCenters.SelectedIndex = 0;
            ddTasks.SelectedIndex = 0;
            ddHours.SelectedIndex = 0;
            ddMinutes.SelectedIndex = 0;
        }
    }
}