using BudgetBuddyAPI.Models.Requests;
using BudgetBuddyAPI.Models.Responses;
using BudgetBuddyAPI.Services;
using Microsoft.AspNetCore.Mvc;

namespace BudgetBuddyAPI.Controllers
{
    public static class CategoryController
    {
        public static void MapCategory(this WebApplication app)
        {
            MapListAllCategory(app);
            MapGetCategoryById(app);
            MapCreateCategory(app);
            MapDeleteCategory(app);
        }

        private static void MapListAllCategory(WebApplication app)
        {
            app.MapGet("/Category", (
                [FromQuery] int? pageNumber,
                [FromQuery] int? rowsPerPage,
                [FromQuery] string? description
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CategoryService>();
                        return Results.Ok(service!.ListAllCategory(description, pageNumber, rowsPerPage));
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
            .WithName("List All Categories")
            .WithTags("Category")
            .Produces<CategoryResponse>()
            .Produces<ProblemDetails>(400)
            .Produces<ProblemDetails>(500);
        }

        private static void MapGetCategoryById(WebApplication app)
        {
            app.MapGet("/Category/{id}", ([FromRoute] int id) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CategoryService>();
                        return Results.Ok(service!.GetCategoryById(id));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Get Category By Id")
            .WithTags("Category")
            .Produces<CategoryResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapCreateCategory(WebApplication app)
        {
            app.MapPost("/Category", (
                [FromBody] CategoryRequest companyRequest
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CategoryService>();
                        return Results.Ok(service!.CreateCategory(companyRequest.Id, companyRequest.Description));
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Create Category")
            .WithTags("Category")
            .Produces<CompanyResponse>()
            .Produces<ProblemDetails>(500);
        }

        private static void MapDeleteCategory(WebApplication app)
        {
            app.MapDelete("/Category/{id}", (
                int id
            ) =>
            {
                try
                {
                    using (var scoped = app.Services.CreateScope())
                    {
                        var service = scoped.ServiceProvider.GetService<CategoryService>();
                        service!.DeleteCategoryById(id);
                        return Results.Ok();
                    }
                }
                catch (Exception e)
                {
                    return Results.Problem(e.Message);
                }
            })
            .WithName("Delete Category")
            .WithTags("Category")
            .Produces<ProblemDetails>(500);
        }
    }
}
