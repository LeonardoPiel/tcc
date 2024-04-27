using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using api.Persistence;

namespace API.Service;

public class UsersService
{
    private readonly AppDbContext _context;

    public UsersService(AppDbContext context)
    {
        _context = context;
    }
}
