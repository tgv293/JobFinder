using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project_63135353.Models
{
    public class PostJobDetailMV_63135353
    {
        public PostJobDetailMV_63135353()
        {
            Requirements = new List<JobRequirementMV_63135353>();
        }
        public int PostJobID { get; set; }
        public string Company { get; set; }
        public string JobCategory { get; set; }
        public string JobTitle { get; set; }
        public string JobDescription { get; set; }
        [DisplayFormat(DataFormatString = "{0:#,##0}", ApplyFormatInEditMode = true)]
        public int MinSalary { get; set; }
        [DisplayFormat(DataFormatString = "{0:#,##0}", ApplyFormatInEditMode = true)]
        public int MaxSalary { get; set; }
        public string Location { get; set; }
        public int Vacancy { get; set; }
        public string JobNature { get; set; }
        public System.DateTime PostDate { get; set; }
        public System.DateTime ApplicationLastDate { get; set; }
        public string WebUrl { get; set; }

        public List<JobRequirementMV_63135353> Requirements { get; set; }
    }
}