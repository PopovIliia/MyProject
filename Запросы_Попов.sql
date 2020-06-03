--Запросы

--1
select s.date_open, s.city
from shop as s
where city = 'Elseside' and date_open > now()

--2
select e.name, e.surname, s.start_time, s.finish_time
from employee e
inner join schedule s on e.id = s.employee_id
where e.shop_id = '11' and s.working_day = 'Thursday'

--3
select b.client_id, cl.name, cl.surname, sum(sp.price)
from buy b
inner join shop_product sp on b.shop_product_id = sp.id
inner join client cl on b.client_id = cl.id
where extract (day from(now()-b.date_buy))<15
group by b.client_id, cl.name, cl.surname
Having sum(sp.price) > 1000

--4
with cl_buy as(
select b.client_id, cl.name, cl.surname, sum(sp.price)
from buy b
inner join shop_product sp on b.shop_product_id = sp.id
inner join client cl on b.client_id = cl.id
where extract (hour from(now()-b.date_buy))<=240
group by b.client_id, cl.name, cl.surname
Order by sum(sp.price) Desc
)
select *
from cl_buy cb
limit (select count(*)*0.3 from cl_buy)

--5
with task4 as(
with cl_buy as(
select b.client_id, cl.name, cl.surname, sum(sp.price) as spr
from buy b
inner join shop_product sp on b.shop_product_id = sp.id
inner join client cl on b.client_id = cl.id
where extract (hour from(now()-b.date_buy))<=240
group by b.client_id, cl.name, cl.surname
Order by sum(sp.price) Desc
)
select *
from cl_buy cb
limit (select count(*)*0.3 from cl_buy)
)
select avg(ts.spr)
from task4 ts

--6
select pr.id, pr.name, w1.total as week1, w2.total as week2, w3.total as week3, w4.total as week4
from product pr
LEFT JOIN (
select pr.id as w1id, count(*) as total
from product pr, ( select pr.id as wthid
from product pr
inner join shop_product shp on pr.id = shp.product_id
inner join buy b on shp.id = b.shop_product_id
where extract (day from(now()-b.date_buy))<=7) as wth
where pr.id = wth.wthid
group by pr.name, pr.id
order by pr.id) as w1
ON pr.id = w1.w1id
LEFT JOIN (
select pr.id as w1id, count(*)as total
from product pr, ( select pr.id as wthid
from product pr
inner join shop_product shp on pr.id = shp.product_id
inner join buy b on shp.id = b.shop_product_id
where extract (day from(now()-b.date_buy)) > 7 and (extract (day from(now()-b.date_buy)) <=14 )) as wth
where pr.id = wth.wthid
group by pr.name, pr.id
order by pr.id) as w2
ON pr.id = w2.w1id
LEFT JOIN (
select pr.id as w1id, count(*)as total
from product pr, ( select pr.id as wthid
from product pr
inner join shop_product shp on pr.id = shp.product_id
inner join buy b on shp.id = b.shop_product_id
where extract (day from(now()-b.date_buy)) > 14 and (extract (day from(now()-b.date_buy))<=21 )) as wth
where pr.id = wth.wthid
group by pr.name, pr.id
order by pr.id) as w3
ON pr.id = w3.w1id
LEFT JOIN (
select pr.id as w1id, count(*)as total
from product pr, ( select pr.id as wthid
from product pr
inner join shop_product shp on pr.id = shp.product_id
inner join buy b on shp.id = b.shop_product_id
where extract (day from(now()-b.date_buy)) > 21 and (extract (day from(now()-b.date_buy)) <=28) ) as wth
where pr.id = wth.wthid
group by pr.name, pr.id
order by pr.id)as w4
ON pr.id = w4.w1id
group by pr.id, pr.name, w1.total, w2.total, w3.total, w4.total
order by pr.id
--7

--8
select e.name, e.surname, s.start_time, s.finish_time, s.working_day
from employee e
inner join schedule s on e.id = s.employee_id
where e.id = 5

--12
select e.name, e.surname, count(s.employee_id)
from supply s
inner join employee e on e.id=s.employee_id
inner join supplier sr on sr.id=s.supplier_id
where s.shop_id=1 and sr.name='Hagenes - Thiel'
group by s.employee_id, e.name, e.surname
order by count(s.employee_id) desc
limit 1

--13
with shop_price as
(select sp.id, sp.price::real as price_shop
from shop_product as sp
inner join product pr on pr.id=sp.product_id
),
sup_price as
(select s.id, s.price::real as price_sup
from supply as s
)
select (abs((shop_price.price_shop-sup_price.price_sup)/sup_price.price_sup)*100)::integer as relative ,
abs(shop_price.price_shop-sup_price.price_sup) as absolute
from shop_price
inner join sup_price on shop_price.id = sup_price.id

--14
with income as(
select sp.shop_id, sum(sp.price) as income
from buy b
inner join shop_product sp on sp.id=b.shop_product_id
where extract (day from(now()-b.date_buy))<=7
group by sp.shop_id
),
costs as(
select s.shop_id, sum(s.price) as costs
from supply s
group by s.shop_id
)
select income.shop_id,income.income, costs.costs
from income
inner join costs on costs.shop_id=income.shop_id

--15
alter table employee
add column salary integer

update employee 
set salary = 30000

alter table employee
alter column salary 
set not null