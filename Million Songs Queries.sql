-- Displaying the Tables with Populated Data

SELECT * FROM Artists;
SELECT * FROM Songs;
SELECT * FROM Song_Analysis;
SELECT * FROM Location;
SELECT * FROM Genres;
SELECT * FROM Artist_Genre;
SELECT * FROM Albums;

-- Business Questions 

-- 1) What are the top 10 most common genres of music in the dataset?
SELECT genre_name, COUNT(*) as genre_count
FROM Genres
JOIN Artist_Genre ON Genres.genre_id = Artist_Genre.genre_id
GROUP BY genre_name
ORDER BY genre_count DESC
LIMIT 10;

-- 2) Which artists have the highest 'hotttnesss' rating, and what genres do they belong to?
SELECT Artists.name, Artists.hotttnesss, Genres.genre_name
FROM Artists
JOIN Artist_Genre ON Artists.artist_id = Artist_Genre.artist_id
JOIN Genres ON Artist_Genre.genre_id = Genres.genre_id
ORDER BY Artists.hotttnesss DESC
LIMIT 10;

-- 3) How many songs are there in each genre?
SELECT Genres.genre_name, COUNT(Songs.song_id) as number_of_songs
FROM Genres
JOIN Artist_Genre ON Genres.genre_id = Artist_Genre.genre_id
JOIN Songs ON Artist_Genre.artist_id = Songs.artist_id
GROUP BY Genres.genre_name
ORDER BY number_of_songs DESC;

-- 4) What is the average song duration per genre?
SELECT Genres.genre_name, AVG(Songs.duration) as average_duration
FROM Genres
JOIN Artist_Genre ON Genres.genre_id = Artist_Genre.genre_id
JOIN Songs ON Artist_Genre.artist_id = Songs.artist_id
GROUP BY Genres.genre_name
ORDER BY average_duration DESC;

-- 5) Find the distribution of songs' release years.
SELECT year, COUNT(*) as number_of_songs
FROM Songs
WHERE year IS NOT NULL
GROUP BY year
ORDER BY year;

-- 6) Which location has produced the most artists?
SELECT Location.latitude, Location.longitude, COUNT(Artists.artist_id) as number_of_artists
FROM Location
JOIN Artists ON Location.latitude = Artists.latitude AND Location.longitude = Artists.longitude
GROUP BY Location.latitude, Location.longitude
ORDER BY number_of_artists DESC
LIMIT 1;

-- 7) Which artists have the longest average song duration?
SELECT Artists.name, AVG(Songs.duration) AS average_song_duration
FROM Artists
JOIN Songs ON Artists.artist_id = Songs.artist_id
GROUP BY Artists.name
ORDER BY average_song_duration DESC
LIMIT 10;

-- 8 What is the average number of songs released per album?
SELECT Albums.title, COUNT(Songs.song_id) AS number_of_songs
FROM Albums
JOIN Songs ON Albums.artist_id = Songs.artist_id
GROUP BY Albums.title
HAVING COUNT(Songs.song_id) > 1 -- Filtering out singles
ORDER BY number_of_songs DESC
LIMIT 10;











