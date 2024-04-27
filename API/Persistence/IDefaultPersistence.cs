using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.Persistence;

public interface IDefaultPersistence
{
	Task<bool> Add<T>(T entity) where T : class;
	Task<bool> Update<T>(T entity) where T : class;
	Task<bool> Delete<T>(T entity) where T : class;
	Task<IEnumerable<T>> GetAll<T>(T entity) where T : class;
	Task<T> Get<T>(int id) where T : class;
}
