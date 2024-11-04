using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_63135353.Models
{
    public class JobRequirementMV_63135353
    {
        public JobRequirementMV_63135353()
        {
            Details = new List<JobRequirementDetailMV_63135353>();
        }
        public int JobRequirementID { get; set; }
        public string JobRequirementTitle { get; set; }
        public List<JobRequirementDetailMV_63135353> Details { get; set; }
    }
}