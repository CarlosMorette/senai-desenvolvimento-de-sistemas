USE InLock_Games_Manha;

-- Alimentando as tabelas
INSERT INTO TipoUsuario(Titulo)
VALUES ('Administrador'),
	   ('Cliente')
GO

INSERT INTO Usuario(Email,Senha,IdTipoUsuario)
VALUES ('admin@admin.com', 'admin', 1),
       ('cliente@cliente.com', 'cliente', 2)
GO

INSERT INTO Estudio(NomeEstudio)
VALUES ('Blizzard'),
	   ('Rockstar Studios'),
	   ('Square Enix')
GO

INSERT INTO Jogo(NomeJogo, Descricao, DataLancamento, Valor, IdEstudio)
VALUES ('Diablo 3', ' � um jogo que cont�m bastante a��o e �
viciante, seja voc� um novato ou um f�', '2012-05-15', 99.00, 1),
	   ('Red Dead Redemption II', 'jogo eletr�nico de a��o-aventura western', '2018-10-26', 120, 2)
GO

SELECT * FROM TipoUsuario;
SELECT * FROM Usuario;
SELECT * FROM Estudio;
SELECT * FROM Jogo;