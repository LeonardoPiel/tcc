using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.Persistence;

public class DefaultPersistence : IDefaultPersistence
{
	private readonly AppDbContext _context;
	public DefaultPersistence(AppDbContext context)
	{
		_context = context;
	}

	public async Task<bool> Add<T>(T entity) where T : class
	{
		try
		{
			await _context.AddAsync<T>(entity);
			return await _context.SaveChangesAsync() > 0;
		}
		catch (Exception ex)
		{
			throw new Exception("", ex);
		}
	}
	public async Task<bool> Update<T>(T entity) where T : class
	{
		try
		{
			_context.Update<T>(entity);
			return await _context.SaveChangesAsync() > 0;
		}
		catch (System.Exception ex)
		{
			throw new Exception(ex.Message, ex);
		}
	}
	public async Task<bool> Delete<T>(T entity) where T : class
	{
		try
		{
			_context.Remove<T>(entity);
			return await _context.SaveChangesAsync() > 0;
		}
		catch (System.Exception ex)
		{
			throw new Exception(ex.Message, ex);
		}
	}

	public Task<T> Get<T>(int id) where T : class
	{
		throw new NotImplementedException();
	}

	public Task<IEnumerable<T>> GetAll<T>(T entity) where T : class
	{
		throw new NotImplementedException();
	}
}
