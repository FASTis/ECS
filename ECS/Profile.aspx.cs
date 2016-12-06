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
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadVolunteerTypes();
                LoadUserInfo();
            }
        }

        protected void LoadUserInfo()
        {
            txtFirstName.Text = Session["FirstName"].ToString();
            txtLastName.Text = Session["LastName"].ToString();
            txtLast4ofPhoneNumber.Text = Session["Last4OfPhone"].ToString();
            txtUserName.Text = Session["Username"].ToString();
            txtPIN.Text = Session["PIN"].ToString();
            ddVolunteerType.SelectedIndex = Convert.ToInt32(Session["VolunteerTypeID"]);
            txtUserName.Enabled = false;
            ddVolunteerType.Enabled = false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            UpdateUser();
            if (!lblRetVal.Text.Contains("success"))
            {
                Bll bll = new Bll();
                User user = bll.GetUserInfo(txtUserName.Text);
                Session["FirstName"] = user.FirstName;
                Session["LastName"] = user.LastName;
                Session["VolunteerType"] = user.VolunteerTypeDescr;
                Session["VolunteerID"] = user.VolunteerID;
                Session["Last4OfPhone"] = user.Last4DigitsOfPhone;
                Session["PIN"] = user.PIN;
            }

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

        private void UpdateUser()
        {
            Bll bll = new Bll();
            string retVal;
            string fname = txtFirstName.Text;
            string lname = txtLastName.Text;
            string last4 = txtLast4ofPhoneNumber.Text;
            string uname = txtUserName.Text;
            string pin = txtPIN.Text;

            if (!string.IsNullOrEmpty(fname) && !string.IsNullOrEmpty(lname) && !string.IsNullOrEmpty(last4) && !string.IsNullOrEmpty(uname))
            {
                retVal = bll.UpdateUser(fname, lname, last4, uname, pin);
            }
            else
                retVal = "Please complete all fields.";

            lblRetVal.Text = retVal;
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            LoadUserInfo();
            lblRetVal.Text = "";
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}