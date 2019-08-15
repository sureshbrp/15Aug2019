using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SMS.BL.Models.User
{
   public class User
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public int RoleID { get; set; }

        public string Password { get; set; }
        public int CreatedByUserID { get; set; }
    }
}
