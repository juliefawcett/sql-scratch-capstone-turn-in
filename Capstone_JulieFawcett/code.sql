/*  get familiar with survey table
SELECT *
FROM survey
LIMIT 10;
-- get familiar with survey table */


/* number of responses for each question 
SELECT question,
	COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;
-- number of responses for each question*/


/* column names
SELECT *
FROM quiz
limit 5;

SELECT *
FROM home_try_on
limit 5;

SELECT *
FROM purchase
limit 5; 
-- column names*/


/* Question 5
SELECT DISTINCT q.user_id, 
	h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
 		on q.user_id = h.user_id
 LEFT JOIN purchase p 
 		on p.user_id = q.user_id
 LIMIT 10; 
 -- Question 5 */ 




/*  get familiar with survey table
SELECT *
FROM survey
LIMIT 10;
-- get familiar with survey table */
/* number of responses for each question 
SELECT question,
	COUNT(DISTINCT user_id)
FROM survey
GROUP BY question;
-- number of responses for each question*/

/* column names
SELECT *
FROM quiz
limit 5;

SELECT *
FROM home_try_on
limit 5;

SELECT *
FROM purchase
limit 5; column names*/

WITH funnels AS (
SELECT DISTINCT q.user_id, 
	h.user_id IS NOT NULL AS 'is_home_try_on',
  h.number_of_pairs,
  p.user_id IS NOT NULL AS 'is_purchase'
 FROM quiz q
 LEFT JOIN home_try_on h
 		on q.user_id = h.user_id
 LEFT JOIN purchase p 
 		on p.user_id = q.user_id)
SELECT 
   1.0 * SUM(is_home_try_on) / COUNT(user_id) AS 'Try_on',
   1.0 * SUM(is_purchase) / SUM(is_checkout) AS 'Purchase'
FROM funnels;

 

 ELECT SUM(q1.is_home_try_on) AS ‘Try_on’,
             SUM(q1.is_purchase) AS ‘Purchases’,
        (SUM(q1.is_purchase) / SUM(q1.is_home_try_on)) AS CVR
      FROM q1;
 