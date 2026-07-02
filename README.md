# 🦁 Banco de Dados Zoológico

## 📖 Sobre o Projeto
Este projeto consiste no desenvolvimento de um sistema de banco de dados relacional para gerenciar as operações internas de um zoológico. O sistema permite o controle detalhado de animais, seus respectivos habitats, quadro de funcionários (com suas especialidades) e a gestão de clientes, ingressos e visitas.

## 📝 Minimundo e Regras de Negócio
O banco de dados foi modelado com base nas seguintes regras operacionais do zoológico:
* **Animais e Habitats:** O zoológico abriga diversos animais, registrando características como nome popular, nome científico, peso e hábitos alimentares. Cada animal está associado a pelo menos um habitat.
* **Habitats:** Possuem número, tipo (ex: savana, floresta, aquático) e capacidade máxima respeitada.
* **Funcionários:** Registrados com dados pessoais, tempo de experiência e especialidades (veterinária, biologia, nutrição, etc.). Um funcionário pode cuidar de vários animais e vice-versa.
* **Visitas e Clientes:** Visitantes compram ingressos vinculados a um cadastro de cliente. Durante uma visita, o cliente pode percorrer vários habitats, mas sem repetições na mesma visita. O ingresso não tem validade e permite uma única visita.

## 🗄️ Estrutura do Banco de Dados
O projeto foi modelado utilizando o **MySQL Workbench** e contém as seguintes tabelas principais e associativas:
* **Acesso e Público:** `TbCliente`, `TbIngresso`, `TbVisita`
* **Ecossistema:** `TbHabitat`, `TbAnimal`
* **Recursos Humanos:** `TbFuncionario`, `TbEspecialidade`, `TbTelefone`
* **Tabelas de Relacionamento (N:M):** `TbVisitaHabitat`, `TbAnimalFuncionario`, `TbFuncionarioEspecialidade`

## 📂 Arquivos do Projeto
* `Arquivos SQL/Bd_Trabalho_Create.sql`: Script DDL para criação de todas as tabelas e chaves (PKs e FKs).
* `Arquivos SQL/Bd_Trabalho_Insert.sql`: Script DML para a inserção de dados fictícios para testes.
* `Arquivos SQL/Bd_Trabalho_Select.sql`: Script DQL contendo consultas com múltiplos `JOINs`, funções de agregação (`MAX`, `SUM`, `COUNT`), operadores (`UNION`, `NOT IN`) e criação de uma `VIEW` (`DadosVisita`).
* `Minimundo/Modelo Zoológico.pdf`: Documentação em PDF com a descrição completa do minimundo.
* `Modelo Conceitual/TrabalhoReformed.mwb`: Arquivo de modelagem gerado no MySQL Workbench.

## 🚀 Como Executar
1. Clone este repositório em sua máquina local.
2. Abra o script no seu SGBD preferido (recomendamos o **MySQL Workbench**).
3. Execute os scripts estritamente na seguinte ordem para evitar erros de restrição de chaves estrangeiras:
   - **1º** `Bd_Trabalho_Create.sql`
   - **2º** `Bd_Trabalho_Insert.sql`
   - **3º** `Bd_Trabalho_Select.sql`

## 👥 Autores
* Arthur Ferreira Reis
* Yuri Espindola de Souza
