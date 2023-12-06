namespace BudgetBuddyAPI.Models.Responses
{
    public class Company
    {
        public int IdCompany { get; set; }
        public string Name { get; set; } =  string.Empty;
        public string? Trading { get; set; }
        public string Document { get; set; } =  string.Empty;
    }
}
