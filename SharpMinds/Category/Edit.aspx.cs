using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Category
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CommonDbTask cdt = new CommonDbTask();
            if (Request.QueryString["Id"]==null || !cdt.CheckExistenceById("Category", int.Parse(Request.QueryString["Id"])))
            {
                Response.Redirect("~/ErrorPage.html");
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            string oldName = e.OldValues["CategoryName"].ToString();
            string newName = e.NewValues["CategoryName"].ToString();
            Guid UserId = (Guid)Membership.GetUser().ProviderUserKey;
            SqlDataSource1.UpdateParameters.Add("UpdatedBy",System.Data.DbType.Guid,UserId.ToString());
            //e.Keys.Add("UpdatedBy",UserId);
        }
    }
}