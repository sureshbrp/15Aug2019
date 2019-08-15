using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SMS.BL.Models.User;
using SMS.BL.Services;

namespace SMS.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        LoginService loginService = new LoginService();

        //public AuthController()
        //{

        //}

        [HttpPost]
        public IActionResult AddUser([FromBody] User user)
        {
            return Ok(loginService.AddUser(user));
        }
    }
}