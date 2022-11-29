-- DDL - Definicao de dados

CREATE DATABASE SekiroDB

USE SekiroDB

CREATE TABLE Usuarios(
	IdUsuario INT PRIMARY KEY IDENTITY,
	Email VARCHAR(100) UNIQUE NOT NULL,
	Senha VARCHAR(255) NOT NULL
)

CREATE TABLE Classes(
	IdClasse INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL, 
	Descricao VARCHAR(255)
)

CREATE TABLE Personagens(
	IdPersonagem INT PRIMARY KEY IDENTITY,
	Apelido VARCHAR(35) UNIQUE NOT NULL,
	IdUsuario INT UNIQUE FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	IdClasse INT UNIQUE FOREIGN KEY REFERENCES Classes(IdClasse)
)

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL,
	Descricao VARCHAR(255)
)

CREATE TABLE ClassesHabilidades(
	IdClasse INT FOREIGN KEY REFERENCES Classes(IdClasse),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades(IdHabilidade),
)

-- DML - Manipulacao de dados

INSERT INTO Classes VALUES 
	('Mago', 'Lança feitiços em combate'),
	('Bárbaro', 'Utiliza lanças em combate'),
	('Monge', 'Curandeiro')

INSERT INTO Habilidades VALUES
	('Lança Mortal', 'Evasão com golpes em sequencia na direção apontada'),
	('Recuperar vida', 'Com sua poção sua vida recuperara 250 de HP em 5s'),
	('Bola de fogo', 'Lança uma bola de fogo em direção ao oponente apontado'),
	('Escudo Supremo', 'Qualquer habilidade ou ataque é repelido pelo seu Escudo Supremo'),
	('Flash', 'Avança em um teleporte em direção apontada em 15 metros')

INSERT INTO ClassesHabilidades VALUES
-- Mago
	(1, 3), (1, 4), (1, 5),
-- Barbaro
	(2, 1), (2, 4),
-- Monge
	(3, 2), (3, 4), (3, 5)

INSERT INTO Usuarios VALUES
	('aph221@gmail.com', '99882211aph'),
	('danox2014@hotmail.com', 'Danox122455')

INSERT INTO Usuarios VALUES
	('vcvaiserdeletado@gmail.com', '1234567890qwert')


INSERT INTO Personagens VALUES
	('DeuBug', 1, 2),
	('BitBug', 2, 3)

DELETE FROM Usuarios WHERE IdUsuario = 3

UPDATE Usuarios SET Email = 'aphonso2012@proton.me' WHERE IdUsuario = 1

UPDATE Usuarios SET Email = 'danox2014@proton.me' WHERE IdUsuario = 2

-- DQL - Consultas

SELECT * FROM Usuarios
SELECT * FROM Classes
SELECT * FROM Personagens
SELECT * FROM Habilidades
SELECT * FROM ClassesHabilidades

-- Somente uma ou mais colunas da tabela
SELECT Nome FROM Classes
SELECT Nome, Descricao FROM Classes
-- Consultas com condicoes especificas
SELECT Nome, Descricao FROM Classes WHERE IdClasse = 3

SELECT * FROM Personagens INNER JOIN Classes ON Personagens.IdClasse = Classes.IdClasse

SELECT Personagens.Apelido, Classes.Nome
FROM Personagens
INNER JOIN Classes
ON Personagens.IdClasse = Classes.IdClasse

SELECT Personagens.Apelido, Usuarios.Email
FROM Personagens
INNER JOIN Usuarios
ON Personagens.IdClasse = Usuarios.IdUsuario

--DCL - Controle

CREATE LOGIN Aphonso WITH PASSWORD = '12345a'

CREATE USER Aphonso FOR LOGIN Aphonso
GRANT SELECT TO Aphonso


-- Apagar database
DROP DATABASE SekiroDB






	
	
	
	
	




