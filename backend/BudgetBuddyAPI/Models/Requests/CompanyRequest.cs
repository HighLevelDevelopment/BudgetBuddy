namespace BudgetBuddyAPI.Models.Requests
{
    public class CompanyRequest
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public string? Trading { get; set; }
        public string? Document { get; set; }
    }
}
