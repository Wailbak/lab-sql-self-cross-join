USE sakila;


-- Retrieving all pairs of actors that worked together.
SELECT 
    a1.actor_id AS actor_id_1,
    a1.first_name AS actor_first_name_1,
    a1.last_name AS actor_last_name_1,
    a2.actor_id AS actor_id_2,
    a2.first_name AS actor_first_name_2,
    a2.last_name AS actor_last_name_2,
    f.title AS film_name
FROM
    film_actor fa1
INNER JOIN film_actor fa2 ON fa1.film_id = fa2.film_id AND fa1.actor_id < fa2.actor_id
INNER JOIN actor a1 ON fa1.actor_id = a1.actor_id
INNER JOIN actor a2 ON fa2.actor_id = a2.actor_id
INNER JOIN film f ON fa1.film_id = f.film_id
ORDER BY 
    fa1.actor_id, fa2.actor_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieving all pairs of customers who were renting the same film more than 3 times.
SELECT 
    r1.customer_id AS customer_id_1, 
    r2.customer_id AS customer_id_2, 
    i.film_id, 
    COUNT(*) AS times_rented_together
FROM 
    rental r1
INNER JOIN 
    inventory i ON r1.inventory_id = i.inventory_id
INNER JOIN 
    rental r2 ON r1.inventory_id = r2.inventory_id AND r1.customer_id < r2.customer_id
GROUP BY 
    customer_id_1, customer_id_2, i.film_id
HAVING 
    times_rented_together > 3;


##There are no pairs of customers who have rented the same film more than 3 times.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Retrieving all possible pairs of actors and films.
SELECT 
    a.actor_id, 
    a.first_name, 
    a.last_name, 
    f.film_id, 
    f.title
FROM 
    actor a
JOIN 
    film_actor fa ON a.actor_id = fa.actor_id
JOIN 
    film f ON fa.film_id = f.film_id
ORDER BY 
    a.actor_id, f.film_id;
































