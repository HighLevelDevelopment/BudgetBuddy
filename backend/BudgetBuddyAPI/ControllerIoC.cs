﻿using BudgetBuddyAPI.Controllers;

namespace BudgetBuddyAPI
{
    public static class ControllerIoC
    {
        public static void ConfigureControllers(this WebApplication app)
        {
            app.MapCompany();
            app.MapCategory();
        }

        public static void ConfigureStatus(this WebApplication app)
        {
            app.MapGet("/status", () => "Working!").WithTags("Others").WithName("Status");
        }
    }
}
