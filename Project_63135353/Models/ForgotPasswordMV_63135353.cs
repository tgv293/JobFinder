using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Project_63135353.Models
{
    public class ForgotPasswordMV_63135353
    {
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
    }
}