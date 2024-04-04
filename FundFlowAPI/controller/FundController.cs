using FundFlowApi.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace FundFlowApi.Controllers
{
    [Route("api/users")]
    [ApiController]
    public class FundController : ControllerBase
    {
        private readonly AppDbContext _context;

        public FundController(AppDbContext context)
        {
            _context = context;
        }

        [HttpPost("AddFund")]
        public async Task<ActionResult<Allocate>> AddFund(Allocate allocate)
        {
            if (await _context.Allocates.AnyAsync(a => a.AllocationName == allocate.AllocationName))
                return BadRequest("Allocation name already exists.");

            _context.Allocates.Add(allocate);
            await _context.SaveChangesAsync();
            

            // Return 201 Created status with the newly created user
            return CreatedAtAction(nameof(AddFund), new { id = allocate.Id }, allocate);
        }

        [HttpGet("GetFunds")]
        public ActionResult<Allocate> GetFunds()
        {
            var funds = _context.Allocates.ToList();
            return Ok(funds);
        }

        [HttpDelete("RemoveFund")]
        public async Task<ActionResult<Allocate>> RemoveFund(int Id)
        {
            var fund = _context.Allocates.FirstOrDefault(f => f.Id == Id);
            if (fund!= null)
            {
                _context.Allocates.Remove(fund);
            }
            await _context.SaveChangesAsync(); // Saving changes asynchronously
            return Ok(true);
        }

        [HttpPut("UpdateFund")]
        public async Task<ActionResult<Allocate>> UpdateFund(string allocationName, double allocationAmount, DateTime allocationDate)
        {
            var fund = _context.Allocates.FirstOrDefault(f => f.AllocationName == allocationName);
            if (fund != null)
            {
                fund.AllocatedAmount = allocationAmount;
                // You may want to update other properties here as well

                await _context.SaveChangesAsync(); // Saving changes asynchronously
                return Ok(true);
            }
            else
            {
                return NotFound(); // Or handle the case where the fund is not found
            }
        }
    }
}
