/* recency, frequency and monetary value */

SELECT * from sales.SalesOrderHeader



/*SELECT count(CustomerID) from Sales.SalesOrderHeader*/

/*select MAX(OrderDate) from Sales.SalesOrderHeader*/

--select CustomerID, DATEDIFF(MONTH, MAX(OrderDate),'2014-06-30') as f INTO #test2 from Sales.SalesOrderHeader
group by CustomerID-- recency

SELECT * from #test2

/*select max (r) from #test2*/

 /* frequency*/

 select * from Sales.SalesOrderDetail




 /*SELECT count(SalesOrderID) as no_of_orders, SalesOrderID into #test3 from Sales.SalesOrderDetail
GROUP BY SalesOrderID*/

SELECT MAX(COUNT(SalesOrderID)) FROM Sales.SalesOrderDetail

select distinct SalesOrderID from Sales.SalesOrderDetail

--select max(no_of_orders) from #test3

--select count(SalesOrderID) as count_orders,  sum_order into #test4 from Sales.SalesOrderDetail
--GROUP BY LineTotal--

--select * from #test4

--select max(sum_order) from #test4--


/*select a.CustomerID, 

DATEDIFF (MONTH, MAX(a.OrderDate),'2014-06-30') as Recency,

CASE WHEN DATEDIFF(MONTH, MAX(a.OrderDate),'2014-06-30') between 0 and 6 then 'highrecency_customer'
      WHEN DATEDIFF(MONTH, MAX(a.OrderDate),'2014-06-30') between 7 and 12 then 'goodrecency_customer'
      WHEN DATEDIFF(MONTH, MAX(a.OrderDate),'2014-06-30') between 13 and 24 then 'fairrecency_customer'
      WHEN DATEDIFF(MONTH, MAX(a.OrderDate),'2014-06-30')  > 24 THEN 'poorrecency_customer'
      End as 'Recency_rating' ,
count(a.SalesOrderID) as Frequency,
CASE when count(a.SalesOrderID) between 1 and 5 then 'lowfrequency_customer'
     when count(a.SalesOrderID) between  6 and 10 then 'fairfrequency_customer'
     when count(a.SalesOrderID) between  11 and 15 then 'goodfrequency_customer'
     when count(a.SalesOrderID) > 15 then 'highfrequency_customer'
     End as 'Frequency_rating',

sum(b.LineTotal) as Monetaryvalue,
CASE WHEN sum(b.LineTotal) BETWEEN 1 and 1000 Then 'lowballer_customer'
      When sum(b.LineTotal)  <=5000 THEN 'Fairballer_customer'
      When sum(b.LineTotal) <=10000  then 'goodballer_customer'
      When sum(b.LineTotal)  >10000 then 'highballer_customer'
 End as Monetary_Rating     
      
into #RFM      
from sales.SalesOrderHeader a
Inner JOIN Sales.SalesOrderDetail b

on a.SalesOrderID = b.SalesOrderID

GROUP BY a.CustomerID
ORDER BY Monetaryvalue DESC*/

SELECT * FROM #RFM
ORDER BY MONETARYVALUE