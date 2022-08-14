INSERT INTO genre (name)
VALUES 
	('Rap'), 
	('Electro'), 
	('Metal'),
	('Rock'),
	('Pop'),
	('Progressive metal'),
	('Indie');
	
INSERT INTO musician (name)
VALUES 
	('Eminem'),
	('Prodigy'),
	('Metallica'),
	('Godsmack'),
	('Kiss'),
	('Sting'),
	('Ранетки'),
	('Звери'),
	('Dream theater'),
	('Haken'),
	('Alt-J');

INSERT INTO genre_musician 
	(genre_id, musician_id)
VALUES 
	(1, 1),
	(2, 2),
	(3, 3),
	(3, 4),
	(4, 5),
	(4, 6),
	(5, 7),
	(5, 8),
	(6, 9),
	(6, 10),
	(7, 11),
	(4, 7);
		
INSERT INTO album (name, year)
VALUES 
	('The Marshall Matters', '2000-05-20'),
	('Kamikaze', '2018-08-31'),
	('The fat of the land', '1997-06-30'),
	('No tourists', '2018-11-02'),
	('Master of puppets', '1986-03-03'),
	('Faceless', '2003-04-08'),
	('The oracle', '2010-05-04'),
	('Love gun', '1977-06-30'),
	('The summoners tale', '1993-03-09'),
	('Ранетки', '2006-12-31'),
	('Районы-кварталы', '2004-04-20'),
	('Octavarium', '2005-06-07'),
	('Virus', '2020-07-24'),
	('An awesome wave', '2012-05-25');

INSERT INTO musician_album (musician_id, album_id)
VALUES 
	(1, 1),
	(1, 2),
	(2, 3),
	(2, 4),
	(3, 5),
	(4, 6),
	(4, 7),
	(5, 8),
	(6, 9),
	(7, 10),
	(8, 11),
	(9, 12),
	(10, 13),
	(11, 14);
	
INSERT INTO track (name, length, album_id)
VALUES 
	('Stan', 404, 1),
	('The real slim shady', 284, 1),
	('Kamikaze', 150, 2),
	('Good guy', 144, 2),
	('Smack my bitch up', 343, 3),
	('Breathe', 335, 3),
	('Need some1', 163, 4),
	('Light up the sky', 200, 4),
	('Master of puppets', 516, 5),
	('Straight out of line', 259, 6),
	('Love hate sex pain', 315, 7),
	('Christine sixteen', 194, 8),
	('Love gun', 198, 8),
	('Shape of my heart', 278, 9),
	('If i ever lose my faith in you', 270, 9),
	('Мы ранетки', 201, 10),
	('Мальчишки-кадеты', 161, 10),
	('Районы-кварталы', 204, 11),
	('Всё что касается', 209, 11),
	('Octavarium', 1440, 12),
	('Panic attack', 436, 12),
	('Invasion', 402, 13),
	('Carousel', 630, 13),
	('Breezeblocks', 227, 14),
	('Matilda', 228, 14);

INSERT INTO collection (name, year)
VALUES 
	('Best rap tracks', '2019-05-05'),
	('Dance music', '2020-06-06'),
	('Headbanger', '2022-10-01'),
	('Top 1 rock group', '2015-10-10'),
	('Favourite', '2020-05-05'),
	('Greatest hits', '2006-10-10'),
	('Best tracks', '2020-07-07'),
	('Total shit', '2014-10-10');

INSERT INTO collection_track 
	(collection_id, track_id)
VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 5),
	(2, 6),
	(2, 7),
	(2, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(4, 12),
	(4, 13),
	(5, 14),
	(5, 15),
	(5, 13),
	(5, 12),
	(6, 16),
	(6, 17),
	(6, 1),
	(6, 3),
	(7, 18),
	(7, 19),
	(7, 10),
	(7, 11),
	(7, 12),
	(8, 18),
	(8, 19),
	(8 ,20),
	(8, 21),
	(8, 22),
	(8, 23),
	(8, 24),
	(8, 25),
	(7, 20),
	(7, 21);
	
	
	
	
