-- Analysis of car theft in The United States of America
-- Objective: to extact insight about car thefts in U.S.A
CREATE DATABASE cartheft;

CREATE TABLE cartheft (
index INT,
State VARCHAR(255),
Rank INT,
Model VARCHAR(255),
ModelYear VARCHAR(255),
Thefts NUMERIC
);

\COPY cartheft (index,State,Rank,Model,ModelYear,Thefts) 
FROM 'C:/Users/hp/Desktop/dataset/data4.csv'
DELIMITER ',' 
CSV HEADER;

SELECT * FROM cartheft;

-- Change data type to integer
ALTER TABLE cartheft
ALTER COLUMN modelyear SET DATA TYPE INTEGER USING modelyear :: INTEGER;

-- check for missing values
SELECT
COUNT (index), COUNT(state), COUNT(rank), COUNT(model), COUNT(modelyear),COUNT(thefts)
FROM cartheft;


SELECT model,
COUNT (model) as countmodel
FROM  cartheft
GROUP BY model;

--total and average thefts
SELECT SUM(thefts) as total_thefts, AVG(thefts) as average_thefts
FROM cartheft;
--Total_thefts = 243,727	Average_thefts = 477.896

-- Thefts by carmodel
SELECT model, SUM(thefts) AS total_thefts
FROM cartheft
GROUP BY model
ORDER BY total_thefts DESC;
-- Honda Accord records highest theft

-- Thefts by state
SELECT state, SUM(thefts) AS total_thefts
FROM cartheft
GROUP BY state
ORDER BY total_thefts DESC;
-- Carlifornia records highest theft 

-- Thefts by modelyear
SELECT modelyear, SUM(thefts) AS total_thefts
FROM cartheft
GROUP BY modelyear
ORDER BY total_thefts DESC;
-- 1998 model records highest theft
