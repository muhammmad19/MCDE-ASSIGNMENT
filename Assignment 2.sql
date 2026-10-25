	--------- ASSINGMENT 2  ------
	USE bikeStore

	--- 2.1 Products with brand name

	SELECT 
	p.product_id, 
    p.product_name,
    b.brand_name

     FROM
     production.products AS p
      INNER JOIN production.brands AS b
      ON p.brand_id = b.brand_id;


-----  2.2 Stores with zero staff ----
SELECT
    st.store_id,
    st.store_name
FROM sales.stores AS st
LEFT JOIN sales.staffs AS sf
    ON st.store_id = sf.store_id
   AND sf.active = 1          -- "currently assigned"
WHERE sf.staff_id IS NULL;


----- 2.3 -----
SELECT 
p.product_name,
s.quantity
FROM production.products AS p
INNER JOIN production.stocks AS s
    ON p.product_id = s.product_id
WHERE s.store_id = 1
  AND s.quantity < 5;


  ----- 2.4 ----

  SELECT 
  m.staff_id   AS manager_id,
       m.first_name + ' ' + m.last_name AS manager_name,
       e.staff_id   AS employee_id,
       e.first_name + ' ' + e.last_name AS employee_name,
       1 AS employee_count_placeholder
FROM sales.staffs AS e
INNER JOIN sales.staffs AS m
    ON e.manager_id = m.staff_id;


    ----- 2.5 ----

    SELECT o.order_id,
    p.product_name,
    oi.quantity
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi
    ON o.order_id = oi.order_id
INNER JOIN production.products AS p
    ON oi.product_id = p.product_id
WHERE o.order_id = 1;


--- 2.6----


SELECT 

COUNT(*) AS order_count
FROM sales.orders
WHERE order_date >= '2018-01-01' AND order_date < '2019-01-01';  


----or 

SELECT

COUNT(DISTINCT o.order_id)
FROM sales.orders AS o
INNER JOIN sales.order_items AS oi ON o.order_id = oi.order_id;


------ 2.7 -----

SELECT 
p.product_id,
p.product_name,
st.store_id, 
st.store_name
FROM production.products AS p
CROSS JOIN sales.stores AS st;