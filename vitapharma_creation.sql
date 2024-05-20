-- DROP DATABASE VitaPharma;
CREATE DATABASE IF NOT EXISTS VitaPharma;

USE VitaPharma;

CREATE TABLE Farmaco (
    codiceFarmaco INT PRIMARY KEY,
    disponibilità INT CHECK (disponibilità >= 0) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    prezzo DECIMAL(10, 2) NOT NULL,
    scadenza DATE NOT NULL,
    vendite INT DEFAULT 0 CHECK (vendite >= 0) NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    fascia VARCHAR(10)
);
CREATE TABLE Acquisto (
    scontrino INT PRIMARY KEY AUTO_INCREMENT,
    data DATE NOT NULL,
    ora TIME NOT NULL
);
CREATE TABLE Cliente (
    CF VARCHAR(16) PRIMARY KEY,
    cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL
);
CREATE TABLE Eccipiente (
    nome VARCHAR(100) PRIMARY KEY,
    formula VARCHAR(255) NOT NULL,
    disponibilità INT CHECK (disponibilità >= 0) NOT NULL
);
CREATE TABLE Fornitore (
    codiceFornitore INT PRIMARY KEY,
    città VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    mail VARCHAR(100) NOT NULL,
    telefono VARCHAR(20)
);
CREATE TABLE Magazzino (
    codicePosizione INT PRIMARY KEY,
    armadio VARCHAR(50) NOT NULL,
    scaffale VARCHAR(50) NOT NULL
);
CREATE TABLE Medico (
    CRM VARCHAR(16) PRIMARY KEY,
    città VARCHAR(100) NOT NULL,
    cognome VARCHAR(100) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    indirizzo VARCHAR(255) NOT NULL,
    recapito VARCHAR(20) NOT NULL,
    specializzazione VARCHAR(100)
);
CREATE TABLE Posologia (
    farmaco INT,
    età VARCHAR(20),
    dosaggio VARCHAR(50) NOT NULL,
    frequenza VARCHAR(50) NOT NULL,
    periodo VARCHAR(50) NOT NULL,
    PRIMARY KEY (farmaco, età),
    FOREIGN KEY (farmaco) REFERENCES Farmaco(codiceFarmaco)
);
CREATE TABLE Ricetta (
    codiceRicetta INT PRIMARY KEY NOT NULL,
    data DATE NOT NULL,
    regione VARCHAR(50) NOT NULL,
    cliente VARCHAR(16) NOT NULL,
    medico VARCHAR(16) NOT NULL,
    scontrino INT DEFAULT NULL,
    FOREIGN KEY (cliente) REFERENCES Cliente(CF),
    FOREIGN KEY (medico) REFERENCES Medico(CRM),
    FOREIGN KEY (scontrino) REFERENCES Acquisto(scontrino)  ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT fk_farmaco_ricetta UNIQUE (scontrino)
);

CREATE TABLE Composizione (
    eccipiente VARCHAR(255) NOT NULL,
    farmaco INT NOT NULL,
    PRIMARY KEY (Eccipiente, Farmaco),
        FOREIGN KEY (Farmaco) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE,
    FOREIGN KEY (Eccipiente) REFERENCES Eccipiente(nome)
);

CREATE TABLE Contenuto (
    farmaco INT NOT NULL,
    ricetta INT NOT NULL,
    PRIMARY KEY (Farmaco, Ricetta),
    FOREIGN KEY (Farmaco) REFERENCES Farmaco(codiceFarmaco)  ON UPDATE CASCADE,
    FOREIGN KEY (Ricetta) REFERENCES Ricetta(codiceRicetta)
);
CREATE TABLE Fornitura (
    farmaco INT NOT NULL,
    fornitore INT NOT NULL,
    costo DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Farmaco, Fornitore),
    FOREIGN KEY (Farmaco) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE,
    FOREIGN KEY (Fornitore) REFERENCES Fornitore(codiceFornitore)
);
CREATE TABLE Generico (
    originale INT NOT NULL,
    generico INT NOT NULL,
    PRIMARY KEY (originale, generico),
    FOREIGN KEY (originale) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE,
    FOREIGN KEY (generico) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE
);
CREATE TABLE Posizione (
    farmaco INT NOT NULL,
    magazzino INT NOT NULL,
    PRIMARY KEY (Farmaco, Magazzino),
    FOREIGN KEY (Farmaco) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE,
    FOREIGN KEY (Magazzino) REFERENCES Magazzino(codicePosizione)
);
CREATE TABLE Vendita (
    acquisto INT NOT NULL,
    farmaco INT NOT NULL,
    quantità INT,
    PRIMARY KEY (acquisto, farmaco),
    FOREIGN KEY (acquisto) REFERENCES Acquisto(scontrino),
    FOREIGN KEY (farmaco) REFERENCES Farmaco(codiceFarmaco) ON UPDATE CASCADE,
    CONSTRAINT fk_farmaco_vendita UNIQUE (acquisto, farmaco, quantità)
);





