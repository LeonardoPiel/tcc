using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api.Persistence;

public class UserPersistence : DefaultPersistence
{
    public UserPersistence(AppDbContext context) : base(context)
    {
    }
}
