using SMS.BL.Models.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SMS.DAL;


namespace SMS.BL.Services
{
    public class LoginService
    {

       public User AddUser (User user)
        {
            using (SMSERPEntities entities = new SMSERPEntities())
            {
                var newUser = entities.AddUser(user.UserName, user.Password, user.RoleID, user.CreatedByUserID).ToList().FirstOrDefault();
                User createdUser = new User()
                {
                    UserName = newUser.UserName,
                    RoleID = newUser.RoleID,
                    UserID = newUser.UserID
                };
                    
                return createdUser;
            }
        }

    }
}
