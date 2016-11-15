using System;
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
                sessionUser = String.Format("Logged in as {0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString());
                lblUser.Text = sessionUser;
            }
            catch (NullReferenceException)
            {
                sessionUser = "";
            }
        }

        
    }
}