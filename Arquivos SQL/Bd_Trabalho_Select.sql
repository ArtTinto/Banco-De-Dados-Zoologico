-- b.1) Exibir qual o/os Telefone/s e o Nome do Funcionario que cuida do Leão (Buscar por NmPopular = Leão, Ordenar pelo Nome do Funcionario)
SELECT 
    NmFuncionario, Telefone
FROM
    TbFuncionario F,
    TbAnimal A,
    TbAnimalFuncionario AF,
    TbTelefone T
WHERE
    T.CdFuncionario = F.CdFuncionario
        AND F.CdFuncionario = AF.CdFuncionario
        AND AF.CdAnimal = A.CdAnimal
        AND A.NmPopular = 'Leão'
ORDER BY NmFuncionario;
        
-- b.2) Exibir o Nome, CPF, Data da Visita de quem visitou o Habitat da Floresta (Procurar por TipoHabitat = "Floresta")
SELECT 
    NmCliente, CPF, DtVisita AS 'Data'
FROM
    TbHabitat H
        INNER JOIN
    TbVisitaHabitat VH ON H.CdHabitat = VH.CdHabitat
        INNER JOIN
    TbVisita V ON VH.CdVisita = V.CdVisita
        INNER JOIN
    TbIngresso I ON V.CdIngresso = I.CdIngresso
     INNER JOIN
	TbCliente C ON I.CdIngresso = C.CdCliente
WHERE
    TipoHabitat = 'Floresta'
ORDER BY NmCliente;
    
-- b.3) Exibir os nomes cientificos dos animais que residem nos habitats e os numero dos habitats que o Carlos Lima visitou
-- ordenar pelo NmCientifico
SELECT 
    NmCientifico, NumHabitat
FROM
    TbCliente C
        INNER JOIN
    TbIngresso I ON C.CdCliente = I.CdCliente
        INNER JOIN
    TbVisita V ON V.CdIngresso = I.CdIngresso
        INNER JOIN
    TbVisitaHabitat VH ON VH.CdVisita = V.CdVisita
        INNER JOIN
    TbHabitat H ON H.CdHabitat = VH.CdHabitat
        INNER JOIN
    TbAnimal A ON A.CdHabitat = H.CdHabitat
WHERE
    NmCliente = 'Carlos Lima'
ORDER BY NmCientifico;

-- c) Exibir a/as Caracteristica/s dos Animais presentes no habitat de numero 3 (Buscar pelo numero do Habitat)
SELECT DISTINCT
	Caracteristica
FROM
	TbAnimal A INNER JOIN
    TbHabitat H ON H.CdHabitat = A.CdHabitat
WHERE
	NumHabitat = 3;

-- d.1) Exibir o Nome Popular, o animal de maior Peso em cada habitat e o Numero do habitat
SELECT 
    NmPopular, MAX(Peso) AS Peso, NumHabitat
FROM
    TbAnimal A
        INNER JOIN
    TbHabitat H ON A.CdHabitat = H.CdHabitat
GROUP BY H.CdHabitat;

-- d.2) Exibir a quantidade arrecadada no dia 2025-01-11
SELECT 
    SUM(Preco) AS Valor
FROM
    TbVisita V
        INNER JOIN
    TbIngresso I ON V.CdIngresso = I.CdIngresso
WHERE
    DtVisita = '2025-01-11';

-- e) Exibir o Nome das pessoas que visitaram pelo menos 2 habitats ordernar pelo numero de habitat's visitados
SELECT 
    NmCliente, COUNT(*) AS Visitados
FROM
    TbCliente C
        INNER JOIN
    TbIngresso I ON C.CdCliente = I.CdCliente
        INNER JOIN
    TbVisita V ON I.CdIngresso = V.CdIngresso
        INNER JOIN
    TbVisitaHabitat VH ON V.CdVisita = VH.CdVisita
        INNER JOIN
    TbHabitat H ON VH.CdHabitat = H.CdHabitat
GROUP BY I.CdIngresso
HAVING Visitados >= 2
ORDER BY Visitados DESC;

-- f.1)  Exibir todas as especialidades de todos os Funcionarios, caso não tenha exiba de qualquer forma
SELECT
NmFuncionario, NmEspecialidade
FROM
TbFuncionario F 
LEFT JOIN
TbFuncionarioEspecialidade FE ON F.CdFuncionario = FE.CdFuncionario
LEFT JOIN
TbEspecialidade E ON FE.CdEspecialidade = E.CdEspecialidade;

-- f.2) Exibir o Nome dos funcionarios do sexo Masculino, e o Nome Popular dos animais em seus cuidados, se não tiver exiba de qualquer forma
-- Ordenar pelo Nome do Funcionario
SELECT 
    NmFuncionario, NmPopular
FROM
    TbFuncionario F
        LEFT JOIN
    TbAnimalFuncionario AF ON F.CdFuncionario = AF.CdFuncionario
        LEFT JOIN
    TbAnimal A ON AF.CdAnimal = A.CdAnimal
WHERE
    F.Genero = 'M'
ORDER BY NmFuncionario;
    
-- g) Exibir o Nome dos cliente, o nome dos funcionario que possuem z no nome,
-- Seus respectivos CPF e um identificador para clientes e funcionarios, ordenar pelo nome do cliente
SELECT 
    NmCliente, CPF, 'Cliente' AS Tipo
FROM
    TbCliente 
UNION SELECT 
    NmFuncionario, CPF, 'Funcionário' AS Tipo
FROM
    TbFuncionario
WHERE
    NmFuncionario LIKE '%z%'
ORDER BY NmCliente;

-- e) Exibir todos os Nomes dos Clientes o Horario de Entrada e Saida e o Tipo do habitat exceto os Habitat's da Floresta ou Aquatico
SELECT DISTINCT
    NmCliente, HrEntrada, HrSaida, TipoHabitat
FROM
    TbCliente C
        INNER JOIN
    TbIngresso I ON C.CdCliente = I.CdCliente
        INNER JOIN
    TbVisita V ON I.CdIngresso = V.CdIngresso
        INNER JOIN
    TbVisitaHabitat VH ON V.CdVisita = VH.CdVisita
        INNER JOIN
    TbHabitat H ON VH.CdHabitat = H.CdHabitat
WHERE
TipoHabitat NOT IN ("Floresta", "Aquatico");

-- i) Criar uma Visao para o Nome do Cliente, a Data da Visita os habitats visitados e Preco do Ingresso e os Habitats visitados
CREATE VIEW DadosVisita AS
SELECT 
    NmCliente, DtVisita, Preco, TipoHabitat
FROM
    TbCliente C
        INNER JOIN
    TbIngresso I ON C.CdCliente = I.CdCliente
        INNER JOIN
    TbVisita V ON I.CdIngresso = V.CdIngresso
        INNER JOIN
    TbVisitaHabitat VH ON V.CdVisita = VH.CdVisita
        INNER JOIN
    TbHabitat H ON VH.CdHabitat = H.CdHabitat;
