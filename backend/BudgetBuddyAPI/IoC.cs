using BudgetBuddyAPI.Data;
using BudgetBuddyAPI.Services;

namespace BudgetBuddyAPI
{
    internal static class IoC
    {
        public static void ConfigureIoC(this WebApplicationBuilder builder)
        {
            builder.Services.AddSingleton(new Database(
                builder.Configuration.GetConnectionString("budgetBuddyConnectionString")
            ));

            builder.Services.AddScoped<CompanyService>();
        }
    }
}
