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
                LoadHours();
                LoadMinutes();
                LoadCenters();
                LoadTasks();
                calendarInKind.SelectedDate = DateTime.Today;
            }
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
            dt = bll.GetCenters();
            ddCenters.DataTextField = "CenterName";
            ddCenters.DataValueField = "CenterID";
            ddCenters.DataSource = dt;
            ddCenters.DataBind();
        }

        private void LoadTasks()
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetTasks();
            ddTasks.DataTextField = "TaskDescr";
            ddTasks.DataValueField = "TaskID";
            ddTasks.DataSource = dt;
            ddTasks.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Validate entries before saving.
            if (!chkTask.Checked)
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
                // Save all data in session variables for use later.[Cici]
                Session["Center"] = ddCenters.SelectedItem.ToString();
                Session["Task"] = ddTasks.SelectedItem.ToString();
                Session["ReadDescr"] = chkTask.Checked;
                Session["Date"] = calendarInKind.SelectedDate.ToString().Replace(" 12:00:00 AM", ""); // remove the midnight text! argh!
                Session["Hours"] = ddHours.SelectedItem;
                Session["Minutes"] = ddMinutes.SelectedItem;

                //Open signatureForm. [Cici]
                Response.Redirect("LogInKindThankYou.aspx");

            }
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