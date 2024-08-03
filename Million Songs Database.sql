-- Million Songs Database

-- Database Creation

-- Create the database
CREATE DATABASE SongsDatabase;

-- Switch to the newly created database
USE SongsDatabase;

-- Artits table
CREATE TABLE Artists (
    artist_id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255),
    familiarity DECIMAL(10, 5),
    hotttnesss DECIMAL(10, 5),
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    terms VARCHAR(255),
    terms_freq DECIMAL(10, 5)
);

-- Songs table
CREATE TABLE Songs (
    song_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    duration DECIMAL(10, 5),
    year INT,
    artist_id VARCHAR(255),
    tempo DECIMAL(10, 5),
    time_signature INT,
    mode INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);

-- Song Analysis table
CREATE TABLE Song_Analysis (
    song_id VARCHAR(255),
    loudness DECIMAL(10, 5),
    end_of_fade_in DECIMAL(10, 5),
    start_of_fade_out DECIMAL(10, 5),
    mode_confidence DECIMAL(10, 5),
    time_signature_confidence DECIMAL(10, 5),
    tempo_confidence DECIMAL(10, 5),
    key_confidence DECIMAL(10, 5),
    FOREIGN KEY (song_id) REFERENCES Songs(song_id)
);

-- Location table
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6)
);

-- Genres table
CREATE TABLE Genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(255)
);

-- Artist Genre table
CREATE TABLE Artist_Genre (
    artist_id VARCHAR(255),
    genre_id INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id),
    FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- Albums table
CREATE TABLE Albums (
    album_id VARCHAR(255) PRIMARY KEY,
    title VARCHAR(255),
    artist_id VARCHAR(255),
    release_year INT,
    FOREIGN KEY (artist_id) REFERENCES Artists(artist_id)
);


