using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Option
{
    public partial class Create : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["QId"]==null)
            {
                Response.Redirect("~/ErrorPage.html");
            }
        }


        protected void DetailsView1_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            SuccessNotification("Option Created Successfully...");
        }
    }
}