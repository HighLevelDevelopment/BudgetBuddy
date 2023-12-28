namespace BudgetBuddyAPI.Models.Responses
{
    public class SpentResponse
    {
        public SpentResponse(
            int remainingPages,
            int currentPage,
            int countItems,
            int totalItems,
            int rowsPerPage,
            IEnumerable<Spent>? data)
        {
            RemainingPages = remainingPages;
            CurrentPage = currentPage;
            CountItems = countItems;
            TotalItems = totalItems;
            RowsPerPage = rowsPerPage;
            Data = data;
        }

        public int RemainingPages { get; set; }
        public int CurrentPage { get; set; }
        public int CountItems { get; set; }
        public int TotalItems { get; set; }
        public int RowsPerPage { get; set; }
        public IEnumerable<Spent>? Data { get; set; }
    }
}
