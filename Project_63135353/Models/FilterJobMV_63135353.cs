using DatabaseLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_63135353.Models
{
    public class FilterJobMV_63135353
    {
        public FilterJobMV_63135353()
        {
            Result = new List<PostJobTable>();
        }
        public int JobCategoryID { get; set; }
        public int JobNatureID { get; set; }
        public string Location { get; set; }
        public int MinSalary { get; set; }
        public int MaxSalary { get; set; }
        public List<PostJobTable> Result { get; set; }
    }
}