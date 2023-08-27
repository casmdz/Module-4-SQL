-- primary keys cant be empty or duplicated

create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

create table brand (
	seller_id SERIAL primary key,
	brand_name VARCHAR(150),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);
-- remember FK and PK need to be created in certain orders, fk need to exist before calling it

--Inventory

create table inventory (
	upc SERIAL primary key,
	product_amount INTEGER
);

create table order_ (
	order_id SERIAL primary key,
	order_date DATE default CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	upc INTEGER not null,
	foreign key(upc) references inventory(upc)
);


create table product (
	item_id SERIAL primary key,
	amount NUMERIC(5,2),
	prod_name VARCHAR(100),
	seller_id INTEGER not null,
	upc INTEGER not null,
	foreign key(seller_id) references brand(seller_id),
	foreign key(upc) references inventory(upc)
);

create table cart (
	cart_id SERIAL primary key,
	customer_id INTEGER not NULL,
	order_id INTEGER not null,
	foreign key(customer_id) references customer(customer_id),
	foreign key(order_id) references order_(order_id)
);






