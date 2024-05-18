using API.Dto;
using API.Helpers;
using API.Service.IServices;

namespace API.IServices.Service;

public interface IUserService : IDefaultService
{
	Task<bool> AddUserAsync(UserDto user);
	Task<PagedList<UserDto>> GetByUserNameAsync(UserParams userParams, string userName);
	Task<UserDto> GetById(int id);
}
