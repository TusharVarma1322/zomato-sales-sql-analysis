-- 1. Top 3 Customers by Number of Orders
SELECT
  c.customer_id,
  c.customer_name,
  COUNT(*) AS order_count
FROM zomatodb.order_detail od
JOIN zomatodb.customer c USING (customer_id)
GROUP BY c.customer_id, c.customer_name
ORDER BY order_count DESC
LIMIT 3;

-- 2. Restaurant with the Highest Average Rating
SELECT
  restaurant_id,
  restaurant_name,
  rrating
FROM zomatodb.restaurant
ORDER BY rrating DESC
LIMIT 1;

-- 3. All Orders Delivered in Under 30 Minutes
SELECT *
FROM zomatodb.order_detail
WHERE TIMESTAMPDIFF(MINUTE, order_time, delivered_time) < 30;


-- 4. Total Revenue per Food Item
SELECT
  ofd.food_id,
  f.food_name,
  SUM(f.price_per_unit * ofd.quantity) AS total_revenue
FROM zomatodb.order_food AS ofd
JOIN zomatodb.foods     AS f   ON ofd.food_id = f.food_id
GROUP BY ofd.food_id, f.food_name
ORDER BY total_revenue DESC;

 -- 5. Second Highest Revenue-Generating Restaurant
SELECT
  t.restaurant_id,
  t.restaurant_name,
  t.total_rev
FROM (
  SELECT
    r.restaurant_id,
    r.restaurant_name,
    SUM(f.price_per_unit * ofd.quantity) AS total_rev
  FROM zomatodb.order_food  AS ofd
  JOIN zomatodb.foods       AS f   ON ofd.food_id       = f.food_id
  JOIN zomatodb.restaurant  AS r   ON ofd.restaurant_id = r.restaurant_id
  GROUP BY r.restaurant_id, r.restaurant_name
  ORDER BY total_rev DESC
) AS t
LIMIT 1 OFFSET 1;

-- 6. Top 5 Most Popular Food Items (by Quantity Sold)
SELECT
  f.food_id,
  f.food_name,
  SUM(ofd.quantity) AS total_qty
FROM zomatodb.order_food ofd
JOIN zomatodb.foods f USING (food_id)
GROUP BY f.food_id, f.food_name
ORDER BY total_qty DESC
LIMIT 5;

-- 7. Top 3 Employees with Highest Average Delivery Ratings
SELECT
  employee_id,
  employee_name,
  employee_avg_rating
FROM zomatodb.zomato_employee
ORDER BY employee_avg_rating DESC
LIMIT 3;

-- 8. Month with the Highest Number of Orders Placed
SELECT
  MONTH(order_time) AS order_month,
  COUNT(*) AS order_count
FROM zomatodb.order_detail
GROUP BY order_month
ORDER BY order_count DESC
LIMIT 1;

-- 9. Average Order Amount per Customer
SELECT
  t.customer_id,
  c.customer_name,
  ROUND(AVG(t.order_total), 2) AS avg_order_amount
FROM (
  SELECT
    ofd.order_id,
    od.customer_id,
    SUM(ofd.quantity * f.price_per_unit) AS order_total
  FROM zomatodb.order_food AS ofd
  JOIN zomatodb.foods AS f ON ofd.food_id = f.food_id
  JOIN zomatodb.order_detail AS od ON ofd.order_id = od.order_id
  GROUP BY ofd.order_id, od.customer_id
) AS t
JOIN zomatodb.customer AS c ON t.customer_id = c.customer_id
GROUP BY t.customer_id, c.customer_name
ORDER BY avg_order_amount DESC;





-- 10. Most Frequent Customer for Each Restaurant
WITH freq AS (
  SELECT
    restaurant_id,
    customer_id,
    COUNT(*) AS cnt,
    RANK() OVER (
      PARTITION BY restaurant_id
      ORDER BY COUNT(*) DESC
    ) AS rk
  FROM zomatodb.order_detail
  GROUP BY restaurant_id, customer_id
)
SELECT
  restaurant_id,
  customer_id,
  cnt AS orders
FROM freq
WHERE rk = 1;

-- 11. Total Number of Orders Placed on Weekends
SELECT
  COUNT(*) AS weekend_orders
FROM zomatodb.order_detail
WHERE DAYOFWEEK(order_time) IN (1, 7);

-- 12. Average Delivery Time: Weekdays vs. Weekends
SELECT
  CASE
    WHEN DAYOFWEEK(order_time) IN (1, 7) THEN 'Weekend'
    ELSE 'Weekday'
  END AS day_type,
  AVG(TIMESTAMPDIFF(MINUTE, order_time, delivered_time)) AS avg_delivery_mins
FROM zomatodb.order_detail
GROUP BY day_type;




-- 13. Top 5 Most Expensive Food Items (include ties using DENSE_RANK)
SELECT
  food_id,
  food_name,
  price_per_unit
FROM (
  SELECT
    food_id,
    food_name,
    price_per_unit,
    DENSE_RANK() OVER (ORDER BY price_per_unit DESC) AS rnk
  FROM zomatodb.foods
) AS ranked_foods
WHERE rnk <= 5
ORDER BY price_per_unit DESC;

-- 14. Restaurant with the Most Diverse Menu
SELECT
  r.restaurant_id,
  r.restaurant_name,
  COUNT(DISTINCT ofd.food_id) AS menu_item_count
FROM zomatodb.order_food ofd
JOIN zomatodb.restaurant r USING (restaurant_id)
GROUP BY r.restaurant_id, r.restaurant_name
ORDER BY menu_item_count DESC
LIMIT 1;

-- 15. Total Payment Amount per Payment Type
SELECT
  pt.payment_type,
  SUM(f.price_per_unit * ofd.quantity) AS total_amount
FROM zomatodb.payment_table pt
JOIN zomatodb.order_food ofd USING (order_id)
JOIN zomatodb.foods f USING (food_id)
GROUP BY pt.payment_type;