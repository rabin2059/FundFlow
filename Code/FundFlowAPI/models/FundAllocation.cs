using System.ComponentModel.DataAnnotations;

namespace FundFlowApi
{
    public class Allocate{
        public int Id{get; set;}
        [Required]
        public string AllocationName{get; set;}
        [Required]
        public double AllocatedAmount{get; set;}
        [Required]
        public DateTime AllocatedDate{get; set;}
    }
}