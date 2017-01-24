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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadVolunteerTypes();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddNewUser();
            if (!lblRetVal.Text.Contains("Please select a different user name"))
            {
                Bll bll = new Bll();
                User user = bll.GetUserInfo(txtUserName.Text);
                Session["FirstName"] = user.FirstName;
                Session["LastName"] = user.LastName;
                Session["VolunteerType"] = user.VolunteerTypeDescr;
                Session["Username"] = user.UserID;
                Session["VolunteerID"] = user.VolunteerID;
                Session["Last4OfPhone"] = user.Last4DigitsOfPhone;
                Session["PIN"] = user.Last4DigitsOfPhone;
                Session["IsAdmin"] = "false";
                Response.Redirect("Default.aspx");
            }
            else
                txtUserName.Focus();
        }

        private void LoadVolunteerTypes()
        {
            DataTable dt = new DataTable();
            Bll bll = new Bll();
            dt = bll.GetVolunteerTypes();
            ddVolunteerType.DataTextField = "VolunteerTypeDescr";
            ddVolunteerType.DataValueField = "VolunteerTypeID";
            ddVolunteerType.DataSource = dt;
            ddVolunteerType.DataBind();
        }

        private void ClearForm()
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPIN.Text = "";
            txtLast4ofPhoneNumber.Text = "";
            txtUserName.Text = "";
            ddVolunteerType.SelectedIndex = 0;
        }

        private void AddNewUser()
        {
            Bll bll = new Bll();
            string retVal;
            string fname = txtFirstName.Text;
            string lname = txtLastName.Text;
            string pin = txtPIN.Text;
            string last4 = txtLast4ofPhoneNumber.Text;
            string uname = txtUserName.Text;
            int vtype = Convert.ToInt32(ddVolunteerType.SelectedValue);
            if (!string.IsNullOrEmpty(fname) && !string.IsNullOrEmpty(lname) && !string.IsNullOrEmpty(pin) && !string.IsNullOrEmpty(last4) && !string.IsNullOrEmpty(uname))
            {
                retVal = bll.InsertNewUser(fname, lname, vtype, 0, last4, uname, pin);
            }
            else
                retVal = "Please complete all fields.";

            lblRetVal.Text = retVal;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearForm();
            lblRetVal.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}