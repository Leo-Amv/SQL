-- 2
SELECT product_name, manufacturer, price
FROM myfirstdb.smartphones
WHERE product_count > 2;

-- 3
SELECT * FROM myfirstdb.smartphones
WHERE manufacturer = 'Samsung';

-- 4.1
SELECT * FROM myfirstdb.smartphones
WHERE product_name LIKE 'IPhone';

-- 4.2
SELECT * FROM myfirstdb.smartphones
WHERE manufacturer LIKE 'Samsung';

-- 4.3
SELECT * FROM myfirstdb.smartphones
WHERE product_name REGEXP '[0-9]';

-- 4.4
SELECT * FROM myfirstdb.smartphones
WHERE product_name REGEXP '[8]';