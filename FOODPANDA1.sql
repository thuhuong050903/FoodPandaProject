CREATE DATABASE FOODPANDA2;
USE FOODPANDA2;
CREATE TABLE IF NOT EXISTS DELIVERY_PERSON
(delivery_person_id int not null,
name varchar(50) not null,
phone varchar(30),
vehicle varchar(30),
PRIMARY KEY (delivery_person_id)   );


CREATE TABLE IF NOT EXISTS ADDRESS
(address_id int not null,
street varchar(30),
city varchar(30),
province varchar(30),
PRIMARY KEY (address_id));


CREATE TABLE  IF NOT EXISTS RESTAURANT
(restaurant_id int not null,
restaurant_name varchar(50),
website varchar(200),
phone varchar(30),
address_id int not null,
PRIMARY KEY (restaurant_id),
FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id));

CREATE TABLE IF NOT EXISTS CUSTOMER
(customer_id int not null,
last_name varchar(30),
first_name varchar(30),
email varchar(50),
phone varchar(30),
address_id int not null,
PRIMARY KEY (customer_id),
FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id) );

CREATE TABLE IF NOT EXISTS FOOD_ITEM
(food_item_id int not null,
food_name varchar(50) not null,
unit_price numeric not null,
food_category varchar(50),
restaurant_id int not null,
PRIMARY KEY (food_item_id),
FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id) );

CREATE TABLE IF NOT EXISTS ORDERS
(order_id int not null,
date_of_order datetime NOT NULL,
pick_up BOOL,
restaurant_id int not null,
delivery_person_id int,
customer_id int not null,
PRIMARY KEY (order_id),
FOREIGN KEY(restaurant_id) REFERENCES RESTAURANT (restaurant_id),
FOREIGN KEY(delivery_person_id) REFERENCES DELIVERY_PERSON (delivery_person_id),
FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id));

CREATE TABLE IF NOT EXISTS ORDER_FOOD_ITEM
(order_id int not null,
food_item_id int not null,
quantity int not null,
FOREIGN KEY(order_id) REFERENCES ORDERS(order_id),
FOREIGN KEY(food_item_id) REFERENCES FOOD_ITEM (food_item_id),
PRIMARY KEY (order_id, food_item_id)  );

SHOW TABLES;

ALTER TABLE FOOD_ORDER
RENAME TO ORDERS;



INSERT INTO DELIVERY_PERSON (delivery_person_id,name,phone,vehicle)
VALUES (0,'Thanh Nhan','0947582234','Bicycle');

INSERT INTO DELIVERY_PERSON (delivery_person_id,name,phone,vehicle)
VALUES (1,'Linh','0932307024','Motobike'),
(2,'Tan Phat','0905521874','Bicycle'),
(3,'Van Nhat','0928479391','Motobike') ;


INSERT INTO ADDRESS (address_id, street,city,province)
VALUES (1,'292 Bà Triệu','Hà Nội',NULL),
(2,'26-28 Trần Phú','Nha Trang','Khánh Hòa'),
(3,'132 Lê Duẩn','Đà Nẵng',NULL),
(4,'101B Lê Hữu Trác','Đà Nẵng',NULL),
(5,'99 Tô Hiến Thành','Đà Nẵng',NULL),
(6,'47 Ngõ Phất Lộc','Hà Nội',NULL),
(7,'34 Phan Phù Tiên','Hà Nội',NULL) ;

SELECT*FROM ADDRESS;


INSERT INTO RESTAURANT(restaurant_id,restaurant_name,website,phone,address_id)
VALUES (1,'ABC Bakery','abcbakery.co','0236 7109 864',3),
(2,'Pizza 4Ps','pizza4ps.com','19006043',2),
(3,'KFC','kfcvietnam.com.vn','(028) 38489828',1)  ;


INSERT INTO CUSTOMER (customer_id, first_name,last_name, email, phone, address_id)
VALUES (1,'Anh Minh','Le Tran','minh.le24@student.passerellesnumeriques.','0915570479',4),
(2,'Hanh','Huynh',NULL,'0363739109',4),
(3,'Thu Huong','Phan Thi',NULL,'0814619859',5),
(4,'Van Di','Ho','di.ho24@student.passerellesnumeriques.or','0359215610',6),
(5,'Tai','Ho',NULL,'0362271203',7),
(6,'Huu','Tran',NULL,'0395142866',4) ;


INSERT INTO FOOD_ITEM (food_item_id,food_name,unit_price,food_category,restaurant_id)
VALUES(1,'Blueberry Vani',12000,'Sliced cakes',	1),
	  (2,'Baguette',15000,'Breads',1),
	(3,'Lemon Cream Cake',10000,'Sliced cakes',	1),
	(4,	'Sandwich',14000,'Packaged products',1),
	(5,'Pepsi Can',17000,'DESSERTS - DRINKS',3),
	(6,'Egg Tart (1 Pc)',17000,'DESSERTS - DRINKS',3),
	(7,'KFC Popcorn (R) (1 Pc)',36000,'SNACKS',3),
	(8,'Fish Sticks (3 Pcs)',40000,'SNACKS',3),
	(9,'Fried Chicken (1 Pc)',35000,'FRIED – ROASTED CHICKEN',3),
	(10,'Roasted Chicken Leg Quarter (1 Pc)',67000,'FRIED – ROASTED CHICKEN',3),
	(11,'Shrimp Burger (1 Pc)',41000,'RICE - BURGER - PASTA',3),
	(12,'Burrata with Parma Ham & Mixed Tropical',230000,'Salad',2),
	(13,'Crab Tomato Cream Spaghetti with Ricotta',	248000,'Pizza, Pasta and Main Dishes',2),
	(14,'Salmon Miso Cream',268000,'Pizza, Pasta and Main Dishes',2),
	(15,'House- made Cheese Pizza',280000,'Pizza, Pasta and Main Dishes',2);
    
SELECT*FROM FOOD_ITEM;


ALTER TABLE ORDERS
MODIFY delivery_person_id int;


INSERT INTO ORDERS (order_id ,date_of_order,pick_up,restaurant_id ,delivery_person_id,customer_id)
VALUES (1,'2022/12/11 13:54:00',1,1,NULL,2),
		(2,'2022/08/06 15:30:00',0,1,1,1),
		(3,'2022/03/21 08:10:00',0,3,0,5);
        
SELECT*FROM ORDERS;

INSERT INTO ORDER_FOOD_ITEM 
VALUES (1,1,2),
		(1,3,1),
		(2,2,1),
		(2,4,1),
		(3,5,2),
		(3,7,3),
		(3,9,4);
        
SELECT *FROM ORDER_FOOD_ITEM;

SELECT*FROM CUSTOMER;

SELECT*FROM DELIVERY_PERSON;

SELECT*FROM ADDRESS;