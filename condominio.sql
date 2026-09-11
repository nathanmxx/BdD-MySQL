create database condominio;
use condominio;

create table apartamento
(id_apartamento int primary key);

create table moradores
(id_morador int primary key,
nome_morador varchar(255) not null,
sobrenome_morador varchar(255) not null,
id_apartamento int not null,
foreign key (id_apartamento) references apartamento (id_apartamento)
);

create table funcionario
(id_funcionario int primary key,
nome_funcionario varchar(255) not null,
sobrenome_funcionario varchar(255) not null,
funcao varchar(255) not null);	

create table ocorrencia
(id_ocorrencia int primary key,
id_apartamento int,
id_morador int,
descricao varchar(255) not null,
data_ocorrencia date not null,
foreign key (id_apartamento) references apartamento (id_apartamento),
foreign key (id_morador) references moradores (id_morador)
);

create table cobranca
(id_cobranca int primary key,
id_apartamento int,
periodo date not null,
valor int not null,
vencimento date not null,
status_c varchar(255) not null,
foreign key (id_apartamento) references apartamento (id_apartamento)
); 

create table areas_comuns
(id_area int primary key,
nome_area varchar(255) not null,
capacidade int not null,
status_a varchar(255) not null);

create table reservas
(id_reservas int primary key,
id_apartamento int,
id_area int,
data_reserva date not null,
foreign key (id_apartamento) references apartamento (id_apartamento),
foreign key (id_area) references areas_comuns (id_area)
);

create table historico
(id_historico int primary key,
id_morador int,
id_apartamento int,
data_entrada date not null,
data_saida date,
foreign key (id_morador) references moradores (id_morador),
foreign key (id_apartamento) references apartamento (id_apartamento)
);
