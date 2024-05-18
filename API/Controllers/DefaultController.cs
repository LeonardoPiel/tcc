using api.Persistence;
using API.Dto;
using API.Extensions;
using API.Helpers;
using API.Service.IServices;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class DefaultController<Service> : ControllerBase
{
	protected readonly AppDbContext _context;
	protected Service _service;

	public DefaultController(AppDbContext context)
	{
		_context = context;
	}
	public DefaultController(AppDbContext context, IDefaultService service)
	{
		try
		{
			if(service is IDefaultService)
			{
				_context = context;
				_service = (Service)service;
			}
		}
		catch(Exception ex)
		{
			throw new Exception(ex.Message, ex);
		}
	}
	/// <summary>
	/// Método customizado para retorno de status 200.
	/// </summary>
	/// <param name="obj"> objeto de dados que será retornado no parâmetro Data do retorno</param>
	/// <typeparam name="T">O tipo do objeto que será retornado. Caso o objecto seja uma lista paginada, passar apenas o tipo do objeto paginado</typeparam>
	/// <returns></returns>
	public OkObjectResult Ok<T>(object obj)
	{
		try
		{
			if (obj != null)
			{
				var result = new DefaultObjectResult
				{
					Data = obj,
					Errors = []
				};
				if (obj.GetType() == typeof(PagedList<>))
				{
					var pagedList = (PagedList<T>)result.Data;
					Response.AddPaginationHeader(new PaginationHeader(pagedList.CurrentPage, pagedList.PageSize, pagedList.TotalCount, pagedList.TotalPages));
				}
			}
			return new OkObjectResult(obj);
		}
		catch(Exception ex)
		{
			throw new Exception(ex.Message);
		}
	}
}
