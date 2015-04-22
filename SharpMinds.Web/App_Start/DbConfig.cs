using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace SharpMinds.Web.App_Start
{
    public class DbConfig
    {
        public static void DbCheck(DbContext context)
        {
            if (context.Database.Exists()==false)
            {
                context.Database.Create();
            }
        }
    }
}