CREATE DATABASE  TP_GRUPO55_BD2;
COLLATE Latin1_General_CI_AI;

GO

USE TP_GRUPO55_BD2;
GO

-- ==============================================
--                   TABLAS
-- ==============================================


CREATE TABLE Pacientes (
    IDPaciente INT PRIMARY KEY IDENTITY (1,1),
    DNIPaciente INT NOT NULL UNIQUE,
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Sexo CHAR(1),
    GrupoSanguineo VARCHAR(8) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    Celular VARCHAR(20) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    Provincia VARCHAR(100) NOT NULL,
    CodigoPostal SMALLINT NOT NULL
);

CREATE TABLE Medicos (
    IDMedico INT PRIMARY KEY IDENTITY (1,1),
    Nombres VARCHAR(50) NOT NULL,
    Apellidos VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Especialidades (
    IDEspecialidad INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR(100) NOT NULL UNIQUE 
);

CREATE TABLE Medico_Especialidad (
    IDMedico INT NOT NULL,
    IDEspecialidad INT NOT NULL,
    PRIMARY KEY (IDMedico, IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidades(IDEspecialidad)
);


CREATE TABLE Estado_Turnos (
    IDEstadoTurno INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR(40) NOT NULL --("Confirmado", "Cancelado", "Pendiente", "Ausente")
);

CREATE TABLE Turnos (
    IDTurno INT PRIMARY KEY IDENTITY (1,1),
    IDPaciente INT NOT NULL,
    FechaTurno DATE NOT NULL,
    HoraTurno TIME NOT NULL,
    IDEspecialidad INT NOT NULL,
    IDMedico INT NOT NULL,
    IDEstadoTurno INT NOT NULL,
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidades(IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDEstadoTurno) REFERENCES Estado_Turnos(IDEstadoTurno)
);



CREATE TABLE Historia_Clinica (
    IDHistoriaClinica INT PRIMARY KEY IDENTITY (1,1),
    IDPaciente INT NOT NULL,
    FechaAtencion DATE DEFAULT GETDATE(),
    IDEspecialidad INT NOT NULL,
    IDMedico INT NOT NULL,
    Motivo VARCHAR(1000) NOT NULL,
    Diagnostico VARCHAR(1000) NOT NULL,
    Evolucion VARCHAR(2000) NOT NULL,
	CrearAlertaSeguimiento CHAR(2) NOT NULL DEFAULT 'NO',
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidades(IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico)
);



CREATE TABLE Estudios (
    IDEstudio INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Estudios_Indicados (
    IDPaciente INT NOT NULL,
    FechaEstudio DATE NOT NULL,
    IDEstudio INT NOT NULL,
    IDEspecialidad INT NOT NULL,
    IDMedico INT NOT NULL,
    PRIMARY KEY (IDPaciente, FechaEstudio, IDEstudio),
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidades(IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDEstudio) REFERENCES Estudios(IDEstudio)
);

CREATE TABLE Medicamentos (
    IDMedicamento INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Medicamentos_Indicados (
    IDPaciente INT NOT NULL,
    FechaReceta DATE NOT NULL,
    IDMedicamento INT NOT NULL,
    IDEspecialidad INT NOT NULL,
    IDMedico INT NOT NULL,
    Cantidad INT NOT NULL,
    PRIMARY KEY (IDPaciente, FechaReceta, IDMedicamento),
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente),
    FOREIGN KEY (IDEspecialidad) REFERENCES Especialidades(IDEspecialidad),
    FOREIGN KEY (IDMedico) REFERENCES Medicos(IDMedico),
    FOREIGN KEY (IDMedicamento) REFERENCES Medicamentos(IDMedicamento)
);

CREATE TABLE Alertas_Seguimiento (
    IDAlerta INT PRIMARY KEY IDENTITY (1,1),
    IDPaciente INT NOT NULL,
    FechaGeneracion DATE DEFAULT GETDATE(),
    Mensaje VARCHAR(255) NOT NULL,
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente)
);

CREATE TABLE Recordatorios_Enviados (
    IDRecordatorio INT PRIMARY KEY IDENTITY(1,1),
    IDPaciente INT NOT NULL,
    FechaEnvio DATE DEFAULT GETDATE(),
    MedioDeComunicacion VARCHAR(50) NOT NULL, -- 'EMAIL' o 'SMS'
    Mensaje VARCHAR(400) NOT NULL,
    FOREIGN KEY (IDPaciente) REFERENCES Pacientes(IDPaciente)
);














--DROP TABLE Recordatorios_Enviados;