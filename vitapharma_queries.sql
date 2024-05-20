USE vitapharma;


-- TRIGGER
DELIMITER $$
DROP TRIGGER checkBeforeVendita$$
CREATE TRIGGER checkBeforeVendita
    BEFORE INSERT ON vendita
    FOR EACH ROW
    BEGIN
        DECLARE new_scontrino INT;
        DECLARE disponibilita_farmaco INT;
        DECLARE scadenza_farmaco DATE;
        DECLARE tipo_farmaco VARCHAR(20);
        DECLARE esiste_ricetta INT;

    -- Ricavo l'id del nuovo scontrino.
        SELECT scontrino INTO new_scontrino FROM acquisto ORDER BY scontrino DESC LIMIT 1;

    -- Faccio un check sulla disponibilità del farmaco. Se non c'è a sufficienza, mando un segnale.
        SELECT disponibilità INTO disponibilita_farmaco FROM farmaco f
            WHERE NEW.farmaco = f.codiceFarmaco;
        IF disponibilita_farmaco < NEW.quantità THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Quantità richiesta maggiore della disponibilità';
        END IF;

    -- Faccio un check sulla data di scadenza del farmaco. Se è scaduto mando un segnale.
        SELECT scadenza INTO scadenza_farmaco FROM farmaco f
            WHERE NEW.farmaco = f.codiceFarmaco;
    
        IF scadenza_farmaco < CURDATE() THEN
            SIGNAL SQLSTATE '45001'
            SET MESSAGE_TEXT = 'Farmaco richiesto scaduto';
        END IF;

    -- Faccio il check sul tipo di farmaco da inserire. Se è un farmaco etico richiedo una ricetta.
        SELECT tipo INTO tipo_farmaco FROM farmaco f
            WHERE NEW.farmaco = f.codiceFarmaco;

        IF tipo_farmaco = 'Etico' THEN

            SELECT count(r.codiceRicetta) INTO esiste_ricetta FROM ricetta r
                WHERE r.scontrino = new_scontrino;

            IF esiste_ricetta = 0 THEN
                SIGNAL SQLSTATE '45002'
                SET MESSAGE_TEXT  = 'Per procedere con l acquisto devi prima inserire una ricetta!';
            END IF;

        END IF;

    END $$
DELIMITER ;





-- OPERAZIONI

-- Creo una SP per l'operazione 1.
-- Dato il codice di una ricetta, mostrare il nome del farmaco etico, il suo prezzo, la sua fascia, la sua posizione
-- all’interno del magazzino e l'eventuale farmaco generico più economico, 		                        (1200 /mese)

DELIMITER $$
-- DROP PROCEDURE infoRicetta;
CREATE PROCEDURE infoRicetta (
    my_codice INT
)
BEGIN

    SELECT r.codiceRicetta, f.nome, f.prezzo, f.fascia, m.armadio, m.scaffale, ff.nome AS generico FROM ricetta r

        INNER JOIN contenuto c ON r.codiceRicetta = c.ricetta
        INNER JOIN farmaco f ON c.farmaco = f.codiceFarmaco
        INNER JOIN posizione p ON f.codiceFarmaco = p.farmaco
        INNER JOIN magazzino m ON p.magazzino = m.codicePosizione
        LEFT JOIN generico g ON f.codiceFarmaco = g.originale
        LEFT JOIN farmaco ff ON g.generico = ff.codiceFarmaco

        WHERE r.codiceRicetta = my_codice
        ORDER BY f.prezzo;

END $$

DELIMITER ;

CALL infoRicetta(1);



-- Creo un processo per l'operazione 2.
-- Inserimento di un’istanza di Acquisto.
DROP PROCEDURE insertAcquisto;
DELIMITER $$
CREATE PROCEDURE insertAcquisto (
    IN my_date DATE,
    IN my_time TIME
)
BEGIN

    INSERT INTO acquisto (data, ora) VALUES (my_date, my_time);

END $$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE insertVendita $$
CREATE PROCEDURE insertVendita (
    my_farmaco INT,
    my_quantità INT
)
BEGIN
    DECLARE my_scontrino INT;

		SELECT scontrino INTO my_scontrino FROM acquisto ORDER BY scontrino DESC LIMIT 1;

		INSERT INTO vendita (acquisto, farmaco, quantità) VALUES (my_scontrino, my_farmaco, my_quantità);

		UPDATE farmaco
			SET
				vendite = vendite + my_quantità,
				disponibilità = disponibilità - my_quantità
			WHERE codiceFarmaco = my_farmaco;

END $$

DELIMITER ;

SET @my_date = CURDATE();
SET @my_time = CURTIME();
CALL insertAcquisto(@my_date,@my_time);

SET @my_farmaco = 1;
SET @my_quantita = 4;
CALL insertVendita(@my_farmaco, @my_quantita);



-- IDEA della funzione Python:
-- def insertAll(farmaci, quantita):
--    if len(farmaci) != len(quantità):
--        raiseException

--    Inizia transazione

--        Chiama insertAcquisto e salva in my_scontrino l'id dell'ultimo scontrino inserito

--        for i in range(len(farmaci)):
--            Chiama stmtinsertVendita (my_scontrino, farmaci[i], quantità[i])

--    Finisci transazione

--    returna
SELECT * from vendita;






-- Creo una SP per l'operazione 3.
DELIMITER $$
CREATE PROCEDURE  showMissing()
BEGIN

    SELECT f.codiceFarmaco, f.nome, f.disponibilità, forn.fornitore, forn.costo FROM farmaco f
        INNER JOIN fornitura forn ON f.codiceFarmaco = forn.farmaco
        WHERE f.vendite > 10 AND f.disponibilità < 10
        ORDER BY forn.costo LIMIT 1;

END $$
DELIMITER ;

CALL showMissing();





-- Creo una SP per l'operazione 4.
DELIMITER $$
CREATE PROCEDURE showEarnings ()
BEGIN

    DECLARE today DATE;
    SET today = CURDATE();

    SELECT sum(v.quantità*f.prezzo) FROM acquisto a
        INNER JOIN vendita v ON a.scontrino = v.acquisto
        INNER JOIN farmaco f ON v.farmaco = f.codiceFarmaco
        WHERE a.data >= today;

END $$
DELIMITER ;

CALL showEarnings();



-- Creo un PS per l'operazione 5.

DELIMITER $$
CREATE PROCEDURE deleteAcquistiSP()
BEGIN

    DECLARE today DATE;
    DECLARE scontrini_eliminabili INT;
    SET today = CURDATE();


    START TRANSACTION;

        SELECT scontrino INTO scontrini_eliminabili FROM acquisto
            WHERE data < DATE_SUB(today, INTERVAL 365 DAY);

        DELETE FROM contenuto WHERE ricetta IN (
            SELECT codiceRicetta FROM ricetta
                WHERE scontrino IN (scontrini_eliminabili)
            );
        DELETE FROM ricetta WHERE scontrino IN (scontrini_eliminabili);
        DELETE FROM vendita WHERE acquisto IN (scontrini_eliminabili);
        DELETE FROM acquisto WHERE scontrino IN (scontrini_eliminabili);

    COMMIT;

END $$
DELIMITER ;

CALL deleteAcquistiSP();