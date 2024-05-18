using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace API.Dto;

public class DefaultObjectResult
{
	public List<string> Errors { get; set; }
	public object Data { get; set; }
}
