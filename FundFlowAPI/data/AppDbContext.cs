using Microsoft.EntityFrameworkCore;
using FundFlowApi;
using FundFlowApi.Models;

namespace FundFlowApi.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Allocate> Allocates { get; set; }
    }
}
