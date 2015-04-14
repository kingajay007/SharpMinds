using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Category
{
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            Guid UserId = (Guid)Membership.Provider.GetUser(HttpContext.Current.User.Identity.Name, true).ProviderUserKey;
            e.Values.Add("CreatedBy",UserId);
            e.Values.Add("UpdatedBy", UserId);
        }

        protected void DetailsView1_ItemCreated(object sender, EventArgs e)
        {

        }
    }
}