
CREATE SCHEMA IF NOT EXISTS `sistema_manifestacoes`;
USE `sistema_manifestacoes`;


CREATE TABLE IF NOT EXISTS `usuarios` (
    `ID`        INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NOME`      VARCHAR(100) NOT NULL,
    `CPF`       INT NOT NULL UNIQUE,
    `EMAIL`     VARCHAR(100) NOT NULL, -- diagrama trazia INT; ajustado p/ VARCHAR(100)
    `TELEFONE`  VARCHAR(100) NOT NULL,
    `ENDERECO`  VARCHAR(100) NOT NULL,
    `TIPO`      VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS `setores` (
    `ID`         INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NOME`       VARCHAR(100) NOT NULL,
    `CARGO`      VARCHAR(100) NOT NULL,
    `MATRICULA`  INT NOT NULL UNIQUE,
    `EMAIL`      VARCHAR(100) NOT NULL,
    `TELEFONE`   VARCHAR(100) NOT NULL
);



CREATE TABLE IF NOT EXISTS `manifestacoes` (
    `ID`                    INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NUMERO_PROTOCOLO`      INT NOT NULL UNIQUE,
    `TITULO`                VARCHAR(100) NOT NULL,
    `DESCRICAO`             VARCHAR(100) NOT NULL,
    `DATA_DE_ABERTURA`      DATE NOT NULL,
    `STATUS`                VARCHAR(100) NOT NULL,
    `PRIORIDADE`            VARCHAR(100) NOT NULL,
    `TIPO_DE_MANIFESTACAO`  VARCHAR(100) NOT NULL,
    `DATA_ENCERRAMENTO`     DATE,
    `USUARIO_CIDADAO_FK`    INT NOT NULL,
    `SETOR_FK`              INT NOT NULL,
    CONSTRAINT `fk_manifestacoes_usuario`
        FOREIGN KEY (`USUARIO_CIDADAO_FK`) REFERENCES `usuarios`(`ID`),
    CONSTRAINT `fk_manifestacoes_setor`
        FOREIGN KEY (`SETOR_FK`) REFERENCES `setores`(`ID`)
);

CREATE TABLE IF NOT EXISTS `respostas` (
    `ID`                       INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `TEXTO`                    VARCHAR(100) NOT NULL,
    `DATA_ENVIO`               DATE NOT NULL,
    `RESPONSAVEL_USUARIO_FK`   INT NOT NULL,
    `MANIFESTACAO_FK`          INT NOT NULL,
    CONSTRAINT `fk_respostas_usuario`
        FOREIGN KEY (`RESPONSAVEL_USUARIO_FK`) REFERENCES `usuarios`(`ID`),
    CONSTRAINT `fk_respostas_manifestacao`
        FOREIGN KEY (`MANIFESTACAO_FK`) REFERENCES `manifestacoes`(`ID`)
);



CREATE TABLE IF NOT EXISTS `atendente_manifestacoes` (
    `ID`                  INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `ATENDENTE_FK`        INT NOT NULL,
    `MANIFESTACOES_FK`    INT NOT NULL,
    CONSTRAINT `fk_atman_atendente`
        FOREIGN KEY (`ATENDENTE_FK`) REFERENCES `sistema_manifestacoes`.`usuarios`(`ID`),
    CONSTRAINT `fk_atman_manifestacao`
        FOREIGN KEY (`MANIFESTACOES_FK`) REFERENCES `sistema_manifestacoes`.`manifestacoes`(`ID`)
);




CREATE TABLE IF NOT EXISTS `historicos` (
    `ID`                 INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `DATA_HORA`          DATETIME NOT NULL,
    `DESCRICAO`          VARCHAR(100) NOT NULL,
    `STATUS`             VARCHAR(100) NOT NULL,
    `OBSERVACAO`         VARCHAR(100),
    `MANIFESTACAO_FK`    INT NOT NULL,
    `ATENDENTE_FK`       INT NOT NULL,
    CONSTRAINT `fk_historicos_manifestacao`
        FOREIGN KEY (`MANIFESTACAO_FK`) REFERENCES `sistema_manifestacoes`.`manifestacoes`(`ID`),
    CONSTRAINT `fk_historicos_atendente`
        FOREIGN KEY (`ATENDENTE_FK`) REFERENCES `sistema_manifestacoes`.`usuarios`(`ID`)
);



CREATE TABLE IF NOT EXISTS `anexos` (
    `ID`                        INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `NOME_ARQUIVO`              VARCHAR(100) NOT NULL,
    `TIPO`                      VARCHAR(100) NOT NULL,
    `DATA_ENVIO`                DATE NOT NULL,
    `CAMINHO_ARMAZENAMENTO`     VARCHAR(300),
    `MANIFESTACAO_FK`           INT NOT NULL,
    CONSTRAINT `fk_anexos_manifestacao`
        FOREIGN KEY (`MANIFESTACAO_FK`) REFERENCES `manifestacoes`(`ID`)
);
