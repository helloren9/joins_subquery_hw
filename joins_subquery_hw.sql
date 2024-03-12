select first_name, last_name
from customer
join address on customer.address_id = address.address_id 
where address.district = 'Texas';

select first_name, last_name
from customer
join payment on customer.customer_id = payment.customer_id 
where payment.amount > 6.99;

select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id
	having sum(amount) > 175
);

select customer.first_name, customer.last_name, country
from customer
full join address
on customer.address_id = address.address_id
full join city
on address.city_id = city.city_id
full join country
on city.country_id = country.country_id
where country = 'Nepal';

select staff.staff_id, staff.first_name, staff.last_name, count(*) as transactions
from payment
join staff on payment.staff_id = staff.staff_id 
group by staff.staff_id, staff.first_name, staff.last_name 
order by transactions desc 
limit 2;

select rating, count (*) as num_movies
from film
group by rating;

select customer_id, first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment
	group by customer_id 
	having count(*) = 1 and sum(amount) > 6.99
);

select count(*) as free_rentals
from payment
where amount = 0.00;