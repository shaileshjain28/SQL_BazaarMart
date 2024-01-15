ALTER TABLE sales
modify time time;

-- 1) add timme segment column

ALTER TABLE sales
add column time_segment varchar(20) NOT NULL AFTER time;

UPDATE sales
SET time_segment = (CASE 
					WHEN time BETWEEN '06:00:00' AND '12:00:00' THEN 'Morning'
					WHEN time BETWEEN '12:01:00' AND '18:00:00' THEN 'AfterNoon'
					WHEN time BETWEEN '18:01:00' AND '21:00:00' THEN 'Evening'
					ELSE 'Night' 
					END);
-- --------------------------------------------------------------------------------------------------------------------------------- 


--  2) add day names


ALTER TABLE sales
ADD COLUMN day_name VARCHAR(10) NOT NULL AFTER time;

UPDATE sales
set day_name = dayname(date);
-- ---------------------------------------------------------------------------------------------------------------------------------

--  2) add day names

ALTER TABLE sales
ADD COLUMN month_name VARCHAR(10) NOT NULL AFTER time;

UPDATE sales
SET month_name = MONTHNAME(date);



                    
                    