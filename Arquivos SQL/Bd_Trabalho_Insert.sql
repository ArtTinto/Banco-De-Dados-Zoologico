INSERT INTO TbHabitat 
VALUES (1, 1, 'Savana', 3),
(2, 2, 'Savana', 2),
(3, 3, 'Floresta', 5),
(4, 4, 'Aquatico', 4);

INSERT INTO TbAnimal
VALUES (1, 'M', 'Leão', "2006-05-11", 190, 'Carnivoro', 'Panthera leo', 1),
(2, 'F', 'Mamute', "1987-11-21", 8000, 'Herbivoro', 'Mammuthus', 3),
(3, 'M', 'Arara Azul', "2023-06-07", 1.3, 'Herbivoro', 'Anodorhynchus hyacinthinus', 3),
(4, 'F', 'Lontra', "2022-01-10", 10.3, 'Carnivoro', 'Lontra longicaudis', 4),
(5, 'F', 'Leão', "2000-12-26", 103.3, 'Carnivoro', 'Panthera leo', 2),
(6, 'M', 'Lontra', "2021-08-04", 12.7, 'Carnivoro', 'Lontra longicaudis', 4);


INSERT INTO TbEspecialidade (CdEspecialidade, NmEspecialidade, Area)
VALUES (1, 'Veterinária Clínica', 'Saúde Animal'),
(2, 'Nutrição Animal', 'Alimentação'),
(3, 'Biologia', 'Pesquisa'),
(4, 'Zootecnia', 'Manejo');

INSERT INTO TbCliente (CdCliente, NmCliente, CPF, DtNasc, Genero)
VALUES (1, 'João Silva', '123.456.789-10', "1993-02-28", 'M'),
(2, 'Maria Souza', '987.654.321-00', "1998-04-01", 'F'),
(3, 'Carlos Lima', '111.222.333-44', "2013-04-29", 'M'),
(4, 'Ana Pereira', '555.666.777-88', "1960-10-11", 'F');

INSERT INTO  TbIngresso (CdIngresso, Preco, CdCliente)
VALUES (1, 40.00, 1),
(2, 40.00, 2),
(3, 50.00, 3),
(4, 50.00, 4),
(5, 50.00, 2);

INSERT INTO TbVisita (CdVisita, HrEntrada, HrSaida, DtVisita, CdIngresso)
VALUES (1, '08:07:03', '09:30:29', "2025-01-10", 1),
(2, '10:30:37', '11:15:01', "2025-01-10", 2),
(3, '13:12:42', '14:45:21', "2025-01-11", 3),
(4, '15:30:21', '16:50:00', "2025-01-11", 4),
(5, '17:32:41', '18:00:00', "2025-01-11", 5);

INSERT INTO TbFuncionario (CdFuncionario, NmFuncionario, CPF, Genero, DtNasc, TempoProfissional, Endereco)
VALUES (1, 'Tiago Miranda', '000.000.000-00', 'M', "2006-11-01", 0, 'Vila do Chaves'),
(2, 'Renato Souza', '020.111.111-80', 'M', "2007-04-03", 8, 'Macuco'),
(3, 'Josina', '020.000.111-80', 'F', "1964-08-18", 27, 'Macuco'),
(4, 'Lucas Pantuza', '020.756.111-80', 'M', "1934-05-18", 19, 'Lado Cefet'),
(5, 'Marcelo', '300.400.500-66', 'M', "1976-07-01", 30, 'Alegre');

INSERT INTO TbTelefone
VALUES (1, '(31) 98888-1111'),
(2, '(31) 97777-2222'),
(2, '(31) 95566-6767'),
(3, '(31) 96666-3333'),
(4, '(31) 95555-4444');

INSERT INTO TbVisitaHabitat (CdHabitat, CdVisita)
VALUES (1, 1),
(1, 3),
(2, 1),
(3, 1),
(3, 2),
(4, 3);

INSERT INTO TbAnimalFuncionario (CdFuncionario, CdAnimal)
VALUES (1, 1),
(2, 2),
(3, 3),
(4, 4),
(2, 5);

INSERT INTO TbFuncionarioEspecialidade (CdEspecialidade, CdFuncionario)
VALUES (1, 1),
(2, 2),
(4, 2),
(3, 3),
(4, 4);