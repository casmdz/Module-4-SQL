create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(200),
	address VARCHAR(150),
	city VARCHAR(150),
	customer_state VARCHAR(150),
	zipcode VARCHAR(50)
);


-- order table 
create table order_ (
	order_id SERIAL primary key,
	order_date DATE default current_date,
	amount numeric(5,2),
	customer_id INTEGER,
	foreign key(customer_id) references customer(customer_id)
);

insert into customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
values(1,'George','Wash','gwash@usa.gov','3200 Mt Vernon Hwy','Mt Vernon', 'VA','22121');

insert into customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
values(2,'John','Adams','jadams@usa.gov','1200 Hancock Lane','Quincy', 'MA','01234');

insert into customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
values(3,'thomas','jeff','tjeff@usa.gov','888 TJ Pkway','Charlotte', 'VA','43567');

insert into customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
values(4,'James','Monroe','jmon@usa.gov','1234 Conway','Orange', 'VA','99923');

insert into customer(customer_id,first_name,last_name,email,address,city,customer_state,zipcode)
values(5,'James','Madison','jmadison@usa.gov','2050 Twisted Towers','Fortnite', 'PA','77777');



insert into order_(order_id,amount,customer_id)
VALUES(1,234.56,1);

insert into order_(order_id,amount,customer_id)
VALUES(2,78.98,3);

insert into order_(order_id,amount,customer_id)
VALUES(3,19.99,2);

insert into order_(order_id,amount,customer_id)
VALUES(4,100.00,3);

insert into order_(order_id,amount,customer_id)
VALUES(5,55.55,NULL);


select * from order_;

-- SQL JOINS 

-- customer == table a
-- order_ == table b



-- INNER JOIN mutual
select first_name, last_name, order_date, amount
from customer --right now customer doesnt have orderdate or amount!
inner join order_
on customer.customer_id = order_.customer_id;	 -- a common (fk) dataset


--left join
select first_name, last_name, order_date, amount
from customer
left join order_
on customer.customer_id = order_.customer_id;
--where order_date is not null
-- why do we have 2 thomas jefs 

--right 
select first_name, last_name, order_date, amount
from customer
right join order_
on customer.customer_id = order_.customer_id;
-- null null date 55.55 mystery president ^

-- full
select first_name, last_name, order_date, amount
from customer
full join order_
on customer.customer_id = order_.customer_id;
--brings back data with all the null values too 







