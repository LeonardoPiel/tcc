

using api.Persistence;

var builder = WebApplication.CreateBuilder(args);
var connectionString = builder.Configuration.GetConnectionString("default") ?? "Data Source=tcc.db";

builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();


builder.Services.AddSqlite<AppDbContext>(connectionString);

builder.Services.AddCors();

var app = builder.Build();

app.UseHttpsRedirection();

app.UseAuthorization();

string[] origins = { "http://localhost:4200", "https://localhost:4200" };

app.UseCors(builder => builder.AllowAnyHeader().AllowAnyHeader().WithOrigins(origins));

app.MapControllers();

app.Run();