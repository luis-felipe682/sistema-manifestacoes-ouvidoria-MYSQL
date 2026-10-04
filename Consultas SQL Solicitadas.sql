------Quantidade de históricos de manifestação agrupados por status.-----

SELECT 
    STATUS AS status_historico,
    COUNT(*) AS total_historicos
FROM sistema_manifestacoes.historicos
GROUP BY STATUS;


--------Nome do arquivo dos anexos por usuário com o número do protocolo da manifestação.------

SELECT 
    u.NOME AS nome_usuario,
    m.NUMERO_PROTOCOLO AS numero_protocolo,
    a.NOME_ARQUIVO AS nome_arquivo_anexo
FROM sistema_manifestacoes.anexos a
JOIN sistema_manifestacoes.manifestacoes m ON a.MANIFESTACAO_FK = m.ID
JOIN sistema_manifestacoes.usuarios u ON m.USUARIO_CIDADAO_FK = u.ID
ORDER BY u.NOME, m.NUMERO_PROTOCOLO;


-----Quantidade de respostas a uma manifestação por setor----

SELECT 
    s.NOME AS nome_setor,
    COUNT(r.ID) AS total_respostas
FROM sistema_manifestacoes.setores s
LEFT JOIN sistema_manifestacoes.manifestacoes m ON s.ID = m.SETOR_FK
LEFT JOIN sistema_manifestacoes.respostas r ON m.ID = r.MANIFESTACAO_FK
GROUP BY s.ID, s.NOME;

------As 5 manifestações abertas há mais tempo.------

SELECT 
    NUMERO_PROTOCOLO,
    TITULO,
    DATA_DE_ABERTURA,
    STATUS
FROM sistema_manifestacoes.manifestacoes
WHERE STATUS = 'ABERTA'
ORDER BY DATA_DE_ABERTURA ASC
LIMIT 5;

----------Identificação do usuário com o maior número de manifestações registradas-------

SELECT 
    u.ID,
    u.NOME,
    u.EMAIL,
    COUNT(m.ID) AS total_manifestacoes
FROM sistema_manifestacoes.usuarios u
JOIN sistema_manifestacoes.manifestacoes m ON u.ID = m.USUARIO_CIDADAO_FK
GROUP BY u.ID, u.NOME, u.EMAIL
ORDER BY total_manifestacoes DESC
LIMIT 1;