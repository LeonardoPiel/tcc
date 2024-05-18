using System.Security.Cryptography;
using System.Text;
using api.Models;
using api.Persistence;
using Api.Dto;
using Api.Service;
using Api.Service.IServices;
using API.Dto;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace API.Controllers;

public class AccountController : DefaultController<TokenService>
{
    public AccountController(AppDbContext context, ITokenService tokenService) : base(context, tokenService)
	{
    }
	[HttpPost("register")]
	public async Task<ActionResult> Register([FromBody]UserRegisterDto body)
	{
		try
		{
			using var hmac = new HMACSHA512();
			var user = new Users
			{
				PasswordHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(body.password)),
				UserName = body.username,
				PasswordSalt = hmac.Key
			};
			_context.Add(user);
			await _context.SaveChangesAsync();
			return Ok<Users>(user);
		}
		catch(Exception ex)
		{
			throw new Exception(ex.Message);
		}
	}
	[HttpPost("login")]
	public async Task<ActionResult> Login([FromBody]LoginDto login)
	{
		var user = await _context.Users.FirstOrDefaultAsync(user => user.UserName == login.UserName.ToLower());
		if (user == null) return NotFound("User not found");
		using var hmac = new HMACSHA512(user.PasswordSalt);
		var computedHash = hmac.ComputeHash(Encoding.UTF8.GetBytes(login.Password));
		for (int i = 0; i < computedHash.Length; i++)
			if (computedHash[i] != user.PasswordHash[i]) return Unauthorized();
        return Ok(new TokenResultDto { token = _service.CreateToken(user), username = user.UserName});
    }
}
