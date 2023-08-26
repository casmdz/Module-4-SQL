--were going to write questions for our database

-- 1) Select all records from actor table

SELECT * from actor;

-- 2) first_name and last_name
SELECT first_name, last_name
from actor;

-- first name that equals Nick using the WHERE clause 
--

SELECT first_name, last_name
from actor
WHERE first_name = 'Nick';


-- firstname data starts with a J using LIKE and Where clauses and a wildcard
select first_name, actor_id
from actor
where first_name like 'J%';

-- all first name data starting with K and has 2 letters after the K, using LIKE and WHERE clauses and the underscore
select first_name, actor_id
from actor
where first_name like 'K__';

-- all first name data that starts with K and ends with 'th'
-- use LIKE and WHERE clauses using both the wildcard and the underscore
select first_name, last_name, actor_id
from actor
where first_name like 'K%__th';


-- COMPARING OPERATORS
-- < > >= <= <>

-- explore data with select all qu to change into a new table
select * from payment;

-- q shows customers who pay amt GREATER than $2
select customer_id, amount
from payment
where amount > 2.00;

-- customers who paid less than 7.99
select customer_id, amount
from payment
where amount < 7.99;

-- less than or equal to  7.99
select customer_id, amount
from payment
where amount <= 7.99;

-- greater than or equal to 2
select customer_id, amount
from payment
where amount >= 2.00;

-- shows customers paying amt not equ to 0 in descending order
select customer_id, amount
from payment
where amount <>	0.00
order by amount desc;


-- AGGREGATE FUNCTIONS 
-- Sum avg count min max

-- display sum of amts paid greater than 5.99
select sum(amount)
from payment
where amount > 5.99;

-- avg of amts paid greater than 5.99
select avg(amount)
from payment
where amount > 5.99;

-- count of amts greater than 5.99
select count(amount)
from payment
where amount > 5.99;

--count of DISTINCT amt paid 
select count(distinct amount)
from payment
where amount > 5.99;

-- min amt greater than 7.99
select min(amount) as min_num_payments
from payment 
where amount > 7.99;

-- max amt greater than 7.99
select max(amount) as mmax_num_payments
from payment 
where amount > 7.99;

-- demo of groupby 
select amount
from payment;
--where amount = 7.99;


-- query to display differnt amounts grouped together
-- and count the amounts

select amount, count(amount)
from payment
group by amount 
order by amount;

-- display customer ids w the summed amts for each customer id
select customer_id, sum(amount)
from payment
group by amount, customer_id 
order by customer_id desc;














