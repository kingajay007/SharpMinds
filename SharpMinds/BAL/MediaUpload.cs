using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace SharpMinds.BAL
{
    public class MediaUpload
    {
        public MediaUpload(FileUpload fileUpload)
        {
            this._fileUpload = fileUpload;
        }

        public FileUpload _fileUpload { get; set; }

        public int UploadFile(string contentType ="image/jpg")
        {
            if (_fileUpload.PostedFile==null|| string.IsNullOrEmpty(_fileUpload.PostedFile.FileName)|| _fileUpload.PostedFile.InputStream==null)
            {
                throw new Exception(StaticResource.ImageUploadError);
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(CommonDbTask.ConnectionString))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        int imageId = 0;
                        byte[] imageBytes = new byte[_fileUpload.PostedFile.InputStream.Length + 1];
                        _fileUpload.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);

                        string commandText = "CreateImage";
                        comm.Parameters.AddWithValue("@imageName", _fileUpload.PostedFile.FileName);
                        comm.Parameters.AddWithValue("@MIME", _fileUpload.PostedFile.ContentType);
                        comm.Parameters.AddWithValue("@imageData", imageBytes);
                        SqlParameter returnImageId = new SqlParameter("ImageId", System.Data.SqlDbType.Int);
                        returnImageId.Direction = System.Data.ParameterDirection.ReturnValue;
                        comm.Parameters.Add(returnImageId);
                        conn.Open();
                        comm.Connection = conn;
                        comm.CommandText = commandText;
                        comm.CommandType = System.Data.CommandType.StoredProcedure;
                        int result =comm.ExecuteNonQuery();
                        if (result==1)
                        {
                            imageId = Convert.ToInt32( returnImageId.Value);
                        }
                        conn.Close();
                        return imageId;
                    }
                }
            }
        }

        public int UploadFile(int imageIdToEdit,string contentType = "image/jpg")
        {
            if (_fileUpload.PostedFile == null || string.IsNullOrEmpty(_fileUpload.PostedFile.FileName) || _fileUpload.PostedFile.InputStream == null)
            {
                throw new Exception(StaticResource.ImageUploadError);
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(CommonDbTask.ConnectionString))
                {
                    using (SqlCommand comm = new SqlCommand())
                    {
                        int imageId = 0;
                        byte[] imageBytes = new byte[_fileUpload.PostedFile.InputStream.Length + 1];
                        _fileUpload.PostedFile.InputStream.Read(imageBytes, 0, imageBytes.Length);

                        //SqlCommand commandGetImage = new SqlCommand(string.Format("select * from Image where ImageId={0}", imageIdToEdit), conn);

                        //SqlDataReader sdr

                        string commandText = string.Format("update Image set ImageName=@imageName,MIME=@MIME,ImageData=@imageData where ImageId ={0}",imageIdToEdit);
                        comm.Parameters.AddWithValue("@imageName", _fileUpload.PostedFile.FileName);
                        comm.Parameters.AddWithValue("@MIME", _fileUpload.PostedFile.ContentType);
                        comm.Parameters.AddWithValue("@imageData", imageBytes);
                        conn.Open();
                        comm.Connection = conn;
                        comm.CommandText = commandText;
                        int result = comm.ExecuteNonQuery();
                       
                        conn.Close();
                        return imageId;
                    }
                }
            }
        }
    }
}