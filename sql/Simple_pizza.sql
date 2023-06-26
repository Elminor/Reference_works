DROP TABLE IF EXISTS pizza CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS courier CASCADE;
DROP TABLE IF EXISTS customer CASCADE;

CREATE TABLE courier (
    id SERIAL2 PRIMARY KEY,
    name VARCHAR(30),
    phone_number INT2
);

CREATE TABLE pizza (
    id SERIAL2 PRIMARY KEY,
    name VARCHAR(30),
    price INT2
);

CREATE TABLE customer (
    id SERIAL2 PRIMARY KEY,
    name VARCHAR(30),
    address VARCHAR(30)
);

CREATE TABLE orders (
    id SERIAL2 PRIMARY KEY,
    courier_id INT2,
    pizza_id INT2,
    customer_id INT2,
    qty INT2
);

ALTER TABLE orders 
ADD CONSTRAINT FK_orders_pizza FOREIGN KEY (pizza_id) REFERENCES pizza(id);

ALTER TABLE orders 
ADD CONSTRAINT FK_orders_courier FOREIGN KEY (courier_id) REFERENCES courier(id);

ALTER TABLE orders 
ADD CONSTRAINT FK_orders_customer FOREIGN KEY (customer_id) REFERENCES customer(id);

INSERT INTO pizza (name, price) VALUES ('Hawaii', 3000), ('Songoku', 2500), ('Pacalos', 10000);
INSERT INTO  courier (name, phone_number) VALUES ('Sanyi', 12), ('Vin Dízel', 37), ('Dzsézön Sztetem', 69);
INSERT INTO  customer (name, address) VALUES ('Bobi', 'Szeged'), ('Robi', 'Szegvár'), ('Dobi', 'Egerszeg');
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (3, 2, 2, 3);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (1, 2, 1, 4);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (1, 1, 3, 6);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (2, 1, 1, 2);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (3, 2, 3, 1);
INSERT INTO orders (courier_id, customer_id, pizza_id, qty) VALUES (2, 3, 3, 1);

ALTER TABLE orders
ADD date DATE DEFAULT now();


SELECT * FROM pizza;
SELECT * FROM orders;
SELECT * FROM customer;
SELECT * FROM courier;

SELECT * FROM pizza WHERE price <= 3000;











