USE TP_GRUPO55_BD2;

--1. Generar Alertas para Seguimientos Médicos de pacientes

-- Trigger para generar alerta cuando se inserte una consulta en Historia_Clinica
CREATE OR ALTER TRIGGER GenerarAlertaSeguimiento ON Historia_Clinica
AFTER INSERT
AS
BEGIN
    DECLARE @CrearAlertaSeguimiento CHAR(2)
    DECLARE @NombrePaciente VARCHAR(50)
    DECLARE @ApellidoPaciente VARCHAR(50)
    DECLARE @DNIPaciente INT
    DECLARE @IDPaciente INT

    -- Obtengo los valores de la fila insertada
    SELECT @CrearAlertaSeguimiento = CrearAlertaSeguimiento, 
           @IDPaciente = IDPaciente
    FROM inserted;

    -- Obtengo los datos del paciente
    SELECT @NombrePaciente = Nombres, 
           @ApellidoPaciente = Apellidos, 
           @DNIPaciente = DNIPaciente
    FROM Pacientes
    WHERE IDPaciente = @IDPaciente;

    -- Verificación y creación de alerta
    IF @CrearAlertaSeguimiento = 'SI'
    BEGIN
        INSERT INTO Alertas_Seguimiento (IDPaciente, Mensaje)
        VALUES (@IDPaciente, 'Se recomienda seguimiento médico en las próximas semanas.')
		PRINT 'SE CREO ALERTA DE SEGUIMIENTO PARA EL PACIENTE: ' + @NombrePaciente + ' ' + @ApellidoPaciente + ', DNI: ' + CAST(@DNIPaciente AS VARCHAR(10));
    END
    ELSE
    BEGIN
        PRINT 'PARA EL PACIENTE ' + @NombrePaciente + ' ' + @ApellidoPaciente  + ', DNI: ' + CAST(@DNIPaciente AS VARCHAR(10)) + ', NO SE CREARON ALERTAS DE SEGUIMIENTO.';
    END

END;--FINALIZA EL TRIGGER


--MUESTRO LAS TABLAS
SELECT * FROM Pacientes
SELECT * FROM Historia_Clinica
SELECT * FROM Alertas_Seguimiento

--ACA NO SE CREA EL ALERTA DE SEGUIMIENTO
INSERT INTO Historia_Clinica(IDPaciente, IDEspecialidad, IDMedico, Motivo, Diagnostico, Evolucion)
VALUES (1, 10, 10, 'Dolor lumbar', 'Cálculos renales', 'Tratamiento farmacológico y seguimiento');

--ACA SI SE CREA EL ALERTA DE SEGUIMIENTO
INSERT INTO Historia_Clinica(IDPaciente, IDEspecialidad, IDMedico, Motivo, Diagnostico, Evolucion, CrearAlertaSeguimiento)
VALUES (2, 10, 10, 'Dolor lumbar', 'Cálculos renales', 'Tratamiento farmacológico y seguimiento', 'SI');


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--2. Enviar Recordatorios de Citas

CREATE OR ALTER PROCEDURE EnviarRecordatorios
AS
BEGIN
    -- Obtengo la fecha de los turnos programados para mañana
	DECLARE @FechaTurno DATE = CAST(GETDATE() + 1 AS DATE);
	
    -- Inserto recordatorio por Email 
    INSERT INTO Recordatorios_Enviados (IDPaciente, MedioDeComunicacion, Mensaje)
    SELECT P.IDPaciente, 'Email', 
           'Estimado ' + P.Nombres + ' ' + P.Apellidos + ', tiene un turno el ' + 
           CONVERT(VARCHAR, T.FechaTurno, 103) + ' a las ' + CONVERT(VARCHAR, T.HoraTurno, 108) + 
           ' con el médico ' + M.Nombres + ' en ' + E.Nombre + '. '
           + 'Le hemos enviado este recordatorio a su correo: ' + P.Email + '.'
    FROM Turnos T
    INNER JOIN Pacientes P ON T.IDPaciente = P.IDPaciente
    INNER JOIN Medicos M ON T.IDMedico = M.IDMedico
    INNER JOIN Especialidades E ON T.IDEspecialidad = E.IDEspecialidad
    WHERE T.FechaTurno = @FechaTurno;

    -- Inserto recordatorio por WPP
    INSERT INTO Recordatorios_Enviados(IDPaciente, MedioDeComunicacion, Mensaje)
    SELECT P.IDPaciente, 'WPP', 
           'Recuerde su turno el ' + CONVERT(VARCHAR, T.FechaTurno, 103) + 
           ' a las ' + CONVERT(VARCHAR, T.HoraTurno, 108) + '. '
           + 'Le enviamos este mensaje a su celular: ' + P.Celular + '.'
    FROM Turnos T
    INNER JOIN Pacientes P ON T.IDPaciente = P.IDPaciente
    WHERE T.FechaTurno = @FechaTurno;

    -- Muestro mensaje de confirmación en consola
    PRINT 'Recordatorios enviados correctamente para los turnos del ' + CONVERT(VARCHAR, @FechaTurno, 103);
END;

--VEO LOS TURNOS QUE TENGO PARA MAÑANA
SELECT * FROM Turnos;
SELECT * FROM Pacientes;
--CHEQUEO LA TABLA "Recordatorios_Enviados"
SELECT * FROM Recordatorios_Enviados;
--EJECUTO EL PROCEDIMIENTO 
EXEC EnviarRecordatorios



----------------------------------------------------------------------------------------------
--Vista de Recordatorio de Turnos enviados a los pacientes (Para ver con mas detalles los datos de los pacientes que se le enviaron recordatosios)
CREATE OR ALTER VIEW Vista_Recordatorios_Pacientes AS
SELECT 
     R.IDRecordatorio, 
	 P.IDPaciente, 
	 P.Nombres, 
	 P.Apellidos, 
	 P.Email, 
	 P.Celular, 
	 R.MedioDeComunicacion, 
	 R.Mensaje
FROM Recordatorios_Enviados R
INNER JOIN Pacientes P ON R.IDPaciente = P.IDPaciente;

-- Ver los recordatorios generados
SELECT * FROM Vista_Recordatorios_Pacientes;--VISTA
SELECT * FROM Recordatorios_Enviados;--TABLA


--------------------------------------------------------------------------------------------------------------------------
--Vista de proximos turnos
CREATE OR ALTER VIEW Vista_Turnos_Proximos AS
SELECT 
    T.IDTurno,
    P.IDPaciente,
    P.Nombres + ' ' + P.Apellidos AS NombreApellidoPaciente,
    P.Email,
    P.Celular,
    T.FechaTurno,
    CONVERT(VARCHAR(5), T.HoraTurno, 108) AS HoraTurno,
    M.Nombres + ' ' + M.Apellidos AS NombreApellidoMedico,
    E.Nombre AS Especialidad,
    ET.Nombre AS EstadoTurno
FROM Turnos T
INNER JOIN Pacientes P ON T.IDPaciente = P.IDPaciente
INNER JOIN Medicos M ON T.IDMedico = M.IDMedico
INNER JOIN Especialidades E ON T.IDEspecialidad = E.IDEspecialidad
INNER JOIN Estado_Turnos ET ON T.IDEstadoTurno = ET.IDEstadoTurno;

--Muestro la VISTA de Turnos proximos
SELECT * FROM Vista_Turnos_Proximos;
--Muestro si quiero ver un turno de una fecha  especifica
SELECT * FROM Vista_Turnos_Proximos
WHERE FechaTurno = '2025-06-15'; 





--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--3. Permite la exportación de Información (HISTORIA CLINICA)
CREATE OR ALTER PROCEDURE ObtenerHistoriaClinicaExportable (@IDPaciente INT)
AS
BEGIN
    SELECT 
        P.Nombres + ' ' + P.Apellidos AS 'Nombre y Apellido Paciente',
        P.Email, P.Celular, 
        H.FechaAtencion, H.Motivo, H.Diagnostico, H.Evolucion,
        M.Nombres + ' ' + M.Apellidos AS 'Nombre y Apellido Médico',
        E.Nombre AS 'Especialidad'
    FROM Historia_Clinica H
    INNER JOIN Pacientes P ON H.IDPaciente = P.IDPaciente
    INNER JOIN Medicos M ON H.IDMedico = M.IDMedico
    INNER JOIN Especialidades E ON H.IDEspecialidad = E.IDEspecialidad
    WHERE P.IDPaciente = @IDPaciente;
END;

--MUESTRO Vista_Informacion_Exportable 
EXEC ObtenerHistoriaClinicaExportable 5;



--VISTA DE INFORMACION DE TODOS LOS PACIENTES
CREATE OR ALTER VIEW Vista_Informacion_Exportable AS
SELECT 
    P.Nombres + ' ' + P.Apellidos AS 'Nombre y Apellido Paciente',
    P.Email, P.Celular, 
    H.FechaAtencion, H.Motivo, H.Diagnostico, H.Evolucion,
    M.Nombres + ' ' + M.Apellidos AS 'Nombre y Apellido Médico',
    E.Nombre AS 'Especialidad'
FROM Historia_Clinica H
INNER JOIN Pacientes P ON H.IDPaciente = P.IDPaciente
INNER JOIN Medicos M ON H.IDMedico = M.IDMedico
INNER JOIN Especialidades E ON H.IDEspecialidad = E.IDEspecialidad;

--MUESTRO Vista_Informacion_Exportable 
SELECT * FROM Vista_Informacion_Exportable;
SELECT * FROM Vista_Informacion_Exportable WHERE [Nombre y Apellido Paciente] = 'Camila Rojas';




-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--4. Historial de atencion por paciente
CREATE OR ALTER VIEW Vista_Historial_Paciente AS
SELECT H.IDHistoriaClinica, P.IDPaciente, P.Nombres, P.Apellidos, H.FechaAtencion, 
       E.Nombre AS 'Especialidad', M.Nombres + ', ' + M.Apellidos AS 'Nombre y Apellido Medico', H.Motivo, H.Diagnostico, H.Evolucion
FROM Historia_Clinica H
INNER JOIN Pacientes P ON H.IDPaciente = P.IDPaciente
INNER JOIN Especialidades E ON H.IDEspecialidad = E.IDEspecialidad
INNER JOIN Medicos M ON H.IDMedico = M.IDMedico;

--MUESTRO Vista_Historial_Paciente
SELECT * FROM Vista_Historial_Paciente WHERE IDPaciente=1;
SELECT * FROM Vista_Historial_Paciente;



----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--5. Historial de medicamentos indicados x paciente
CREATE OR ALTER PROCEDURE ObtenerHistorialMedicamentos (@IDPaciente INT = NULL)
AS
BEGIN
    SELECT 
        P.IDPaciente,
        P.Nombres + ', ' + P.Apellidos AS 'Nombre y Apellido Paciente',
        MI.FechaReceta,
        M.Nombre AS 'Medicamento',
        MI.Cantidad,
        E.Nombre AS 'Especialidad',
        Med.Nombres + ', ' + Med.Apellidos AS 'Nombre y Apellido Medico'
    FROM Medicamentos_Indicados MI
    INNER JOIN Pacientes P ON MI.IDPaciente = P.IDPaciente
    INNER JOIN Medicamentos M ON MI.IDMedicamento = M.IDMedicamento
    INNER JOIN Especialidades E ON MI.IDEspecialidad = E.IDEspecialidad
    INNER JOIN Medicos Med ON MI.IDMedico = Med.IDMedico
    WHERE @IDPaciente IS NULL OR MI.IDPaciente = @IDPaciente;
END;

--EJECUTO EL PROCEDIMIENTO
EXEC ObtenerHistorialMedicamentos;
EXEC ObtenerHistorialMedicamentos 5;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
--6. Borrar Historial medicamentos
CREATE OR ALTER PROCEDURE BorrarHistorialMedicamentos (@IDPaciente INT)
AS
BEGIN
    DELETE FROM Medicamentos_Indicados WHERE IDPaciente = @IDPaciente;
END;

--EJECUTO EL PROCEDIMIENTO0
EXEC BorrarHistorialMedicamentos @IDPaciente = 5;
--ME FIJO SI SE ELIMINO
EXEC ObtenerHistorialMedicamentos;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--7. Historial de estudios indicados x paciente
CREATE OR ALTER PROCEDURE ObtenerHistorialEstudios (@IDPaciente INT = NULL)
AS
BEGIN
    SELECT P.IDPaciente, P.Nombres + ', ' + P.Apellidos AS 'Nombre y Apellido Paciente',
           EI.FechaEstudio, E.Nombre AS 'Estudio', 
           Esp.Nombre AS 'Especialidad', Med.Nombres + ', ' +  Med.Apellidos AS 'Nombre y Apellido Medico'
    FROM Estudios_Indicados EI
    INNER JOIN Pacientes P ON EI.IDPaciente = P.IDPaciente
    INNER JOIN Estudios E ON EI.IDEstudio = E.IDEstudio
    INNER JOIN Especialidades Esp ON EI.IDEspecialidad = Esp.IDEspecialidad
    INNER JOIN Medicos Med ON EI.IDMedico = Med.IDMedico
    WHERE @IDPaciente IS NULL OR EI.IDPaciente = @IDPaciente;
END;

--EJECUTO PROCEDIMIENTO
EXEC ObtenerHistorialEstudios 5;
EXEC ObtenerHistorialEstudios;


----------------------------------------------------------------------------------------------------------------------------------------------------------------
--8. Borrar Historial ESTUDIOS
CREATE OR ALTER PROCEDURE BorrarHistorialEstudios (@IDPaciente INT)
AS
BEGIN
    DELETE FROM Estudios_Indicados WHERE IDPaciente = @IDPaciente;
END;

--EJECUTO EL PROCEDIMIENTO0
EXEC BorrarHistorialEstudios @IDPaciente = 1;
--ME FIJO SI SE ELIMINO
EXEC ObtenerHistorialEstudios;



--------------------------------------------------------------------------------------------------------------------------------------------------------------
--9. Trigger IDEstadoTurno
CREATE OR ALTER TRIGGER trg_ActualizarFechaUltimaVisita
ON Turnos
AFTER UPDATE
AS
BEGIN
    -- cuando pongo que asistió cambia el valor de la tabla para poder guardar bien la información de GETDATE()
    UPDATE Pacientes
    SET FechaUltimaVisita = CONVERT(VARCHAR(50), GETDATE(), 120) -- Ej: 2025-06-17 22:35:00
    WHERE IDPaciente IN (
        SELECT i.IDPaciente
        FROM inserted i
        JOIN Estado_Turnos e ON i.IDEstadoTurno = e.IDEstadoTurno
        WHERE e.Nombre = 'Asistido'
    );

    -- cuando pongo cualquier otro estado va a guardar el estado que corresponda con lo escrito, ya sea pendiente, confirmado, canceelado o reprogramado
    UPDATE Pacientes
    SET FechaUltimaVisita = e.Nombre
    FROM Pacientes p
    INNER JOIN inserted i ON p.IDPaciente = i.IDPaciente
    INNER JOIN Estado_Turnos e ON i.IDEstadoTurno = e.IDEstadoTurno
    WHERE e.Nombre IN ('Pendiente', 'Confirmado', 'Cancelado', 'Reprogramado');
END;



-- contenido actualizado en la tabla Pacientes
SELECT * 
FROM Pacientes
WHERE IDPaciente = (
    SELECT IDPaciente FROM Turnos WHERE IDTurno = 1
);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------
--10. Procedimiento sp_ActualizarEstadoTurno
CREATE OR ALTER PROCEDURE sp_ActualizarEstadoTurno
    @IDTurno INT,
    @NuevoEstadoNombre VARCHAR(40)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @NuevoEstadoID INT;
    SELECT @NuevoEstadoID = IDEstadoTurno FROM Estado_Turnos WHERE Nombre = @NuevoEstadoNombre;

    IF @NuevoEstadoID IS NULL
    BEGIN
        RAISERROR('Estado no válido', 16, 1);
        RETURN;
    END

    UPDATE Turnos
    SET IDEstadoTurno = @NuevoEstadoID
    WHERE IDTurno = @IDTurno;
END;


-- 1 = Pendiente
EXEC sp_ActualizarEstadoTurno @IDTurno = 1, @NuevoEstadoNombre = 'Pendiente';

-- 2 = Confirmado
EXEC sp_ActualizarEstadoTurno @IDTurno = 1, @NuevoEstadoNombre = 'Confirmado';

-- 3 = Asistido
EXEC sp_ActualizarEstadoTurno @IDTurno = 1, @NuevoEstadoNombre = 'Asistido';

-- 4 = Cancelado
EXEC sp_ActualizarEstadoTurno @IDTurno = 1, @NuevoEstadoNombre = 'Cancelado';

-- 5 = Reprogramado
EXEC sp_ActualizarEstadoTurno @IDTurno = 1, @NuevoEstadoNombre = 'Reprogramado';

-- estado de turno actual
SELECT IDTurno, IDEstadoTurno
FROM Turnos
WHERE IDTurno = 1;