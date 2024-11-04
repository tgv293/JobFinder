using System;
using System.ComponentModel.DataAnnotations;

namespace Project_63135353.Models
{
    public class PostJobMV_63135353
    {
        public int PostJobID { get; set; }
        public int UserID { get; set; }
        public int CompanyID { get; set; }
        public int JobCategoryID { get; set; }

        public string JobTitle { get; set; }

        public string JobDescription { get; set; }

        [DisplayFormat(DataFormatString = "{0:#,##0}", ApplyFormatInEditMode = true)]
        public int MinSalary { get; set; }

        [DisplayFormat(DataFormatString = "{0:#,##0}", ApplyFormatInEditMode = true)]
        public int MaxSalary { get; set; }

        public string Location { get; set; }

        public int Vacancy { get; set; }

        public int JobNatureID { get; set; }
        public System.DateTime PostDate { get; set; }

        [DataType(DataType.Date)]
        public System.DateTime ApplicationLastDate { get; set; } = DateTime.Now.AddDays(15);

        public int JobStatusID { get; set; }

        [DataType(DataType.Url)]
        public string WebUrl { get; set; }
    }
}