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
    public partial class EditVolunteer : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _mode = "";
        string _id = "";

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

            //Get the values in the query string and store them in variables...
            _mode = Request.QueryString["mode"];
            _id = "";

            if(!IsPostBack)
                LoadVolunteerTypes();

            if (_mode != "A") //if mode is not "A" for "add", then get the id from the query string and populate the Volunteer type textbox.
            {
                _id = Request.QueryString["id"];
                if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
                {
                    LoadUserInfo(Convert.ToInt32(_id));
                }
            }

            if (_mode == "A")
                btnManageChildren.Visible = false;

            if (_mode == "D")
                btnSubmit.Text = "Delete";
        }

        protected void LoadUserInfo(int volunteerId)
        {
            User user = _bll.GetUserInfoForVolunteer(volunteerId);
            txtFirstName.Text = user.FirstName;
            txtLastName.Text = user.LastName;
            txtLast4ofPhoneNumber.Text = user.Last4DigitsOfPhone;
            txtUserName.Text = user.UserID;
            txtPIN.Text = user.PIN;

            //Select the appropriate session item in the dropdown list...
            string t = user.VolunteerTypeDescr;
            ddVolunteerType.Items.FindByText(t).Selected = true;

            if (!t.Equals("Parent/Guardian"))
                btnManageChildren.Visible = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            _id = Request.QueryString["id"];
            int volId = Convert.ToInt32(_id);
            User u = new User();

            u.FirstName = txtFirstName.Text;
            u.LastName = txtLastName.Text;
            u.VolunteerTypeID = Convert.ToInt32(ddVolunteerType.SelectedValue);
            u.Last4DigitsOfPhone = txtLast4ofPhoneNumber.Text;
            u.UserID = txtUserName.Text;
            u.PIN = txtPIN.Text;

            string returnedMessage = "";

            switch (_mode)
            {
                case "E":
                    returnedMessage = UpdateUser();
                    break;
                case "A":
                    returnedMessage = _bll.InsertNewUser(u);
                    break;
                case "D":
                    returnedMessage = String.Format("Please ask your system administrator to deactivate Volunteer ID {0} - {1} {2} (UserID {3}).", _id, u.FirstName, u.LastName, u.UserID);
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
            string radalertscript = "<script language='javascript'>function f(){radalert('" + returnedMessage.Replace("'", "`") + "', 300, 100, 'ECS Volunteer App: Edit Volunteer'); Sys.Application.remove_load(f);}; Sys.Application.add_load(f);</script>";
            Page.ClientScript.RegisterStartupScript(this.GetType(), "radalert", radalertscript);
        }

        private void LoadVolunteerTypes()
        {            
            ddVolunteerType.DataTextField = "VolunteerTypeDescr";
            ddVolunteerType.DataValueField = "VolunteerTypeID";
            ddVolunteerType.DataSource = _bll.GetVolunteerTypes();
            ddVolunteerType.DataBind();

        }

        private string UpdateUser()
        {
            Bll bll = new Bll();
            string retVal;
            string fname = txtFirstName.Text;
            string lname = txtLastName.Text;
            string last4 = txtLast4ofPhoneNumber.Text;
            string uname = txtUserName.Text;
            string pin = txtPIN.Text;
            string volunteerType = ddVolunteerType.SelectedValue;

            if (!string.IsNullOrEmpty(fname) && !string.IsNullOrEmpty(lname) && !string.IsNullOrEmpty(last4) && !string.IsNullOrEmpty(uname))
            {
                retVal = bll.UpdateUser(fname, lname, last4, uname, pin, volunteerType);
            }
            else
                retVal = "Please complete all fields.";

            return retVal;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            try
            {
                LoadUserInfo(Convert.ToInt32(_id));
            }
            catch
            {
                txtFirstName.Text = "";
                txtLastName.Text = "";
                txtLast4ofPhoneNumber.Text = "";
                txtUserName.Text = "";
                txtPIN.Text = "";
            }
            lblRetVal.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void btnManageChildren_Click(object sender, EventArgs e)
        {
            string volId = _id;
            string fName = txtFirstName.Text;
            String lName = txtLastName.Text;
            Response.Redirect("ManageChildren.aspx?volId=" + volId + "&fname=" + fName + "&lname=" + lName);
        }

    }
}