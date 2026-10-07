create database WebApplication2Db

use WebApplication2Db

select * from SalesDetails;

select * from Sales;

--truncate table SalesDetails;
--truncate table Sales;

--alter table SalesDetails
--drop constraint FK_SalesDetails_Sales;  

--alter table SalesDetails
--add constraint FK_SalesDetails_Sales
--foreign key (SaleId) references Sales(Id);


insert into Sales (BranchId, SaleDate) values
(7, '2026-04-18'),
(2, '2026-01-07'),
(9, '2026-08-22'),
(1, '2026-03-11'),
(5, '2026-11-03'),
(10, '2026-02-25'),
(3, '2026-07-14'),
(8, '2026-05-09'),
(4, '2026-10-27'),
(6, '2026-01-19'),
(2, '2026-09-06'),
(7, '2026-06-21'),
(1, '2026-12-12'),
(10, '2026-04-03'),
(6, '2026-08-15'),
(4, '2026-02-12'),
(9, '2026-11-19'),
(3, '2026-05-28'),
(8, '2026-10-08'),
(5, '2026-03-24');



insert into SalesDetails (SaleId, ProductId, Quantity, UnitPrice, CostPrice) values
(1, 104, 3, 1250, 950),
(1, 101, 1, 18500, 15500),
(2, 107, 2, 4500, 3600),
(2, 103, 5, 850, 650),
(3, 110, 1, 12500, 9800),
(3, 105, 4, 320, 240),
(4, 102, 2, 1750, 1350),
(4, 108, 3, 950, 720),
(5, 101, 2, 21000, 17500),
(5, 109, 1, 5800, 4500),
(6, 106, 4, 2200, 1700),
(6, 104, 1, 39500, 34000),
(7, 103, 2, 1200, 900),
(7, 107, 3, 5200, 4100),
(8, 110, 2, 9800, 7600),
(8, 105, 6, 280, 210),
(9, 108, 4, 1150, 850),
(9, 101, 1, 19500, 16200),
(10, 109, 2, 6200, 4800),
(10, 102, 5, 1600, 1250),
(11, 104, 2, 41000, 35000),
(11, 106, 3, 1950, 1500),
(12, 105, 8, 300, 220),
(12, 110, 1, 14500, 11200),
(13, 107, 1, 5600, 4300),
(13, 103, 4, 900, 680),
(14, 101, 3, 19800, 16500),
(14, 108, 2, 1250, 900),
(15, 109, 5, 5400, 4200),
(15, 106, 2, 2350, 1800),
(16, 102, 4, 1550, 1200),
(16, 104, 1, 38500, 32500),
(17, 110, 3, 10500, 8200),
(17, 105, 7, 275, 200),
(18, 103, 2, 1350, 1000),
(18, 107, 1, 5900, 4500),
(19, 106, 5, 2100, 1600),
(19, 101, 2, 20500, 17000),
(20, 108, 3, 1350, 1000),
(20, 109, 2, 6100, 4700);





create procedure GetSalesReport
@BranchId int,
@FromDate date,
@ToDate date

as
begin

select s.BranchId,

-- Total Sales
sum(sd.Quantity * sd.UnitPrice) as TotalSales,

-- Total Cost
sum(sd.Quantity * sd.CostPrice) as TotalCost,

-- Gross Profit
sum((sd.Quantity * sd.UnitPrice)  -  (sd.Quantity * sd.CostPrice)) as GrossProfit,

-- GP Percentage
(sum((sd.Quantity * sd.UnitPrice)  -  (sd.Quantity * sd.CostPrice))  /  sum(sd.Quantity * sd.UnitPrice)) * 100 as GPPercentage


from SalesDetails sd
inner join Sales s
on s.Id = sd.SaleId

where s.BranchId = @BranchId and s.SaleDate between @FromDate and @ToDate

group by s.BranchId;
end;


exec GetSalesReport @BranchId = 10,  @FromDate = '2026-01-12',  @ToDate = '2026-12-30';



--select * from sys.procedures
--where name = 'GetSalesReport';

--drop procedure GetSalesReport;