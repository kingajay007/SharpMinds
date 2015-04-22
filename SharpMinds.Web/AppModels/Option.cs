using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SharpMinds.Web
{
    public class Option
    {
        public int OptionId { get; set; }
        public string OptionValue { get; set; }
        public bool IsCorrect { get; set; }
    }
}
