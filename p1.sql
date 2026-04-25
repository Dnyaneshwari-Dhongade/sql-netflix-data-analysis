create database mega;
use mega;
select * from customers;
select * from orders;
select * from products;
select * from order_items;
-- Basic Queries
-- Show all customers
select * from customers;
select * from products;
select * from order_items;

-- Show all orders
select * from orders;

-- Find total number of orders
select count(*) from orders;

-- Find total revenue
select sum(total_amount) from orders;

-- 🔹 Intermediate Queries
-- Find total sales per customer
select customer_id, sum(total_amount) as total_sale
from orders group by customer_id;

-- Find top 5 customers by spending
select customer_id ,sum(total_amount) as total_spent
from orders
group by customer_id
order by total_spent desc
limit 5;

-- Find most sold products
select product_id, sum(quantity) as total_quantity
from order_items
group by product_id
order by total_quantity desc;

-- Find sales by category
-- Find monthly sales

-- Advanced Queries
-- Find customers who never ordered
-- Find repeat customers
-- Find highest order value
-- Find average order value
-- Rank customers by spending (use RANK)
-- Find top-selling product in each category
-- 🔹 Complex Queries (Interview Level)
-- Find revenue growth month-wise
-- Find customer retention
-- Find orders with more than 3 products
-- Find most profitable category
-- Create a view for sales summary

-- Top customers generate most revenue
-- ✅ 2. Few products contribute to majority sales
-- ✅ 3. Sales increase during certain months
-- ✅ 4. Some customers never place orders
-- ✅ 5. Electronics category gives highest revenue