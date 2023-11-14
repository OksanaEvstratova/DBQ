CREATE TABLE IF NOT EXISTS singers (
	singer_ID SERIAL PRIMARY KEY,
	singer_name VARCHAR(80) unique NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	genre_ID SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT null 
);

CREATE TABLE IF NOT EXISTS albums (
	album_ID SERIAL PRIMARY KEY,
	album_name VARCHAR(80) NOT NULL,
	album_year integer NOT NULL
);

CREATE TABLE IF NOT EXISTS singers_genres (
	singer INTEGER REFERENCES singers(singer_ID),
	genre INTEGER REFERENCES genres(genre_ID),
	CONSTRAINT sg_ID PRIMARY KEY (singer, genre)
);

CREATE TABLE IF NOT EXISTS singers_albums (
	singer INTEGER REFERENCES singers(singer_ID),
	album INTEGER REFERENCES albums(album_ID),
	CONSTRAINT sa_ID PRIMARY KEY (singer, album)
);

CREATE TABLE IF NOT EXISTS tracks (
	track_ID SERIAL PRIMARY KEY,
	track_name VARCHAR(80) NOT NULL,
	track_length INTEGER,
	album INTEGER REFERENCES albums(album_ID)
);

CREATE TABLE IF NOT EXISTS collections (
	collection_id SERIAL PRIMARY KEY,
	collection_name VARCHAR(80) NOT NULL,
	collection_year integer NOT null	
);

CREATE TABLE IF NOT EXISTS collections_tracks (
	track INTEGER REFERENCES tracks(track_ID),
	collection INTEGER REFERENCES collections(collection_id),
	CONSTRAINT ct_ID PRIMARY KEY (track, collection)
);