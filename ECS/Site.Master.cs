﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.SessionState;

namespace ECS
{
    public partial class ECSSite : System.Web.UI.MasterPage
    {
        public string sessionUser;
        protected void Page_Load(object sender, EventArgs e)
        {
            SetSessionUser();
        }

        public void SetSessionUser()
        {
            try
            {
                sessionUser = String.Format(" ({0} {1})", Session["FirstName"].ToString(), Session["LastName"].ToString());
                divUser.InnerText = sessionUser;
                btnLogoff.Visible = true;
            }
            catch (NullReferenceException)
            {
                sessionUser = "";
                btnLogoff.Visible = false;
            }
        }
        protected void btnLogoff_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        
    }
}