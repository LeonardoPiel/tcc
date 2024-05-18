using api.Models;
using API.Helpers;
namespace API.Persistence.IPersistences;

public interface IUserPersistence
{
	Task<bool> AddAsync(Users user);
	Task<PagedList<Users>> GetByUserNameAsync(UserParams parameters, string userName);
	Task<bool> ChangePasswordAsync(int userId, string oldPassword, string newPassword);
}
