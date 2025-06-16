USE TP_GRUPO55_BD2;
GO
SET DATEFORMAT 'YMD'
GO

INSERT INTO Pacientes (DNIPaciente, Nombres, Apellidos, FechaNacimiento, Sexo, GrupoSanguineo, Email, Telefono, Celular, Direccion, Ciudad, Provincia, CodigoPostal) 
VALUES (12345678, 'Juan', 'Pérez', '1985-02-10', 'M', 'O+', 'juan.perez@email.com', '1122334455', '1199887766', 'Calle Falsa 123', 'Buenos Aires', 'Buenos Aires', 1406),
       (87654321, 'María', 'Gómez', '1990-07-20', 'F', 'A-', 'maria.gomez@email.com', '1133445566', '1100223344', 'Av. Siempre Viva 742', 'Córdoba', 'Córdoba', 5000),
       (45678912, 'Carlos', 'Fernández', '1978-05-12', 'M', 'B+', 'carlos.fernandez@email.com', '1144778899', '1133221144', 'Av. Corrientes 3000', 'Buenos Aires', 'Buenos Aires', 1043),
       (23456789, 'Ana', 'Ramírez', '1982-09-25', 'F', 'AB-', 'ana.ramirez@email.com', '1166554433', '1177889922', 'Calle Lavalle 1500', 'Rosario', 'Santa Fe', 2000),
       (34567891, 'Pedro', 'Martínez', '2001-01-15', 'M', 'O-', 'pedro.martinez@email.com', '1188996655', '1155223344', 'Av. Belgrano 400', 'Mendoza', 'Mendoza', 5500),
       (56789123, 'Laura', 'López', '1995-03-18', 'F', 'A+', 'laura.lopez@email.com', '1199776622', '1188554411', 'San Martín 999', 'Neuquén', 'Neuquén', 8300),
       (67891234, 'Sergio', 'González', '1972-07-07', 'M', 'B-', 'sergio.gonzalez@email.com', '1111223344', '1133998877', 'Pueyrredón 210', 'Salta', 'Salta', 4400),
       (78912345, 'Valeria', 'Suárez', '1989-12-29', 'F', 'AB+', 'valeria.suarez@email.com', '1177665522', '1100997766', 'Calle Maipú 125', 'Tucumán', 'Tucumán', 4000),
       (89123456, 'Martín', 'Díaz', '1993-06-14', 'M', 'O+', 'martin.diaz@email.com', '1122993344', '1199667744', 'Av. Sarmiento 1600', 'La Plata', 'Buenos Aires', 1900),
       (91234567, 'Gabriela', 'Molina', '1986-11-03', 'F', 'A-', 'gabriela.molina@email.com', '1133115522', '1166443322', 'Av. Callao 450', 'Santa Fe', 'Santa Fe', 3000),
       (10123456, 'Ricardo', 'Vega', '1980-04-05', 'M', 'A+', 'ricardo.vega@email.com', '1144556677', '1199223344', 'Av. Mitre 321', 'Mar del Plata', 'Buenos Aires', 7600),
       (11123457, 'Camila', 'Rojas', '1992-08-19', 'F', 'O-', 'camila.rojas@email.com', '1122993344', '1177668855', 'Calle San Juan 112', 'Santa Rosa', 'La Pampa', 6300),
       (12123458, 'Diego', 'Castro', '1987-03-11', 'M', 'B+', 'diego.castro@email.com', '1133445577', '1188554411', 'Av. Alem 920', 'San Juan', 'San Juan', 5400),
       (13123459, 'Patricia', 'Luna', '1991-12-07', 'F', 'A-', 'patricia.luna@email.com', '1199665522', '1100997766', 'Av. Colon 230', 'Córdoba', 'Córdoba', 5000),
       (14123450, 'Esteban', 'Morales', '1975-06-22', 'M', 'AB+', 'esteban.morales@email.com', '1155667788', '1133998877', 'Calle Lavalle 140', 'Rosario', 'Santa Fe', 2000),
       (15123451, 'Silvia', 'Herrera', '1983-09-03', 'F', 'O+', 'silvia.herrera@email.com', '1188996655', '1155223344', 'Av. Belgrano 500', 'Mendoza', 'Mendoza', 5500),
       (16123452, 'Luis', 'Ortiz', '2000-05-25', 'M', 'B-', 'luis.ortiz@email.com', '1177665522', '1166443322', 'Av. Callao 450', 'La Plata', 'Buenos Aires', 1900),
       (17123453, 'Micaela', 'Ruiz', '1994-11-30', 'F', 'A+', 'micaela.ruiz@email.com', '1122334455', '1199887766', 'Calle Falsa 123', 'Buenos Aires', 'Buenos Aires', 1406),
       (18123454, 'Gonzalo', 'Martínez', '1988-02-15', 'M', 'O-', 'gonzalo.martinez@email.com', '1144778899', '1133221144', 'Av. Corrientes 3000', 'Buenos Aires', 'Buenos Aires', 1043),
       (19123455, 'Carolina', 'Gutiérrez', '1996-07-29', 'F','AB-', 'carolina.gutierrez@email.com', '1166554433', '1177889922', 'Calle Lavalle 1500', 'Rosario', 'Santa Fe', 2000);



INSERT INTO Medicos (Nombres, Apellidos, Email, Telefono) VALUES
('Carlos', 'Fernández', 'carlos.fernandez@email.com', '1155667788'),
('Lucía', 'Martínez', 'lucia.martinez@email.com', '1188776655'),
('Fernando', 'Alonso', 'fernando.alonso@email.com', '1199665522'),
('Patricia', 'Sánchez', 'patricia.sanchez@email.com', '1122334455'),
('Javier', 'Méndez', 'javier.mendez@email.com', '1133445566'),
('Sofía', 'López', 'sofia.lopez@email.com', '1144778899'),
('Diego', 'Gutiérrez', 'diego.gutierrez@email.com', '1199223344'),
('Valeria', 'Ruiz', 'valeria.ruiz@email.com', '1177665522'),
('Esteban', 'Morales', 'esteban.morales@email.com', '1188554411'),
('Martina', 'Herrera', 'martina.herrera@email.com', '1166443322');


INSERT INTO Especialidades (Nombre) VALUES
('Cardiología'),
('Dermatología'),
('Neurología'),
('Pediatría'),
('Oftalmología'),
('Gastroenterología'),
('Oncología'),
('Endocrinología'),
('Psiquiatría'),
('Urología'),
('Medico Clinico');


INSERT INTO Estado_Turnos (Nombre) VALUES
('Pendiente'),
('Confirmado'),
('Ausente'),
('Cancelado');

INSERT INTO Turnos (IDPaciente, FechaTurno, HoraTurno, IDEspecialidad, IDMedico, IDEstadoTurno) VALUES
(1, '2025-06-08', '10:00', 1, 1, 1),
(2, '2025-06-09', '14:30', 2, 2, 2),
(3, '2025-06-10', '09:15', 3, 3, 1),
(4, '2025-06-11', '12:45', 4, 4, 3),
(5, '2025-06-12', '16:00', 5, 5, 2),
(6, '2025-06-13', '08:00', 6, 6, 1),
(7, '2025-06-14', '11:30', 7, 7, 2),
(8, '2025-06-15', '15:45', 8, 8, 3),
(9, '2025-06-16', '10:15', 9, 9, 1),
(10, '2025-06-17', '13:00', 10, 10, 2),
(11, '2025-06-18', '09:30', 2, 1, 1),
(12, '2025-06-19', '14:45', 3, 2, 3),
(13, '2025-06-20', '17:00', 4, 3, 2),
(14, '2025-06-21', '08:15', 5, 4, 1),
(15, '2025-06-22', '12:30', 6, 5, 3),
(16, '2025-06-23', '16:45', 7, 6, 2),
(17, '2025-06-24', '09:00', 8, 7, 1),
(18, '2025-06-25', '14:00', 9, 8, 3),
(19, '2025-06-26', '11:15', 10, 9, 2),
(20, '2025-06-27', '18:30', 1, 10, 1);


INSERT INTO Medico_Especialidad (IDMedico, IDEspecialidad) VALUES
(1, 1), -- Carlos Fernández - Cardiología
(2, 2), -- Lucía Martínez - Dermatología
(3, 3), -- Fernando Alonso - Neurología
(4, 4), -- Patricia Sánchez - Pediatría
(5, 5), -- Javier Méndez - Oftalmología
(6, 6), -- Sofía López - Gastroenterología
(7, 7), -- Diego Gutiérrez - Oncología
(8, 8), -- Valeria Ruiz - Endocrinología
(9, 9), -- Esteban Morales - Psiquiatría
(10, 10), -- Martina Herrera - Urología
(1, 6), -- Carlos Fernández - Gastroenterología
(2, 7), -- Lucía Martínez - Oncología
(3, 8), -- Fernando Alonso - Endocrinología
(4, 9), -- Patricia Sánchez - Psiquiatría
(5, 10), -- Javier Méndez - Urología
(6, 11); --Sofía López - Medica Clinica



INSERT INTO Estudios (Nombre) VALUES
('Radiografía de tórax'),
('Tomografía cerebral'),
('Ecografía abdominal'),
('Resonancia magnética'),
('Electrocardiograma'),
('Prueba de esfuerzo'),
('Colonoscopía'),
('Endoscopía digestiva'),
('Densitometría ósea'),
('Hemograma completo'),
('Test de función pulmonar'),
('Perfil lipídico'),
('Prueba de glucosa'),
('Cultivo de orina'),
('Examen de tiroides'),
('Prueba de alergias'),
('Electroencefalograma'),
('Ecocardiografía'),
('Test de intolerancia alimentaria'),
('Examen de sangre básica');

INSERT INTO Medicamentos (Nombre) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina'),
('Omeprazol'),
('Salbutamol'),
('Metformina'),
('Atorvastatina'),
('Losartán'),
('Aspirina'),
('Diazepam'),
('Ranitidina'),
('Prednisona'),
('Levotiroxina'),
('Clonazepam'),
('Tramadol'),
('Azitromicina'),
('Doxiciclina'),
('Captopril'),
('Cetirizina'),
('Naproxeno');

INSERT INTO Estudios_Indicados (IDPaciente, FechaEstudio, IDEstudio, IDEspecialidad, IDMedico) VALUES
(1, '2025-06-08', 1, 1, 1),
(2, '2025-06-09', 2, 2, 2),
(3, '2025-06-10', 3, 3, 3),
(4, '2025-06-11', 4, 4, 4),
(5, '2025-06-12', 5, 5, 5),
(6, '2025-06-13', 6, 6, 6),
(7, '2025-06-14', 7, 7, 7),
(8, '2025-06-15', 8, 8, 8),
(9, '2025-06-16', 9, 9, 9),
(10, '2025-06-17', 10, 10, 10),
(11, '2025-06-18', 11, 1, 1),
(12, '2025-06-19', 12, 2, 2),
(13, '2025-06-20', 13, 3, 3),
(14, '2025-06-21', 14, 4, 4),
(15, '2025-06-22', 15, 5, 5);


INSERT INTO Medicamentos_Indicados (IDPaciente, FechaReceta, IDMedicamento, IDEspecialidad, IDMedico, Cantidad) VALUES
(1, '2025-06-08', 1, 1, 1, 2),
(2, '2025-06-09', 2, 2, 2, 1),
(3, '2025-06-10', 3, 3, 3, 3),
(4, '2025-06-11', 4, 4, 4, 1),
(5, '2025-06-12', 5, 5, 5, 2),
(6, '2025-06-13', 6, 6, 6, 1),
(7, '2025-06-14', 7, 7, 7, 3),
(8, '2025-06-15', 8, 8, 8, 2),
(9, '2025-06-16', 9, 9, 9, 1),
(10, '2025-06-17', 10, 10, 10, 2),
(11, '2025-06-18', 11, 1, 1, 1),
(12, '2025-06-19', 12, 2, 2, 3),
(13, '2025-06-20', 13, 3, 3, 2),
(14, '2025-06-21', 14, 4, 4, 1),
(15, '2025-06-22', 15, 5, 5, 3);

INSERT INTO Historia_Clinica (IDPaciente, FechaAtencion, IDEspecialidad, IDMedico, Motivo, Diagnostico, Evolucion) VALUES
(1, '2025-06-08', 1, 1, 'Dolor de pecho', 'Angina de pecho', 'Se indica reposo y tratamiento farmacológico'),
(2, '2025-06-09', 2, 2, 'Erupción en la piel', 'Dermatitis alérgica', 'Se prescriben antihistamínicos y cremas tópicas'),
(3, '2025-06-10', 3, 3, 'Dolores de cabeza frecuentes', 'Migraña', 'Tratamiento sintomático y recomendaciones de estilo de vida'),
(4, '2025-06-11', 4, 4, 'Fiebre y tos persistente', 'Bronquitis', 'Se recomienda antibiótico y control en una semana'),
(5, '2025-06-12', 5, 5, 'Disminución de visión', 'Miopía progresiva', 'Se indica uso de lentes correctivos'),
(6, '2025-06-13', 6, 6, 'Dolor abdominal', 'Gastritis crónica', 'Cambio en dieta y tratamiento con omeprazol'),
(7, '2025-06-14', 7, 7, 'Pérdida de peso inexplicable', 'Cáncer gástrico', 'Remisión a oncología para tratamiento'),
(8, '2025-06-15', 8, 8, 'Fatiga extrema', 'Hipotiroidismo', 'Tratamiento con levotiroxina y seguimiento endocrino'),
(9, '2025-06-16', 9, 9, 'Insomnio persistente', 'Ansiedad crónica', 'Terapia psicológica y fármacos según evolución'),
(10, '2025-06-17', 10, 10, 'Dolor al orinar', 'Infección urinaria', 'Tratamiento antibiótico y aumento de líquidos'),
(11, '2025-06-18', 1, 1, 'Palpitaciones irregulares', 'Arritmia leve', 'Electrocardiograma y seguimiento cardiológico'),
(12, '2025-06-19', 2, 2, 'Enrojecimiento cutáneo', 'Psoriasis', 'Crema inmunosupresora y revisión dermatológica'),
(13, '2025-06-20', 3, 3, 'Pérdida de coordinación', 'Neuritis óptica', 'Terapia neurológica y examen adicional'),
(14, '2025-06-21', 4, 4, 'Dolor en oído izquierdo', 'Otitis media', 'Antibiótico y analgésico según respuesta'),
(15, '2025-06-22', 5, 5, 'Cansancio ocular', 'Astigmatismo leve', 'Uso de lentes con corrección especializada'),
(16, '2025-06-23', 6, 6, 'Diarrea persistente', 'Síndrome de intestino irritable', 'Tratamiento dietético y probióticos'),
(17, '2025-06-24', 7, 7, 'Molestias estomacales', 'Úlcera gástrica', 'Tratamiento con inhibidores de ácido'),
(18, '2025-06-25', 8, 8, 'Sudoración excesiva', 'Hipertiroidismo', 'Control endocrinológico y ajuste terapéutico'),
(19, '2025-06-26', 9, 9, 'Ataques de pánico', 'Trastorno de ansiedad', 'Psicoterapia y seguimiento psiquiátrico'),
(20, '2025-06-27', 10, 10, 'Dolor lumbar', 'Cálculos renales', 'Tratamiento farmacológico y control periódico');
