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
    public partial class Create : System.Web.UI.Page
    {
        private int? UploadedImageId { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            Guid UserId = (Guid)Membership.Provider.GetUser(HttpContext.Current.User.Identity.Name, true).ProviderUserKey;
            //e.Values.Add("ImageId", UploadedImageId == 0 ? null : UploadedImageId);
            e.Values.Add("CreatedBy",UserId);
            e.Values.Add("UpdatedBy", UserId);
            
        }

        protected void customValidatoryCategoryName_ServerValidate(object sender, ServerValidateEventArgs args)
        {
            TextBox tb = DetailsView1.FindControl("TextBox1") as TextBox;
            args.IsValid = (tb.Text.Length > 2 && tb.Text.Length < 50);
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            FileUpload fileUpload = DetailsView1.FindControl("CategoryImageUpload") as FileUpload;
            Image image = DetailsView1.FindControl("CategoryImage") as Image;

            if (!UploadedImageId.HasValue)
            {
                UploadedImageId = new MediaUpload(fileUpload).UploadFile();
                //Picture picture = new CommonDbTask().GetImageById(UploadedImageId.Value);
                image.ImageUrl = string.Format("~/Handlers/ImageHandler.ashx?imageId={0}", UploadedImageId);
                image.DescriptionUrl = UploadedImageId.ToString();
            }
            else
            {
                if (UploadedImageId.Value>0)
                {
                    UploadedImageId = new MediaUpload(fileUpload).UploadFile(UploadedImageId.Value);
                    //Picture picture = new CommonDbTask().GetImageById(UploadedImageId.Value);
                    image.ImageUrl = string.Format("~/Handlers/ImageHandler.ashx?imageId={0}", UploadedImageId);
                }
                
            }
        }
    }
}