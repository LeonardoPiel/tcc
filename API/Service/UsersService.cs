using api.Models;
using api.Persistence;
using API.Dto;
using API.Extensions;
using API.Helpers;
using API.IServices.Service;
using AutoMapper;

namespace API.Service;

public class UsersService : IUserService
{
	private readonly UserPersistence _userPersistence;
	private readonly DefaultPersistence _defaultPersistence;
	private readonly IMapper _mapper;

	public UsersService(UserPersistence userPersistence, DefaultPersistence defaultPersistence, IMapper	mapper)
	{
		_userPersistence = userPersistence;
		_defaultPersistence = defaultPersistence;
		_mapper = mapper;
	}
	public async Task<bool> AddUserAsync(UserDto user)
	{
		var model = _mapper.Map<UserDto, Users>(user);
		return await _userPersistence.AddAsync(model);
	}

	public async Task<UserDto> GetById(int id)
	{
		var model = await _defaultPersistence.GetById<Users>(id);
		var result = _mapper.Map<UserDto>(model);
		return result;
	}

	public async Task<PagedList<UserDto>> GetByUserNameAsync(UserParams userParams, string userName)
	{
		var model = await _userPersistence.GetByUserNameAsync(userParams, userName);
		var result = _mapper.MapWithPageList<UserDto, Users>(model);
		return result;
	}
}
