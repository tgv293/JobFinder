using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using DatabaseLayer;

namespace Project_63135353.Models
{
    public class JobRequirementsMV_63135353
    {
        public JobRequirementsMV_63135353()
        {
            Details = new List<JobRequirementDetailTable>();
        }

        [Required(ErrorMessage = "Không được để trống!")]
        public int JobRequirementID { get; set; }
        [Required(ErrorMessage = "Không được để trống!")]
        public string JobRequirementDetail { get; set; }
        public int PostJobID { get; set; }

        public List<JobRequirementDetailTable> Details { get; set; }
    }
}