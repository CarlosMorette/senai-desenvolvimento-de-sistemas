USE InLock_Games_Manha;
GO

SELECT * FROM Usuario;
SELECT * FROM Estudio;

-- Listar todos os jogos e seus respectivos est�dios
SELECT Jogo.NomeJogo, Jogo.DataLancamento, Jogo.Valor, Estudio.NomeEstudio FROM Jogo
INNER JOIN Estudio ON Jogo.IdEstudio = Estudio.IdEstudio

-- Buscar e trazer na lista todos os est�dios, mesmo que eles n�o contenham nenhum jogo de refer�ncia
SELECT * FROM Estudio
INNER JOIN Jogo ON Estudio.IdEstudio = Jogo.IdEstudio
WHERE IdJogo = 1

-- Buscar um usu�rio por email e senha
SELECT Usuario.Email, Usuario.Senha, Usuario.IdTipoUsuario FROM Usuario
WHERE (Email = 'admin@admin.com') AND( Senha = 'admin')

-- Buscar um jogo por IdJogo
SELECT * FROM Jogo
WHERE IdJogo = 1

-- Buscar um est�dio por IdEstudio
SELECT * FROM Estudio
WHERE IdEstudio = 1