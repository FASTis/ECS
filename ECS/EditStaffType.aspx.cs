using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL; //This line must be present in order to access the methods in the BLL.

namespace ECS
{
    public partial class EditStaffType : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _mode = "";
        string _id = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Make sure the person is a valid Admin user, and isn't just browsing to this page to wreak havoc...
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

            //Get the values in the query string and store them in variables...
            _mode = Request.QueryString["mode"];
            _id = "";
            
            if (_mode != "A") //if mode is not "A" for "add", then get the id from the query string and populate the staff type textbox.
            {
                _id = Request.QueryString["id"];
                if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
                {
                    string staffType = _bll.GetStaffTypeForID(_id);
                    txtStaffType.Text = staffType;
                }
            }

            if (_mode == "D")
                btnSubmit.Text = "Delete";

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string sType = txtStaffType.Text;
            string returnedMessage = "";
            switch (_mode)
            {
                case "E":
                    returnedMessage = _bll.UpdateStaffType(_id, sType);
                    break;
                case "A":
                    returnedMessage = _bll.AddStaffType(sType);
                    break;
                case "D":
                    returnedMessage = "The delete feature has not yet been implemented.";
                    btnCancel.Text = "Close Form";
                    break;
                default:
                    break;
            }

            //Return the value to the user.
            DisplayPopup(returnedMessage);

            if (returnedMessage.ToLower().Contains("success"))
            {
                btnCancel.Text = "Close Form";
            }

        }

        private void DisplayPopup(string returnedMessage)
        {
            string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedMessage.Replace("'", "`") + "', 300, 100, 'ECS Volunteer App: Edit Staff Type'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageStaffTypes.aspx");
        }
    }
}