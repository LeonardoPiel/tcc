using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Service;

public interface IService
{
	Task<bool> GetAll<T>() where T : class;
	Task<bool> GetById<T>(int id) where T : class;
	Task<bool> AddAsync<T>(T dto) where T : class;
	Task<bool> UpdateAsync<T>(T dto) where T : class;
	Task<bool> DeleteAsync<T>(T dto) where T : class;
}
