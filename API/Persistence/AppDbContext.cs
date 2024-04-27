using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Models;
using Microsoft.EntityFrameworkCore;

namespace api.Persistence;

public class AppDbContext : DbContext
{
	public DbSet<Users> Users { get; set; }
	public AppDbContext(DbContextOptions options) : base(options)
	{
	}
}
