using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ECS.BLL;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected string TypedPassword
        {
            get
            {
                if (ViewState["TypedPassword"] != null)
                {
                    return Convert.ToString(ViewState["TypedPassword"]);
                }
                return null;
            }
            set
            {
                ViewState["TypedPassword"] = value;
            }
        }
        protected string TypedPasswordCon
        {
            get
            {
                if (ViewState["TypedPasswordCon"] != null)
                {
                    return Convert.ToString(ViewState["TypedPasswordCon"]);
                }
                return null;
            }
            set
            {
                ViewState["TypedPasswordCon"] = value;
            }
        }

        protected string PasswordMask
        {
            get
            {
                if (ViewState["PasswordMask"] != null)
                {
                    return Convert.ToString(ViewState["PasswordMask"]);
                }
                return null;
            }
            set
            {
                ViewState["PasswordMask"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Do things here that you only want to happen when the page first loads
                btnSubmit.Enabled = false;
                PasswordMask = "****";
            }
            else
            {
                // Do things here every time the page is requested, except for the first time
                if (txtNewPass.Text.Trim().Length > 0 && txtNewPass.Text != PasswordMask)
                {
                    TypedPassword = txtNewPass.Text;
                    txtNewPass.Attributes.Add("value", PasswordMask);
                }

                if (txtConPass.Text.Trim().Length > 0 && txtConPass.Text != PasswordMask)
                {
                    TypedPasswordCon = txtConPass.Text;
                    txtConPass.Attributes.Add("value", PasswordMask);
                }

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var userName = Request.QueryString["username"];
            Bll bll = new Bll();
            bool retVal = bll.UpdateUserPin(userName, TypedPasswordCon);
            if (!retVal)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                lblRetVal.Text = "Please try again later";
            }
        }

        private bool ValidEntry()
        {
            bool valid = false;
            if (!String.IsNullOrEmpty(TypedPassword) && !String.IsNullOrEmpty(TypedPasswordCon))
            {
                if(string.Equals(TypedPassword, TypedPasswordCon))
                {
                    valid = true;
                    lblRetVal.Text = "";
                }

                else
                {
                    btnSubmit.Enabled = false;
                    lblRetVal.Text = "Passwords does not match.";
                }
            }
            return valid;

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void txtConPass_TextChanged(object sender, EventArgs e)
        {
            btnSubmit.Enabled = ValidEntry();
        }

        protected void txtNewPass_TextChanged(object sender, EventArgs e)
        {
            btnSubmit.Enabled = ValidEntry();
        }


    }
}