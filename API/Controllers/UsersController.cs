using api.Persistence;
using API.Dto;
using API.Helpers;
using API.Service;
using API.Service.IServices;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;
public class UsersController : DefaultController<UsersService>
{
	public UsersController(AppDbContext context, IDefaultService service) : base(context, service)
	{
	}

	[HttpGet]
	public async Task<ActionResult> GetByUserName([FromQuery] UserParams queryParams, [FromBody] string userName)
	{
		try
		{
			var users = await _service.GetByUserNameAsync(queryParams, userName);
			return Ok<UserDto>(users);
		}
		catch (System.Exception ex)
		{
			throw new Exception(ex.Message, ex);
		}
	}
}
