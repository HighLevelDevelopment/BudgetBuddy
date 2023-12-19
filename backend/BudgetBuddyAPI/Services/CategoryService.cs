using BudgetBuddyAPI.Data;
using BudgetBuddyAPI.Models.Responses;
using Dapper;
using System.Data;

namespace BudgetBuddyAPI.Services
{
    public class CategoryService
    {
        private readonly Database database;

        public CategoryService(Database database)
        {
            this.database = database;
        }

        public CategoryResponse ListAllCategory(string? description,
            int? pageNumber,
            int? rowsPerPage)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@PageNumber", pageNumber);
            parameters.Add("@RowsPerPage", rowsPerPage);
            parameters.Add("@Description", description);
            parameters.Add("@RemainingPages", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("@TotalItems", dbType: DbType.Int32, direction: ParameterDirection.Output);

            var response = database.BudgetBuddyConnection.Query<Category>(
                "ListAllCategory",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var remainingPages = parameters.Get<int>("@RemainingPages");
            var totalItems = parameters.Get<int>("@TotalItems");

            return new CategoryResponse(
                remainingPages,
                pageNumber ?? 1,
                response?.Count() ?? 0,
                totalItems,
                rowsPerPage ?? 0,
                response
            );
        }

        public Category? GetCategoryById(int id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);

            return database.BudgetBuddyConnection.QueryFirstOrDefault<Category>(
                "GetCompanyById",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }

        public Category? CreateCategory(int id, string description)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@IdCompany", id);
            parameters.Add("@Description", description);

            var company = database.BudgetBuddyConnection.Execute(
                "InsCategory",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return GetCategoryById(id);
        }

        public void DeleteCategoryById(int id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);

            database.BudgetBuddyConnection.Query(
                "DeleteCategoryById",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
    }
}
