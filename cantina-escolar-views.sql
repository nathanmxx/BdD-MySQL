USE cantina_escolar;

CREATE VIEW vw_compras_aluno_funcionario AS
    SELECT aluno.nome AS "Aluno", funcionario.nome AS "Funcionario",
           compra.data_compra AS "Data", compra.total AS "Total"
    FROM compra, aluno, funcionario
    WHERE compra.id_aluno       = aluno.id_aluno
    AND   compra.id_funcionario = funcionario.id_funcionario;

CREATE VIEW vw_produtos_comprados_aluno AS
    SELECT aluno.nome AS "Aluno", produto.nome AS "Produto",
           item_compra.quantidade AS "Quantidade"
    FROM aluno, compra, item_compra, produto
    WHERE aluno.id_aluno         = compra.id_aluno
    AND   compra.id_compra       = item_compra.id_compra
    AND   item_compra.id_produto = produto.id_produto;

CREATE VIEW vw_recargas_aluno_pagamento AS
    SELECT aluno.nome AS "Aluno", recarga.valor AS "Valor",
           recarga.data_recarga AS "Data", forma_pagamento.descricao AS "Forma de Pagamento"
    FROM recarga, aluno, forma_pagamento
    WHERE recarga.id_aluno           = aluno.id_aluno
    AND   recarga.id_forma_pagamento = forma_pagamento.id_forma_pagamento;

CREATE VIEW vw_itens_produto_categoria AS
    SELECT produto.nome AS "Produto", categoria_produto.nome AS "Categoria",
           item_compra.quantidade AS "Quantidade"
    FROM item_compra, produto, categoria_produto
    WHERE item_compra.id_produto = produto.id_produto
    AND   produto.id_categoria   = categoria_produto.id_categoria;

CREATE VIEW vw_alunos_responsaveis_turmas AS
    SELECT aluno.nome AS "Aluno", responsavel.nome AS "Responsavel",
           turma.nome AS "Turma"
    FROM aluno, responsavel, turma
    WHERE aluno.id_responsavel = responsavel.id_responsavel
    AND   aluno.id_turma       = turma.id_turma;

CREATE VIEW vw_compras_aluno_turma AS
    SELECT aluno.nome AS "Aluno", turma.nome AS "Turma",
           compra.data_compra AS "Data", compra.total AS "Total"
    FROM compra, aluno, turma
    WHERE compra.id_aluno = aluno.id_aluno
    AND   aluno.id_turma  = turma.id_turma;

CREATE VIEW vw_recargas_completo AS
    SELECT aluno.nome AS "Aluno", responsavel.nome AS "Responsavel",
           recarga.valor AS "Valor", forma_pagamento.descricao AS "Forma de Pagamento"
    FROM recarga, aluno, responsavel, forma_pagamento
    WHERE recarga.id_aluno           = aluno.id_aluno
    AND   recarga.id_responsavel     = responsavel.id_responsavel
    AND   recarga.id_forma_pagamento = forma_pagamento.id_forma_pagamento;

CREATE VIEW vw_compras_aluno_funcionario_turma AS
    SELECT aluno.nome AS "Aluno", turma.nome AS "Turma",
           funcionario.nome AS "Funcionario", compra.data_compra AS "Data"
    FROM compra, aluno, turma, funcionario
    WHERE compra.id_aluno       = aluno.id_aluno
    AND   aluno.id_turma        = turma.id_turma
    AND   compra.id_funcionario = funcionario.id_funcionario;

CREATE VIEW vw_itens_aluno_produto_categoria AS
    SELECT aluno.nome AS "Aluno", produto.nome AS "Produto",
           categoria_produto.nome AS "Categoria", item_compra.quantidade AS "Quantidade"
    FROM aluno, compra, item_compra, produto, categoria_produto
    WHERE aluno.id_aluno         = compra.id_aluno
    AND   compra.id_compra       = item_compra.id_compra
    AND   item_compra.id_produto = produto.id_produto
    AND   produto.id_categoria   = categoria_produto.id_categoria;

CREATE VIEW vw_visao_geral AS
    SELECT aluno.nome AS "Aluno", turma.nome AS "Turma",
           funcionario.nome AS "Funcionario", produto.nome AS "Produto",
           item_compra.quantidade AS "Quantidade"
    FROM aluno, turma, compra, funcionario, item_compra, produto
    WHERE aluno.id_turma         = turma.id_turma
    AND   compra.id_aluno        = aluno.id_aluno
    AND   compra.id_funcionario  = funcionario.id_funcionario
    AND   item_compra.id_compra  = compra.id_compra
    AND   item_compra.id_produto = produto.id_produto;

CREATE VIEW vw_alunos_saldo_baixo AS
    SELECT nome AS "Aluno", saldo AS "Saldo"
    FROM aluno
    WHERE saldo < 30.00;

CREATE VIEW vw_compras_marco AS
    SELECT id_compra AS "ID Compra", data_compra AS "Data", total AS "Total"
    FROM compra
    WHERE data_compra >= '2025-03-01' AND data_compra <= '2025-03-31';

CREATE VIEW vw_produtos_caros AS
    SELECT nome AS "Produto", preco AS "Preco"
    FROM produto
    WHERE preco > 4.00;

CREATE VIEW vw_recargas_pix AS
    SELECT aluno.nome AS "Aluno", recarga.valor AS "Valor", recarga.data_recarga AS "Data"
    FROM recarga, aluno
    WHERE recarga.id_aluno           = aluno.id_aluno
    AND   recarga.id_forma_pagamento = 2;

CREATE VIEW vw_compras_alto_valor AS
    SELECT aluno.nome AS "Aluno", compra.total AS "Total", compra.data_compra AS "Data"
    FROM compra, aluno
    WHERE compra.id_aluno = aluno.id_aluno
    AND   compra.total > 8.00;

CREATE VIEW vw_alunos_por_saldo AS
    SELECT nome AS "Aluno", saldo AS "Saldo"
    FROM aluno
    ORDER BY saldo DESC;

CREATE VIEW vw_produtos_por_preco AS
    SELECT nome AS "Produto", preco AS "Preco"
    FROM produto
    ORDER BY preco ASC;

CREATE VIEW vw_compras_por_data AS
    SELECT id_compra AS "ID Compra", data_compra AS "Data", total AS "Total"
    FROM compra
    ORDER BY data_compra DESC;

CREATE VIEW vw_recargas_por_valor AS
    SELECT aluno.nome AS "Aluno", recarga.valor AS "Valor"
    FROM recarga, aluno
    WHERE recarga.id_aluno = aluno.id_aluno
    ORDER BY recarga.valor DESC;

CREATE VIEW vw_alunos_por_nome AS
    SELECT aluno.nome AS "Aluno", turma.nome AS "Turma"
    FROM aluno, turma
    WHERE aluno.id_turma = turma.id_turma
    ORDER BY aluno.nome ASC;

CREATE VIEW vw_total_compras_por_aluno AS
    SELECT aluno.nome AS "Aluno", COUNT(compra.id_compra) AS "Total de Compras"
    FROM compra, aluno
    WHERE compra.id_aluno = aluno.id_aluno
    GROUP BY aluno.nome;

CREATE VIEW vw_valor_gasto_por_aluno AS
    SELECT aluno.nome AS "Aluno", SUM(compra.total) AS "Total Gasto"
    FROM compra, aluno
    WHERE compra.id_aluno = aluno.id_aluno
    GROUP BY aluno.nome;

CREATE VIEW vw_produtos_por_categoria AS
    SELECT categoria_produto.nome AS "Categoria", COUNT(produto.id_produto) AS "Qtd Produtos"
    FROM produto, categoria_produto
    WHERE produto.id_categoria = categoria_produto.id_categoria
    GROUP BY categoria_produto.nome;

CREATE VIEW vw_recargas_por_forma_pagamento AS
    SELECT forma_pagamento.descricao AS "Forma de Pagamento", SUM(recarga.valor) AS "Total Recarregado"
    FROM recarga, forma_pagamento
    WHERE recarga.id_forma_pagamento = forma_pagamento.id_forma_pagamento
    GROUP BY forma_pagamento.descricao;

CREATE VIEW vw_compras_por_funcionario AS
    SELECT funcionario.nome AS "Funcionario", COUNT(compra.id_compra) AS "Compras Registradas"
    FROM compra, funcionario
    WHERE compra.id_funcionario = funcionario.id_funcionario
    GROUP BY funcionario.nome;
