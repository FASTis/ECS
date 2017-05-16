using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ECS.BLL;

namespace ECS
{
    public partial class ManageChildren : System.Web.UI.Page
    {
        //Instantiate a new BLL object so that you can access its methods later...
        Bll _bll = new Bll();
        string _volId = "";
        string _fName = "";
        string _lName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the values in the query string and store them in variables...
            _volId = Request.QueryString["volId"];
            _fName = Request.QueryString["fname"];
            _lName = Request.QueryString["lname"];

            if (!IsPostBack) //Don't do this on postback -- don't do the below unless we're loading the form for the first time!!!
            {
                LoadChildren();
                lblVolunteerName.Text = _fName + " " + _lName;
            }
            
        }

        private void LoadChildren()
        {
            gvChildren.DataSource = _bll.GetChildrenWithoutNA(Convert.ToInt32(_volId));
            gvChildren.DataBind();
        }
        protected void gvChildren_Paging(object sender, GridViewPageEventArgs e)
        {
            gvChildren.PageIndex = e.NewPageIndex;
            LoadChildren();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditChild.aspx?mode=A&volId=" + _volId);
        }
    }
}