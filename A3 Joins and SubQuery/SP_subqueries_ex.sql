-- disable auto lowercase: preferences > editors > sql editor > code editor > convert keyword case

-- inner join on the actor and film actor table
select actor.actor_id, first_name, last_name, film_id
FROM film_actor 
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;


--  MULTIJOINS
--
--- join thatll produce info abt a customer from the countru of angola 
-- using a full join will take several steps 

SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id 
--first we link it to ID > addressID > full cjoin city on address city ID
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
--one more step 2 get 2 the country
ON city.country_id = country.country_id
WHERE country = 'Angola';
--Claude and Martin




-- SUBQUERIES


-- Two queries split apart

-- find customer ID that has an amt greater than 175 in total payments
select * from customer;

SELECT customer_id
FROM payment
GROUP BY customer_id 
HAVING sum(amount)> 175
ORDER BY sum(amount) desc; --dont get the same results

SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id in(
	select customer_id
	from payment
	group by customer_id
	having sum(amount) >175
	order by sum(amount) desc
)
group by store_id, first_name, last_name;


SELECT *
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
); -- 1 mary 341 peter


-- basic subquery where all films are in english 
select * from language;

SELECT * 
FROM film
where language_id IN(
select language_id
from "language" 
where name = 'English'
);
