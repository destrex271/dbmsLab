CREATE TABLE Sailors(
  sid INT NOT NULL PRIMARY KEY,
  sname VARCHAR(25),
  rating INT DEFAULT 0,
  age FLOAT, 
  CHECK(age > 18)
);

CREATE TABLE Boats(
  bid INT NOT NULL PRIMARY KEY,
  bname VARCHAR(30) NOT NULL,
  color VARCHAR(30) NOT NULL
);

CREATE TABLE Reserves(
  sid INT, 
  bid INT,
  day DATE,
  FOREIGN KEY(sid) REFERENCES Sailors(sid),
  FOREIGN KEY(bid) REFERENCES Boats(bid),
  PRIMARY KEY(sid, bid)
);

-- Sailors Table values 
INSERT INTO Sailors VALUES(22, "Dustin", 7, 45.0);
INSERT INTO Sailors VALUES(29, "Brutus", 1, 33.0);
INSERT INTO Sailors VALUES(31, "Lubber", 8, 55.5);
INSERT INTO Sailors VALUES(32, "Andy", 8, 25.0);
INSERT INTO Sailors VALUES(58, "Rusty", 10, 35.0);
INSERT INTO Sailors VALUES(64, "Horatio", 7, 35.0);
INSERT INTO Sailors VALUES(71, "Zobra", 10, 16.0);
INSERT INTO Sailors VALUES(74, "Horatio", 9, 35.0);
INSERT INTO Sailors VALUES(85, "Art", 3, 25.0);
INSERT INTO Sailors VALUES(95, "Bob", 3, 63.5);

-- Boats Table values
INSERT INTO Boats VALUES(101, "Interlake", "blue");
INSERT INTO Boats VALUES(102, "Interlake", "red");
INSERT INTO Boats VALUES(103, "Cipher", "green");
INSERT INTO Boats VALUES(104, "Marine", "red");

-- Reserves Table values
INSERT INTO Reserves VALUES(22, 101, DATE'1998-10-10');
INSERT INTO Reserves VALUES(22, 102, DATE'1998-10-10');
INSERT INTO Reserves VALUES(22, 103, DATE'1998-8-10');
INSERT INTO Reserves VALUES(22, 104, DATE'1998-7-10');
INSERT INTO Reserves VALUES(31, 102, DATE'1998-10-11');
INSERT INTO Reserves VALUES(31, 103, DATE'1998-6-11');
INSERT INTO Reserves VALUES(31, 104, DATE'1998-12-11');
INSERT INTO Reserves VALUES(64, 101, DATE'1998-05-09');
INSERT INTO Reserves VALUES(64, 102, DATE'1998-08-09');
INSERT INTO Reserves VALUES(74, 103, DATE'1998-08-09');

SELECT NAME, AGE
FROM Sailors;

SELECT * 
FROM Boats
WHERE color IN ("red", "blue");

SELECT MAX(age)
FROM Sailors;

SELECT MIN(age)
FROM Sailors;

SELECT *
FROM Sailors
WHERE sname LIKE "B%" AND LIKE "%B" AND LEN(sname) = 3;

SELECT AVG(rating)
FROM Sailors;

SELECT *
FROM Sailors
WHERE rating > 7;

-- SELECT COUNT(bid) 
SELECT *
FROM Reserves
INNER JOIN Sailors
ON Reserves.sid = Sailors.sid
WHERE sname LIKE "Horatio";

-- SELECT color 
SELECT *
FROM Reserves
INNER JOIN Sailors
ON Reserves.sid = Sailors.sid
INNER JOIN Boats
ON Reserves.bid = Boats.bid
WHERE sname LIKE "Lubber";



DROP TABLE Reserves;
DROP TABLE Boats;
DROP TABLE Sailors;
