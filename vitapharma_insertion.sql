USE vitapharma;

-- Inserimento di dati di esempio nella tabella Farmaco
INSERT INTO Farmaco (CodiceFarmaco, Disponibilità, Nome, Prezzo, Scadenza, Vendite, Tipo, Fascia)
VALUES
    (1, 100, 'Paracetamolo', 5.99, '2025-12-31', 0, 'Etico', 'A'),
    (2, 50, 'Amoxicillina', 8.50, '2025-09-30', 0, 'Da Banco', NULL),
    (3, 80, 'Ibuprofene', 3.99, '2025-06-30', 0, 'Da Banco', NULL),
    (4, 120, 'Aspirina', 4.25, '2026-12-31', 0, 'Etico', 'C'),
    (5, 60, 'Omeprazolo', 9.75, '2025-08-31', 0, 'Etico', 'A'),
    (6, 90, 'Diazepam', 7.20, '2025-03-31', 0, 'Da Banco', NULL),
    (7, 70, 'Ranitidina', 6.45, '2026-10-31', 0, 'Da Banco', NULL),
    (8, 110,'Simvastatina', 12.99, '2027-11-30', 0, 'Etico', 'C'),
    (9, 40, 'Metformina', 3.60, '2025-02-28', 0, 'Da Banco', NULL),
    (10, 85,'Atorvastatina', 15.75, '2024-07-31', 0, 'Etico', 'A'),
    (11, 75, 'Lisinopril', 4.99, '2026-10-31', 0, 'Etico', 'A'),
    (12, 55, 'Venlafaxina', 11.80, '2025-01-31', 0, 'Etico', 'C'),
    (13, 95, 'Cetirizina', 6.20, '2024-09-30', 0, 'Da Banco', NULL),
    (14, 65, 'Warfarina', 8.99, '2028-12-31', 0, 'Etico', 'A'),
    (15, 130,'Loratadina', 7.45, '2025-04-30', 0, 'Da Banco', NULL),
    (16, 45, 'Furosemide', 4.30, '2026-05-31', 0, 'Etico', 'A'),
    (17, 80, 'Fluoxetina', 9.60, '2025-07-31', 0, 'Da Banco', NULL),
    (18, 105,'Tadalafil', 17.99, '2026-02-28', 0, 'Da Banco', NULL),
    (19, 35, 'Metoprololo', 5.75, '2025-06-30', 0, 'Etico', 'C'),
    (20, 70, 'Levotiroxina', 13.25, '2024-03-31', 0, 'Da Banco', NULL),
    (21, 50, 'Fosamax', 12.99, '2025-06-01', 0, 'Etico', 'B'),
    (22, 80, 'Zoloft', 15.50, '2027-12-01', 0, 'Da Banco', NULL),
    (23, 40, 'Atacand', 8.75, '2024-08-01', 0, 'Etico', 'B'),
    (24, 60, 'Diovan', 9.80, '2024-10-01', 0, 'Etico', 'C'),
    (25, 70, 'Synthroid', 21.99, '2025-02-01', 0, 'Etico', 'A'),
    (26, 45, 'Crestor', 13.75, '2024-04-01', 0, 'Da Banco', NULL),
    (27, 55, 'Lyrica', 18.25, '2026-11-01', 0, 'Etico', 'C'),
    (28, 65, 'Namenda', 17.50, '2025-10-01', 0, 'Da Banco', NULL),
    (29, 75, 'Bystolic', 14.99, '2024-06-01', 0, 'Etico', 'B'),
    (30, 55, 'Nasonex', 19.50, '2027-09-01', 0, 'Etico', 'C'),
    (31, 65, 'Ranexa', 24.99, '2028-05-01', 0, 'Da Banco', NULL),
    (32, 45, 'Votrient', 16.75, '2025-03-01', 0, 'Da Banco', NULL),
    (33, 55, 'Exelon', 11.25, '2024-11-01', 0, 'Etico', 'C'),
    (34, 65, 'Humalog', 14.50, '2026-07-01', 0, 'Etico', 'A'),
    (35, 75, 'Tecfidera', 17.99, '2024-09-01', 0, 'Da Banco', NULL),
    (36, 50, 'Pulmicort', 22.50, '2025-01-01', 0, 'Etico', 'C'),
    (37, 80, 'Advair', 25.75, '2026-06-01', 0, 'Etico', 'A'),
    (38, 40, 'Enbrel', 19.99, '2025-05-01', 0, 'Da Banco', NULL),
    (39, 60, 'Seroquel', 23.75, '2024-07-01', 0, 'Da Banco', NULL),
    (40, 70, 'Zyprexa', 27.50, '2027-08-01', 0, 'Etico', 'A');

-- Inserimento di dati di esempio nella tabella Acquisto
INSERT INTO Acquisto (Data, Ora)
VALUES
    ('2024-05-01', '10:30:00'),
    ('2024-05-02', '11:15:00'),
    ('2024-05-03', '09:45:00'),
    ('2024-05-04', '14:20:00'),
    ('2024-05-05', '16:00:00'),
    ('2024-05-06', '12:00:00'),
    ('2024-05-07', '17:30:00'),
    ('2024-05-08', '10:00:00'),
    ('2024-05-09', '13:45:00'),
    ('2024-05-10', '15:20:00'),
    ('2024-05-11', '11:00:00'),
    ('2024-05-12', '14:30:00'),
    ('2024-05-13', '16:45:00'),
    ('2024-05-14', '09:00:00'),
    ('2024-05-15', '12:15:00'),
    ('2024-05-16', '15:30:00'),
    ('2024-05-17', '10:45:00'),
    ('2024-05-18', '13:00:00'),
    ('2024-05-19', '16:15:00'),
    ('2024-05-20', '11:30:00');



-- Inserimento di dati di esempio nella tabella Vendita
INSERT INTO Vendita (Acquisto, Farmaco, Quantità)
VALUES
    (1, 1, 3),   -- Scontrino 1: Acquisto di 3 unità di Paracetamolo
    (1, 2, 1),   -- Scontrino 1: Acquisto di 1 unità di Amoxicillina
    (2, 3, 2),   -- Scontrino 2: Acquisto di 2 unità di Ibuprofene
    (2, 4, 1),   -- Scontrino 2: Acquisto di 1 unità di Aspirina
    (3, 1, 2),   -- Scontrino 3: Acquisto di 2 unità di Paracetamolo
    (4, 5, 3),   -- Scontrino 4: Acquisto di 3 unità di Omeprazolo
    (4, 6, 1),   -- Scontrino 4: Acquisto di 1 unità di Diazepam
    (5, 3, 1),   -- Scontrino 5: Acquisto di 1 unità di Ibuprofene
    (5, 7, 2),   -- Scontrino 5: Acquisto di 2 unità di Ranitidina
    (6, 8, 1),   -- Scontrino 6: Acquisto di 1 unità di Simvastatina
    (7, 2, 2),   -- Scontrino 7: Acquisto di 2 unità di Amoxicillina
    (8, 9, 3),   -- Scontrino 8: Acquisto di 3 unità di Metformina
    (9, 10, 1),  -- Scontrino 9: Acquisto di 1 unità di Atorvastatina
    (9, 11, 2),  -- Scontrino 9: Acquisto di 2 unità di Lisinopril
    (10, 12, 1), -- Scontrino 10: Acquisto di 1 unità di Venlafaxina
    (11, 5, 2),  -- Scontrino 11: Acquisto di 2 unità di Omeprazolo
    (11, 13, 1), -- Scontrino 11: Acquisto di 1 unità di Cetirizina
    (12, 4, 1),  -- Scontrino 12: Acquisto di 1 unità di Aspirina
    (13, 6, 2),  -- Scontrino 13: Acquisto di 2 unità di Diazepam
    (14, 7, 1),  -- Scontrino 14: Acquisto di 1 unità di Ranitidina
    (14, 8, 3),  -- Scontrino 14: Acquisto di 3 unità di Simvastatina
    (15, 10, 1), -- Scontrino 15: Acquisto di 1 unità di Atorvastatina
    (16, 12, 2), -- Scontrino 16: Acquisto di 2 unità di Venlafaxina
    (17, 13, 1), -- Scontrino 17: Acquisto di 1 unità di Cetirizina
    (18, 15, 3), -- Scontrino 18: Acquisto di 3 unità di Loratadina
    (19, 16, 1), -- Scontrino 19: Acquisto di 1 unità di Furosemide
    (20, 18, 2); -- Scontrino 20: Acquisto di 2 unità di Tadalafil


-- Inserimento di dati di esempio nella tabella Fornitura
INSERT INTO Fornitore (CodiceFornitore, Città, Indirizzo, Mail, Telefono)
VALUES
    (1, 'Roma', 'Via Roma 123', 'fornitore1@example.com', '1234567890'),
    (2, 'Milano', 'Via Milano 456', 'fornitore2@example.com', '0987654321'),
    (3, 'Napoli', 'Via Napoli 789', 'fornitore3@example.com', '9876543210'),
    (4, 'Torino', 'Via Torino 321', 'fornitore4@example.com', '0123456789'),
    (5, 'Firenze', 'Via Firenze 654', 'fornitore5@example.com', '6789012345'),
    (6, 'Bologna', 'Via Bologna 987', 'fornitore6@example.com', '5432109876'),
    (7, 'Palermo', 'Via Palermo 234', 'fornitore7@example.com', '3456789012'),
    (8, 'Genova', 'Via Genova 567', 'fornitore8@example.com', '8901234567'),
    (9, 'Bari', 'Via Bari 890', 'fornitore9@example.com', '4567890123'),
    (10, 'Verona', 'Via Verona 123', 'fornitore10@example.com', '9012345678');

-- inserisci tu valori nuovi e diversi per ogni riga
INSERT INTO Fornitura (Farmaco, Fornitore, Costo)
VALUES (1, 1, 4.50),
        (1, 2, 5.00),
        (2, 2, 7.80),
        (2, 4, 6.20),
        (3, 2, 3.10),
        (3, 1, 2.90),
        (4, 2, 3.75),
        (4, 1, 5.30),
        (4, 3, 5.50),
        (5, 1, 8.25),
        (5, 4, 8.25),
        (5, 5, 8.55),
        (6, 2, 6.50),
        (7, 2, 5.10),
        (7, 1, 5.40),
        (8, 2, 11.99),
        (8, 4, 14.90),
        (9, 1, 4.30),
        (9, 3, 4.50),
        (10, 2, 10.50),
        (10, 4, 11.50),
        (11, 1, 3.75),
        (12, 2, 9.20),
        (12, 5, 9.50),
        (13, 1, 4.90),
        (13, 3, 6.90),
        (13, 4, 5.90),
        (13, 5, 2.90),
        (14, 2, 7.25),
        (15, 1, 6.60),
        (15, 3, 6.67),
        (16, 2, 5.50),
        (16, 1, 5.30),
        (16, 3, 8.50),
        (16, 4, 4.50),
        (17, 1, 9.90),
        (18, 2, 15.75),
        (18, 3, 16.75),
        (19, 1, 4.40),
        (19, 4, 15.95),
        (20, 2, 12.30),
        (20, 4, 15.30);

-- Inserimento di dati di esempio nella tabella Medico
INSERT INTO Medico (CRM, Città, Cognome, Nome, Indirizzo, Recapito, Specializzazione)
VALUES
    ('MED123', 'Roma', 'Rossi', 'Mario', 'Via Roma 1', '3331122334', 'Cardiologia'),
    ('MED234', 'Milano', 'Bianchi', 'Laura', 'Via Milano 2', '3354455667', 'Pediatria'),
    ('MED345', 'Firenze', 'Verdi', 'Giuseppe', 'Via Firenze 3', '3387788990', 'Dermatologia'),
    ('MED456', 'Napoli', 'Ferrari', 'Anna', 'Via Napoli 4', '3400011223', 'Gastroenterologia'),
    ('MED567', 'Torino', 'Russo', 'Giovanni', 'Via Torino 5', '3475566778', 'Neurologia'),
    ('MED678', 'Bologna', 'Martini', 'Chiara', 'Via Bologna 6', '3490011223', 'Ortopedia'),
    ('MED789', 'Palermo', 'Galli', 'Paola', 'Via Palermo 7', '3461122334', 'Oncologia'),
    ('MED890', 'Genova', 'Conti', 'Marco', 'Via Genova 8', '3493344556', 'Psichiatria'),
    ('MED901', 'Bari', 'Santini', 'Lorenzo', 'Via Bari 9', '3406677889', 'Oculistica'),
    ('MED012', 'Verona', 'Moretti', 'Elena', 'Via Verona 10', '3458899001', 'Endocrinologia');


-- Inserimento di dati di esempio nella tabella Cliente
INSERT INTO Cliente (CF, Cognome, Nome)
VALUES
    ('ABCD1234567890', 'Rossi', 'Paolo'),
    ('EFGH1234567890', 'Bianchi', 'Maria'),
    ('IJKL1234567890', 'Verdi', 'Luigi'),
    ('MNOP1234567890', 'Ferrari', 'Giulia'),
    ('QRST1234567890', 'Russo', 'Alessandro'),
    ('UVWX1234567890', 'Martini', 'Roberto'),
    ('YZAB1234567890', 'Galli', 'Giulia'),
    ('CDEF1234567890', 'Conti', 'Simona'),
    ('GHIJ1234567890', 'Santini', 'Federica'),
    ('KLMN1234567890', 'Moretti', 'Andrea');

-- Inserimento di dati di esempio nella tabella Ricetta
INSERT INTO Ricetta (CodiceRicetta, Data, Regione, Cliente, Medico, Scontrino)
VALUES
    (1, '2023-05-01', 'Lazio', 'ABCD1234567890', 'MED123', 1),
    (2, '2023-06-15', 'Lombardia', 'EFGH1234567890', 'MED234', 2),
    (3, '2023-07-10', 'Toscana', 'IJKL1234567890', 'MED345', 3),
    (4, '2023-08-20', 'Piemonte', 'MNOP1234567890', 'MED456', 4),
    (5, '2023-09-05', 'Veneto', 'QRST1234567890', 'MED567', 5),
    (6, '2023-10-15', 'Lazio', 'UVWX1234567890', 'MED678', 6),
    (7, '2023-11-20', 'Lombardia', 'YZAB1234567890', 'MED789', 7),
    (8, '2023-12-05', 'Toscana', 'CDEF1234567890', 'MED890', 8),
    (9, '2024-01-10', 'Piemonte', 'GHIJ1234567890', 'MED901', 9),
    (10, '2024-02-25', 'Veneto', 'KLMN1234567890', 'MED012', 10);

-- Inserimento di dati di esempio nella tabella Contenuto (associando farmaci a ricette)
INSERT INTO Contenuto (Farmaco, Ricetta)
VALUES
    (1, 1),
    (4, 1),
    (1, 2),
    (4, 2),
    (5, 3),
    (4, 3),
    (5, 4),
    (8, 4),
    (10, 5),
    (8, 5),
    (11, 6),
    (12, 7),
    (8, 8),
    (14, 9),
    (10, 10),
    (16, 1),
    (16, 2),
    (14, 3),
    (12, 4),
    (11, 5);


-- Inserimento di dati di esempio nella tabella Magazzino
INSERT INTO Magazzino (CodicePosizione, Armadio, Scaffale)
VALUES
    (1, 'A1', 'S1'),
    (2, 'B2', 'S2'),
    (3, 'C3', 'S3'),
    (4, 'D4', 'S4'),
    (5, 'E5', 'S5'),
    (6, 'F6', 'S6'),
    (7, 'G7', 'S7'),
    (8, 'H8', 'S8'),
    (9, 'I9', 'S9'),
    (10, 'J10', 'S10');


-- Inserimento di dati di esempio nella tabella Posizione (associando farmaci a più posizioni di magazzino)
INSERT INTO Posizione (Farmaco, Magazzino)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10);

-- Inserimento di dati di esempio nella tabella Eccipiente (ingredienti farmaceutici)
INSERT INTO Eccipiente (Nome, Formula, Disponibilità)
VALUES
    ('Lattosio', 'C12H22O11', 100),
    ('Cellulosa microcristallina', 'C6H10O5', 80),
    ('Sodio amido glicolato', 'C6H9NaO7', 120),
    ('Stearato di magnesio', 'C36H70MgO4', 90),
    ('Diossido di silicio', 'SiO2', 110),
    ('Talco', 'Mg3Si4O10(OH)2', 95),
    ('Glicerolo', 'C3H8O3', 105),
    ('Acqua depurata', 'H2O', 85),
    ('Povidone', 'C6H9NO', 125),
    ('Ossido di ferro', 'Fe2O3', 70),
    ('Gomma arabica', 'C12H16O12', 80),
    ('Saccarosio', 'C12H22O11', 110),
    ('Cloruro di sodio', 'NaCl', 95),
    ('Sodio citrato', 'C6H5Na3O7', 105),
    ('Sodio laurilsolfato', 'C12H25NaO4S', 90),
    ('Acido citrico', 'C6H8O7', 120),
    ('Ossido di zinco', 'ZnO', 100),
    ('Gelatina', 'C6H12O6', 80),
    ('Lanolina', 'C30H62O2', 95),
    ('Amido di mais', 'C6H10O5', 110);

-- Inserimento di dati di esempio nella tabella Composizione (associando farmaci agli ingredienti)
INSERT INTO Composizione (Eccipiente, Farmaco)
VALUES
    ('Lattosio', 1),
    ('Cellulosa microcristallina', 1),
    ('Sodio amido glicolato', 1),
    ('Stearato di magnesio', 1),
    ('Diossido di silicio', 2),
    ('Talco', 2),
    ('Glicerolo', 2),
    ('Acqua depurata', 2),
    ('Povidone', 3),
    ('Ossido di ferro', 3),
    ('Gomma arabica', 4),
    ('Saccarosio', 4),
    ('Cloruro di sodio',4),
    ('Sodio citrato', 4),
    ('Sodio laurilsolfato',5),
    ('Acido citrico', 5),
    ('Ossido di zinco',6),
    ('Gelatina', 6),
    ('Lanolina', 7),
    ('Amido di mais',7),
    ('Lattosio', 7),
    ('Diossido di silicio', 8),
    ('Glicerolo', 9),
    ('Acqua depurata',10),
    ('Povidone', 10),
    ('Ossido di ferro',10),
    ('Gomma arabica', 11),
    ('Saccarosio', 11),
    ('Cloruro di sodio',11),
    ('Sodio citrato', 12),
    ('Sodio laurilsolfato',13),
    ('Acido citrico', 14),
    ('Ossido di zinco', 14),
    ('Gelatina', 15),
    ('Lanolina', 16),
    ('Amido di mais',17),
    ('Lattosio', 18),
    ('Diossido di silicio', 19),
    ('Diossido di silicio', 20);


-- Inserimento di dati di esempio nella tabella Posologia (informazioni sulla posologia dei farmaci)
INSERT INTO Posologia (Farmaco, Età, Dosaggio, Frequenza, Periodo)
VALUES
    (1, 'Adulto', '500 mg', 'Una volta al giorno', '7 giorni'),
    (1, 'Bambino', '100 mg', 'Due volte al giorno', '5 giorni'),
    (2, 'Adulto', '1000 mg', 'Una volta ogni 6 ore', '3 giorni'),
    (3, 'Bambino', '250 mg', 'Una volta al giorno', '2 giorni'),
    (16, 'Adulto', '400 mg', 'Una volta al giorno', '7 giorni'),
    (16, 'Bambino', '100 mg', 'Due volte al giorno', '5 giorni'),
    (6, 'Adulto', '20 mg', 'Una volta al giorno', '30 giorni'),
    (12, 'Adulto', '500 mg', 'Due volte al giorno', '10 giorni'),
    (11, 'Adulto', '40 mg', 'Una volta al giorno', '30 giorni'),
    (10, 'Adulto', '850 mg', 'Due volte al giorno', '60 giorni'),
    (10, 'Anziano', '50 mg', 'Una volta al giorno', '90 giorni'),
    (14, 'Adulto', '20 mg', 'Una volta al giorno', '30 giorni'),
    (16, 'Anziano', '5 mg', 'Una volta al giorno', '30 giorni');

-- Inserimento di dati di esempio nella tabella Generico (associazioni tra farmaci originali e generici)
INSERT INTO Generico (originale, generico)
VALUES
    (1, 2),
    (1, 3),
    (6, 8),
    (10,19 ),
    (17, 14);


-- Inserimento dati speciali per operazioni
INSERT INTO farmaco (codiceFarmaco, nome, prezzo, scadenza, disponibilità, vendite, tipo,  fascia)
    VALUES (110, 'Tachipirina', 10.00, '2027-12-31', 9, 11, 'Etico', 'A');
INSERT INTO fornitura (fornitore, farmaco, costo) VALUES (1, 110, 9.00);
INSERT INTO fornitura (fornitore, farmaco, costo) VALUES (2, 110, 8.50);

INSERT INTO acquisto (data, ora) VALUES ('2021-12-31', '12:00:00');
INSERT INTO vendita (acquisto, farmaco, quantità) VALUES (21, 110, 1);






