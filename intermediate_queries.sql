-- JOIN THE NECESSARY TABLES TO FIND TOTAL QUANTITY OF EACH PIZZA CATEGORY ORDERED--
select pizza_types.category ,
sum(order_details.quantity) as quantity 
from pizza_types 
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category
order by quantity desc;

-- DETERMINE DISTRIBUTION OF ORDERS BY HOUR OF THE DAY--
select hour(order_time) as hour , count(order_id) as order_count
from orders 
group by hour (order_time);

-- JOIN RELEVANT TABLES TO FIND THE CATEGORY WISE DISTRIBUTION OF PIZZA
select category , count(name) from pizza_types
group by category;

-- GROUP ORDERS BY DATE AND CALCULATE AVG NO OF PIZZAS ORDERED PER DAY
SELECT 
    ROUND(AVG(quantity), 0) as avg_pizza_ordered_per_day
FROM
    (SELECT 
        orders.order_date, SUM(order_details.quantity) AS quantity
    FROM
        orders
    JOIN order_details ON orders.order_id = order_details.order_id
    GROUP BY orders.order_date) AS order_quantity;

-- DETERMINE TOP 3 MOST ORDERED PIZZA TYPES BASED ON REVENUE 
select pizza_types.name,
sum(order_details.quantity*pizzas.price) as revenue
from pizza_types join pizzas 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name
order by revenue desc limit 3;
