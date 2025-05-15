#criação do banco de dados
create database db_sistema_faculdade;

#ativando o banco de dados
use db_sistema_faculdade;


#criação da tabela  Cursos 
create table tbl_cursos(
	id int primary key auto_increment not null,
	nome_curso varchar(45) not null,
	semestres int not null,
	valor decimal (10,2) not null,
	descricao varchar (100),
	unique index (id)
);

#relacção da tabela cursos com a tabela materias
create table tbl_cursos_materias(
	id int primary key auto_increment not null,
    id_materias int,	
    id_cursos int,
    
    constraint fk_materias_cursos_materias
    foreign key (id_materias) 
    references tbl_materias (id),
    
    constraint fk_cursos_cursos_materias
    foreign key (id_cursos) 
    references tbl_cursos (id),
    unique index (id)
);


#criação da tabela Materias com a FK da Tabela notas
create table tbl_materias(
	id int primary key auto_increment not null,
    nome_materia varchar(45) not null,
    carga_horaria int not null,
	id_notas int,
    
    constraint fk_notas_materias
    foreign key (id_notas) 
    references tbl_notas(id),
    unique index (id)
);

#criação da tabela notas
create table tbl_notas(
	id int not null auto_increment primary key,
    nota_aluno varchar (45) not null,
    frequencia_aula varchar(45) not null,
    unique index (id)
);


#criação da tabela professor com a FK da tabela Materias 
create table tbl_professor(
	id int primary key auto_increment not null,
    nome_professor varchar(45) not null,
    email varchar(45) not null,
    data_contratacao date not null,
    id_materias int,
    
    constraint fk_materias_professor
    foreign key (id_materias)  
    references tbl_materias (id),
    
    unique index (id)
);

#criação da tabela turma
create table tbl_turma(
	id int auto_increment primary key not null,
    horario varchar(15) not null,
	
    unique index (id)
);

#relação das tabelas turna com a tabeka materias 
create table tbl_materias_turna(
	id int auto_increment primary key not null,
	id_turma int,
	id_materias int,
    
	constraint fk_turma_materias_turma
	foreign key (id_turma) 
    references tbl_turma(id),
	
    constraint fk_materias_materias_turma
    foreign key (id_materias) 
    references tbl_materias (id),
	
    unique index (id)
);

#criação da tablea endereço com a FK da tabela Aluno
create table tbl_endereco(
	id int auto_increment primary key not null,
    cep varchar(45) not null,
    logradouro varchar(45) not null,
    numero varchar(45) not null,
    bairro varchar(45) not null,
    cidade varchar(45) not null,
    estado varchar(45) not null,
    id_aluno int,
    
    constraint fk_aluno_endereco
    foreign key (id_aluno)
    references tbl_aluno (id),
    
    unique index (id)
);

#criação da tabela aluno 
create table tbl_aluno(
	id int primary key auto_increment not null,
	nome_aluno varchar(45) not null,
	cpf int not null,
	data_nascimento date not null,
	telefone varchar(45) not null,
	curso varchar(45) not null,
	matricula int not null,
	email varchar(45),
    
    unique index (id)

);

#relação da tabela aluno com a tabela turma
create table tbl_turma_aluno(
	id int primary key auto_increment not null,
	id_aluno int,
	id_turma int,

	constraint fk_aluno_turma_aluno
	foreign key (id_aluno) 
	references tbl_aluno(id),
	
    constraint fk_turma_turma_aluno
    foreign key (id_turma) 
    references tbl_turma(id),
	
    unique index (id)
);

show tables;


