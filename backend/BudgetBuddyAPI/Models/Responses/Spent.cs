namespace BudgetBuddyAPI.Models.Responses
{
    public class Spent
    {
        public int IdSpent { get; set; }
        public int IdSpentCategory { get; set; }
        public int IdSpentType { get; set; }
        public string Description { get; set; }
        public decimal SpentAmount { get; set; }
    }

}
