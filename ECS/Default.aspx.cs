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
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadVolunteerTypes();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            AddNewUser();
            ClearForm();
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
        }

        private void AddNewUser()
        {
            Bll bll = new Bll();
            string fname = txtFirstName.Text;
            string lname = txtLastName.Text;
            string pin = txtPIN.Text;
            string last4 = txtLast4ofPhoneNumber.Text;
            string uname = txtUserName.Text;
            int vtype = Convert.ToInt32(ddVolunteerType.SelectedValue);
            string retVal = bll.InsertNewUser(fname, lname, vtype, 0, last4, uname, pin);
            lblRetVal.Text = retVal;
        }
    }
}