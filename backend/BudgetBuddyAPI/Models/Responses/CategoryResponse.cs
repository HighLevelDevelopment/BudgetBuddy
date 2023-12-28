namespace BudgetBuddyAPI.Models.Responses
{
    public class CategoryResponse
    {
        public CategoryResponse(
            int remainingPages,
            int currentPage,
            int countItems,
            int totalItems,
            int rowsPerPage,
            IEnumerable<Category>? data)
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
        public IEnumerable<Category>? Data { get; set; }
    }
}
