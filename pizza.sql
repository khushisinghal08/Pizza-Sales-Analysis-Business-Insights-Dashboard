create database pizza_sales;

use pizza_sales;
select count(*) from pizza_sales;


alter table pizza_sales
change ï»¿pizza_id pizza_id int;

select * from pizza_sales;

alter table pizza_sales
modify pizza_name_id varchar(255);

alter table pizza_sales
modify pizza_size varchar(255);

alter table pizza_sales
modify pizza_category varchar(255);

alter table pizza_sales
modify pizza_ingredients varchar(255);

alter table pizza_sales
modify pizza_name varchar(255);

alter table pizza_sales
modify order_date Datetime;

SET SQL_SAFE_UPDATES = 0;

UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

ALTER TABLE pizza_sales
MODIFY order_date DATETIME;

UPDATE pizza_sales
SET order_time = STR_TO_DATE(order_time, '%H:%i:%s');

ALTER TABLE pizza_sales
MODIFY order_time TIME;

select count(*) from pizza_sales;

select * from pizza_sales;

#total Revenue

select sum(total_price)  as total_revenue from pizza_sales;

select sum(total_price) / count(distinct order_id) as avg_order_value from pizza_sales;

select sum(quantity) as total_pizza_sold from pizza_sales;

select count(distinct order_id) as Total_orders from pizza_sales;

select sum(quantity) / count(distinct order_id) as avg_pizza_per_order from pizza_sales;

select dayname (order_date) as order_day , count(distinct order_id) as total_orders from pizza_sales
group by dayname (order_date);

select monthname(order_date) as order_month , count(distinct order_id) as total_orders from pizza_sales
group by monthname(order_date)
order by total_orders desc;

select pizza_category from pizza_sales;

select pizza_category, sum(total_price) as total_sales , sum(total_price) * 100 / (select sum(total_price) from pizza_sales ) as pct_of_total_sales from pizza_sales 
group by pizza_category;


SELECT 
    pizza_size, 
    SUM(total_price) AS total_sales,
    ROUND(SUM(total_price) * 100 / 
          (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct_of_total_sales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pct_of_total_sales desc;

SELECT 
    pizza_category, 
    SUM(total_price) AS total_sales,
    ROUND(SUM(total_price) * 100 / 
          (SELECT SUM(total_price) FROM pizza_sales), 2) AS pct_of_total_sales
FROM pizza_sales
GROUP BY pizza_category
ORDER BY pct_of_total_sales desc;


select pizza_name , sum(total_price) as total_revenue from pizza_sales
group by pizza_name 
order by total_revenue desc
limit 5 ;


select pizza_name , sum(total_price) as total_revenue from pizza_sales
group by pizza_name 
order by total_revenue asc
limit 5 ;

select pizza_name , sum(quantity) as total_quantity from pizza_sales
group by pizza_name 
order by total_quantity desc
limit 5 ;

select pizza_name , sum(quantity) as total_quantity from pizza_sales
group by pizza_name 
order by total_quantity asc
limit 5 ;

select pizza_name , count(distinct order_id) as total_order from pizza_sales
group by pizza_name 
order by total_order desc
limit 5 ;

select pizza_name , count(distinct order_id) as total_order from pizza_sales
group by pizza_name 
order by total_order asc
limit 5 ;