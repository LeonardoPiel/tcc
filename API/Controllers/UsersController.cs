using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Persistence;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers;

[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
	private readonly AppDbContext _context;

	public UsersController(AppDbContext context)
	{
		_context = context;
	}
	[HttpGet]
	public async Task<ActionResult> GetAll()
	{
		return Ok("Olá");
	}
}
