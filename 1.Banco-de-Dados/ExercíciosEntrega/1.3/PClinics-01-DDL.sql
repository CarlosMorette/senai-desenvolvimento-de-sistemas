CREATE DATABASE PClinics_Manha;

USE PClinics_Manha;

CREATE TABLE Clinica(
	IdClinica INT PRIMARY KEY IDENTITY NOT NULL,
	RazaoSocial VARCHAR(200),
	Endereco VARCHAR(200)
);

CREATE TABLE Dono (
	IdDono INT PRIMARY KEY IDENTITY NOT NULL,
	Nome VARCHAR(200),
);

CREATE TABLE TipoPet(
	IdTipoPet INT PRIMARY KEY IDENTITY NOT NULL,
	Titulo VARCHAR(100),
);

CREATE TABLE Raca (
	IdRaca INT PRIMARY KEY IDENTITY NOT NULL,
	IdTipoPet INT FOREIGN KEY REFERENCES TipoPet (IdTipoPet),
	Titulo VARCHAR(200),
);

CREATE TABLE Veterinario (
	IdVet INT PRIMARY KEY IDENTITY NOT NULL,
	IdClinica INT FOREIGN KEY REFERENCES Clinica (IdClinica),
	Nome VARCHAR(200),
	CRMV INT,
);

CREATE TABLE Pet (
	IdPet INT PRIMARY KEY IDENTITY NOT NULL,
	IdDono INT FOREIGN KEY REFERENCES Dono (IdDono),
	IdRaca INT FOREIGN KEY REFERENCES Raca (IdRaca),
	Nome VARCHAR(100),
	Telefone BIGINT
);

CREATE TABLE Atendimento (
	IdAtendimento INT PRIMARY KEY IDENTITY NOT NULL,
	IdVet INT FOREIGN KEY REFERENCES Veterinario(IdVet),
	IdPet INT FOREIGN KEY REFERENCES Pet(IdPet),
	DataAtendimento DATE,
	Descricao VARCHAR(255),
);