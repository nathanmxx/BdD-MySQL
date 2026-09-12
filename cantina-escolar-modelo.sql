CREATE DATABASE cantina_escolar;
USE cantina_escolar;

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao          VARCHAR(50) NOT NULL
);

CREATE TABLE turma (
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome     VARCHAR(20) NOT NULL,
    ano      INT         NOT NULL
);

CREATE TABLE responsavel (
    id_responsavel INT PRIMARY KEY AUTO_INCREMENT,
    nome           VARCHAR(100) NOT NULL,
    cpf            VARCHAR(14)  NOT NULL,
    telefone       VARCHAR(20)  NOT NULL
);

CREATE TABLE aluno (
    id_aluno       INT PRIMARY KEY AUTO_INCREMENT,
    nome           VARCHAR(100) NOT NULL,
    matricula      VARCHAR(20)  NOT NULL,
    saldo          DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_turma       INT NOT NULL,
    id_responsavel INT NOT NULL,
    FOREIGN KEY (id_turma)       REFERENCES turma(id_turma),
    FOREIGN KEY (id_responsavel) REFERENCES responsavel(id_responsavel)
);

CREATE TABLE categoria_produto (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(50) NOT NULL
);

CREATE TABLE produto (
    id_produto   INT PRIMARY KEY AUTO_INCREMENT,
    nome         VARCHAR(100)  NOT NULL,
    preco        DECIMAL(10,2) NOT NULL,
    id_categoria INT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria_produto(id_categoria)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome           VARCHAR(100) NOT NULL,
    cargo          VARCHAR(50)  NOT NULL
);

CREATE TABLE recarga (
    id_recarga         INT PRIMARY KEY AUTO_INCREMENT,
    valor              DECIMAL(10,2) NOT NULL,
    data_recarga       DATE          NOT NULL,
    id_aluno           INT NOT NULL,
    id_responsavel     INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    FOREIGN KEY (id_aluno)           REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_responsavel)     REFERENCES responsavel(id_responsavel),
    FOREIGN KEY (id_forma_pagamento) REFERENCES forma_pagamento(id_forma_pagamento)
);

CREATE TABLE compra (
    id_compra      INT PRIMARY KEY AUTO_INCREMENT,
    data_compra    DATETIME      NOT NULL,
    total          DECIMAL(10,2) NOT NULL,
    id_aluno       INT NOT NULL,
    id_funcionario INT NOT NULL,
    FOREIGN KEY (id_aluno)       REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_funcionario) REFERENCES funcionario(id_funcionario)
);

CREATE TABLE item_compra (
    id_item        INT PRIMARY KEY AUTO_INCREMENT,
    quantidade     INT           NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    id_compra      INT NOT NULL,
    id_produto     INT NOT NULL,
    FOREIGN KEY (id_compra)  REFERENCES compra(id_compra),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
