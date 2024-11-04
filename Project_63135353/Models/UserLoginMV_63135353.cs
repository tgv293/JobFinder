using System.ComponentModel.DataAnnotations;

namespace Project_63135353.Models
{
    public class UserLoginMV_63135353
    {
        [Required(ErrorMessage = "Không được để trống!")]
        public string UserName { get; set; }

        [Required(ErrorMessage = "Không được để trống!")]
        public string Password { get; set; }
    }
}