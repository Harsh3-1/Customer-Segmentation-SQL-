select distinct *
from [Customer Segmentation].[dbo].['Online Retail$']

-- No.of custmores from each country
select country,count(customerID) as No_of_customers
from [Customer Segmentation].[dbo].['Online Retail$']
where country is not null
group by country
order by No_of_customers desc

--Distribution of order values for all customers

select customerid, count(InvoiceNo) as No_of_orders_per_customer
from [Customer Segmentation].[dbo].['Online Retail$']
where InvoiceNo is not null and CustomerID <> 0
group by CustomerID

--how many unique products purchased by each customer
select customerid,count(distinct(stockcode)) as unique_orders
from [Customer Segmentation].[dbo].['Online Retail$']
where customerid<>0
group by CustomerID
order by unique_orders desc


--Customers who made only a single purchase
select customerid, count(InvoiceNo) as No_of_orders_per_customer
from [Customer Segmentation].[dbo].['Online Retail$']
where InvoiceNo is not null and CustomerID <> 0
group by CustomerID
having count(InvoiceNO) = 1

--Which products are most profitable
select stockcode,description, quantity*unitprice as totalEarinings
from [Customer Segmentation].[dbo].['Online Retail$']
order by totalEarinings desc

-- Top 10 dates where most sales happened
select top(10) invoicedate, Max(quantity) as sales
from [Customer Segmentation].[dbo].['Online Retail$']
group by InvoiceDate
order by sales desc














