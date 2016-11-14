using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ECS
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Server.TransferRequest("Login.aspx");
            //Placeholder; didn't want to mess up anyone else's code. -- Cici
        }
    }
}