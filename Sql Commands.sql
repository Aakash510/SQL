
USE dx_pvt;

USE dx_pvt; 

SELECT * FROM orders;
SELECT DISTINCT status FROM orders;
SELECT DISTINCT total_cost FROM orders;
SELECT order_no,total_cost FROM orders;
SELECT * FROM orders 
WHERE order_id IN (2,3);
SELECT quantity,order_no,status FROM orders 
WHERE total_cost > 800
LIMIT 4;

ALTER TABLE orders
ADD COLUMN size_code INT NOT NULL;
SELECT * FROM orders;

ALTER TABLE orders
DROP COLUMN size_code;
SELECT * FROM orders;

ALTER TABLE orders
CHANGE COLUMN quantity qyt INT;
ALTER TABLE orders              -- DB2  
RENAME COLUMN qyt TO quantity;     
SELECT * FROM orders;

ALTER TABLE orders              -- DB2  
MODIFY COLUMN status char(15) NOT NULL;     
SELECT * FROM orders;

DELETE FROM orders
WHERE order_id = 7; 
SELECT * FROM orders;

INSERT INTO orders (order_id,order_no,quantity,product_price,total_cost, order_date ,status,deal_size)
VALUES 