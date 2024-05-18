using api.Models;
using API.Service.IServices;

namespace Api.Service.IServices
{
    public interface ITokenService : IDefaultService
    {
        string CreateToken(Users user);
    }
}
