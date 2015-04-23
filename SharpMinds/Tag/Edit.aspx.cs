using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Tag
{
    public partial class Edit : System.Web.UI.Page
    {
        DropDownList ddlUpdate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Id"]==null)
            {
                Response.Redirect("~/ErrorPage.html");
            }
            ddlUpdate = DetailsView1.FindControl("ddlUpdate") as DropDownList;
            string selected = GetCategoryIdOfTag(Convert.ToInt32(Request.QueryString["Id"])).ToString();
            ddlUpdate.SelectedValue = selected;
            ddlUpdate.Items[0].Selected = false;

            ListItem item = ddlUpdate.Items.FindByValue(selected);
            item.Selected = true;
        }

        public int GetCategoryIdOfTag(int tagId)
        {
            int catId = 0;
            using (SqlConnection conn = new SqlConnection(CommonDbTask.ConnectionString))
            {
                using (SqlCommand comm = new SqlCommand(string.Format("select CategoryId from Tag where TagId ={0} ", tagId), conn))
                {
                    conn.Open();
                    SqlDataReader sdr = comm.ExecuteReader();
                    while (sdr.Read())
                    {
                        catId = Convert.ToInt32(sdr["CategoryId"]);
                    }
                    conn.Close();
                    return catId;
                }
            }
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            SqlDataSource1.UpdateParameters.Add(new Parameter() { Name = "CategoryId", DefaultValue = ddlUpdate.SelectedValue });
            SqlDataSource1.UpdateParameters.Add(new Parameter() { Name = "UpdatedBy", DefaultValue = Membership.GetUser().ProviderUserKey.ToString() });
            
        }

        protected void DetailsView1_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            Response.Redirect("Create.aspx");
        }

    }
}