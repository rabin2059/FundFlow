using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FundFlowApi.Data;
using FundFlowApi.Models;

namespace FundFlowApi.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsersController(AppDbContext context)
        {
            _context = context;
        }

        // POST: api/users/register
        [HttpPost("register")]
        public async Task<ActionResult<User>> Register(User user)
        {
            if (await _context.Users.AnyAsync(u => u.Username == user.Username))
                return BadRequest("Username already exists.");

            if (await _context.Users.AnyAsync(u => u.Email == user.Email))
                return BadRequest("Email already exists.");

            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            // Return 201 Created status with the newly created user
            return CreatedAtAction(nameof(Login), new { id = user.Id }, user);
        }

        // POST: api/users/login
        [HttpPost("login")]
        public async Task<ActionResult<User>> Login(User loginModel)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u =>
                (u.Username == loginModel.Username || u.Email == loginModel.Email) &&
                u.PasswordHash == loginModel.PasswordHash);

            if (user == null)
                return BadRequest("Invalid username/email or password.");

            // Return 200 OK with the logged-in user
            return Ok(user);
        }
    }
}
