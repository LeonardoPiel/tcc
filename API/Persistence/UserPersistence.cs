using api.Models;
using API.Helpers;
using API.Persistence.IPersistences;

namespace api.Persistence;

public class UserPersistence : DefaultPersistence, IUserPersistence
{
	private readonly AppDbContext _context;

	public UserPersistence(AppDbContext context) : base(context)
	{
		_context = context;
	}

	public async Task<bool> AddAsync(Users user)
	{
		Add(user);
		return await SaveChanges();
	}

	public Task<bool> ChangePasswordAsync(int userId, string oldPassword, string newPassword)
	{
		throw new NotImplementedException();
	}
	public async Task<PagedList<Users>> GetByUserNameAsync(UserParams parameters, string userName)
	{
		IQueryable<Users> query = _context.Users.Where(user => user.UserName.ToLower() == userName.ToLower()).AsQueryable();
		return await PagedList<Users>.CreateAsync(query, parameters.PageNumber, parameters.PageSize);
	}
}
