-- (RE2) Simular o preço de uma reserva
DELIMITER $$
CREATE FUNCTION simular_reserva(data_inicio DATE, data_fim DATE, id_quarto INT)
		RETURNS FLOAT DETERMINISTIC
BEGIN
		RETURN (SELECT (SELECT Preco FROM Tipo_Quarto AS tq INNER JOIN Quarto q
										  ON q.Tipo_de_Quarto = tq.Designacao
                                          WHERE q.id = id_quarto) * (SELECT DATEDIFF(data_fim, data_inicio)));
END $$


SELECT simular_reserva('2020/01/01', '2020/01/06', 5) AS 'Preço da Reserva';

        
-- (RE13)  Consultar o total de faturação do hotel.
DELIMITER $$
CREATE FUNCTION consulta_Lucro(id_hotel INT)
		RETURNS FLOAT DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(PRECO) AS Lucro FROM Quarto_has_Reserva as qr INNER JOIN Quarto as q 
											ON qr.quarto_ID = q.id
											INNER JOIN Reserva as r
                                            ON r.ID = qr.Reserva_ID
	WHERE q.hotel_ID = id_hotel);
END $$
	
 SELECT consulta_Lucro(20202913) AS 'Lucro';