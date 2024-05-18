using api.Models;
using API.Dto;
using AutoMapper;

namespace API.Helpers;

public class AutoMapperProfile : Profile
{
    public AutoMapperProfile()
    {
        CreateMap<Users, UserDto>();
    }
}
