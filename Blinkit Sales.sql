-- Managing inconsistencies in Item_Fat_Content values
use Project; 
update blinkit_sales
set Item_Fat_Content = 
case 
when Item_Fat_Content IN ('LF', 'low fat') then 'low Fat'
when Item_Fat_Content  = 'reg' then 'Regular'
else Item_Fat_Content
end ;

--Total Sales
select 
concat(cast(sum(Sales)/ 1000000 as decimal(10,2)),' Millions') as TotalRevenueInMillions
from blinkit_sales;

--Average Sales
select round(avg(Sales), 2) as AverageSales  from blinkit_sales;

--Total Items Sold
select count(Item_Type) as TotalItems from blinkit_sales;

--Average Rating
 Select round(avg(Rating), 2) as AverageRating from blinkit_sales;

 -- Total Sales , Average sales, Average Rating, Number Of items by fat Content

select Item_Fat_Content, 
		concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalRevenueInThousand,
		round(avg(Sales), 2) as AverageSales ,
		count(Item_Type) as TotalItems ,
		round(avg(Rating), 2) as AverageRating
from blinkit_sales
group by Item_Fat_Content
order by TotalRevenueInThousand desc;

-- Total Sales , Average sales, Average Rating, Number Of items by Item Type
select Item_Type, 
		concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalRevenueInThousand,
		round(avg(Sales), 2) as AverageSales ,
		count(Item_Type) as TotalItems ,
		round(avg(Rating), 2) as AverageRating
from blinkit_sales
group by Item_Type
order by TotalRevenueInThousand desc;


select Outlet_Location_Type, Item_Fat_Content ,
		concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalRevenueInThousand,
		round(avg(Sales), 2) as AverageSales ,
		count(Item_Type) as TotalItems ,
		round(avg(Rating), 2) as AverageRating
from blinkit_sales
group by Outlet_Location_Type, Item_Fat_Content 
order by TotalRevenueInThousand desc;

--Total Sales by outlet establishment year
select Outlet_Establishment_Year,
		concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalRevenueInThousand
from blinkit_sales
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year asc;

-- Sales Percentage by Outlet Size
select Outlet_Size, round(Sum(Sales), 2) as TotalSales,
round(sum(Sales) * 100 / sum(sum(Sales)) over() , 2) as SalesPercentage
from blinkit_sales
group by Outlet_Size
order by TotalSales desc;

--Sales by Outlet Location
select Outlet_Location_Type, concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalSales,
round(sum(Sales) * 100 / sum(sum(Sales)) over() , 2) as SalesPercentage
from blinkit_sales
group by Outlet_Location_Type
order by TotalSales;

--All the metrics by outlet type
select Outlet_Type, 
		concat(cast(sum(Sales)/ 1000 as decimal(10,2)),' Thousand') as TotalRevenueInThousand,
		round(avg(Sales), 2) as AverageSales ,
		count(Item_Type) as TotalItems ,
		round(avg(Rating), 2) as AverageRating
from blinkit_sales
group by Outlet_Type
order by TotalRevenueInThousand desc;



select * from blinkit_sales;