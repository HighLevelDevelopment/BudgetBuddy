namespace BudgetBuddyAPI.Models.Responses
{
    public class CompanyResponse
    {
        public CompanyResponse(
            int remainingPages,
            int currentPage,
            int countItems,
            int totalItems,
            int rowsPerPage,
            string? name,
            string? trading,
            IEnumerable<Company>? data)
        {
            RemainingPages = remainingPages;
            CurrentPage = currentPage;
            CountItems = countItems;
            TotalItems = totalItems;
            RowsPerPage = rowsPerPage;
            Name = name;
            Trading = trading;
            Data = data;
        }

        public int RemainingPages { get; set; }
        public int CurrentPage { get; set; }
        public int CountItems { get; set; }
        public int TotalItems { get; set; }
        public int RowsPerPage { get; set; }
        public string? Name { get; set; }
        public string? Trading { get; set; }

        public IEnumerable<Company>? Data { get; set; }
    }
}
