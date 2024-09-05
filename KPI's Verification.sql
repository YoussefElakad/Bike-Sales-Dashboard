select PRODUCTCATEGORY, count(ORDERNO) from Sales_e
group by PRODUCTCATEGORY
order by count(orderno) desc;

select PRODUCTCATEGORY, sum(itemprice-itemcost) from Sales_e
group by PRODUCTCATEGORY
order by sum(itemprice-itemcost) desc;

select count(ORDERNO) from Sales_e;

select sum(itemprice-itemcost) from sales_e;

select sum(itemprice) from sales_e;

with lastyear as
(
select sum(itemprice) ly from sales_e 
where to_char(ORDERDATE,'yyyy') = '2019'
),
currentyear as
(
select sum(itemprice) cy
from sales_e
where to_char(ORDERDATE,'yyyy') = '2020'
)
select round(((cy-ly)/ly)*100,2) || '%'
from lastyear, currentyear;

with lastyear as
(
select sum(itemprice) ly from sales_e 
where to_char(ORDERDATE,'yyyy/mm') = '2019/01'
),
currentyear as
(
select sum(itemprice) cy
from sales_e
where to_char(ORDERDATE,'yyyy/mm') = '2020/01'
)
select round(((cy-ly)/ly)*100,2) || '%'
from lastyear, currentyear;

select to_char(orderdate,'month'),sum(itemprice) from sales_e
where to_char(orderdate,'yyyy') = '2020'
group by to_char(orderdate,'month');

select customerstate,sum(itemprice-itemcost) from sales_e
group by customerstate
order by sum(itemprice-itemcost) desc
fetch first 5 rows only;

select PRODUCTSUBCATEGORY,sum(itemprice-itemcost) from sales_e
where lower(PRODUCTCATEGORY) = 'accessories'
group by PRODUCTSUBCATEGORY
order by sum(itemprice-itemcost) desc
fetch first 5 rows only;