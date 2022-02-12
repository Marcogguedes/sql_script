CREATE DATABASE curso_sql;

-- Selecionar o banco de dados utilize o comando USE
USE curso_sql;

-- Criando a primeira tabela no banco de dados
CREATE TABLE funcionarios
(
	id int unsigned not null auto_increment,
    nome varchar(45) not null,
    salario double not null default '0',
    departamento varchar(45) not null,
    primary key(id)
);

-- Criando a segunda tabela no banco de dados
CREATE TABLE veiculos
(
id int unsigned not null auto_increment,
funcionario_id int unsigned default null,
veiculo varchar(45) not null default '',
placa varchar(10) not null default '',
primary key(id),
constraint fk_veiculos_funcionarios foreign key (funcionario_id) references funcionarios (id)
);

-- Criando a terceira tabela no banco de dados
CREATE TABLE salarios
(
faixa varchar(45),
inicio double not null,
fim double not null,
primary key (faixa)
);

-- Alterando campos de uma tabela
ALTER TABLE funcionarios CHANGE COLUMN nome nome_func varchar(50) not null;

-- Alterando campos de uma tabela para o valor original
ALTER TABLE funcionarios CHANGE COLUMN nome_func nome varchar(45) not null;

-- Apagando tabela de um banco de dados
DROP TABLE salarios;

-- Criando índice em uma tabela no banco de dados
CREATE INDEX departamentos ON funcionarios (departamento);
CREATE INDEX nomes ON funcionarios (nome(8));