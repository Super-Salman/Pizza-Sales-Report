use pizzadb;

select * from pizza_sales;

select count(pizza_id) as Total from pizza_sales;

select round(sum(total_price),2) as Total_Revenue from pizza_sales;

select (round(sum(total_price) / count(distinct order_id),2)) as Avg_Order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as total_orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) 
as decimal(10,2)) as decimal(10,2)) as avg_pizza_sales from pizza_sales;

select datename(DW, order_date) as order_day,
count(distinct order_id) as total_orders
from pizza_sales
group by datename(dw,order_date)
order by total_orders;

select datename(DW, order_date) as order_day,
count(datename(DW, order_date)) as total_days
from pizza_sales
group by datename(DW, order_date);

select datename(Month, order_date) as order_month,
count(distinct order_id) as total_orders
from pizza_sales
group by datename(month, order_date)
order by total_orders desc;

select * from pizza_sales;

select pizza_category, round(sum(total_price),2) as total_sales,
round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales
where month(order_date) = 1),2) as PCT
from pizza_sales
where month(order_date) = 1
group by pizza_category;

select pizza_size, round(sum(total_price),2) as total_sales,
round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales
),2) as PCT
from pizza_sales
group by pizza_size;

select Top 5 pizza_name, round(sum(total_price),0) as total_sales
from pizza_sales
group by pizza_name
order by total_sales desc;

select Top 5 pizza_name, round(sum(total_price),0) as total_sales
from pizza_sales
group by pizza_name
order by total_sales;


