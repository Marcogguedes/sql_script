USE curso_sql;

-- Selecionando tabelas
SELECT * FROM funcionarios;
SELECT * FROM veiculos;

-- Criando relacionamentos entre duas tabelas
SELECT * FROM funcionarios INNER JOIN veiculos ON funcionario_id = funcionarios.id;

-- Criando relacionamentos entre duas tabelas usando apelido
SELECT * FROM funcionarios f INNER JOIN veiculos v ON v.funcionario_id = f.id;

-- Criando relacionamentos entre duas tabelas usando variacoes do (join)
SELECT * FROM funcionarios LEFT JOIN veiculos v ON v.funcionario_id = f.id;

-- Cadastrando mais um veiculo na tabela 
INSERT INTO veiculos (funcionario_id, veiculo, placa) VALUES (null, "Moto", "KNP-0124");

-- Selecionando a tabela
SELECT * FROM veiculos;

-- Criando relacionamentos entre duas tabelas usando variaçoes do (join)
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

-- Criando relacionamentos entre duas tabelas usando o comando (union)
SELECT * FROM funcionarios f LEFT JOIN 	veiculos v ON v.funcionario_id = f.id
UNION
SELECT * FROM funcionarios f RIGHT JOIN veiculos v ON v.funcionario_id = f.id;

-- Criando uma nova tabela

CREATE TABLE cpfs
(
id int unsigned not null,
cpf varchar(14) not null,
primary key(id),
constraint fk_cpf foreign key (id) references funcionarios (id)
)

-- Inserindo dados na tabela
INSERT INTO cpfs (id,cpf) VALUES (1,'111.111.111-11');
INSERT INTO cpfs (id,cpf) VALUES (2,'222.222.222-22');
INSERT INTO cpfs (id,cpf) VALUES (3,'333.333.333-33');
INSERT INTO cpfs (id,cpf) VALUES (5,'555.555.555-55');
INSERT INTO cpfs (id,cpf) VALUES (1,'111.111.111-11');

-- Selecionando a tabela
SELECT * FROM cpfs;

-- Criando relacionamentos entre tabelas
SELECT * FROM funcionarios INNER JOIN cpfs ON funcionarios.id = cpfs.id;
SELECT * FROM funcionarios INNER JOIN cpfs USING (id);

-- Criando uma nova tabela

CREATE TABLE clientes
(
id int unsigned not null,
nome varchar(45) not null,
quem_indicou int unsigned,
primary key (id),
constraint fk_quem_indicou foreign key (quem_indicou) references clientes (id)
);

-- Inserindo registros na tabela
INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'Marco', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Julio', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Elaine', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Josy', 3);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (5, 'Monica', 4);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (6, 'Daniel', 1);

-- Selecionando a tabela
SELECT * FROM clientes;

-- Criando um relacionamento de uma tabela com ela mesma e aplicando apelidos nas tabelas
SELECT a.nome AS Cliente, b.nome AS Quem_Indicou FROM clientes a JOIN clientes b ON a.quem_indicou = b.id;

-- Criando visoes no banco de dados
CREATE VIEW funcionarios_a AS SELECT * FROM funcionarios WHERE salario >= 5500;

-- Selecionando a VIEW no banco de dados
SELECT * FROM funcionarios_a;

-- Excluindo uma VIEW no banco de dados
/* DROP VIEW funcionarios_a; */