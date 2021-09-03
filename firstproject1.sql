CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name_genre VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS executor (
	id SERIAL PRIMARY KEY,
	name_executor VARCHAR(40) NOT NULL,
	genre_id INTEGER NOT NULL REFERENCES genre(id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name_album VARCHAR(40) NOT NULL,
	year_album INTEGER NOT NULL CHECK(year_album > 0),
	executor_id INTEGER NOT NULL REFERENCES executor(id)
);

CREATE TABLE IF NOT EXISTS song (
	id SERIAL PRIMARY KEY,
	name_song VARCHAR(40) NOT NULL UNIQUE,
	duration INTEGER NOT NULL CHECK(duration > 0),
	album_id INTEGER NOT NULL REFERENCES album(id)
);

CREATE TABLE IF NOT EXISTS collection (
	name_collection VARCHAR(40) NOT NULL UNIQUE,
	year_collection INTEGER NOT NULL CHECK(year_collection > 0),
	executor_id INTEGER NOT NULL REFERENCES executor(id),
	song_id INTEGER NOT NULL REFERENCES song(id),
	CONSTRAINT es PRIMARY KEY (executor_id, song_id)
);


