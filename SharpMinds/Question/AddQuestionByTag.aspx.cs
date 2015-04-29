using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Question
{
    public partial class AddQuestionByTag : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CheckQueryString("tagId")==null)
            {
                Response.Redirect("./ErrorPage.html");
            }
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            Guid UserId = (Guid)Membership.GetUser().ProviderUserKey;
            e.Values.Add("CreatedBy", UserId);
            e.Values.Add("UpdatedBy", UserId);
        }
    }
}