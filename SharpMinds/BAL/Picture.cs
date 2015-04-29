using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;

namespace SharpMinds.BAL
{
    public class Picture
    {
        public int ImageId { get; set; }
        public string ImageName { get; set; }
        public string MIME { get; set; }
        public byte[] ImageData { get; set; }
    }
}
