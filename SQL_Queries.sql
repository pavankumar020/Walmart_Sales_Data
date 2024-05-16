create database walmart;

use walmart;

select * from walmartsales;

alter table  walmartsales add column time_of_day varchar(20);

select time,
( case
  when 'time_of_day' between '00:00:00' and '12:00:00' then 'Morning'
  when 'time_of_day' between '12:01:00' and '16:00:00' then 'Afternoon'
  else 'Evening'
  end
  ) as time_of_day
  from walmartsales;


-- For this to work turn off safe mode for update
-- Edit > Preferences > SQL Edito > scroll down and toggle safe mode
-- Reconnect to MySQL: Query > Reconnect to server

update walmartsales
set time_of_day = 
( case
  when 'time_of_day' between '00:00:00' and '12:00:00' then 'Morning'
  when 'time_of_day' between '12:01:00' and '16:00:00' then 'Afternoon'
  else 'Evening'
  end
  );
  
  select date,
  DAYNAME(date)
  from walmartsales;
  
  alter table walmartsales add column day_name varchar(20);
  
  update walmartsales
  set day_name = DAYNAME(date);
  
  select date,
  monthname(date)
  from walmartsales;
  
  alter table walmartsales add column monthname  varchar(20);
  
  update walmartsales
  set monthname = monthname(date);
  
  --- -- How many unique cities does the data have?
  
select distinct city from walmartsales;

-- In which city is each branch?

select distinct city,branch from walmartsales;

-- How many unique product lines does the data have?

SELECT
	 Product_line
FROM walmartsales;

select * from walmartsales;

desc walmartsales;

select Product line from walmartsales;

-- What is the total revenue by month

select sum(total),monthname from walmartsales
group by total
order by total;

-- What month had the largest COGS?

select max(cogs),monthname from walmartsales
group by cogs
order by cogs desc limit 1;

-- What is the city with the largest revenue?

select product from walmartsales;

select city,sum(total) from walmartsales
group by city
order by city desc limit 1;

-- How many unique product does the data have?

select distinct product from walmartsales;


-- What is the most selling product line

select product,sum(quantity) from walmartsales
group by product
order by product desc limit 1;

-- What product had the largest revenue?

select product,sum(total) from walmartsales
group by product
order by product desc limit 1;

-- What product had the largest VAT?

select product,avg(tax_pct) from walmartsales
group by product
order by product desc limit 1;

-- Fetch each product line and add a column to those product 
-- line showing "Good", "Bad". Good if its greater than average sales

select avg(quantity) as quantity from walmartsales;

select product ,
case 
when  quantity > 6 then 'Good'
else 'Bad'
end
as Remark
from walmartsales
group by product;

-- Which branch sold more products than average product sold?

select branch,sum(quantity)
 from walmartsales
 group by branch
 having sum(quantity) > (select avg(quantity) from walmartsales);
 
SELECT 
	branch, 
    SUM(quantity) AS qnty
FROM walmartsales
GROUP BY branch
HAVING SUM(quantity) > (SELECT AVG(quantity) FROM walmartsales);

 -- What is the most common product line by gender

select gender as total_count,count(gender),product
from walmartsales
group by product,gender
order by total_count desc ;

-- What is the average rating of each product line

select product,round((rating),2) as Ratings
from walmartsales
group by product
order by Ratings desc ;

-- How many unique customer types does the data have?

select distinct customer from walmartsales;

-- How many unique payment methods does the data have?

select distinct payment from walmartsales;

-- What is the most common customer type?

select customer,count(*) as total_count from walmartsales
group by customer
order by total_count desc;

-- Which customer type buys the most?

select customer,total as total_buy
from walmartsales
group by customer
order by total_buy desc;

-- What is the gender of most of the customers?

select count(customer) as total_customer,gender from walmartsales
group by gender
order by total_customer desc;

SELECT
	gender,
	COUNT(*) as gender_cnt
FROM walmartsales
GROUP BY gender
ORDER BY gender_cnt DESC;

-- What is the gender distribution per branch?

select branch,count(branch),gender as total_gender 
from walmartsales
group by branch
order by gender desc;

select gender,count(branch) as Branch from walmartsales
group by  Branch
order by Branch desc;

SELECT
	gender,
	COUNT(*) as gender_cnt
FROM walmartsales
WHERE branch = "C"
GROUP BY gender
ORDER BY gender_cnt DESC;

select gender,count(*) as gender_cnt from walmartsales
where branch = 'c'
group by gender
order by gender_cnt desc;

select time,
(
case
when `time` between '00;00;00' and '12;00;00' then 'Morning'
when `time` between '12;01;00' and '16;00;00' then 'Afternoon'
else 'Evening'
end)
from walmartsales;

alter table walmartsales add column time_of_dat varchar(20);

update walmartsales
set time_of_dat =
 (
case 
when `time` between '00;00;00' and '12;00;00' then 'Morning'
when `time` between '12;01;00' and '16;00;00' then 'Afternoon'
else 'Evening'
end);

select * from walmartsales;

-- Which time of the day do customers give most ratings?

 select time_of_dat,count(Rating) as Ratings
 from walmartsales
 group by time_of_dat
 order by Ratings desc;
 
 SELECT
	time_of_dat,
	AVG(rating) AS avg_rating
FROM walmartsales
WHERE branch = "A"
GROUP BY time_of_dat
ORDER BY avg_rating DESC;

-- Which day fo the week has the best avg ratings?

select day_name,round(avg(rating),2) as Ratings
from walmartsales
group by day_name
order by Rating desc;

