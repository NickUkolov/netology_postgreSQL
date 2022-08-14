SELECT name, YEAR FROM album
WHERE EXTRACT (YEAR FROM YEAR) = 2018;

SELECT name, length FROM track
ORDER BY length DESC 
LIMIT 1;

SELECT name FROM track
WHERE length > 210
ORDER BY length;

SELECT name FROM collection
WHERE EXTRACT (YEAR FROM YEAR) BETWEEN 2018 AND 2020;

SELECT name FROM musician
WHERE name NOT LIKE '% %';

SELECT name FROM track
WHERE name LIKE '%my%' OR name LIKE '%моё%';