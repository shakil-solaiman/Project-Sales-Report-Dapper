namespace WebApplication2.Models;

public class Sale
{
    public int Id { get; set; }

    public int BranchId { get; set; }

    public DateTime SaleDate { get; set; } = DateTime.Now;

    public ICollection<SalesDetail> SalesDetails { get; set; } = new List<SalesDetail>();
}