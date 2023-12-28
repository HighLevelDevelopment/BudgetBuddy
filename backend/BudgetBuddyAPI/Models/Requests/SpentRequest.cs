namespace BudgetBuddyAPI.Models.Requests
{
    public class SpentRequest
    {
        public int IdSpentCategory { get; set; }
        public int IdSpentType { get; set; }
        public string? Description { get; set; }
        public decimal SpentAmount { get; set; }
    }
}
