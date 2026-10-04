USE `sistema_manifestacoes`;


INSERT INTO `usuarios`
    (`NOME`, `CPF`, `EMAIL`, `TELEFONE`, `ENDERECO`, `TIPO`)
VALUES
    ('Luis Viana',   111111111, 'luis.viana@unifacisa.edu.br',  '(83) 99111-1111', 'Rua A, 100', 'ATENDENTE'),
    ('Caio Dias',   111111112, 'caio.dias@unifacisa.edu.br',  '(83) 99111-1112', 'Rua B, 200', 'ATENDENTE'),
    ('Edcarla Jesus',   111111113, 'edcarla.jesu@unifacisa.edu.br',  '(83) 99111-1113', 'Rua C, 300', 'ATENDENTE'),
    ('Matheus Silva',   111111114, 'matheus.silva@unifacisa.edu.br',  '(83) 99111-1114', 'Rua D, 400', 'ADMINISTRADOR'),
    ('Hymura Sousa',       222222221, 'hymura.sousa@unifacisa.edu.br',             '(83) 98222-2221', 'Rua E, 10',  'CIDADAO'),
    ('Eldifonso Filho',     222222222, 'Eldefonso.filho@unifacisa.edu.br',           '(83) 98222-2222', 'Rua F, 20',  'CIDADAO'),
    ('jhonatas Sousa',    222222223, 'jhonatas.sosa@unifacisa.edu.br',          '(83) 98222-2223', 'Rua G, 30',  'CIDADAO'),
    ('Eriberto Andrade',  222222224, 'eriberto.andrade@unifacisa.edu.br',        '(83) 98222-2224', 'Rua H, 40',  'CIDADAO'),
    ('Rafael Barbosa',    222222225, 'Rafael.Barbosa@unifacisa.edu.br',          '(83) 98222-2225', 'Rua I, 50',  'CIDADAO'),
    ('Thalita Gomes',    222222226, 'thalita.gomes@unifacisa.edu.br',          '(83) 98222-2226', 'Rua J, 60',  'CIDADAO');
    
    

INSERT INTO `setores`
    (`NOME`, `CARGO`, `MATRICULA`, `EMAIL`, `TELEFONE`)
VALUES
   ('Secretaria Acadêmica', 'Coordenador', 600001, 'secretaria.academica@unifacisa.edu.br', '(83) 2101.8877'),
    ('Setor Financeiro',     'Coordenador', 600002, 'financeiro@unifacisa.edu.br',           '(83) 2101.8877');
    


INSERT INTO `manifestacoes`
    (`NUMERO_PROTOCOLO`, `TITULO`, `DESCRICAO`, `DATA_DE_ABERTURA`, `STATUS`, `PRIORIDADE`, `TIPO_DE_MANIFESTACAO`, `DATA_ENCERRAMENTO`, `USUARIO_CIDADAO_FK`, `SETOR_FK`)
VALUES
     (2026001, 'Erro na matrícula',                        'Erro no sistema durante o processo de matrícula online',            '2026-06-10', 'ABERTA',       'ALTA',  'RECLAMACAO', NULL,         5,  1),
    (2026002, 'Atraso na emissão do boleto',               'Boleto da mensalidade não foi emitido no prazo',                    '2026-06-15', 'EM_ANDAMENTO', 'MEDIA', 'RECLAMACAO', NULL,         6,  2),
    (2026003, 'Sugestão de ampliação da biblioteca',       'Sugestão de aumentar o acervo e o horário da biblioteca',           '2026-06-05', 'ENCERRADA',    'BAIXA', 'SUGESTAO',   '2026-03-01', 7,  1),
    (2026004, 'Cobrança indevida na mensalidade',          'Valor cobrado divergente do contratado na matrícula',              '2026-06-20', 'ABERTA',       'ALTA',  'DENUNCIA',   NULL,         8,  2),
    (2026005, 'Elogio ao atendimento da secretaria',       'Elogio ao atendimento recebido na Secretaria Acadêmica',           '2026-06-01', 'ENCERRADA',    'BAIXA', 'ELOGIO',     '2026-03-05', 9,  1),
    (2026006, 'Instabilidade no portal financeiro',        'Portal financeiro apresentando instabilidade constante',           '2026-07-10', 'EM_ANDAMENTO', 'MEDIA', 'RECLAMACAO', NULL,         10, 2),
    (2026007, 'Erro no cálculo de desconto',               'Desconto de pontualidade não aplicado corretamente na fatura',     '2026-06-02', 'ABERTA',       'ALTA',  'RECLAMACAO', NULL,         5,  2),
    (2026008, 'Sugestão de horário estendido da secretaria','Sugestão de ampliar o horário de atendimento da Secretaria Acadêmica', '2026-08-18', 'ENCERRADA', 'BAIXA', 'SUGESTAO', '2026-05-01', 6,  1),
    (2026009, 'Cobrança de taxa não informada',            'Denúncia de cobrança de taxa extra não informada previamente',     '2026-08-05', 'EM_ANDAMENTO', 'ALTA',  'DENUNCIA',   NULL,         7,  2),
    (2026010, 'Problema no acesso ao portal do aluno',     'Impossibilidade de acessar o portal acadêmico do aluno',           '2026-08-20', 'ABERTA',       'MEDIA', 'RECLAMACAO', NULL,         8,  1),
    (2026011, 'Falta de retorno sobre financiamento',      'Ausência de retorno sobre solicitação de financiamento estudantil', '2026-08-10', 'ABERTA',      'ALTA',  'RECLAMACAO', NULL,         9,  2),
    (2026012, 'Falta de sinalização das salas de aula',    'Falta de identificação numérica nas salas do bloco novo',          '2026-06-25', 'ABERTA',       'MEDIA', 'RECLAMACAO', NULL,         10, 1);





INSERT INTO `respostas`
    (`TEXTO`, `DATA_ENVIO`, `RESPONSAVEL_USUARIO_FK`, `MANIFESTACAO_FK`)
VALUES
     ('Encaminhamos sua solicitação para a Secretaria Acadêmica.',      '2026-09-12', 1, 1),
    ('A equipe está verificando o erro no sistema de matrícula.',      '2026-09-20', 1, 1),
    ('Matrícula corrigida e confirmada com sucesso.',                  '2026-09-01', 1, 1),
    ('Pedimos desculpas pelo atraso, o boleto já foi reemitido.',      '2026-09-18', 2, 2),
    ('Sugestão encaminhada para avaliação da coordenação da biblioteca.', '2026-09-10', 1, 3),
    ('Ampliação do horário da biblioteca em análise pela direção.',    '2026-09-20', 1, 3),
    ('Valor da mensalidade ajustado conforme contrato assinado.',      '2026-09-25', 3, 4);

INSERT INTO `atendente_manifestacoes`
    (`ATENDENTE_FK`, `MANIFESTACOES_FK`)
VALUES
    (1, 1), (2, 2), (1, 3), (3, 4), (2, 5), (3, 6),
    (1, 7), (2, 8), (3, 9), (1, 10), (2, 11), (3, 12);





INSERT INTO `historicos`
    (`DATA_HORA`, `DESCRICAO`, `STATUS`, `OBSERVACAO`, `MANIFESTACAO_FK`, `ATENDENTE_FK`)
VALUES
    ('2026-01-10 09:00:00', 'Manifestação registrada',       'ABERTA',       NULL,                 1,  1),
    ('2026-01-15 10:30:00', 'Manifestação registrada',       'ABERTA',       NULL,                 2,  2),
    ('2026-01-20 14:00:00', 'Manifestação em atendimento',   'EM_ANDAMENTO', NULL,                 2,  2),
    ('2026-02-05 08:45:00', 'Manifestação registrada',       'ABERTA',       NULL,                 3,  1),
    ('2026-03-01 11:00:00', 'Manifestação encerrada',        'ENCERRADA',    'Ciclovia aprovada',  3,  1),
    ('2026-02-20 09:15:00', 'Manifestação registrada',       'ABERTA',       NULL,                 4,  3),
    ('2026-03-01 10:00:00', 'Manifestação registrada',       'ABERTA',       NULL,                 5,  2),
    ('2026-03-05 15:30:00', 'Manifestação encerrada',        'ENCERRADA',    'Elogio arquivado',   5,  2),
    ('2026-03-10 08:00:00', 'Manifestação registrada',       'ABERTA',       NULL,                 6,  3),
    ('2026-03-15 09:20:00', 'Manifestação em atendimento',   'EM_ANDAMENTO', NULL,                 6,  3),
    ('2026-04-02 10:10:00', 'Manifestação registrada',       'ABERTA',       NULL,                 7,  1),
    ('2026-04-18 11:40:00', 'Manifestação registrada',       'ABERTA',       NULL,                 8,  2),
    ('2026-05-01 13:00:00', 'Manifestação encerrada',        'ENCERRADA',    'Horário ampliado',   8,  2),
    ('2026-05-05 09:00:00', 'Manifestação registrada',       'ABERTA',       NULL,                 9,  3),
    ('2026-05-06 10:00:00', 'Manifestação em atendimento',   'EM_ANDAMENTO', NULL,                 9,  3),
    ('2026-05-20 08:30:00', 'Manifestação registrada',       'ABERTA',       NULL,                 10, 1),
    ('2026-06-10 09:45:00', 'Manifestação registrada',       'ABERTA',       NULL,                 11, 2),
    ('2026-06-25 10:15:00', 'Manifestação registrada',       'ABERTA',       NULL,                 12, 3);





INSERT INTO `anexos`
    (`NOME_ARQUIVO`, `TIPO`, `DATA_ENVIO`, `CAMINHO_ARMAZENAMENTO`, `MANIFESTACAO_FK`)
VALUES
     ('print_erro_matricula.png',        'IMAGEM',    '2026-01-10', '/anexos/2026/001/print_erro_matricula.png',        1),
    ('comprovante_matricula.pdf',       'DOCUMENTO', '2026-01-10', '/anexos/2026/001/comprovante_matricula.pdf',       1),
    ('boleto_atrasado.pdf',             'DOCUMENTO', '2026-01-15', '/anexos/2026/002/boleto_atrasado.pdf',             2),
    ('proposta_biblioteca.pdf',         'DOCUMENTO', '2026-02-05', '/anexos/2026/003/proposta_biblioteca.pdf',         3),
    ('fatura_divergente.pdf',           'DOCUMENTO', '2026-02-20', '/anexos/2026/004/fatura_divergente.pdf',           4),
    ('carta_elogio_secretaria.pdf',     'DOCUMENTO', '2026-03-01', '/anexos/2026/005/carta_elogio_secretaria.pdf',     5),
    ('print_erro_portal_financeiro.png','IMAGEM',    '2026-03-10', '/anexos/2026/006/print_erro_portal_financeiro.png',6),
    ('fatura_desconto.pdf',             'DOCUMENTO', '2026-04-02', '/anexos/2026/007/fatura_desconto.pdf',             7),
    ('sugestao_horario_secretaria.pdf', 'DOCUMENTO', '2026-04-18', '/anexos/2026/008/sugestao_horario_secretaria.pdf', 8),
    ('comprovante_taxa_extra.pdf',      'DOCUMENTO', '2026-05-05', '/anexos/2026/009/comprovante_taxa_extra.pdf',      9),
    ('print_erro_portal_aluno.png',     'IMAGEM',    '2026-05-20', '/anexos/2026/010/print_erro_portal_aluno.png',     10),
    ('solicitacao_financiamento.pdf',   'DOCUMENTO', '2026-06-10', '/anexos/2026/011/solicitacao_financiamento.pdf',   11),
    ('foto_sala_sem_identificacao.jpg', 'IMAGEM',    '2026-06-25', '/anexos/2026/012/foto_sala_sem_identificacao.jpg', 12);
