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
                name,
                trading,
                response
            );
        }

        public CompanyResponse GetCompanyByDocument(string document)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Document", document);

            var company = database.BudgetBuddyConnection.QueryFirstOrDefault<Company>(
                "GetCompanyByDocument",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            int remainingPages = 0;
            int totalItems = company != null ? 1 : 0;

            return new CompanyResponse(
                remainingPages,
                1,
                totalItems,
                totalItems,
                1,
                company?.Name,
                company?.Trading,
                new List<Company> { company }
            );
        }

        public CompanyResponse CreateCompany(int id, string name, string trading, string document)
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

        public CompanyResponse UpdateCompany(string document, string name, string trading)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Document", document);
            parameters.Add("@Name", name);
            parameters.Add("@Trading", trading);

            var result = database.BudgetBuddyConnection.Execute(
                "UpdateCompany",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return GetCompanyByDocument(document);
        }
    }
}
