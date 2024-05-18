using API.Helpers;
using AutoMapper;

namespace API.Extensions;


public static class AutoMapperExtension
{
    public static PagedList<T> MapWithPageList<T, A>(this IMapper mapper, PagedList<A> source)
    {
        var ret = mapper.Map<PagedList<T>>(source);
        ret.PageSize = source.PageSize;
        ret.TotalPages = source.TotalPages;
        ret.TotalCount = source.TotalCount;
        ret.CurrentPage = source.CurrentPage;
        return ret;
    }
}

