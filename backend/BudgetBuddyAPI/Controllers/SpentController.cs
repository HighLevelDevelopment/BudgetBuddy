using BudgetBuddyAPI.Models.Requests;
using BudgetBuddyAPI.Models.Responses;
using BudgetBuddyAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace BudgetBuddyAPI.Controllers
{
    internal static class SpentController
    {
        public static void MapSpent(this WebApplication app)
        {
            MapListAllSpent(app);
            MapGetSpentById(app);
            MapCreateSpent(app);
            MapDeleteSpent(app);
        }

        private static void MapListAllSpent(WebApplication app)
        {
            app.MapGet("/Spent", (
                [FromQuery] int? pageNumber,
                [FromQuery] int? rowsPerPage,
                [FromQuery] string? description
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<SpentService>();
                        return Results.Ok(service!.ListAllSpent(description, pageNumber, rowsPerPage));
                    }
                }
                catch (ArgumentException e)
                {
                    return Results.BadRequest(e.Message);
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("List All Spent")
            .WithTags("Spent")
            .Produces<IEnumerable<SpentResponse>>()
            .Produces<ProblemDetails>(400)
            .Produces<ProblemDetails>(500);
        }

        private static void MapGetSpentById(WebApplication app)
        {
            app.MapGet("/Spent/{id}", ([FromRoute] int id) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<SpentService>();
                        return Results.Ok(service!.GetSpentById(id));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Get Spent By Id")
            .WithTags("Spent")
            .Produces<SpentResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapCreateSpent(WebApplication app)
        {
            app.MapPost("/Spent", (
                [FromBody] SpentRequest spentRequest
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<SpentService>();
                        return Results.Ok(service!.CreateSpent(spentRequest.IdSpentCategory, spentRequest.IdSpentType, spentRequest.Description, spentRequest.SpentAmount));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Create Spent")
            .WithTags("Spent")
            .Produces<SpentResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapDeleteSpent(WebApplication app)
        {
            app.MapDelete("/Spent/{id}", ([FromRoute] int id) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<SpentService>();
                        service!.DeleteSpentById(id);
                        return Results.Ok();
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Delete Spent")
            .WithTags("Spent")
            .Produces<ProblemDetails>(500);
        }
    }
}
