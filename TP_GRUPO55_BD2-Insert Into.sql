USE TP_GRUPO55_BD2;
GO
SET DATEFORMAT 'YMD'
GO

INSERT INTO Pacientes (DNIPaciente, Nombres, Apellidos, FechaNacimiento, Sexo, GrupoSanguineo, Email, Telefono, Celular, Direccion, Ciudad, Provincia, CodigoPostal) 
VALUES (12345678, 'Juan', 'P�rez', '1985-02-10', 'M', 'O+', 'juan.perez@email.com', '1122334455', '1199887766', 'Calle Falsa 123', 'Buenos Aires', 'Buenos Aires', 1406),
       (87654321, 'Mar�a', 'G�mez', '1990-07-20', 'F', 'A-', 'maria.gomez@email.com', '1133445566', '1100223344', 'Av. Siempre Viva 742', 'C�rdoba', 'C�rdoba', 5000),
       (45678912, 'Carlos', 'Fern�ndez', '1978-05-12', 'M', 'B+', 'carlos.fernandez@email.com', '1144778899', '1133221144', 'Av. Corrientes 3000', 'Buenos Aires', 'Buenos Aires', 1043),
       (23456789, 'Ana', 'Ram�rez', '1982-09-25', 'F', 'AB-', 'ana.ramirez@email.com', '1166554433', '1177889922', 'Calle Lavalle 1500', 'Rosario', 'Santa Fe', 2000),
       (34567891, 'Pedro', 'Mart�nez', '2001-01-15', 'M', 'O-', 'pedro.martinez@email.com', '1188996655', '1155223344', 'Av. Belgrano 400', 'Mendoza', 'Mendoza', 5500),
       (56789123, 'Laura', 'L�pez', '1995-03-18', 'F', 'A+', 'laura.lopez@email.com', '1199776622', '1188554411', 'San Mart�n 999', 'Neuqu�n', 'Neuqu�n', 8300),
       (67891234, 'Sergio', 'Gonz�lez', '1972-07-07', 'M', 'B-', 'sergio.gonzalez@email.com', '1111223344', '1133998877', 'Pueyrred�n 210', 'Salta', 'Salta', 4400),
       (78912345, 'Valeria', 'Su�rez', '1989-12-29', 'F', 'AB+', 'valeria.suarez@email.com', '1177665522', '1100997766', 'Calle Maip� 125', 'Tucum�n', 'Tucum�n', 4000),
       (89123456, 'Mart�n', 'D�az', '1993-06-14', 'M', 'O+', 'martin.diaz@email.com', '1122993344', '1199667744', 'Av. Sarmiento 1600', 'La Plata', 'Buenos Aires', 1900),
       (91234567, 'Gabriela', 'Molina', '1986-11-03', 'F', 'A-', 'gabriela.molina@email.com', '1133115522', '1166443322', 'Av. Callao 450', 'Santa Fe', 'Santa Fe', 3000),
       (10123456, 'Ricardo', 'Vega', '1980-04-05', 'M', 'A+', 'ricardo.vega@email.com', '1144556677', '1199223344', 'Av. Mitre 321', 'Mar del Plata', 'Buenos Aires', 7600),
       (11123457, 'Camila', 'Rojas', '1992-08-19', 'F', 'O-', 'camila.rojas@email.com', '1122993344', '1177668855', 'Calle San Juan 112', 'Santa Rosa', 'La Pampa', 6300),
       (12123458, 'Diego', 'Castro', '1987-03-11', 'M', 'B+', 'diego.castro@email.com', '1133445577', '1188554411', 'Av. Alem 920', 'San Juan', 'San Juan', 5400),
       (13123459, 'Patricia', 'Luna', '1991-12-07', 'F', 'A-', 'patricia.luna@email.com', '1199665522', '1100997766', 'Av. Colon 230', 'C�rdoba', 'C�rdoba', 5000),
       (14123450, 'Esteban', 'Morales', '1975-06-22', 'M', 'AB+', 'esteban.morales@email.com', '1155667788', '1133998877', 'Calle Lavalle 140', 'Rosario', 'Santa Fe', 2000),
       (15123451, 'Silvia', 'Herrera', '1983-09-03', 'F', 'O+', 'silvia.herrera@email.com', '1188996655', '1155223344', 'Av. Belgrano 500', 'Mendoza', 'Mendoza', 5500),
       (16123452, 'Luis', 'Ortiz', '2000-05-25', 'M', 'B-', 'luis.ortiz@email.com', '1177665522', '1166443322', 'Av. Callao 450', 'La Plata', 'Buenos Aires', 1900),
       (17123453, 'Micaela', 'Ruiz', '1994-11-30', 'F', 'A+', 'micaela.ruiz@email.com', '1122334455', '1199887766', 'Calle Falsa 123', 'Buenos Aires', 'Buenos Aires', 1406),
       (18123454, 'Gonzalo', 'Mart�nez', '1988-02-15', 'M', 'O-', 'gonzalo.martinez@email.com', '1144778899', '1133221144', 'Av. Corrientes 3000', 'Buenos Aires', 'Buenos Aires', 1043),
       (19123455, 'Carolina', 'Guti�rrez', '1996-07-29', 'F','AB-', 'carolina.gutierrez@email.com', '1166554433', '1177889922', 'Calle Lavalle 1500', 'Rosario', 'Santa Fe', 2000);



INSERT INTO Medicos (Nombres, Apellidos, Email, Telefono) VALUES
('Carlos', 'Fern�ndez', 'carlos.fernandez@email.com', '1155667788'),
('Luc�a', 'Mart�nez', 'lucia.martinez@email.com', '1188776655'),
('Fernando', 'Alonso', 'fernando.alonso@email.com', '1199665522'),
('Patricia', 'S�nchez', 'patricia.sanchez@email.com', '1122334455'),
('Javier', 'M�ndez', 'javier.mendez@email.com', '1133445566'),
('Sof�a', 'L�pez', 'sofia.lopez@email.com', '1144778899'),
('Diego', 'Guti�rrez', 'diego.gutierrez@email.com', '1199223344'),
('Valeria', 'Ruiz', 'valeria.ruiz@email.com', '1177665522'),
('Esteban', 'Morales', 'esteban.morales@email.com', '1188554411'),
('Martina', 'Herrera', 'martina.herrera@email.com', '1166443322');


INSERT INTO Especialidades (Nombre) VALUES
('Cardiolog�a'),
('Dermatolog�a'),
('Neurolog�a'),
('Pediatr�a'),
('Oftalmolog�a'),
('Gastroenterolog�a'),
('Oncolog�a'),
('Endocrinolog�a'),
('Psiquiatr�a'),
('Urolog�a'),
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
(1, 1), -- Carlos Fern�ndez - Cardiolog�a
(2, 2), -- Luc�a Mart�nez - Dermatolog�a
(3, 3), -- Fernando Alonso - Neurolog�a
(4, 4), -- Patricia S�nchez - Pediatr�a
(5, 5), -- Javier M�ndez - Oftalmolog�a
(6, 6), -- Sof�a L�pez - Gastroenterolog�a
(7, 7), -- Diego Guti�rrez - Oncolog�a
(8, 8), -- Valeria Ruiz - Endocrinolog�a
(9, 9), -- Esteban Morales - Psiquiatr�a
(10, 10), -- Martina Herrera - Urolog�a
(1, 6), -- Carlos Fern�ndez - Gastroenterolog�a
(2, 7), -- Luc�a Mart�nez - Oncolog�a
(3, 8), -- Fernando Alonso - Endocrinolog�a
(4, 9), -- Patricia S�nchez - Psiquiatr�a
(5, 10), -- Javier M�ndez - Urolog�a
(6, 11); --Sof�a L�pez - Medica Clinica



INSERT INTO Estudios (Nombre) VALUES
('Radiograf�a de t�rax'),
('Tomograf�a cerebral'),
('Ecograf�a abdominal'),
('Resonancia magn�tica'),
('Electrocardiograma'),
('Prueba de esfuerzo'),
('Colonoscop�a'),
('Endoscop�a digestiva'),
('Densitometr�a �sea'),
('Hemograma completo'),
('Test de funci�n pulmonar'),
('Perfil lip�dico'),
('Prueba de glucosa'),
('Cultivo de orina'),
('Examen de tiroides'),
('Prueba de alergias'),
('Electroencefalograma'),
('Ecocardiograf�a'),
('Test de intolerancia alimentaria'),
('Examen de sangre b�sica');

INSERT INTO Medicamentos (Nombre) VALUES
('Paracetamol'),
('Ibuprofeno'),
('Amoxicilina'),
('Omeprazol'),
('Salbutamol'),
('Metformina'),
('Atorvastatina'),
('Losart�n'),
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
(1, '2025-06-08', 1, 1, 'Dolor de pecho', 'Angina de pecho', 'Se indica reposo y tratamiento farmacol�gico'),
(2, '2025-06-09', 2, 2, 'Erupci�n en la piel', 'Dermatitis al�rgica', 'Se prescriben antihistam�nicos y cremas t�picas'),
(3, '2025-06-10', 3, 3, 'Dolores de cabeza frecuentes', 'Migra�a', 'Tratamiento sintom�tico y recomendaciones de estilo de vida'),
(4, '2025-06-11', 4, 4, 'Fiebre y tos persistente', 'Bronquitis', 'Se recomienda antibi�tico y control en una semana'),
(5, '2025-06-12', 5, 5, 'Disminuci�n de visi�n', 'Miop�a progresiva', 'Se indica uso de lentes correctivos'),
(6, '2025-06-13', 6, 6, 'Dolor abdominal', 'Gastritis cr�nica', 'Cambio en dieta y tratamiento con omeprazol'),
(7, '2025-06-14', 7, 7, 'P�rdida de peso inexplicable', 'C�ncer g�strico', 'Remisi�n a oncolog�a para tratamiento'),
(8, '2025-06-15', 8, 8, 'Fatiga extrema', 'Hipotiroidismo', 'Tratamiento con levotiroxina y seguimiento endocrino'),
(9, '2025-06-16', 9, 9, 'Insomnio persistente', 'Ansiedad cr�nica', 'Terapia psicol�gica y f�rmacos seg�n evoluci�n'),
(10, '2025-06-17', 10, 10, 'Dolor al orinar', 'Infecci�n urinaria', 'Tratamiento antibi�tico y aumento de l�quidos'),
(11, '2025-06-18', 1, 1, 'Palpitaciones irregulares', 'Arritmia leve', 'Electrocardiograma y seguimiento cardiol�gico'),
(12, '2025-06-19', 2, 2, 'Enrojecimiento cut�neo', 'Psoriasis', 'Crema inmunosupresora y revisi�n dermatol�gica'),
(13, '2025-06-20', 3, 3, 'P�rdida de coordinaci�n', 'Neuritis �ptica', 'Terapia neurol�gica y examen adicional'),
(14, '2025-06-21', 4, 4, 'Dolor en o�do izquierdo', 'Otitis media', 'Antibi�tico y analg�sico seg�n respuesta'),
(15, '2025-06-22', 5, 5, 'Cansancio ocular', 'Astigmatismo leve', 'Uso de lentes con correcci�n especializada'),
(16, '2025-06-23', 6, 6, 'Diarrea persistente', 'S�ndrome de intestino irritable', 'Tratamiento diet�tico y probi�ticos'),
(17, '2025-06-24', 7, 7, 'Molestias estomacales', '�lcera g�strica', 'Tratamiento con inhibidores de �cido'),
(18, '2025-06-25', 8, 8, 'Sudoraci�n excesiva', 'Hipertiroidismo', 'Control endocrinol�gico y ajuste terap�utico'),
(19, '2025-06-26', 9, 9, 'Ataques de p�nico', 'Trastorno de ansiedad', 'Psicoterapia y seguimiento psiqui�trico'),
(20, '2025-06-27', 10, 10, 'Dolor lumbar', 'C�lculos renales', 'Tratamiento farmacol�gico y control peri�dico');
