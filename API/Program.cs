using api.Persistence;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("default") ?? "Data Source=tcc.db";
// Add services to the container.

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSqlite<AppDbContext>(connectionString);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
}
app.UseHttpsRedirection();
app.Run();