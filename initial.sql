-- Crear la base de datos
CREATE DATABASE MovieLens;
GO

-- Usar la base de datos
USE MovieLens;
GO

-- Crear tablas según los archivos del dataset
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title NVARCHAR(255),
    Genres NVARCHAR(255)
);

CREATE TABLE Ratings (
    UserID INT,
    MovieID INT,
    Rating FLOAT,
    Timestamp BIGINT
);

CREATE TABLE Tags (
    UserID INT,
    MovieID INT,
    Tag NVARCHAR(255),
    Timestamp BIGINT
);

CREATE TABLE Links (
    MovieID INT PRIMARY KEY,
    IMDbID INT,
    TMDbID INT
);

-- Cargar datos usando BULK INSERT
BULK INSERT Movies
FROM '/usr/src/app/data/movies.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001',  -- UTF-8 encoding
    TABLOCK
);

BULK INSERT Ratings
FROM '/usr/src/app/data/ratings.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Tags
FROM '/usr/src/app/data/tags.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);

BULK INSERT Links
FROM '/usr/src/app/data/links.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    CODEPAGE = '65001',
    TABLOCK
);
GO
