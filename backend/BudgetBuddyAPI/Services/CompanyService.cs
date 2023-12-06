using BudgetBuddyAPI.Data;
using BudgetBuddyAPI.Models.Responses;
using Dapper;
using System.Data;

namespace BudgetBuddyAPI.Services
{
    public class CompanyService
    {
        private readonly Database database;

        public CompanyService(Database database)
        {
            this.database = database;
        }

        public CompanyResponse ListAllCompany(string? name,
            string? trading,
            int? pageNumber,
            int? rowsPerPage)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@PageNumber", pageNumber);
            parameters.Add("@RowsPerPage", rowsPerPage);
            parameters.Add("@Name", name);
            parameters.Add("@Trading", trading);
            parameters.Add("@RemainingPages", dbType: DbType.Int32, direction: ParameterDirection.Output);
            parameters.Add("@TotalItems", dbType: DbType.Int32, direction: ParameterDirection.Output);

            var response = database.BudgetBuddyConnection.Query<Company>(
                "ListAllCompany",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            var remainingPages = parameters.Get<int>("@RemainingPages");
            var totalItems = parameters.Get<int>("@TotalItems");

            return new CompanyResponse(
                remainingPages,
                pageNumber ?? 1,
                response?.Count() ?? 0,
                totalItems,
                rowsPerPage ?? 0,
                response
            );
        }

        public Company? GetCompanyByDocument(string document)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Document", document);

            return database.BudgetBuddyConnection.QueryFirstOrDefault<Company>(
                "GetCompanyByDocument",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }

        public Company? CreateCompany(int id, string name, string trading, string document)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@IdCompany", id);
            parameters.Add("@Name", name);
            parameters.Add("@Trading", trading);
            parameters.Add("@Document", document);

            var company = database.BudgetBuddyConnection.Execute(
                "InsCompany",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return GetCompanyByDocument(document);
        }

        public void DeleteCompanyByDocument(string document)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Document", document);

            database.BudgetBuddyConnection.Query(
                "DeleteCompanyByDocument",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }
    }
}
