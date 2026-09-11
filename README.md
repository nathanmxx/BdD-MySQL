# Banco de Dados com MySQL

Modelagem e consultas em MySQL, do primeiro semestre da disciplina de Banco de
Dados, no 2º ano do ensino médio técnico.

Este é o lado **relacional** da disciplina: os dados ficam em tabelas de esquema
fixo, cada registro tem as mesmas colunas, e as ligações entre as tabelas são
declaradas como chave estrangeira e garantidas pelo próprio banco. É o que
permite, por exemplo, impedir que um aluno seja cadastrado numa turma que não
existe, ou cruzar cinco tabelas numa única consulta com `JOIN`.

O segundo semestre trabalha o lado **não relacional**, em MongoDB, onde os dados
ficam em documentos que não precisam ter todos o mesmo formato e as ligações são
resolvidas na aplicação. Esse fica em `BdD-MongoDB`.

## Scripts

### condominio.sql

Modelo de um condomínio em oito tabelas: apartamento, moradores, funcionário,
ocorrência, cobrança, áreas comuns, reservas e histórico de entrada e saída de
moradores. Cria o banco, as tabelas e as chaves estrangeiras que ligam morador a
apartamento, ocorrência a morador e reserva a área comum.

### cantina-escolar-modelo.sql

Modelo de uma cantina escolar com crédito pré-pago, em dez tabelas: forma de
pagamento, turma, responsável, aluno, categoria de produto, produto,
funcionário, recarga, compra e item da compra. O aluno tem saldo, o responsável
faz recargas, e cada compra é registrada por um funcionário e detalhada em
itens, já que uma mesma compra pode levar vários produtos.

### cantina-escolar-views.sql

25 views sobre o modelo da cantina: dez cruzando três ou mais tabelas, cinco com
filtro `WHERE`, cinco com `ORDER BY` e cinco com `GROUP BY`, entre elas total
gasto por aluno, produtos por categoria, recargas por forma de pagamento e alunos
com saldo baixo.

### cantina-escolar-consultas.sql

Dez consultas diretas às tabelas e a leitura de todas as views.

## Como executar

Requer MySQL. Rode na ordem:

    mysql -u root -p < cantina-escolar-modelo.sql
    mysql -u root -p < cantina-escolar-views.sql
    mysql -u root -p < cantina-escolar-consultas.sql

O `condominio.sql` é independente e cria o próprio banco.

Os scripts criam apenas a estrutura, sem carga de dados, então as consultas
retornam vazio até que as tabelas sejam populadas.

## Tecnologias

MySQL.

Projeto desenvolvido em equipe.
