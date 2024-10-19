CREATE DATABASE dx_pvt;
USE dx_pvt; 

-- Hello world
SELECT * FROM orders;


CREATE TABLE orders (
            order_id INT NOT NULL,
            order_no int NOT NULL,
            quantity INT NOT NULL,
            product_price INT NOT NULL,
            total_cost INT NOT NULL,
            order_date int NOT NULL,
            status varchar(20),
            deal_size varchar(20)
);
ALTER TABLE orders
ADD constraint pk_order_id PRIMARY KEY (order_id);

CREATE TABLE product (
            product_code varchar(20) NOT NULL,
            product_name varchar(20) NOT NULL
);
ALTER TABLE product
ADD constraint pk_product_code PRIMARY KEY (product_code);


CREATE TABLE customer (
            customer_id INT NOT NULL,
            customer_first_name varchar(20) NOT NULL,
            customer_last_name varchar(20) NOT NULL,
            phone_no INT NOT NULL,
            address INT NOT NULL,
            city  varchar(20),
            state varchar(20),
            postal_code INT NOT NULL,
			country varchar(20)
);
ALTER TABLE customer
ADD CONSTRAINT pk_customer_id PRIMARY KEY (customer_id);

ALTER TABLE customer
MODIFY customer_id CHAR(5) NOT NULL;
ALTER TABLE Customer
MODIFY Phone_no BIGINT NOT NULL;
ALTER TABLE customer
MODIFY city VARCHAR(20) NOT NULL;


CREATE TABLE relationships (
            order_id INT NOT NULL,
            product_code varchar(20) NOT NULL,
            customer_id INT NOT NULL
);
ALTER TABLE relationships
MODIFY COLUMN customer_id CHAR(5);

ALTER TABLE relationships
ADD CONSTRAINT pk_order_id PRIMARY KEY (order_id);


-- BUILDING RELATIONSHIP USING FOREIGH KEYS & PRIMARY KEYS

ALTER TABLE relationships
ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders (order_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE relationships
ADD CONSTRAINT fk_product_code FOREIGN KEY (product_code) REFERENCES product (product_code) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE relationships
ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customer (customer_id) ON DELETE CASCADE ON UPDATE CASCADE;

INSERT INTO orders (order_id,order_no,quantity,product_price,total_cost, order_date ,status,deal_size)
VALUES
(1,	101,	2,	200,	400,	'2024-10-01',	"shipped",	"small"),
(2,	102,	2,	250	,	500,	'2024-10-02',	"cancel",	"medium"),
(3,	103,	3,	600,	1800,	'2024-10-03',	"shipped",	"big"),
(4,	103,	3,	600,	1800,	'2024-10-04',	"shipped",	"big"),
(5,	104,	5,	250,    1250,	'2024-10-05',	"shipped",	"big"),
(6,	105,	4,	80,		320,	'2024-10-06',	"shipped",	"medium"),
(7,	106,	2,	100,	200,	'2024-10-07',	"on hold",	"small");

INSERT INTO product (product_code,Product_name)
values 
("PRD_101",	"shirt"),
("PRD_102", "jeans"),
("PRD_103",	"kurta"),
("PRD_104",	"Towser"),
("PRD_105",	"hanky"),
("PRD_106",	"t-shirt");

INSERT INTO customer (customer_id, Customer_first_name, Customer_last_name, Phone_no, City, state, postal_code, country) VALUES
(1, 'jay', 'sahu', 9798653245, 'indore', 'mp', 452020, 'India'),
(2, 'raj', 'panwar', 9844444643, 'bhopal', 'mp', 458520, 'India'),
(3, 'vyom', 'bisani', 9899746464, 'pipariya', 'mp', 461775, 'India'),
(4, 'ram', 'rawat', 9594897687, 'dewas', 'mp', 436521, 'India'),
(5, 'shyam', 'patil', 9798653245, 'ujjain', 'mp', 695262, 'India'),
(6, 'goli', 'sahu', 9798653245, 'indore', 'mp', 452021, 'India');

		
SELECT * FROM orders;
SELECT * FROM product;
SELECT * FROM customer;
SELECT * FROM relationships;
