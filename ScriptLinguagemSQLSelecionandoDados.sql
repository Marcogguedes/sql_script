-- Utilizando os comandos da linguagem DML e DQL
USE curso_sql;

-- Inserindo dados na tabela
INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (1, 'Marco', 4500, 'TI');
INSERT INTO funcionarios (id, nome, salario, departamento) VALUES (2, 'Mario', 6500, 'Financeiro');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Fabio', 6300, 'Financeiro');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Nelson', 4800, 'Fiscal');
INSERT INTO funcionarios (nome, salario, departamento) VALUES ('Marcia', 5800, 'Logistica');

-- Utilizando o comando SELECT
SELECT * FROM funcionarios;

-- Filtrando um valor unico
SELECT * FROM funcionarios WHERE nome = 'Marco';

-- Filtrando um valor pelo id
SELECT * FROM funcionarios WHERE id = 4;

-- Filtrando valores com o uso de operadores
SELECT * FROM funcionarios WHERE salario > 6000;

-- Atualizando os valores do campo salario da tabela
UPDATE funcionarios SET salario = salario * 1.1 WHERE id = 1;

SET SQL_SAFE_UPDATES = 0;
/* SET SQL_SAFE_UPDATES = 1; */

UPDATE funcionarios SET salario = salario * 1.1;

-- Selecionando a tabela com os valores atualizados
SELECT * FROM funcionarios;

-- Utilizando a funçao de arredondamento
UPDATE funcionarios SET salario = ROUND(salario * 1.1, 2);

-- Selecionando a tabela com os valores atualizados e arredondados
SELECT * FROM funcionarios;

-- Fazendo a exclusao de um registro na tabela
DELETE FROM funcionarios WHERE id = 4;

-- Inserindo novos registros na tabela
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Onix', 'KQH-6452');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (2, 'Volvo', 'JHN-1785');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (3, 'Punto', 'KQJ-6429');
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (1, 'Fiesta', 'KQH-6452');

-- Selecionando a tabaela com os valores inseridos
SELECT * FROM veiculos;

-- Atualizando a tabela 
UPDATE veiculos SET funcionario_id = 5 WHERE id = 1;

-- Selecionando a tabaela com os valores inseridos
SELECT * FROM veiculos;

-- Inserindo dados na tabela de salarios
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Jr', 2500, 3000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Pleno', 3500, 4000);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Analista Senior', 5500, 4500);
INSERT INTO salarios (faixa, inicio, fim) VALUES ('Data Science', 10000, 11000);

-- Selecionando a tabela de salarios
SELECT * FROM salarios;

-- Atribuindo um apelido para a tabela
SELECT * FROM funcionarios f WHERE f.salario > 6000;

-- Selecionando campos especificos da tabela
SELECT nome, salario FROM funcionarios f WHERE f.salario > 7500;

-- Mudando o nome do campo de uma tabela
SELECT nome AS 'Funcionario', salario FROM funcionarios f WHERE f.salario > 7000;

-- Unindo o resultado de duas consultas
SELECT * FROM funcionarios WHERE nome = 'Mario'
UNION
SELECT * FROM funcionarios WHERE id = 5;