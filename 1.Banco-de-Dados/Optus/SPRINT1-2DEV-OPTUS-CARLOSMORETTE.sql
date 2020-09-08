CREATE DATABASE Optus_Manha;

USE Optus_Manha;

-- DDL
CREATE TABLE TipoUsuario(
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo		  VARCHAR(200) NOT NULL
);

CREATE TABLE Usuarios(
	IdUsuario 	INT PRIMARY KEY IDENTITY,
	Nome 		VARCHAR(200) NOT NULL,
	IdTipoUsuario   INT FOREIGN KEY REFERENCES TipoUsuario(IdTipoUsuario)
);

CREATE TABLE Artistas(
	IdArtistas 	INT PRIMARY KEY IDENTITY,
	Nome		VARCHAR(200) NOT NULL,
);

CREATE TABLE Estilos(
	IdEstilo  INT PRIMARY KEY IDENTITY,
	Nome	  VARCHAR(200) NOT NULL
);

CREATE TABLE Albuns (
	IdAlbum 	INT PRIMARY KEY IDENTITY,
	IdArtista 	INT FOREIGN KEY REFERENCES Artistas(IdArtistas),
	IdEstilo 	INT FOREIGN KEY REFERENCES Estilos (IdEstilo),
	Nome 		VARCHAR(200),
	DataLancamento  DATE,
	QtdMinutos 	VARCHAR(200),
	Visualizacao 	VARCHAR(200),
);

-- DML
-- Inserir no m�nimo 5 dados em cada tabela
INSERT INTO TipoUsuario (Titulo)
VALUES	('Administrador'),
		('Comum'),
		('Vendedor'),
		('Comprador'),
		('Visitante');

INSERT INTO Usuarios(Nome,IdTipoUsuario)
VALUES	('Carlos',3),
		('Gustavo',4),
		('Alberto',2),
		('Robilson',1),
		('Custodio',5);

INSERT INTO Artistas(Nome)
VALUES	('Anitta'),
		('Gusttavo Lima'),
		('Bruno Mars'),
		('Katy Perry'),
		('Miley Cyrus');

INSERT INTO Estilos(Nome)
VALUES  ('Dance'),
		('Jazz'),
		('Pagode'),
		('Samba Rock'),
		('Rock');

INSERT INTO Albuns(IdArtista, IdEstilo,Nome, DataLancamento, QtdMinutos, Visualizacao)
VALUES (5,3,'Album bom',' 2020/05/21','30min', '1.5 bilhao'),
	   (2,4,'Gustavo do Samba','22/04/2020','20min', '1 bilhao'),
	   (3,2,'Bruno do Jazz','21/05/2020','15min', '2 bilhao'),
	   (1,5,'Anitta do Rock','05/01/2020','5min', '3 bilhao'),
	   (4,1,'Katy do Dance','10/02/2020','12min', '4 bilhao');

-- Alterar Nome de um Artista
UPDATE Artistas SET
	Nome='Gustavo Limonada'
WHERE IdArtistas=2;

-- Alterar um Tipo de Usuario
UPDATE TipoUsuario SET
	Titulo = 'Admilson'
WHERE IdTipoUsuario=1;

-- Alterar a Quantidade de visualiza��o de um �lbum
UPDATE Albuns SET
	Visualizacao= '300 bilhoes'
WHERE IdAlbum=5;

-- Apagar um �lbum
DELETE FROM Albuns
WHERE IdAlbum=5

-- DQL
-- Consultar dados
SELECT * FROM TipoUsuario;
SELECT * FROM Usuarios;
SELECT * FROM Artistas;
SELECT * FROM Estilos;
SELECT * FROM Albuns;

-- Consultas espec�ficas
-- Operacoes < > =

SELECT * FROM Albuns WHERE  IdAlbum = 1;
SELECT * FROM Albuns WHERE IdAlbum >= 4;


-- OR OU
SELECT Nome, QtdMinutos FROM Albuns
-- Data lan�amento null ou Localizacao null
WHERE (DataLancamento IS NULL) OR (Visualizacao IS NULL);

-- AND
SELECT * FROM Albuns
WHERE (IdEstilo = 2) AND (IdArtista = 3);


/* Coment�rio de Bloco */
-- Filtro de texto
SELECT IdArtistas, Nome FROM Artistas
WHERE Nome LIKE 'Gusta%'; -- M�todo de busca

-- Gusta% : Gusta no come�o da frase
-- %Gusta% : Gusta no meio da frase
-- %Gusta : Gusta no final da frase


-- Ordena��o
-- Ordenar por ordem alfab�tica
SELECT IdAlbum, Nome FROM Albuns
ORDER BY Nome;

-- Ordena��o crescente
SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos ASC;

-- Ordena��o decrescente
SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos DESC;

-- Count
-- Quantidade
SELECT COUNT(IdAlbum) FROM Albuns;

-- Exerc�cio
SELECT * FROM Albuns;
SELECT * FROM Artistas;
SELECT * FROM Estilos;
SELECT * FROM TipoUsuario;
SELECT * FROM Usuarios;

-- Selecione os albuns do mesmo artista
SELECT IdAlbum,Nome FROM Albuns WHERE IdArtista =3;

-- Com INNER JOIM (Jun��o)
SELECT * FROM Artistas INNER JOIN Albuns ON Artistas.IdArtistas = Albuns.IdArtista
Where Albuns.IdArtista = 2
GO


-- Selecionar os albuns lan�ados na mesma data
SELECT IdAlbum, Nome, DataLancamento FROM Albuns WHERE DataLancamento = '21/05/2020'

--COM INNER JOIN
-- Com o AS � uma outra maneira de mostrar o nome da coluna
SELECT Artistas.Nome AS NomeArtista, Albuns.Nome, Albuns.DataLancamento
FROM Artistas
INNER JOIN Albuns ON Artistas.IdArtistas = Albuns.IdArtista
WHERE DataLancamento ='21/05/2020';


-- Selecionar albuns e artistas e ordenar a data de lan�amento
SELECT IdArtista, Nome, DataLancamento FROM Albuns
ORDER BY DataLancamento DESC;

-- COM INNER JOIN
SELECT * FROM Albuns
INNER JOIN Artistas ON Albuns.IdArtista = Artistas.IdArtistas
ORDER BY DataLancamento DESC;

-- Selecionar os artistas do mesmo estilo musical
SELECT * FROM Albuns WHERE (IdArtista = 2) and (IdEstilo = 4);

-- COM INNER JOIN, USANDO 3 TABELAS
--SELECIONAR OS ARTISTAS DO MESMO ESTILO MUSICAL
SELECT Artistas.Nome, Estilos.Nome FROM Artistas
INNER JOIN Albuns ON Artistas.IdArtistas = Albuns.IdAlbum
INNER JOIN Estilos ON Artistas.IdArtistas = Estilos.IdEstilo
WHERE Estilos.IdEstilo = 1