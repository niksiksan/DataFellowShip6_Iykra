

-- NO.1 
select COUNT(*)
from film
where description like '%stronaut%'

-- No.2 
select COUNT(*)
from film
where (rating = 'R') and (replacement_cost between 5 and 15)

-- No. 3
select COUNT(*) FILTER (WHERE staff_id = 1) as Staff1, COUNT(*)FILTER (where staff_id = 2) as Staff2,
SUM(amount) FILTER(where staff_id = 1) as Amount_Processed_Staff1, SUM(amount) FILTER(where staff_id = 2) as Amount_Processed_Staff2
from payment

-- No. 3 Alternative Query
select staff_id, COUNT(payment) as payments_handle , SUM(amount) as total_of_amount_processed
from payment
group by staff_id

-- No. 4
select rating, AVG(replacement_cost) as avg_replacement_cost
from film 
group by rating

-- No. 5
select CONCAT(c.first_name, ' ',c.last_name) as Name, c.email, sum(p.amount) as Total_Amount 
from customer c 
join payment p on p.customer_id = c.customer_id
group by c.customer_id
order by Total_Amount DESC
limit 5

-- No. 6
select store_id, film_id, COUNT(*) as Total
from inventory
group by store_id, film_id
order by store_id asc

-- No. 7
select CONCAT(c.first_name, '',c.last_name) as Name, c.email, COUNT(p.customer_id) as Total
from customer c 
join payment p on p.customer_id = c.customer_id
group by c.customer_id
having COUNT(p.customer_id) >= 40

