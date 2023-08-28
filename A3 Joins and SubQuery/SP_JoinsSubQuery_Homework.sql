-- questions 

-- 1. List all customers who live in Texas (use JOINs)
SELECT * FROM customer; --need address id
SELECT * from address; -- district = texas

SELECT first_name, last_name, district
FROM customer
FULL JOIN address
on customer.address_id = address.address_id
WHERE address.district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT * from payment;

SELECT first_name, last_name, amount
FROM customer 
FULL JOIN payment 
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99;


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	WHERE amount >175
);


-- 4. List all customers that live in Nepal (use the city table) ??
select * from country; -- 66 nepal
select * from city; --birgunj 81 countryID
select * from customer; --addressID 
select * from address;
--SELECT city
--FROM city
--WHERE country_id IN(
--	select country_id
--	FROM country
--	WHERE country = 'Nepal'); -- Birgunj
	
SELECT customer.first_name, customer.last_name, city.city, country.country
FROM customer
JOIN address ON customer.address_id  = address.address_id
FULL JOIN city ON address.city_id = city.city_id
FULL JOIN country ON city.country_id = country.country_id
WHERE country.country = 'Nepal';



-- 5. Which staff member had the most transactions?

SELECT first_name, last_name, COUNT(payment_id)
FROM staff
FULL JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY staff.staff_id DESC LIMIT 1;


-- 6. How many movies of each rating are there?
SELECT rating, count(rating)
FROM FILM
GROUP BY rating
ORDER BY COUNT(rating);



-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name, amount
FROM customer
INNER JOIN payment
on customer.customer_id =  payment.customer_id
WHERE amount IN(
    select amount
    from payment
    where amount > 6.99
);


--8 How many free rentals did our stores give away? 

SELECT count(*)
FROM rental 
LEFT JOIN payment
ON rental.rental_id = payment.rental_id
WHERE payment.amount <= 0;



