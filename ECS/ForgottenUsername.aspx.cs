using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ECS.BLL;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class ForgottenUsername : System.Web.UI.Page
    {
        protected string FirstName
        {
            get
            {
                if (ViewState["FirstName"] != null)
                {
                    return Convert.ToString(ViewState["FirstName"]);
                }
                return null;
            }
            set
            {
                ViewState["FirstName"] = value;
            }
        }
        protected string LastName
        {
            get
            {
                if (ViewState["LastName"] != null)
                {
                    return Convert.ToString(ViewState["LastName"]);
                }
                return null;
            }
            set
            {
                ViewState["LastName"] = value;
            }
        }

        protected string LastFourDigits
        {
            get
            {
                if (ViewState["LastFourDigits"] != null)
                {
                    return Convert.ToString(ViewState["LastFourDigits"]);
                }
                return null;
            }
            set
            {
                ViewState["LastFourDigits"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Do things here that you only want to happen when the page first loads
                btnSubmit.Enabled = false;
            }
            else
            {
                // Do things here every time the page is requested, except for the first time
                if (txtFirstName.Text.Trim().Length > 0 && txtFirstName.Text != FirstName)
                {
                    FirstName = txtFirstName.Text;
                    txtFirstName.Attributes.Add("value", FirstName);
                }

                if (txtLastName.Text.Trim().Length > 0 && txtLastName.Text != LastName)
                {
                    LastName = txtLastName.Text;
                    txtLastName.Attributes.Add("value", LastName);
                }

                if (txtPhone.Text.Trim().Length > 0 && txtPhone.Text != LastFourDigits)
                {
                    LastFourDigits = txtPhone.Text;
                    txtPhone.Attributes.Add("value", LastFourDigits);
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var userFound = UserFound();
            if (userFound)
            {
                lblFirstName.Visible = false;
                lblLastName.Visible = false;
                lblPhone.Visible = false;
                txtFirstName.Visible = false;
                txtLastName.Visible = false;
                txtPhone.Visible = false;
                btnSubmit.Visible = false;
                btnCancel.Text = "Return to Login Screen";
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        private bool UserFound()
        {
            bool userFound = true;
            lblRetVal.Text = "";
            Bll bll = new Bll();
            var retVal = bll.GetForgottenUser(FirstName, LastName, LastFourDigits);

            if (!String.IsNullOrEmpty(retVal))
            {
                lblRetVal.Text = "Your username is: "+ retVal;
            }
            else
            {
                userFound = false;
                lblRetVal.Text = "Unable to find a username that matches the information.";
            }
            return userFound;
        }

        private bool ValidEntry()
        {
            return (!String.IsNullOrEmpty(FirstName) &&
                !String.IsNullOrEmpty(LastName) &&
                !String.IsNullOrEmpty(LastFourDigits));
        }

        protected void txtFirstName_TextChanged(object sender, EventArgs e)
        {
            btnSubmit.Enabled = ValidEntry();
        }

        protected void txtLastName_TextChanged(object sender, EventArgs e)
        {
            btnSubmit.Enabled = ValidEntry();
        }

        protected void txtPhone_TextChanged(object sender, EventArgs e)
        {
            btnSubmit.Enabled = ValidEntry();
        }
    }
}