CREATE TABLE orders (
id SERIAL PRIMARY KEY,
customer_id INT,
status VARCHAR(20),
amount DECIMAL(10,2)
);

INSERT INTO orders (customer_id, status, amount)
SELECT
(random()*1000)::int,
CASE
WHEN random() < 0.5 THEN 'completed'
ELSE 'pending'
END,
random()*1000
FROM generate_series(1,100000);

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 100
AND status = 'completed';

CREATE INDEX idx_wrong
ON orders(status, customer_id);

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 100
AND status = 'completed';

DROP INDEX idx_wrong;

CREATE INDEX idx_correct
ON orders(customer_id, status);

EXPLAIN ANALYZE
SELECT *
FROM orders
WHERE customer_id = 100
AND status = 'completed';
