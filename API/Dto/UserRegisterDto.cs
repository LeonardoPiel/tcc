using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace API.Dto;

public class UserRegisterDto
{
	[Required]
	public string username { get; set; }
	[Required]
	public string password { get; set; }
}
