using BudgetBuddyAPI.Data;
using BudgetBuddyAPI.Models.Responses;
using Dapper;
using System.Data;

namespace BudgetBuddyAPI.Services
{
    public class SpentService
    {
        private readonly Database database;

        public SpentService(Database database)
        {
            this.database = database;
        }

        public IEnumerable<Spent> ListAllSpent(string? description, int? pageNumber, int? rowsPerPage)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@PageNumber", pageNumber);
            parameters.Add("@RowsPerPage", rowsPerPage);
            parameters.Add("@Description", description);

            return database.BudgetBuddyConnection.Query<Spent>(
                "ListAllSpent",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }

        public Spent? GetSpentById(int id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);

            return database.BudgetBuddyConnection.QueryFirstOrDefault<Spent>(
                "GetSpentById",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }

        public Spent? CreateSpent(int idSpentCategory, int idSpentType, string description, decimal spentAmount)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@IdSpentCategory", idSpentCategory);
            parameters.Add("@IdSpentType", idSpentType);
            parameters.Add("@Description", description);
            parameters.Add("@SpentAmount", spentAmount);

            database.BudgetBuddyConnection.Execute(
                "InsSpent",
                parameters,
                commandType: CommandType.StoredProcedure
            );

            return GetSpentById(parameters.Get<int>("@Id"));
        }

        public void DeleteSpentById(int id)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);

            database.BudgetBuddyConnection.Query(
                "DeleteSpentById",
                parameters,
                commandType: CommandType.StoredProcedure
            );
        }

    }
}
