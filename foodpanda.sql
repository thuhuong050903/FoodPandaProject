

CREATE DATABASE IF NOT EXISTS FOODPANDA;
USE FOODPANDA;
CREATE TABLE IF NOT EXISTS DELIVERY_PERSON
(delivery_person_id numeric not null,
name varchar(50) not null,
phone varchar(30),
vehicle varchar(30),
PRIMARY KEY (delivery_person_id)   );

CREATE TABLE IF NOT EXISTS ADDRESS
(address_id numeric not null,
street varchar(30),
city varchar(30),
province varchar(30),
PRIMARY KEY (address_id)  );

CREATE TABLE  IF NOT EXISTS RESTAURANT
(restaurant_id numeric not null,
restaurant_name varchar(50),
website varchar(200),
phone varchar(30),
address_id numeric not null,
PRIMARY KEY (restaurant_id),
FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id)  );

CREATE TABLE IF NOT EXISTS CUSTOMER
(customer_id numeric not null,
last_name varchar(30),
first_name varchar(30),
email varchar(50),
phone varchar(30),
address_id numeric not null,
PRIMARY KEY (customer_id),
FOREIGN KEY (address_id) REFERENCES ADDRESS(address_id) );

CREATE TABLE IF NOT EXISTS FOOD_ITEM
(food_item_id numeric not null,
food_name varchar(50) not null,
unit_price numeric not null,
food_category varchar(50),
restaurant_id numeric not null,
PRIMARY KEY (food_item_id),
FOREIGN KEY (restaurant_id) REFERENCES RESTAURANT(restaurant_id) );

CREATE TABLE IF NOT EXISTS FOOD_ORDER
(order_id numeric not null,
date_of_order datetime NOT NULL,
pick_up BOOL,
restaurant_id numeric not null,
delivery_person_id numeric not null,
customer_id numeric not null,
PRIMARY KEY (order_id),
FOREIGN KEY(restaurant_id) REFERENCES RESTAURANT (restaurant_id),
FOREIGN KEY(delivery_person_id) REFERENCES DELIVERY_PERSON (delivery_person_id),
FOREIGN KEY(customer_id) REFERENCES CUSTOMER(customer_id));

CREATE TABLE IF NOT EXISTS ORDER_FOOD_ITEM
(order_id numeric not null,
food_item_id numeric not null,
quantity numeric not null,
FOREIGN KEY(order_id) REFERENCES FOOD_ORDER(order_id),
FOREIGN KEY(food_item_id) REFERENCES FOOD_ITEM(food_item_id),
PRIMARY KEY (order_id, food_item_id)  );
SHOW TABLES;
DESC ORDERS;


