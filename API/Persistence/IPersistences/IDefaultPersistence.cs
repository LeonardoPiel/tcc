namespace API.Persistence.IPersistences;
public interface IDefaultPersistence
{
	void Add<T>(T entity) where T : class;
	void Update<T>(T entity) where T : class;
	void Delete<T>(T entity) where T : class; 
	Task<T> GetById<T>(int id) where T : class;
	Task<bool> SaveChanges();
}
