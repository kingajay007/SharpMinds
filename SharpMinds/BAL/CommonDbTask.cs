﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Drawing;

namespace SharpMinds.BAL
{
    public class CommonDbTask
    {
        public static string ConnectionString = ConfigurationManager.ConnectionStrings["SharpMindsConnectionString"].ToString();
        //Check existence of element in database before edit 
        public bool CheckExistenceById(string tableName, int Id)
        {
            string primaryKeyField = tableName + "Id";
            string commandText = string.Format("select count(*) from {0} where {1} = {2}", tableName, primaryKeyField, Id);
            int count = 0;

            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand comm = new SqlCommand(commandText, conn))
                {
                    conn.Open();
                    SqlDataReader dr = comm.ExecuteReader();
                    while (dr.Read())
                    {
                        count++;
                    }
                    conn.Close();
                    if (count < 1)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="categoryId"></param>
        /// <param name="userId"></param>
        public void CreateDefaultCategoryOnInsert(int categoryId, Guid userId)
        {
            string getCategoryWithNoTags = string.Format("select * from Tag where CategoryId={0}", categoryId);
            string commandText = string.Format("insert into Tag(TagName,CategoryId,CreatedBy,UpdatedBy) values('Others',{0},{1},{2})", categoryId, userId, userId);
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand comm = new SqlCommand(getCategoryWithNoTags, conn))
                {
                    conn.Open();
                    SqlDataReader dr = comm.ExecuteReader();
                    bool present = dr.Read();
                    if (present)
                    {
                        comm.CommandText = commandText;
                        comm.ExecuteNonQuery();
                        conn.Close();
                    }
                }
            }
        }

        public DataTable GetCategoryList()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    string commandText = "select CategoryId,CategoryName from Category";

                }
            }
            return dt;
        }

        public Picture GetImageById(int imageId)
        {
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            {
                Picture picture = null;
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    string command = string.Format("select * from Image where ImageId ={0}",imageId);
                    comm.CommandText = command;

                    conn.Open();

                    SqlDataReader sdr = comm.ExecuteReader();
                    if (sdr.HasRows)
                    {
                        picture = new Picture();
                    while (sdr.Read())
                    {
                        picture.ImageId = Convert.ToInt32(sdr["ImageId"]);
                        picture.ImageName = (string)sdr["ImageName"];
                        picture.MIME = (string)sdr["MIME"];
                        picture.ImageData = (byte[])sdr["ImageData"];
                    }
                    }
                    return picture;
                }
            }
        }

        public Image GetImageFromByteArray(byte[] imageData)
        {
            using (System.IO.MemoryStream ms = new System.IO.MemoryStream(imageData))
            {
                return Image.FromStream(ms);
            }
        }
    }
}
