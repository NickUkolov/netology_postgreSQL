create table if not exists GENRE (
	genre_id SERIAL primary key, 
	genre_name VARCHAR(100) not null
);

create table if not exists MUSICIAN (
	musician_id SERIAL primary key, 
	musician_name VARCHAR(100) not null
);

create table if not exists ALBUM (
	album_id SERIAL primary key, 
	album_name VARCHAR(100) not null,
	album_year DATE not null
);

create table if not exists TRACK (
	track_id SERIAL primary key, 
	track_name VARCHAR(100) not null,
	track_length SMALLINT,
	album_id INTEGER not NULL REFERENCES ALBUM(album_id)
);

create table if not exists COLLECTION (
collection_id SERIAL primary key,
collection_name VARCHAR(100) not null,
collection_year DATE not null
);

create table if not exists GENRE_MUSICIAN (
genre_id INTEGER not null references GENRE(genre_id),
musician_id INTEGER not null references MUSICIAN(musician_id),
constraint genre_musician_pk primary key (genre_id, musician_id)
);

create table if not exists MUSICIAN_ALBUM (
musician_id INTEGER not null references MUSICIAN(musician_id),
album_id INTEGER not null references ALBUM(album_id),
constraint musician_album_pk primary key (musician_id, album_id)
);

create table if not exists COLLECTION_TRACK (
collection_id INTEGER not null references COLLECTION(collection_id),
track_id INTEGER not null references TRACK(track_id),
constraint collection_track_pk primary key (collection_id, track_id)
);

