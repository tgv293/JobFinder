using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Project_63135353.Models
{
    public class JobRequirementDetailMV_63135353
    {
        public JobRequirementDetailMV_63135353()
        {
            Details = new List<JobRequirementDetailMV_63135353>();
        }
        public int JobRequirementID { get; set; }
        public string JobRequirementDetail { get; set; }
        public List<JobRequirementDetailMV_63135353> Details { get; set; }
}
}