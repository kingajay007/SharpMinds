using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace SharpMinds.Web
{
    public class Question
    {
        public int QuestionId { get; set; }
        public string Query { get; set; }
        public List<Option> Options { get; set; }
        public int TagId { get; set; }
        public int CategoryId { get; set; }
    }
}
