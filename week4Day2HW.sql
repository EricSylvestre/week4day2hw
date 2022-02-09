
--1. List all customers who live in Texas (use JOINs)
select address.address_id , first_name , last_name , district 
from address 
join customer on customer.address_id = address.address_id 
where district 
like 'Texas%'



--2. Get all payments above $6.99 with the Customer's Full Name
select customer.customer_id , first_name , last_name , amount 
from customer 
join payment on payment.customer_id = customer.customer_id 
where amount > 6.99



--3. Show all customers names who have made payments over $175(use subqueries) <--  There is none over $175?
select customer.customer_id , first_name , last_name , amount
from customer 
join payment on payment.customer_id = customer.customer_id 
where amount =
	(select amount
	from payment 
	where amount > 175 )
	


--4. List all customers that live in Nepal (use the city table)
select city.country_id, first_name, last_name
from city 
join customer on customer.address_id = city.country_id
where country_id = '66'



--5. Which staff member had the most transactions?
select payment.staff_id, first_name , last_name, count(payment_id)
from payment 
join staff on payment.staff_id = staff.staff_id 
group by payment.staff_id, first_name , last_name




--6. How many movies of each rating are there?
select rating , count(film_id)
from film 
group by rating



-- NOT DONE 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer.customer_id , first_name, last_name, amount 
from customer
join payment on payment.customer_id = customer.customer_id
where amount =
	(select distinct customer_id  
	from payment
	where amount > 6.99)
	



--8.How many free rentals did our stores give away?
select count(payment.amount)
from payment 
where payment.amount = '0.00'





