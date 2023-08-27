-- ERD and Database movie theater database creation

-- first customer, then movies, none of those have any FK
-- then tickets, finally concessions


create table customer(
	customer_id SERIAL primary key,
	first_name VARCHAR(50),
	last_name VARCHAR(100),
	credit_card NUMERIC(19,0)
);

create table movie (
    movie_id SERIAL primary key,
    movie_title VARCHAR(100), 
    rating VARCHAR(25)
);

create table ticket(
	ticket_id SERIAL primary key,
	ticket_date DATE default CURRENT_DATE,
	movie_id INTEGER not null,
	customer_id INTEGER not null,
	foreign key(movie_id) references movie(movie_id),
	foreign key(customer_id) references customer(customer_id)
);

create table concessions(
	concession_id SERIAL primary key,
	item_name VARCHAR(100),
	item_cost NUMERIC(10,2),
	customer_id INTEGER not null,
	foreign key(customer_id) references customer(customer_id)
);



-- INSERT DATA 

insert into customer(customer_id,first_name,last_name,credit_card)
values(1,'Cas','Mendez','1234567890123456');

insert into customer(customer_id,first_name,last_name,credit_card)
values(2,'Homer','Simpson', NULL);


insert into movie (movie_id,movie_title,rating)
values(1,'Everything Everywhere All at Once','R');

insert into movie(movie_id,movie_title,rating)
values(2,'Barbie','PG-13');

-- no need 2 write ticket date 
insert into ticket (ticket_id,movie_id,customer_id)
values (17,1,1);

insert into ticket(ticket_id,movie_id,customer_id)
values(21,2,2);


insert into concessions(concession_id,item_name,item_cost, customer_id)
values(1,'Bucket of Popcorn',10.00,1);

insert into concessions(concession_id,item_name,item_cost,customer_id)
values(2,'Super Slushy',6.00,2);




-- ALTER, UPDATE/SET, DELETE/WHERE, ADD(used with an ALTER statment), DROP

alter table movie
add summary VARCHAR(240);


update movie
set summary = 'Barbie suffers a crisis that leads her to question her world and her existence.'
where movie_id = 1;




