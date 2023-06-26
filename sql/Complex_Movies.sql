CREATE TABLE Movies(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    length INT
);

CREATE TABLE People(
    id SERIAL PRIMARY KEY ,
    user_name VARCHAR(30)
);

CREATE TABLE Ratings(
    id SERIAL PRIMARY KEY,
    movie_id INT,
    person_id INT,
    rating INT
);

ALTER TABLE Ratings
ADD CONSTRAINT FK_MovieRatings
FOREIGN KEY (movie_id) REFERENCES Movies(id);

ALTER TABLE Ratings
ADD CONSTRAINT FK_PeopleRatings
FOREIGN KEY (person_id) REFERENCES People(id);


INSERT INTO Movies (name, length)
VALUES ('Fekete Párduc 2', 120),('Top Gun', 90), ('Black Adam', 88);

SELECT * FROM Movies;

INSERT INTO People (user_name)
VALUES ('feketeParducFan08'), ('Sanyi'), ('Béla');


SELECT * FROM People;

INSERT INTO Ratings (movie_id, person_id, rating)
VALUES (1, 1, 8), (2,2,7), (3,3,9), (2,1,6);

SELECT * FROM Ratings;

SELECT Movies.name, ROUND(AVG(Ratings.rating),1) AS Ratingavg FROM Movies JOIN Ratings
ON movies.id = ratings.movie_id
GROUP BY Movies.name
ORDER BY Ratingavg DESC;



