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
    public partial class EditChild : System.Web.UI.Page
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
                    Child c = _bll.GetChildByChildID(_id);
                    txtFirstName.Text = c.FirstName;
                    txtLastName.Text = c.LastName;
                    txtDOB.Text = c.DOB.ToShortDateString();
                }
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            _id = Request.QueryString["id"];
            _volId = Request.QueryString["volId"];
            string relationship = "Child";
            string returnedMessage = "";

            if (String.IsNullOrEmpty(_volId))
                _volId = Session["VolunteerID"].ToString();

            DateTime dob;
            if (DateTime.TryParse(txtDOB.Text, out dob))
            {
                int volunteerId = Convert.ToInt32(_volId);
                string firstName = txtFirstName.Text;
                string lastName = txtLastName.Text;
                switch (_mode)
                {
                    case "E":
                        returnedMessage = _bll.UpdateChild(_id, firstName, lastName, dob);
                        break;
                    case "A":
                        returnedMessage = _bll.AddChild(volunteerId, firstName, lastName, dob, relationship);
                        break;
                    default:
                        break;
                }
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
            string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedMessage + "', 300, 100, 'ECS Volunteer App: Edit Child'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
