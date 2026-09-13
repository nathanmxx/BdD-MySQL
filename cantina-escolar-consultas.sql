USE cantina_escolar;

SELECT * FROM aluno;
SELECT nome, preco FROM produto;
SELECT nome, cargo FROM funcionario;
SELECT * FROM forma_pagamento;
SELECT * FROM turma;
SELECT nome, telefone FROM responsavel;
SELECT * FROM categoria_produto;
SELECT nome, saldo FROM aluno;
SELECT id_compra, data_compra, total FROM compra;
SELECT id_recarga, valor, data_recarga FROM recarga;

SELECT * FROM vw_compras_aluno_funcionario;
SELECT * FROM vw_produtos_comprados_aluno;
SELECT * FROM vw_recargas_aluno_pagamento;
SELECT * FROM vw_itens_produto_categoria;
SELECT * FROM vw_alunos_responsaveis_turmas;
SELECT * FROM vw_compras_aluno_turma;
SELECT * FROM vw_recargas_completo;
SELECT * FROM vw_compras_aluno_funcionario_turma;
SELECT * FROM vw_itens_aluno_produto_categoria;
SELECT * FROM vw_visao_geral;

SELECT * FROM vw_alunos_saldo_baixo;
SELECT * FROM vw_compras_marco;
SELECT * FROM vw_produtos_caros;
SELECT * FROM vw_recargas_pix;
SELECT * FROM vw_compras_alto_valor;

SELECT * FROM vw_alunos_por_saldo;
SELECT * FROM vw_produtos_por_preco;
SELECT * FROM vw_compras_por_data;
SELECT * FROM vw_recargas_por_valor;
SELECT * FROM vw_alunos_por_nome;

SELECT * FROM vw_total_compras_por_aluno;
SELECT * FROM vw_valor_gasto_por_aluno;
SELECT * FROM vw_produtos_por_categoria;
SELECT * FROM vw_recargas_por_forma_pagamento;
SELECT * FROM vw_compras_por_funcionario;
