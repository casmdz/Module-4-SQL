--add values 2 pieces of data or more 
-- at least 2 stored functions
   
INSERT INTO Customer (first_name,last_name,phone_number)
VALUES ('Cas', 'Mendez','773202LUNA'),('Homer','Simpson','555-123-4567'),('John','Smith','888-987-6543');

INSERT INTO salesperson (first_name,last_name,phone_number, address, rate)
VALUES 
('Michael','Scott','773-222-2020', '123 Main St', 'Full Time'),
('Marge', 'Simpson', '555-444-333', '1432 W Springfield Rd', 'Part Time'),
('Obiwan','Kenobi', '800-111-6666', '66B Stewjon Blvd', 'Part Time');


INSERT INTO Car(car_serial_number,car_make,car_model,car_year,car_cost,customer_id,salesperson_id)
VALUES
(123456789,'Toyota','Corolla','2020',20000,2,1);
INSERT INTO Car(car_serial_number,car_make,car_model,car_year,car_cost,customer_id,salesperson_id)
VALUES
(634823172,'Subaru','Outback','2022','28000',1,3);


INSERT INTO Mechanic(first_name, last_name, rate)
VALUES 
('Noelle','Holiday','Part Time'),
('Han','Solo','Full Time');


INSERT INTO Parts(part_name, part_cost,part_serial_number)
VALUES
('Carburetor',10.00,'BP123CD456'),
('Fuel Injector', 21.99, 'SP789IJ012'),
('Spark Plugs',15.00,'AF012KL345');


--be the same as Car
INSERT INTO 
Invoice(customer_id,salesperson_id, car_id)
VALUES (1,3,2);
INSERT INTO Invoice(customer_id,salesperson_id, car_id)
VALUES(2,1,1);


INSERT INTO ServicedParts(part_id,quantity)
VALUES (3,5),(1,4);


INSERT INTO ServiceTicket(service_provided,customer_id,mechanic_id,serviced_parts_id,total_cost)
VALUES
('The spark plugs of this car were definitely sparking... which is not good probably. I replaced 3 of them. -Noe',1,1,1,45.00),
--Cas,Noelle,SP
('The Carburetors were busted. Replaced with 4 top shelf brand. Your Welcome.',2,2,2,40.00);


SELECT car_id, car_make,service_ticket_id, service_provided, customer.first_name as customer, mechanic.first_name as mechanic
FROM Car
INNER JOIN ServiceTicket 
ON car.car_id = car.car_id
LEFT JOIN Customer 
ON car.customer_id = customer.customer_id
RIGHT JOIN mechanic ON mechanic.mechanic_id = serviceticket.service_ticket_id;


---------------------------

select * from car;

CREATE OR REPLACE PROCEDURE addStudentDiscount(
	--car_cost 
	x_car_id INTEGER,
	x_studentDiscountAmount DECIMAL
) 
language plpgsql
as $$
begin 
	update Car
	set car_cost = car_cost - x_studentDiscountAmount
	where car_id = x_car_id;
	commit;
end;
$$
-- 1 Toyota=20000;
call addStudentDiscount(1, 2000.00);

select * from car;
--DROP PROCEDURE addStudentDiscount;



CREATE OR REPLACE FUNCTION add_customer(_first_name VARCHAR, _last_name VARCHAR, _phone_number VARCHAR)
returns void
as $MAIN$
begin
	INSERT INTO customer(first_name,last_name, phone_number)
	VALUES(_first_name,_last_name, _phone_number);
end;
$MAIN$
language plpgsql;

SELECT add_customer('Padme','Amidala','434-232-1098');
SELECT add_customer('Bilbo', 'Baggins','300-888-2222');

select * from customer;
drop function add_customer;


CREATE OR REPLACE FUNCTION add_part(_part_name VARCHAR, _part_cost NUMERIC, _part_serial_number VARCHAR)
returns void
as $MAIN$
begin
	INSERT INTO Parts(part_name,part_cost, part_serial_number)
	VALUES(_part_name,_part_cost, _part_serial_number);
end;
$MAIN$
language plpgsql;

SELECT add_part('Catalytic Converter',178.99,'C206-A050');
select * from Parts;


