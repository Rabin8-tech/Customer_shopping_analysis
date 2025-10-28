SELECT DATABASE();
select * from customer limit 10;

-- Q1. What is total revenue generate by male vs Female?
select gender,SUM(purchase_amount) as revenue
from customer
group by gender;

-- Q2. Which cusotmer used a discount but still spent mre than average purchase?
select customer_id, purchase_amount 
from customer
where discount_applied='Yes' 
         and purchase_amount>=(select avg(purchase_amount) from customer);
  
  -- Q3. Which are the top 5 products with the highest average review rating?
select item_purchased,avg(review_rating) as "Average Product Rating"
from customer
group by item_purchased
order by avg(review_rating) desc
limit 5;

-- Q4. Compare the average Purchase Amounts betweeen Standard and Express Delivery.
select shipping_type,
avg(purchase_amount) from customer
where shipping_type in ('Standard','Express')
group by shipping_type;

-- Q5. Do subscibed customer spend more? Compare average total spend and total revenue
        -- between subscribers and non_subscribers.
select subscription_status,
count(customer_id) as total_customer,
round(avg(purchase_amount),2) as avg_spend,
round(sum(purchase_amount),2) as total_revenue
from customer
group by subscription_status
order by total_revenue, avg_spend desc;


-- Q6 Which 5 products have the highest percentage of purchase with discounts applied?

select item_purchased,
round(sum(case when discount_applied='Yes' then 1 else 0 END)/count(*) * 100,2) as discount_rate
from customer
group by item_purchased
order by discount_rate desc
limit 5;


-- Q7 segment customer into NEw, Returning and loyal based on their
     -- total number of previous purchases , adn show the count of each segment
     
with customer_type as (
  select customer_id, previous_purchases,
  CASE
	when previous_purchases=1 then 'New'
    when previous_purchases between 2 and 10 then 'Returning'
    else 'Loyal'
    end as customer_segment
  from customer
)
select customer_segment, count(*) as "Number of Customers"
from customer_type
group by customer_segment;

-- Q8 what are top 3 most purchased products within each category?

with item_counts as (
	select category, item_purchased,
    count(customer_id) as total_orders,
    row_number() over(partition by category order by count(customer_id) DESC) as item_rank
    from customer
    group by category, item_purchased
    )
select item_rank,category,item_purchased,total_orders
from item_counts
where item_rank<=3;


-- Q9 Customers who are repeat buyers do they tend to subscribe(having more than 5 purchase)

select subscription_status,
count(customer_id) as repeat_buyers
from customer
where previous_purchases>5
group by subscription_status;


-- Q10. what is the revenue contribution of each age group?

select age_group,
sum(purchase_amount) as total_revenue
from customer
group by age_group
order by total_revenue;

select * from customer;
drop table customer;