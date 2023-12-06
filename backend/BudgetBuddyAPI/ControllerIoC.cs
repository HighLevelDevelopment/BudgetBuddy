using BudgetBuddyAPI.Controllers;

namespace BudgetBuddyAPI
{
    public static class ControllerIoC
    {
        public static void ConfigureControllers(this WebApplication app)
        {
            app.MapCompany();
        }
    }
}
