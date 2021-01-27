CREATE VIEW Reserva_Duracao AS
SELECT r.data_de_início AS 'Data de Início', r.data_de_fim AS 'Data de Fim', c.nome AS 'Nome'
FROM Reserva as r INNER JOIN Cliente as c
					ON c.id = r.cliente
WHERE r.data_de_início >= now();  


CREATE VIEW Reservas_Preco AS
SELECT r.Preco AS 'Preço da Reserva', c.nome AS 'Nome', c.ID 'ID Cliente'
FROM Reserva as r INNER JOIN Cliente as c
						ON c.id = r.cliente;


CREATE VIEW Quartos_Ocupados_Cliente AS
SELECT c.nome AS 'Nome',  q.ID AS 'Número do Quarto', h.nome AS 'Hotel' ,r.id AS 'Reserva', r.preco AS 'Preço'
FROM Reserva AS r INNER JOIN Cliente c
				   ON c.id = r.cliente
                   INNER JOIN quarto_has_reserva qr 
                   ON qr.Reserva_ID = r.ID
                   INNER JOIN Quarto q
                   ON q.ID = qr.Quarto_ID
                   INNER JOIN Hotel h
                   ON q.Hotel_ID = h.ID;


CREATE VIEW Reserva_TipoQuarto AS
SELECT r.ID AS 'Número da Reserva', tq.Designacao AS 'Tipo de Quarto', tq.Capacidade AS 'Capacidade do Quarto', c.nome AS 'Cliente'
FROM Reserva AS r INNER JOIN Cliente c
				   ON c.id = r.cliente
                   INNER JOIN quarto_has_reserva qr 
                   ON qr.Reserva_ID = r.ID
                   INNER JOIN Quarto q
                   ON q.ID = qr.Quarto_ID
                   INNER JOIN Tipo_Quarto tq
                   ON q.Tipo_de_Quarto = tq.Designacao;
   


                  
