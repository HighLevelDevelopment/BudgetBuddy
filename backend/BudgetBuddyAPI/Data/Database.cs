using System.Data.SqlClient;

namespace BudgetBuddyAPI.Data
{
    public class Database
    {
        private readonly string budgetBuddyConnectionString;

        public Database(string budgetBuddyConnectionString)
        {
            this.budgetBuddyConnectionString = budgetBuddyConnectionString;
        }

        public SqlConnection BudgetBuddyConnection { get { return new SqlConnection(budgetBuddyConnectionString); } }
    }
}
