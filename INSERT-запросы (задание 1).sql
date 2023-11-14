--3
INSERT INTO genres (genre_name) values 
	('Rock'),
	('Pop'),
	('Metall'),
	('Neo-classic'),
	('Jaz'),
	('K-pop')
	ON CONFLICT (genre_name) DO NOTHING;
    
   
--DELETE FROM genres 

--4
INSERT INTO singers (singer_name) values 
	('David Garrette'),
	('David Bowie'),
	('The Cranberries'),
	('The Cardigans'),
	('Bon Jovi'),
	('Metallica'),
	('Michael Jackson'),
	('BTS')
	ON CONFLICT (singer_name) DO NOTHING;


INSERT INTO singers_genres (singer, genre) values 
	((SELECT singer_id FROM singers WHERE singer_name = 'The Cardigans'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Rock')),
	((SELECT singer_id FROM singers WHERE singer_name = 'David Garrette'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Neo-classic')),
	((SELECT singer_id FROM singers WHERE singer_name = 'David Garrette'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Rock')),
	((SELECT singer_id FROM singers WHERE singer_name = 'David Bowie'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Rock')),
	((SELECT singer_id FROM singers WHERE singer_name = 'The Cranberries'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Rock')),
	((SELECT singer_id FROM singers WHERE singer_name = 'Bon Jovi'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Rock')),
	((SELECT singer_id FROM singers WHERE singer_name = 'Metallica'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Metall')),
	((SELECT singer_id FROM singers WHERE singer_name = 'Michael Jackson'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'Pop')),
	((SELECT singer_id FROM singers WHERE singer_name = 'BTS'), (SELECT genre_id FROM genres WHERE genres.genre_name = 'K-pop'))
	ON CONFLICT (singer,  genre) DO NOTHING;
	
--3
INSERT INTO albums (album_name, album_year) values 
	('Gran Turismo', 1998),
	('Rock Symphonies', 2020),
	('Explosive', 2015),
	('Crush', 2000);

--DELETE FROM albums 	

INSERT INTO singers_albums (singer, album) values 
	((SELECT singer_id FROM singers WHERE singer_name = 'The Cardigans'), (SELECT album_id FROM albums WHERE albums.album_name = 'Gran Turismo')),
	((SELECT singer_id FROM singers WHERE singer_name = 'David Garrette'), (SELECT album_id FROM albums WHERE albums.album_name = 'Rock Symphonies')),
	((SELECT singer_id FROM singers WHERE singer_name = 'David Garrette'), (SELECT album_id FROM albums WHERE albums.album_name = 'Explosive')),
	((SELECT singer_id FROM singers WHERE singer_name = 'Bon Jovi'), (SELECT album_id FROM albums WHERE albums.album_name = 'Crush'))
	ON CONFLICT (singer,  album) DO NOTHING;

--DELETE FROM singers_albums

--6
INSERT INTO tracks (track_name, track_length, album) values 
	('My Favourite Game', 216, (SELECT album_id FROM albums WHERE albums.album_name = 'Gran Turismo')),
	('Smells Like Teen Spirit', 246, (SELECT album_id FROM albums WHERE albums.album_name = 'Rock Symphonies')),
	('Vivaldi Vs. Vertigo', 195, (SELECT album_id FROM albums WHERE albums.album_name = 'Rock Symphonies')),
	('Master Of Puppets', 227, (SELECT album_id FROM albums WHERE albums.album_name = 'Rock Symphonies')),
	('Its My Life', 225, (SELECT album_id FROM albums WHERE albums.album_name = 'Crush')),
	('Thank You For Loving Me', 309, (SELECT album_id FROM albums WHERE albums.album_name = 'Crush')),
	('One Wild Night', 283, (SELECT album_id FROM albums WHERE albums.album_name = 'Crush'));
	
--DELETE FROM tracks

--4 сборника
INSERT INTO collections (collection_name, collection_year) values 
	('The 1st', 2010),
	('The 2nd', 2011),
	('The best of David Garrette', 2019),
	('The other', 2020);
	


INSERT INTO collections_tracks (track, collection) values 
	((SELECT track_id FROM tracks WHERE track_name = 'My Favourite Game'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The 1st')),
	((SELECT track_id FROM tracks WHERE track_name = 'Smells Like Teen Spirit'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The 1st')),
	((SELECT track_id FROM tracks WHERE track_name = 'Its My Life'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The 1st')),
	((SELECT track_id FROM tracks WHERE track_name = 'One Wild Night'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The 2nd')),
	((SELECT track_id FROM tracks WHERE track_name = 'Vivaldi Vs. Vertigo'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The 2nd')),
	((SELECT track_id FROM tracks WHERE track_name = 'Vivaldi Vs. Vertigo'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The best of David Garrette')),
	((SELECT track_id FROM tracks WHERE track_name = 'Smells Like Teen Spirit'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The best of David Garrette')),
	((SELECT track_id FROM tracks WHERE track_name = 'Master Of Puppets'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The best of David Garrette')),
	((SELECT track_id FROM tracks WHERE track_name = 'Its My Life'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The best of David Garrette')),
	((SELECT track_id FROM tracks WHERE track_name = 'My Favourite Game'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The other')),
	((SELECT track_id FROM tracks WHERE track_name = 'One Wild Night'), (SELECT collection_id FROM collections WHERE collections.collection_name = 'The other'))	;