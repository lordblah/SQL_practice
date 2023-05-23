Question 28. Film with the second largest cast medium
Instruction 
• Write a query to return the title of the film with the second largest cast.
• If there are ties, e.g., two movies have the same number of actors, return either one of 
the movie.

#my solution
SELECT 
f1.title,
count(f2.actor_id) Cast_count
from film f1
inner join film_actor f2
on f1.film_id = f2.film_id
group by 1
), rankdataset as (
SELECT 
title,
Cast_count,
rANK() OVER (ORDER BY Cast_count  DESC)AS Rank 
	from countdataset
  )
  SELECT 
  title,
Cast_count,
Rank
FROM rankdataset
where rank = 2

#their solution
WITH film_size AS (
SELECT film_id,
COUNT(*) AS actors_cnt
FROM film_actor
GROUP BY film_id
ORDER BY actors_cnt DESC
LIMIT 2
)
SELECT title
FROM film
WHERE film_id IN (
 SELECT film_id
 FROM film_size
 ORDER BY actors_cnt
 LIMIT 1
)
