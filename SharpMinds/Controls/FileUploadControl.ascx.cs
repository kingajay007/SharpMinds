using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SharpMinds.Controls
{
    public partial class FileUploadControl : System.Web.UI.UserControl
    {
        public int UploadedImageId { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            MediaUpload upload = new MediaUpload(FileUpload1);
            UploadedImageId= upload.UploadFile();
        }
    }
}