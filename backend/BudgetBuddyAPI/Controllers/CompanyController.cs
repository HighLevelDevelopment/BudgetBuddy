using BudgetBuddyAPI.Models.Requests;
using BudgetBuddyAPI.Models.Responses;
using BudgetBuddyAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace BudgetBuddyAPI.Controllers
{
    internal static class CompanyController
    {
        public static void MapCompany(this WebApplication app)
        {
            MapListAllCompany(app);
            MapGetCompanyByDocument(app);
            MapCreateCompany(app);
            MapDeleteCompany(app);
        }

        private static void MapListAllCompany(WebApplication app)
        {
            app.MapGet("/Company", (
                [FromQuery] int? pageNumber,
                [FromQuery] int? rowsPerPage,
                [FromQuery] string? name,
                [FromQuery] string? trading
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CompanyService>();
                        return Results.Ok(service!.ListAllCompany(name, trading, pageNumber, rowsPerPage));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("List All Company")
            .WithTags("Company")
            .Produces<CompanyResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapGetCompanyByDocument(WebApplication app)
        {
            app.MapGet("/Company/{document}", ([FromRoute] string document) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CompanyService>();
                        return Results.Ok(service!.GetCompanyByDocument(document));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Get Company By Document")
            .WithTags("Company")
            .Produces<CompanyResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapCreateCompany(WebApplication app)
        {
            app.MapPost("/Company", (
                [FromBody] CompanyRequest companyRequest
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CompanyService>();
                        return Results.Ok(service!.CreateCompany(companyRequest.Id, companyRequest.Name, companyRequest.Trading, companyRequest.Document));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Create Company")
            .WithTags("Company")
            .Produces<CompanyResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapDeleteCompany(WebApplication app)
        {
            app.MapDelete("/Company/{document}", (
                [FromBody] CompanyRequest companyRequest
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CompanyService>();
                        service!.DeleteCompanyByDocument(companyRequest.Document);
                        return Results.Ok();
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Delete Company")
            .WithTags("Company")
            .Produces<ProblemDetails>(500);
        }
    }
}
