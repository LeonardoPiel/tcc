using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers{}

[ApiController]
[Route("api/[controller]")]
public class UsersControllers : ControllerBase
{
	private readonly AppDbContext _context;

	public UsersControllers(AppDbContext context)
	{
		_context = context;
		
	}
	[HttpGet]
	public ActionResult GetAll()
	{
		return Ok();
	}
}
