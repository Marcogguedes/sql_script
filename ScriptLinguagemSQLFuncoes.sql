USE curso_sql;

-- Selecionando uma tabela
SELECT * FROM funcionarios;

-- Utilizando funcoes de agregacao
SELECT count(*)FROM funcionarios;    -- Quantidade de funcionários são 4.

-- Utilizando funcoes de agregacao com filtro
SELECT count(*) FROM funcionarios WHERE salario > 7500;    -- São 2 funcionários que ganham acima de 7.500 reais.

-- Utilizando funcoes de agregacao com filtro e mais criterios
SELECT * FROM funcionarios 
WHERE salario > 6000 AND departamento = 'Financeiro';   -- São 2 funcionários do departamento financeiro que ganham mais de 6.000 reais.

-- Utilizando a funcao SOMA
SELECT sum(salario) FROM funcionarios;    -- A soma dos salários dos funcionários é de 28.495,50 reais.

-- Utilizando a funcao SOMA e mais um filtro
SELECT sum(salario) FROM funcionarios 
WHERE departamento = 'Financeiro';    -- A soma dos salários dos funcionários do departamento financeiro é de 15.488,00 reais.

-- Utilizando a funcao MEDIA 
SELECT round(avg(salario)) FROM funcionarios;  -- A média salarial dos funcionários é de 7.124 reais.

-- Utilizando a funcao MEDIA e mais um filtro
SELECT avg(salario) FROM funcionarios WHERE departamento = 'Financeiro';    -- A média salarial do departamento financeiro é de 7.744 reais

-- Utilizando a funcao MAX para ver qual é o maior salario
SELECT max(salario) FROM funcionarios;    -- O maior salário da tabela de funcionários é de 7.865,00 reais.

-- Utilizando a funcao MAX para ver qual é o maior salario de um departamento
SELECT max(salario) FROM funcionarios WHERE departamento = 'Financeiro';    -- O maior salário do departamento financeiro é de 7.865,00 reais.

-- Utilizando a funcao MIN para ver qual é o menor salario
SELECT min(salario) FROM funcionarios;    -- O menor salário da tabela de funcionaários é de 5.989,50 reais.

-- Utilizando a funcao MIN para ver qual é menor salario de um departamento
SELECT min(salario) FROM funcionarios WHERE departamento ='Financeiro';    -- O menor salário do departamento financeiro é de 7.623,00 reais.

-- Utilizando a funcao DISTINCT para trazer valores distintos
SELECT DISTINCT(departamento) FROM funcionarios;    -- Os departamentos da tabela de funcionário (financeiro, logística, TI).

-- Selecionando a tabela
SELECT * FROM funcionarios;

-- Selecionando a tabela por ordem
SELECT * FROM funcionarios ORDER BY nome;

-- Selecionando a tabela por ordem decrescente
SELECT * FROM funcionarios ORDER BY salario DESC;

-- Selecionando a tabela
SELECT * FROM funcionarios;

-- Selecionando a tabela por paginacao
SELECT * FROM funcionarios LIMIT 2;

-- Selecionando a tabela por paginacao pulando 1 registro
SELECT * FROM funcionarios LIMIT 2 OFFSET 1;
SELECT * FROM funcionarios LIMIT 1, 2;

-- Selecionando a tabela com funcoes de agrupamento
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento;
SELECT departamento, AVG(salario) FROM funcionarios GROUP BY departamento HAVING AVG(salario) > 6000;

-- Selecionando a tabela e agrupando o numero de funcionarios de cada departamento
SELECT departamento, COUNT(*) FROM funcionarios GROUP BY departamento;

-- Selecionando e utilizando subqueries 
SELECT nome FROM funcionarios WHERE departamento IN ('Financeiro');

SELECT nome FROM funcionarios 
WHERE departamento IN 
	(
    SELECT departamento FROM funcionarios GROUP BY departamento HAVING AVG (salario) > 6000
    );