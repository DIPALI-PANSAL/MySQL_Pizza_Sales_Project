-- RETRIEVE TOTAL NO OF ORDERS PLACED -- 
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- CALCULATE TOTAL REVENUE GENERATED FROM PIZZA SALES--
SELECT 
ROUND(SUM(order_details.quantity * pizzas.price),2) AS total_sales
FROM order_details 
JOIN pizzas
ON pizzas.pizza_id = order_details.pizza_id;

-- IDENTIFY THE HIGHEST PRICED PIZZA
SELECT pizza_types.name , pizzas.price
FROM pizza_types
JOIN pizzas 
ON pizza_types.pizza_type_id = pizzas.pizza_type_id 
ORDER BY pizzas.price DESC LIMIT 1;

-- IDENTIFY MOST COMMON PIZZA SIZE ORDER
SELECT 
    pizzas.size, COUNT(order_details.order_details_id) AS order_count
FROM
    pizzas
        JOIN
    order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY order_count DESC;

-- LIST TOP 5 MOST ORDERED PIZZA TYPES ALONG WITH QUANTITIES
SELECT 
    pizza_types.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_types
        JOIN
    pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quantity DESC LIMIT 5;