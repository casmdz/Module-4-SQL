--CAR DEALERSHIP

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone_number VARCHAR(13)
);

CREATE TABLE Salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	phone_number VARCHAR(13),
	address VARCHAR(150),
	rate VARCHAR(40)
);

CREATE TABLE Car (
	car_id SERIAL PRIMARY KEY,
	car_serial_number INTEGER NOT NULL,
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year VARCHAR(20),
	car_cost NUMERIC(9,2),
	customer_id INTEGER,
	salesperson_id INTEGER,
	FOREIGN KEY(customer_id) references customer(customer_id),
	FOREIGN KEY(salesperson_id) references salesperson(salesperson_id)
);

CREATE TABLE Invoice (
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE default CURRENT_DATE,
	customer_id INTEGER,
	salesperson_id INTEGER,
	car_id INTEGER,
	FOREIGN KEY(customer_id) references customer(customer_id),
	FOREIGN KEY(salesperson_id) references salesperson(salesperson_id),
	FOREIGN KEY(car_id) references car(car_id)
);

CREATE TABLE Mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	rate VARCHAR(40)
);

-- 
CREATE TABLE Parts (
	part_id SERIAL PRIMARY KEY,
	part_name VARCHAR(200),
	part_cost NUMERIC(9,2),
	part_serial_number VARCHAR(100)
);


CREATE TABLE ServicedParts(
	serviced_parts_id SERIAL PRIMARY KEY,
	part_id INTEGER,
	quantity INTEGER,
	FOREIGN KEY(part_id) references parts(part_id)
--FOREIGN KEY(service_ticket_id) references ServiceTicket(service_ticket_id)
);


CREATE TABLE ServiceTicket(
	service_ticket_id SERIAL PRIMARY KEY,
	service_date DATE DEFAULT CURRENT_DATE,
	service_provided VARCHAR(400),
	customer_id INTEGER,
	mechanic_id INTEGER,
	serviced_parts_id INTEGER,
	total_cost NUMERIC (9,2),
	FOREIGN KEY(customer_id) references customer(customer_id),
	FOREIGN KEY(mechanic_id) references mechanic(mechanic_id),
	FOREIGN KEY(serviced_parts_id) references ServicedParts(serviced_parts_id)
);




















