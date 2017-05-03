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
    public partial class EditTask : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _mode = "";
        string _id = "";
        string _volId = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the values in the query string and store them in variables...
            _mode = Request.QueryString["mode"];

            if (_mode != "A") //if mode is not "A" for "add", then get the id from the query string and populate the staff type textbox.
            {
                if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
                {
                    _id = Request.QueryString["id"];
                    Task t = _bll.GetTaskById(Convert.ToInt32(_id));
                    txtTaskDescription.Text = t.TaskDescr;
                    txtPricePerMinute.Text = t.PricePerMinute.ToString();
                    txtRestrictToTypes.Text = t.RestrictToVolunteerTypes;
                }
            }

            if (_mode == "D")
                btnSubmit.Text = "Delete";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            _id = Request.QueryString["id"];
            _volId = Request.QueryString["volId"];

            Task task = new Task();
            task.TaskID = Convert.ToInt32(_id);
            task.TaskDescr = txtTaskDescription.Text;
            task.PricePerMinute = Convert.ToDecimal(txtPricePerMinute.Text);
            task.RestrictToVolunteerTypes = txtRestrictToTypes.Text;

            string returnedMessage = "";

            switch (_mode)
            {
                case "E":
                    returnedMessage = _bll.EditTask(task);
                    break;
                case "A":
                    returnedMessage = _bll.AddTask(task);
                    break;
                case "D":
                    returnedMessage = String.Format("Please ask your system administrator to deactivate Task ID {0} - {1}.", _id, task.TaskDescr);
                    btnCancel.Text = "Close Form";
                    break;
                default:
                    break;
            }
            //Return the value to the user.
            DisplayPopup(returnedMessage);

            if (returnedMessage.Contains("Success"))
            {
                btnCancel.Text = "Close Form";
            }


        }

        private void DisplayPopup(string returnedMessage)
        {
            string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedMessage.Replace("'", "`") + "', 300, 100, 'ECS Volunteer App: Edit Child'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageTasks.aspx");
        }
    }
}