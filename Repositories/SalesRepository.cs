using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using WebApplication2.DTOs;

namespace WebApplication2.Repositories;

public class SalesRepository : ISalesRepository
{
    private readonly IConfiguration _configuration;

    public SalesRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public async Task<SalesReportDto?> GetSalesReportAsync(int branchId, DateTime fromDate, DateTime toDate)
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");

        using var connection = new SqlConnection(connectionString);

        var parameters = new
        {
            BranchId = branchId,
            FromDate = fromDate,
            ToDate = toDate
        };


        var result = await connection.QueryFirstOrDefaultAsync<SalesReportDto>(
                "GetSalesReport",
                parameters,
                commandType: CommandType.StoredProcedure
            );

        return result;
    }
}