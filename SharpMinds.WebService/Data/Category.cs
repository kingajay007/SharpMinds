//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SharpMinds.WebService.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class Category
    {
        public Category()
        {
            this.Tags = new HashSet<Tag>();
        }
    
        public int CategoryId { get; set; }
        public string CategoryName { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime ModifiedOn { get; set; }
        public System.Guid CreatedBy { get; set; }
        public System.Guid UpdatedBy { get; set; }
    
        public virtual ICollection<Tag> Tags { get; set; }
    }
}