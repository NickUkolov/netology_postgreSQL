SELECT genre_name, COUNT(musician_id) AS count_musician FROM genre g 
JOIN genre_musician gm ON g.genre_id = gm.genre_id 
GROUP BY genre_name;

SELECT album_name, album_year, COUNT(track_name) AS track_count FROM album a 
JOIN track t ON a.album_id = t.album_id 
WHERE EXTRACT (YEAR FROM album_year) BETWEEN 2019 AND 2020
GROUP BY album_name, album_year; 

SELECT album_name, AVG(track_length) AS average_length FROM album a 
JOIN track t ON a.album_id = t.album_id 
GROUP BY album_name;

SELECT musician_name FROM musician m 
JOIN musician_album ma ON m.musician_id = ma.musician_id 
JOIN album a ON ma.album_id = a.album_id 
WHERE EXTRACT (YEAR FROM album_year) != 2020
GROUP BY musician_name;

SELECT collection_name, musician_name FROM collection c 
JOIN collection_track ct USING(collection_id)
JOIN track t USING(track_id)
JOIN album a USING(album_id)
JOIN musician_album ma USING(album_id)
JOIN musician m USING(musician_id)
WHERE musician_name LIKE 'Звери'
GROUP BY collection_name, musician_name;

SELECT album_name, musician_name, COUNT(genre_name) AS genre_count FROM album a 
JOIN musician_album ma USING(album_id)
JOIN musician m USING(musician_id)
JOIN genre_musician gm USING(musician_id)
JOIN genre g USING(genre_id)
GROUP BY album_name, musician_name
HAVING COUNT(genre_name) > 1;

SELECT track_name FROM track t 
FULL JOIN collection_track ct USING(track_id)
WHERE ct.collection_id IS NULL 
GROUP BY track_name;

SELECT musician_name, track_length FROM musician m 
JOIN musician_album ma USING(musician_id)
JOIN album a USING(album_id)
JOIN track t USING(album_id)
WHERE track_length = (SELECT MIN(track_length) FROM track)
GROUP BY musician_name, track_length;

SELECT album_name, COUNT(track_name) AS track_count FROM album a 
JOIN track t USING(album_id)
GROUP BY album_name
HAVING COUNT(track_name) = (
	SELECT COUNT(track_name) AS count_track FROM track t2 
	JOIN album a2 USING(album_id)
	GROUP BY album_name
	ORDER BY count_track
	LIMIT 1);







