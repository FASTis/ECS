﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ValidEntry();
        }

        private bool ValidEntry()
        {
            bool valid = false;
            if (!String.IsNullOrEmpty(txtNewPass.Text) && !String.IsNullOrEmpty(txtConPass.Text))
            {
                if(string.Equals(txtNewPass.Text, txtConPass.Text))
                {
                    valid = true;
                    //TODO Connect to Db to enter new pass
                }

                else
                {
                    //TODO Display error msg
                }
            }

            return valid;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}