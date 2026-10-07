using WebApplication2.DTOs;

namespace WebApplication2.Repositories;

public interface ISalesRepository
{
    Task<SalesReportDto?> GetSalesReportAsync(
        int branchId,
        DateTime fromDate,
        DateTime toDate);
}