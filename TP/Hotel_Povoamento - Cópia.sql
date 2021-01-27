
-- SCHEMA "Hotel"
USE `Hotel` ;

--
-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;

--
-- Povoamento da tabela "Hotel"
INSERT INTO Hotel
	(Site, ID, Nome, Rua, Freguesia, Codigo_Postal, Localidade, Estrelas)
    VALUES
		('http://apuliapraia-hotel.com', 20202911, 'Apulia Praia Hotel', 'Avenida da Praia 45',
			'Apúlia', '4740-033 Apúlia', 'Esposende', 4),
        ('http://ofirpraia-hotel.com', 20202912, 'Ofir Praia Hotel', 'Largo do Cortinhal',
			'Fão', '4740-329 Fão', 'Esposende', 3),
        ('http://esposendepraia-hotel.com', 20202913, 'Esposende Praia Hotel', 'Rua 1º de Dezembro',
			'Esposende', '4740-226 Esposende', 'Esposende', 5);    
            
--
-- Povoamento da tabela "Hotel"
INSERT INTO Funcionario
	(ID, Nome, Codigo_Postal, Freguesia, Rua, Localidade, Email, Telemovel, CC, Cargo, Turno, Hotel)
    VALUES
		(1, 'João Antunes', '4900-058 Afife', 'Afife', 'Estrada do Caracol', 'Viana do Castelo', null, '924678543', '87564356-1ZY8','Rececionista','Diurno', 	20202911),
        (2, 'Mariana Santos', '4910-003 Arga de Baixo', 'Arga de Baixo', 'Rua da Coutada', 'Caminha', 'mariana@gmail.com', null, '90958674-1ZX9','Rececionista', 'Diurno', 20202911),
        (3, 'Gustavo Neto', '4930-210 Cristelo Covo', 'Cristelo Covo', 'Rua das Flores', 'Valença', 'gustavomail@gmail.com', '987567432', '85674635-1QW9','Segurança', 'Noturno', 20202911),
        (4, 'Joana Domingues', '4990-335 Feitosa', 'Feitosa', 'Rua da Cotinha', 'Ponte de Lima', null, null, '89857646-2TY0','Rececionista', 'Diurno', 20202912),
        (5, 'Pedro Machado', '4980-813 Vila Nova de Muía', 'Vila Nova de Muía', 'Rua da Ribeira', 'Ponte da Barca', null, null, '87564900-1ER4','Rececionista', 'Diurno', 20202912),
        (6, 'Francisco Franco', '9650- 218 Lomba do Alcaide', 'Nossa Senhora dos Remédios', 'Rua Dona Adelaide', 'Povoação', null, null, '87567463-1PO9','Segurança', 'Noturno', 20202912),
        (7, 'Luís Sobral', '4710 - 562 Adaúfe', 'Adaúfe', 'Rua da Agrela', 'Braga', 'luissobral@gamil.com', null, '45361123-8ZZ4','Rececionista', 'Diurno', 20202913),
        (8, 'Rui Vieira', '4830 - 119 Campos', 'São Martinho do Campo', 'Rua Nossa Senhora de Fátima', 'Póvoa de Lanhoso', null, null, '85645534 - L44O','Rececionista', 'Diurno', 20202913),
        (9, 'André Martins', '4840-010 Terras de Bouro', 'Balança', 'Lugar de Água Levada', 'Terras de Bouro', null, '968205674', '51884563-P09P','Segurança', 'Noturno', 20202913);


--
-- Povoamento da tabela "Cliente"
INSERT INTO Cliente
	(ID, CC, NIF, Nome, Morada, Telemovel, Email, País)
    VALUES
		(1, '43123234-8OP9', 897675090, 'Luís Maximiano', 'Largo da Confeteira, nº 81, Braga', '986745321', null, 'Portugal'),
        (2, '43567807-9JN9', 756589090, 'Cleyton Vinicius', 'Bairro das Fontaínhas, nº 252, Terras de Bouro', '9345675849', null, 'Brasil'),
        (3, '46574642-9JH5', 645888765, 'Isabel Dos Santos', ' Rua de Barros, nº 34,1 Amares', null, null, 'Angola'),
        (4, '76574837-4TP9', 443098768, 'Carlos de Matos', 'Rua Luís de Matos, nº 543, Póvoa de Varzim', '965764322', null, 'Portugal'),
        (5, '87965232-3RT3', 784411963, 'John English', 'Rua dos Tabuleiros, nº 230, Viseu', '931200089', null, 'Inglês'),
        (6, '87200321-4UI4', 789210021, 'François Lloris', 'Travessa dos Moleiros, nº 12, Ponte de Lima', null, null, 'França'),
        (7, '87100968-4NB3', 978265477, 'Julian Werner', 'Praça do Rossio, nº 141, Lisboa', '925477987', null, 'Alemanha'),
        (8, '10987836-I53D', 109875433,'Joana de Matos Sottomayor', 'Rua do Bom Jesus, nº 2, Braga', '912333987', null, 'Brasil'),
        (9, '87559632-6TR0', 000254698, 'Paulo João Telles', ' Rua de Barros, nº 341 Braga', null, null, 'Portugal');

--
-- Povoamento da tabela "Tipo_Quarto"
INSERT INTO Tipo_Quarto
	(Designacao, Preco, Capacidade)
    VALUES
		('Suíte', 350.00, 2),
        ('Single', 50.00, 1),
        ('Duplo', 90.00, 2),
        ('Triplo', 150.00, 3),
        ('Quadruplo', 200.00, 4);

--
-- Povoamento da tabela "Quarto"
INSERT INTO Quarto
	(ID, Hotel_ID, Tipo_de_Quarto, Ocupado)
    VALUES
    (1, 20202911, 'Suíte', '1'),
    (2, 20202911, 'Single', '1'),
    (3, 20202911, 'Single', '1'),
    (4, 20202911, 'Single', '0'),
    (5, 20202911, 'Duplo', '0'),
    (6, 20202911, 'Duplo', '0'),
    (7, 20202911, 'Triplo', '0'),
    (8, 20202911, 'Triplo', '0'),
    (9, 20202911, 'Quadruplo', '0'),
    (10, 20202911, 'Quadruplo', '0'),
    (11, 20202912, 'Single', '1'),
    (12, 20202912, 'Single', '1'),
    (13, 20202912, 'Single', '1'),
    (14, 20202912, 'Single', '0'),
    (15, 20202912, 'Duplo', '0'),
    (16, 20202912, 'Duplo', '0'),
    (17, 20202912, 'Triplo', '0'),
    (18, 20202912, 'Triplo', '0'),
    (19, 20202912, 'Quadruplo', '0'),
    (20, 20202913, 'Quadruplo', '1'),
    (21, 20202913, 'Suíte', '1'),
    (22, 20202913, 'Suíte', '0'),
    (23, 20202913, 'Suíte', '1'),
    (24, 20202913, 'Suíte', '0'),
    (25, 20202913, 'Duplo', '0'),
    (26, 20202913, 'Duplo', '0'),
    (27, 20202913, 'Triplo', '0'),
    (28, 20202913, 'Triplo', '0'),
    (29, 20202913, 'Quadruplo', '0'),
    (30, 20202913, 'Quadruplo', '1');
    
--
-- Povoamento da tabela "Reserva"   
INSERT INTO Reserva
	(Data_de_Início, Data_de_Fim, ID, Preco, Data_de_Reserva, Cliente)
    VALUES
		('2021/11/30', '2021/12/04', 1500, 200.00 , '2020/11/29', 1),
        ('2020/12/06', '2020/12/09', 1501, 150.00 , '2020/05/20', 2),
        ('2020/12/30', '2021/1/04', 1502, 1000.00 , '2020/11/29', 3),
        ('2021/01/30', '2021/02/04', 1503, 250.00 , '2020/12/1', 4),
        ('2021/08/06', '2021/08/13', 1504, 350.00 , '2020/06/24', 5),
        ('2021/05/13', '2021/05/15', 1505, 400.00 , '2020/11/21', 6),
        ('2021/09/01', '2021/09/04', 1506, 1050.00 , '2020/11/23', 7),
        ('2020/12/06', '2020/12/09', 1507, 1050.00 , '2020/02/20', 8),
        ('2020/12/30', '2021/1/04', 1508, 250.00 , '2020/10/21', 9),
        ('2021/06/30', '2021/07/03', 1509, 400.00 , '2020/10/21', 9);


--
-- Povoamento da tabela "Quarto_has_Reserva"
INSERT INTO Quarto_has_Reserva
	(Quarto_ID, Reserva_ID)
    VALUES
		(1, 1500),
        (13, 1501),
        (30, 1502),
        (11, 1503),
        (3, 1504),
        (20, 1505),
        (21, 1506),
        (23, 1507),
        (2, 1509),
        (12, 1509);
 




        
        