namespace WebApplication2.DTOs;

public class SalesReportDto
{
    public int BranchId { get; set; }

    public decimal TotalSales { get; set; }

    public decimal TotalCost { get; set; }

    public decimal GrossProfit { get; set; }

    public decimal GPPercentage { get; set; }
}