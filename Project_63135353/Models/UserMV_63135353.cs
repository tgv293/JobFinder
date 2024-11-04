using System.ComponentModel.DataAnnotations;

namespace Project_63135353.Models
{
    public class UserMV_63135353
    {
        public UserMV_63135353()
        {
            Company = new CompanyMV_63135353();
        }

        public int UserID { get; set; }
        public int UserTypeID { get; set; }
        [Required(ErrorMessage = "Không được để trống!")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Không được để trống!")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Không được để trống!")]
        public string EmailAddress { get; set; }
        [Required(ErrorMessage = "Không được để trống!")]
        public string ContactNo { get; set; }
        public bool AreYouProvider { get; set; }
        public CompanyMV_63135353 Company { get; set; }
    }
}