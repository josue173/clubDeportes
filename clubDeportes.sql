DROP DATABASE IF EXISTS clubDeportes;
CREATE DATABASE clubDeportes;
USE clubDeportes;

CREATE TABLE Campeonatos (
    CodTrofeo INT PRIMARY KEY UNIQUE, 
    NombreTrofeo VARCHAR(50)
);

CREATE TABLE Clubes (
    CodClub INT PRIMARY KEY UNIQUE, 
    Nombre VARCHAR(30), 
    Direccion VARCHAR(100), 
    Poblacion INT, 
    Provincia VARCHAR(100), 
    CosPostal INT, 
    Tlfno VARCHAR(20), 
    Colores VARCHAR(100), 
    Himno VARCHAR(1000), 
    Fax VARCHAR(20), 
    AñoFundación YEAR, 
    Presupuesto INT, 
    Presidente VARCHAR(100), 
    Vicepresidente VARCHAR(100)
);

CREATE TABLE Demarcaciones (
    CodDem INT PRIMARY KEY UNIQUE, 
    Demarcacion VARCHAR(30)
);

CREATE TABLE Entrenadores (
    CodEntren INT PRIMARY KEY UNIQUE, 
    Entrenador VARCHAR(20), 
    FechaNcmto DATE, 
    Poblacion INT, 
    Provincia VARCHAR(100)
);

CREATE TABLE Paises (
    CodPais INT PRIMARY KEY UNIQUE, 
    NombrePais VARCHAR(20) UNIQUE, 
    Comunitario VARCHAR(100)
);

CREATE TABLE Jugadores (
    Codjugador INT PRIMARY KEY UNIQUE, 
    Club VARCHAR(100), 
    Jugador VARCHAR(30), 
    Dorsal VARCHAR(30), 
    CodiPais INT, 
    CodDem INT, 
    FOREIGN KEY (CodiPais) REFERENCES Paises(CodPais),
    FOREIGN KEY (CodDem) REFERENCES Demarcaciones(CodDem)
);

CREATE TABLE Socios (
    NumSocio INT PRIMARY KEY UNIQUE, 
    CodPost INT, 
    Nombre VARCHAR(50), 
    Apellidos VARCHAR(100), 
    Direccion VARCHAR(100), 
    Provincia VARCHAR(100), 
    FechaAlta DATE, 
    CoutaActual INT, 
    CodClub INT, 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub)
);

CREATE TABLE Esponsors (
    CodEspon INT PRIMARY KEY UNIQUE, 
    Esponsor VARCHAR(100), 
    CodClub INT, 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub)
);

CREATE TABLE Equipacion (
    CodEquip INT PRIMARY KEY UNIQUE, 
    Encasa VARCHAR(100), 
    CodClub INT, 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub)
);

CREATE TABLE Estadios (
    CodEstadio INT PRIMARY KEY UNIQUE, 
    Estadio VARCHAR(50), 
    Direccion VARCHAR(100), 
    CodPostal INT, 
    Poblacion INT, 
    Provincia VARCHAR(100), 
    Capacidad INT, 
    Sentados INT, 
    Inauguracion DATE, 
    Dimensiones VARCHAR(100), 
    CodClub INT, 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub)
);

CREATE TABLE EntrenClubes (
    CodClub INT, 
    CodEntren INT, 
    PRIMARY KEY (CodClub, CodEntren), 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub), 
    FOREIGN KEY (CodEntren) REFERENCES Entrenadores(CodEntren)
);

CREATE TABLE Palmares (
    CodClub INT, 
    CodTrofeo INT, 
    Ano YEAR, 
    PRIMARY KEY (CodClub, CodTrofeo), 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub), 
    FOREIGN KEY (CodTrofeo) REFERENCES Campeonatos(CodTrofeo)
);

CREATE TABLE ClubJug (
    CodClub INT, 
    CodJugador INT, 
    Liga VARCHAR(100), 
    PRIMARY KEY (CodClub, CodJugador), 
    FOREIGN KEY (CodClub) REFERENCES Clubes(CodClub), 
    FOREIGN KEY (CodJugador) REFERENCES Jugadores(CodJugador)
);
