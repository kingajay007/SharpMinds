using SharpMinds.BAL;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;

namespace SharpMinds.Handlers
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            HttpRequest request = context.Request;
            if (!string.IsNullOrEmpty(request.QueryString["imageId"]))
            {
                //this hash table contain the SP parameter
                Picture pic = new Picture();
                CommonDbTask dbTask = new CommonDbTask();
                pic = dbTask.GetImageById(Convert.ToInt32(request.QueryString["imageId"]));
                //DBHelper.SQLExecuteNonQuery(procedure_name,command_parameters) 
                //return the object data.
                // casting return value to byte[]
                byte[] imageByte = pic.ImageData;
                //checking byte[] 

                Image image = dbTask.GetImageFromByteArray(pic.ImageData);
                Bitmap bitMap = new Bitmap(image, 200, 300);
                if (imageByte != null && imageByte.Length > 0)
                {
                    context.Response.ContentType = pic.MIME;
                    bitMap.Save(context.Response.OutputStream,
                            System.Drawing.Imaging.ImageFormat.Jpeg);
                    bitMap.Dispose();
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}