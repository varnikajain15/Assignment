create table customers (
	cust_Id SERIAL PRIMARY KEY,
   cust_name varchar(255),
   cust_email varchar(255),
   cust_address varchar(255)
);


create table categories (
	categ_Id SERIAL PRIMARY KEY,
	categ_name varchar (255)
);


create table products (
	prod_Id serial primary key,
	prod_name varchar(255),
	categ_Id smallint references categories(categ_Id)
);


insert into customers(cust_name,cust_email,cust_address) values ('ram','ram@abc.com','faridabad'),
('mohan','mohan@abc.com','noida'),
('vanshi','vanshi@abc.com','delhi'),
('madhur','madhur@abc.com','ghaziadabad');
select * from customers;


insert into categories(categ_name) values ('home'), ('fashion'), ('electronics'), ('groceries'), ('beauty');
select * from categories;


insert into products(prod_name,categ_Id) values ('mobile',3), ('lipstick',5), ('table',1), ('shirt',2), ('earphones',3),
('oreo',4), ('mositurizer',5), ('bedsheet',1), ('maggie',4);
select * from products;

create table orders(
	order_Id serial primary key,
	order_date date,
	cust_Id smallint references customers(cust_Id),
	prod_Id smallint references products(prod_Id),

	
);
create table invoice(
	bill_no serial primary key,
	is_paid bool,
	order_id smallint references orders(order_Id),
	price smallint	
)


insert into orders(order_date,cust_Id,prod_Id) values (now(),2,3), (now(),1,4), (now(),2,1) ;
select * from orders;

insert into invoice(is_paid,order_id,price) values (true,2,340), (false,1,500);
select * from invoice;

create or replace view customer_details
as
	select customers.* , orders.order_Id, orders.order_date ,invoice.is_paid , invoice.price
	from customers INNER JOIN orders 
	ON customers.cust_Id = orders.cust_Id 
	INNER JOIN invoice
	ON orders.order_Id = invoice.order_Id;

select * from customer_details;



	