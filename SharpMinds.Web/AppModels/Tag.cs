﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SharpMinds.Web
{
    public class Tag
    {
        public int TagId { get; set; }
        public string TagName { get; set; }
        public int CategoryId { get; set; }
    }
}
