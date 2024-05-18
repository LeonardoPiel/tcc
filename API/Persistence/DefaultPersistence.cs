
using API.Persistence.IPersistences;
using Microsoft.EntityFrameworkCore;

namespace api.Persistence;

public class DefaultPersistence : IDefaultPersistence
{
	private readonly AppDbContext _context;

	public DefaultPersistence(AppDbContext context)
	{
		_context = context;
		_context.ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
	}

	public async void Add<T>(T entity) where T : class
	{
		_context.Add(entity);
	}

	public void Delete<T>(T entity) where T : class
	{
		_context.Remove(entity);
	}

	public async Task<T> GetById<T>(int id) where T : class
	{
		return await _context.FindAsync<T>(id);
	}

	public async Task<bool> SaveChanges() => await _context.SaveChangesAsync() > 0;
	

	public void Update<T>(T entity) where T : class
	{
		throw new NotImplementedException();
	}
}
