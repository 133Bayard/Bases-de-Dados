Use Hotel

-- (RE4) Visualizar o histórico de reservas feitas entre duas datas    
DELIMITER  $$
CREATE PROCEDURE consulta_reservas (IN id_cliente INT, data_inicio DATE, data_fim DATE)
BEGIN
        SELECT * FROM Reserva AS r INNER JOIN Cliente AS c ON r.cliente = c.id
		WHERE r.cliente = id_cliente AND r.data_de_início >= data_inicio AND r.data_de_fim <= data_fim
    ORDER BY r.data_de_início ASC;

END $$

-- CALL consulta_reservas (9, '2020/01/01', '2022/01/01');

-- (RE1) Ver quartos livres.
DELIMITER $$
CREATE PROCEDURE disponibilidade_quartos(IN id_hotel INT)
BEGIN
	SELECT * FROM QUARTO AS q 
    WHERE q.ocupado = '0' AND q.hotel_ID = id_hotel
    ORDER BY q.id ASC;
END $$

 -- CALL disponibilidade_quartos(20202912);
 
-- (RE9) Consultar disponibilidade de um Quarto
DELIMITER $$
CREATE PROCEDURE disponibilidade(IN id_quarto INT)
BEGIN
	SELECT Ocupado FROM QUARTO AS q
    WHERE q.id = id_quarto;
END $$

 -- CALL disponibilidade(20);
 
 -- (RE10) Consultar a ocupação total do hotel.

 DELIMITER $$
CREATE PROCEDURE Ocupacao(IN id_hotel INT)
BEGIN
	SELECT COUNT(*) AS 'Quartos Ocupados' FROM QUARTO AS q
    WHERE q.hotel_id = id_hotel AND q.ocupado = '1';
END $$ 

-- CALL Ocupacao (20202911);

-- (RE8)  Visualizar as informações referentes a cada funcionário.
 DELIMITER $$
CREATE PROCEDURE consulta_Funcionarios(IN id_hotel INT)
BEGIN
	SELECT * FROM FUNCIONARIO AS f
    WHERE f.hotel = id_hotel;
END $$

CALL consulta_Funcionarios(20202913);

-- (RE3) Consultar a reserva de maior valor num determinado espaço de tempo
DELIMITER $$
CREATE PROCEDURE maior_reserva(IN data_inicio DATE, data_fim DATE)
BEGIN
	SELECT r.Data_de_início, r.Data_de_fim, r.Preco, c.Nome, h.Nome
    FROM Reserva AS r INNER JOIN Cliente c
					  ON c.id = r.cliente
                      INNER JOIN quarto_has_reserva qr 
					  ON qr.Reserva_ID = r.ID
                      INNER JOIN Quarto q
                      ON q.ID = qr.Quarto_ID
                      INNER JOIN Hotel h
                      ON q.Hotel_ID = h.ID
	WHERE r.data_de_início >= data_inicio AND r.data_de_fim <= data_fim
    ORDER BY Preco DESC
    LIMIT 1;
END$$

-- CALL maior_reserva('2021/06/01', '2021/09/01');

-- (RC5) - Registar um hotel.
DELIMITER $$
CREATE PROCEDURE regista_Hotel(IN ID INT,  Nome VARCHAR(45), Rua VARCHAR(45), Localidade VARCHAR(45), Freguesia VARCHAR(45), Codigo_Postal VARCHAR(45), Estrelas INT)
BEGIN
	INSERT INTO Hotel(ID, Nome, Rua, Localidade, Freguesia, Codigo_Postal, Estrelas)
			VALUES (ID, Nome, Rua, Localidade, Freguesia, Codigo_Postal, Estrelas);
END $$



-- (RC7) - Registar um funcionário.
DELIMITER $$
CREATE PROCEDURE regista_Funcionario(IN ID INT,  Nome VARCHAR(45), Rua VARCHAR(45), Localidade VARCHAR(45), Freguesia VARCHAR(45), Codigo_Postal VARCHAR(45), CC VARCHAR(45),
Cargo VARCHAR(45), Turno VARCHAR(45), Hotel INT)
BEGIN
	INSERT INTO Funcionario(ID, Nome, Rua, Localidade, Freguesia, Codigo_Postal, CC, Cargo, Turno, Hotel)
			VALUES (ID, Nome, Rua, Localidade, Freguesia, Codigo_Postal, CC, Cargo, Turno, Hotel);
END $$

-- (RC10) - Atualizar as informações inseridas aquando do registo de um quarto.
DELIMITER $$
CREATE PROCEDURE altera_Disponibilidade_Quarto(IN disponibilidade CHAR(1), ID INT)
BEGIN
	UPDATE Quarto SET Ocupado = disponibilidade WHERE Hotel_ID = ID;
END $$
 
 





