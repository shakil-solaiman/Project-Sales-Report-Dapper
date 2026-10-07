using Microsoft.AspNetCore.Mvc;
using WebApplication2.Repositories;

namespace WebApplication2.Controllers;

public class SalesController : Controller
{
    private readonly ISalesRepository _salesRepository;

    public SalesController(ISalesRepository salesRepository)
    {
        _salesRepository = salesRepository;
    }


    [HttpGet]
    public IActionResult Report()
    {
        return View();
    }


    [HttpPost]
    public async Task<IActionResult> Report(int branchId, DateTime fromDate, DateTime toDate)
    {
        var report = await _salesRepository.GetSalesReportAsync( branchId, fromDate, toDate);

        if (report == null)
        {
            ViewBag.Message = "No sales data found.";

            ViewBag.count = 1;

            return View();
        }

        return View(report);
    }
}