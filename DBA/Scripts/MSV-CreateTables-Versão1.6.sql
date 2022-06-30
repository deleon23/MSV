/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 30/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : MSV versão 1.6
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
USE [CORPORATE]
GO
*/

IF object_id(N'DBO.MSV_Periodo', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Periodo

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_Periodo 
    (
     ID_Periodo INTEGER NOT NULL IDENTITY (1, 1)  , 
     TMP_Inicio TIME NOT NULL , 
     TMP_Fim TIME NOT NULL , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao  DATETIME  , 
     FLG_Situacao BIT NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Persiste informações referente a Frequências de Serviços. Engine de registro de frequência, padronizado conforme sistema de proposta (PCO_). Tabelas envolvidas na engine de frequencia (MSV_Feriado, MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela de Periodo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'ID_Periodo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Horário referente ao Início do Período' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'TMP_Inicio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Horário referente ao Fim do Período' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'TMP_Fim' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Periodo' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_Periodo ADD CONSTRAINT DF_MSV_Periodo_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Periodo ADD CONSTRAINT DF_MSV_Periodo_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_Periodo ADD CONSTRAINT PK_MSV_Periodo PRIMARY KEY CLUSTERED (ID_Periodo)

--Foreign Keys
END

IF object_id(N'DBO.MSV_PeriodoRecolhimento', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PeriodoRecolhimento

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PeriodoRecolhimento 
    (
     ID_PeriodoRecolhimento INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Periodo INTEGER , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao  DATETIME  , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Período de recolhimento. Tabelas envolvidas na engine de frequencia (MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela de de tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' , 'COLUMN' , 'ID_PeriodoRecolhimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Chave estrangeira da tabela Periodo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' , 'COLUMN' , 'COD_Periodo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoRecolhimento' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PeriodoRecolhimento ADD CONSTRAINT DF_MSV_PeriodoRecolhimento_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PeriodoRecolhimento ADD CONSTRAINT DF_MSV_PeriodoRecolhimento_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PeriodoRecolhimento ADD CONSTRAINT PK_MSV_PeriodoRecolhimento PRIMARY KEY CLUSTERED (ID_PeriodoRecolhimento)

--Foreign Keys
ALTER TABLE MSV_PeriodoRecolhimento
    ADD CONSTRAINT FK_MSV_PeriodoRecolhimento_MSV_Periodo FOREIGN KEY ( COD_Periodo )
        REFERENCES MSV_Periodo ( ID_Periodo )

END

IF object_id(N'DBO.MSV_PeriodoSuprimento', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PeriodoSuprimento

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PeriodoSuprimento 
    (
     ID_PeriodoSuprimento INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Periodo INTEGER , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao  DATETIME  , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Persiste informações referente a Frequências de Serviços. Engine de registro de frequência, padronizado conforme sistema de proposta (PCO_). Tabelas envolvidas na engine de frequencia (MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' , 'COLUMN' , 'ID_PeriodoSuprimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Chave estrangeira da tabela de Periodo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' , 'COLUMN' , 'COD_Periodo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PeriodoSuprimento' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PeriodoSuprimento ADD CONSTRAINT DF_MSV_PeriodoSuprimento_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PeriodoSuprimento ADD CONSTRAINT DF_MSV_PeriodoSuprimento_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PeriodoSuprimento ADD CONSTRAINT PK_MSV_PeriodoSuprimento PRIMARY KEY CLUSTERED (ID_PeriodoSuprimento)

--Foreign Keys
ALTER TABLE MSV_PeriodoSuprimento
    ADD CONSTRAINT FK_MSV_PeriodoSuprimento_MSV_Periodo FOREIGN KEY ( COD_Periodo )
        REFERENCES MSV_Periodo ( ID_Periodo )

END

IF object_id(N'DBO.MSV_Frequencia', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Frequencia

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_Frequencia 
    (
     ID_Frequencia INTEGER NOT NULL IDENTITY (1, 1) , 
     Des_Quinzena VARCHAR (100) , 
     Des_DiasSemana VARCHAR (100) , 
     Des_SemanaMes VARCHAR (100) , 
     Des_DiasUteis VARCHAR (100) , 
     Des_Cronograma VARCHAR (100) , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Dominio de frequencia. Engine de registro de frequência, padronizado conforme sistema de proposta (PCO_). Tabelas envolvidas na engine de frequencia (MSV_Frequencia, MSV_Feriado, MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela de MSV_Frequencia' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'ID_Frequencia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo de quinzena - Quinzena 1, 2 ou 1,2 ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'Des_Quinzena' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo dias da semana numero de 1 a 7 separados por virgula' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'Des_DiasSemana' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo das semanas no mês de 1 a 4' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'Des_SemanaMes' 
EXEC sp_addextendedproperty 'MS_Description' , 'Dias no mes, sendo de 1 a 30' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'Des_DiasUteis' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador de cronograma especial' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'Des_Cronograma' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Frequencia' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_Frequencia ADD CONSTRAINT DF_MSV_Frequencia_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Frequencia ADD CONSTRAINT df_MSV_Frequencia_FLG_situacao DEFAULT 1 FOR FLG_situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_Frequencia ADD CONSTRAINT PK_MSV_Frequencia PRIMARY KEY CLUSTERED (ID_Frequencia)

--Foreign Keys
END 

IF object_id(N'DBO.MSV_TipoFeriado', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_TipoFeriado

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_TipoFeriado 
    (
     ID_TipoFeriado INTEGER NOT NULL IDENTITY (1, 1)  , 
     Nom_TipoFeriado VARCHAR (50) NOT NULL , 
     Des_TipoFeriado VARCHAR (200) NOT NULL , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao  DATETIME  , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Persiste informações referente a Frequências de Serviços. Engine de registro de frequência, padronizado conforme sistema de proposta (PCO_). Tabelas envolvidas na engine de frequencia (MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela de MSV_TipoFeriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'ID_TipoFeriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Nome tipo de feriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'Nom_TipoFeriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo tipo de feriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'Des_TipoFeriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoFeriado' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_TipoFeriado ADD CONSTRAINT DF_MSV_TipoFeriado_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_TipoFeriado ADD CONSTRAINT DF_MSV_TipoFeriado_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_TipoFeriado ADD CONSTRAINT PK_MSV_TipoFeriado PRIMARY KEY CLUSTERED (ID_TipoFeriado)

--Foreign Keys
END 

IF object_id(N'DBO.MSV_Feriado', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Feriado

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_Feriado 
    (
     ID_Feriado INTEGER NOT NULL IDENTITY (1, 1) ,
     COD_Periodo INTEGER , 
     COD_TipoFeriado INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Feriado. Engine de registro de frequência, padronizado conforme sistema de proposta. Tabelas envolvidas na engine de frequencia (MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primária da tabela de MSV_Feriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'ID_Feriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do período' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'COD_Periodo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Tipo de Feriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'COD_TipoFeriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Feriado' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_Feriado ADD CONSTRAINT DF_MSV_Feriado_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Feriado ADD CONSTRAINT DF_MSV_Feriado_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_Feriado ADD CONSTRAINT PK_MSV_Feriado PRIMARY KEY CLUSTERED (ID_Feriado)

--Foreign Keys
ALTER TABLE MSV_Feriado
    ADD CONSTRAINT FK_MSV_Feriado_MSV_TipoFeriado FOREIGN KEY ( COD_TipoFeriado )
        REFERENCES MSV_TipoFeriado ( ID_TipoFeriado )
END

IF object_id(N'DBO.MSV_PrecoPAFrequencia', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoPAFrequencia

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoPAFrequencia 
    (
     ID_PrecoPAFrequencia INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Frequencia INTEGER NOT NULL , 
     COD_Feriado INTEGER , 
     COD_PeriodoRecolhimento INTEGER , 
     COD_PeriodoSuprimento INTEGER , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao  DATETIME  , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Efetua o relacionamento criando assim a frequencia completa. Engine de registro de frequência, padronizado conforme sistema de proposta (PCO_). Tabelas envolvidas na engine de frequencia (MSV_TipoFeriado, MSV_Periodo, MSV_PeriodoSuprimento, MSV_PeriodoRecolhimento, MSV_PrecoPAFrequencia).' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primaria de tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'ID_PrecoPAFrequencia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código da frequência' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'COD_Frequencia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do feriado' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'COD_Feriado' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do período de recolhimento' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'COD_PeriodoRecolhimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do período de suprimento' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'COD_PeriodoSuprimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteracao do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAFrequencia' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoPAFrequencia ADD CONSTRAINT DF_MSV_PrecoPAFrequencia_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoPAFrequencia ADD CONSTRAINT DF_MSV_PrecoPAFrequencia_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoPAFrequencia ADD CONSTRAINT PK_MSV_PrecoPAFrequencia PRIMARY KEY CLUSTERED (ID_PrecoPAFrequencia)
ALTER TABLE MSV_PrecoPAFrequencia ADD CONSTRAINT UK_MSV_PrecoPAFrequencia UNIQUE NONCLUSTERED (COD_Frequencia, COD_Feriado, COD_PeriodoRecolhimento, COD_PeriodoSuprimento)

--Foreign Keys
ALTER TABLE MSV_PrecoPAFrequencia
    ADD CONSTRAINT FK_MSV_PrecoPAFrequencia_MSV_PeriodoRecolhimento FOREIGN KEY ( COD_PeriodoRecolhimento )
        REFERENCES MSV_PeriodoRecolhimento ( ID_PeriodoRecolhimento )
  
ALTER TABLE MSV_PrecoPAFrequencia
    ADD CONSTRAINT FK_MSV_PrecoPAFrequencia_MSV_PeriodoSuprimento FOREIGN KEY ( COD_PeriodoSuprimento )
        REFERENCES MSV_PeriodoSuprimento ( ID_PeriodoSuprimento )

ALTER TABLE MSV_PrecoPAFrequencia
    ADD CONSTRAINT FK_MSV_PrecoPAFrequencia_MSV_Feriado FOREIGN KEY ( COD_Feriado )
        REFERENCES MSV_Feriado ( ID_Feriado )

ALTER TABLE MSV_PrecoPAFrequencia
    ADD CONSTRAINT FK_MSV_PrecoPAFrequencia_MSV_Frequencia FOREIGN KEY ( COD_Frequencia )
        REFERENCES MSV_Frequencia ( ID_Frequencia )
END 

IF object_id(N'DBO.MSV_TipoMAquina', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_TipoMAquina

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_TipoMaquina 
    (
     ID_TipoMaquina INTEGER NOT NULL IDENTITY (1, 1)  , 
     Des_TipoMaquina VARCHAR (50) NOT NULL , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Especificação do tipo de máquina que pode ser : 1). A - ATM, 2.) C - COMPUSAFE, 3.) F - FECHADURA ou 4.) R - ATMR' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Chave primaria de tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina' , 'COLUMN' , 'ID_TipoMaquina' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo do tipo de maquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina' , 'COLUMN' , 'Des_TipoMaquina' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteracao do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoMaquina' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_TipoMaquina ADD CONSTRAINT DF_MSV_TipoMaquina_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_TipoMaquina ADD CONSTRAINT DF_MSV_TipoMaquina_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_TipoMaquina ADD CONSTRAINT PK_MSV_TipoMaquina PRIMARY KEY CLUSTERED (ID_TipoMaquina)

--Foreign Keys
END

IF object_id(N'DBO.MSV_ModeloCWP', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_ModeloCWP

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_ModeloCWP 
    ( ID_ModeloCWP INTEGER NOT NULL IDENTITY (1, 1)  , 
     Des_ModeloCWP VARCHAR (50) NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Especificação do modelo de máquina que pode ser : exemplo SUPER STANDART, LIGHT são modelos de equipamentos COMPUSAFE..' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP' , 'COLUMN' , 'ID_ModeloCWP' 
EXEC sp_addextendedproperty 'MS_Description' , 'descrição do modelo de CWP' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP' , 'COLUMN' , 'Des_ModeloCWP' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ModeloCWP' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_ModeloCWP ADD CONSTRAINT DF_MSV_ModeloCWP_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_ModeloCWP ADD CONSTRAINT DF_MSV_ModeloCWP_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_ModeloCWP ADD CONSTRAINT PK_MSV_ModeloCWP PRIMARY KEY CLUSTERED (ID_ModeloCWP)

--Foreign Keys
END 

IF object_id(N'DBO.MSV_Maquina', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Maquina

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_Maquina 
    (
     ID_Maquina INTEGER NOT NULL IDENTITY (1, 1)  , 
     Nr_Serial VARCHAR (15) NOT NULL , 
     Des_Maquina VARCHAR (50) , 
     Lim_Diurno MONEY , 
     Lim_Noturno MONEY , 
     COD_TipoMaquina INTEGER NOT NULL , 
     COD_ModeloCWP INTEGER , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Cadastro de Máquinas.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'ID_Maquina' 
EXEC sp_addextendedproperty 'MS_Description' , 'Número serial único da máquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'Nr_Serial' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo da máquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'Des_Maquina'
EXEC sp_addextendedproperty 'MS_Description' , 'Limite diurno da maquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'Lim_Diurno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Limite diurno da maquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'Lim_Noturno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Limite noturno da maquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'COD_TipoMaquina' 
EXEC sp_addextendedproperty 'MS_Description' , 'Tipo da Maquina' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'COD_ModeloCWP' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Maquina' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_Maquina ADD CONSTRAINT DF_MSV_Maquina_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Maquina ADD CONSTRAINT DF_MSV_Maquina_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_Maquina ADD CONSTRAINT PK_MSV_Maquina PRIMARY KEY CLUSTERED (ID_Maquina)
ALTER TABLE MSV_Maquina ADD CONSTRAINT UK_MSV_Maquina UNIQUE NONCLUSTERED  ( Nr_Serial )  

--Foreign Keys
ALTER TABLE MSV_Maquina
    ADD CONSTRAINT FK_MSV_Maquina_MSV_ModeloCWP FOREIGN KEY ( COD_ModeloCWP )
        REFERENCES MSV_ModeloCWP ( ID_ModeloCWP )
  
ALTER TABLE MSV_Maquina
    ADD CONSTRAINT FK_MSV_Maquina_MSV_TipoMaquina FOREIGN KEY ( COD_TipoMaquina )
        REFERENCES MSV_TipoMaquina ( ID_TipoMaquina )

END

IF object_id(N'DBO.MSV_TipoPontoAtendimento', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_TipoPontoAtendimento

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_TipoPontoAtendimento 
    (
     ID_TipoPontoAtendimento INTEGER NOT NULL IDENTITY (1, 1)  , 
     Des_TIpoPontoAtendimento VARCHAR (50) NOT NULL , 
     DT_Inclusao DATETIME NOT NULL  , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Tipo do ponto de atendimento que pode ser: 1.) Ponto Operacional, 2.) Ponto Genérico, 3.) Ponto de Terceiro ou 4.) Ponto sem Roteiro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento' , 'COLUMN' , 'ID_TipoPontoAtendimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador unico de registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento' , 'COLUMN' , 'Des_TIpoPontoAtendimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoPontoAtendimento' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_TipoPontoAtendimento ADD CONSTRAINT DF_MSV_TipoPontoAtendimento_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_TipoPontoAtendimento ADD CONSTRAINT DF_MSV_TipoPontoAtendimento_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_TipoPontoAtendimento ADD CONSTRAINT PK_MSV_tipopontoatendimento PRIMARY KEY CLUSTERED (ID_TipoPontoAtendimento)

--Foreign Keys
END

IF object_id(N'DBO.MSV_CargaHoraria', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_CargaHoraria

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_CargaHoraria 
    (
     ID_CargaHoraria INTEGER NOT NULL IDENTITY (1, 1)  , 
     Des_Descricao VARCHAR (100) NOT NULL , 
     Des_CargaHoraria VARCHAR (50) NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Carga horária do ponto de atendimento' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador da tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'ID_CargaHoraria' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo da Carga Horária' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'Des_Descricao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descrição da Carga Horária' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'Des_CargaHoraria' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro <0> - Ativo / <1> - Inativo ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_CargaHoraria' , 'COLUMN' , 'FLG_Situacao'  
-- DEFAULT Constraints 
ALTER TABLE MSV_CargaHoraria ADD CONSTRAINT DF_MSV_CargaHoraria_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_CargaHoraria ADD CONSTRAINT DF_MSV_CargaHoraria_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Keys
ALTER TABLE MSV_CargaHoraria ADD CONSTRAINT PK_MSV_CargaHoraria PRIMARY KEY CLUSTERED (ID_CargaHoraria)

--Foreign Keys
END

IF object_id(N'DBO.MSV_PrecoStatus', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoStatus

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoStatus 
    (
     ID_PrecoStatus INTEGER NOT NULL IDENTITY (1, 1)  , 
     Des_PrecoStatus VARCHAR (50) , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Status do registro de preço que pode ser 1.) Cancelado, 2.) Inativo, 3.) Suspenso ou 4.) Ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador da tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus' , 'COLUMN' , 'ID_PrecoStatus'
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo do status' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus' , 'COLUMN' , 'Des_PrecoStatus'
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus' , 'COLUMN' , 'DT_Inclusao'
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus' , 'COLUMN' , 'DT_Alteracao'
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro <0> - Ativo / <1> - Inativo ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoStatus' , 'COLUMN' , 'FLG_Situacao'

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoStatus ADD CONSTRAINT DF_MSV_PrecoStatus_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoStatus ADD CONSTRAINT DF_MSV_PrecoStatus_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoStatus ADD CONSTRAINT PK_MSV_PrecoStatus PRIMARY KEY CLUSTERED (ID_PrecoStatus)

--Foreign Keys
END 

IF object_id(N'DBO.MSV_Reduzido', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Reduzido

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  Tabela dominio de Reduzido. Um Reduzido é um códicurto que define a
--  relação de uma Entidade (Cliente), há um EntidadeEndereço (SubCliente).
CREATE TABLE MSV_Reduzido 
    (
     ID_Reduzido INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Regional INTEGER NOT NULL , 
     COD_Filial INTEGER NOT NULL , 
     COD_Entidade INTEGER NOT NULL , 
     COD_EntidadeEndereco INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Tabela dominio de Reduzido. Um Reduzido é um código curto que define a relação de uma Entidade (Cliente), há um EntidadeEndereço (SubCliente).xxxxx' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador da tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'ID_Reduzido'
EXEC sp_addextendedproperty 'MS_Description' , 'Código da Entidade (Cliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'COD_Entidade'
EXEC sp_addextendedproperty 'MS_Description' , 'Código da EntidadeEndereço (SubCLiente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'COD_EntidadeEndereco'
EXEC sp_addextendedproperty 'MS_Description' , 'Código da Regional' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'COD_Regional'
EXEC sp_addextendedproperty 'MS_Description' , 'Código da Filial' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'COD_Filial'
EXEC sp_addextendedproperty 'MS_Description' , 'Data da inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'DT_Inclusao'
EXEC sp_addextendedproperty 'MS_Description' , 'Data da alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'DT_Alteracao'
EXEC sp_addextendedproperty 'MS_Description' , 'Situação do registro <0> - Ativo / <1> - Inativo ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Reduzido' , 'COLUMN' , 'FLG_Situacao'

-- DEFAULT Constraints 
ALTER TABLE MSV_Reduzido ADD CONSTRAINT DF_MSV_Reduzido_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Reduzido ADD CONSTRAINT MSV_Reduzido_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_Reduzido ADD CONSTRAINT PK_MSV_Reduzido PRIMARY KEY CLUSTERED (ID_Reduzido)
ALTER TABLE MSV_Reduzido ADD CONSTRAINT UK_MSV_Reduzido UNIQUE NONCLUSTERED (COD_Regional, COD_Filial, COD_Entidade, COD_EntidadeEndereco)  

--Foreign Keys
ALTER TABLE MSV_Reduzido
    ADD CONSTRAINT FK_MSV_Reduzido_CLI_Entidade FOREIGN KEY ( COD_Entidade )
        REFERENCES   CLI_Entidade ( ID_Entidade )
  
ALTER TABLE MSV_Reduzido
    ADD CONSTRAINT FK_MSV_Reduzido_COR_EntidadeEndereco FOREIGN KEY ( COD_EntidadeEndereco )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_Reduzido
    ADD CONSTRAINT FK_MSV_Reduzido_COR_Filial FOREIGN KEY ( COD_Filial, COD_Regional )
        REFERENCES   COR_Filial ( COD_Filial, COD_Regional )

END 

IF object_id(N'DBO.MSV_ContratoReduzido', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_ContratoReduzido

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_ContratoReduzido 
    (
     ID_ContratoReduzido INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Contrato INTEGER NOT NULL , 
     COD_Reduzido INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Vínculo entre um Reduzido (Entidade/Cliente + EntidadeEndereço/SubCliente) e um Contrato. Onde um Contrato pertence somente há um Reduzido, porem um Reduzido pode ter um ou mais Contratos. ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido'  

-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador único de tabela' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'ID_ContratoReduzido' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'COD_Contrato' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Reduzido' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'COD_Reduzido' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador se registro ativo ou inativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ContratoReduzido' , 'COLUMN' , 'FLG_Situacao' 

-- DEFAULT Constraints 
ALTER TABLE MSV_ContratoReduzido ADD CONSTRAINT DF_MSV_ContratoReduzido_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_ContratoReduzido ADD CONSTRAINT DF_MSV_ContratoReduzido_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_ContratoReduzido ADD CONSTRAINT PK_MSV_ContratoReduzido PRIMARY KEY CLUSTERED (ID_ContratoReduzido)
ALTER TABLE MSV_ContratoReduzido ADD CONSTRAINT UK_MSV_ContratoReduzido UNIQUE NONCLUSTERED (COD_Contrato, COD_Reduzido)

--Foreign Keys
ALTER TABLE MSV_ContratoReduzido
    ADD CONSTRAINT FK_MSV_ContratoReduzido_CLI_Contrato FOREIGN KEY ( COD_Contrato )
        REFERENCES   CLI_Contrato ( ID_Contrato )
  
ALTER TABLE MSV_ContratoReduzido
    ADD CONSTRAINT FK_MSV_ContratoReduzido_MSV_Reduzido FOREIGN KEY ( COD_Reduzido )
        REFERENCES MSV_Reduzido ( ID_Reduzido )

END 

IF object_id(N'DBO.MSV_Preco', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_Preco

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_Preco 
    (
     ID_Preco INTEGER NOT NULL IDENTITY (1, 1)  , 
     Seq_Preco INTEGER , 
     COD_PrecoOrigem INTEGER , 
     COD_ContratoReduzido INTEGER NOT NULL , 
     COD_Servico INTEGER NOT NULL , 
     COD_EntidadeSAV INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAV INTEGER NOT NULL , 
     COD_EntidadeEnderecoCNAB INTEGER NOT NULL , 
     COD_EntidadeFAT INTEGER NOT NULL , 
     COD_EntidadeEnderecoFAT INTEGER NOT NULL , 
     COD_FranquiaGrupo INTEGER NOT NULL , /*replicação ???*/
     COD_CargaHoraria INTEGER NOT NULL , 
     COD_PrecoStatus INTEGER NOT NULL , 
     COD_Fluxo TINYINT NOT NULL , 
     COD_Tributacao SMALLINT NOT NULL , /*replicação ???*/
     DT_VigenciaInicio DATETIME NOT NULL , 
     DT_VigenciaFim DATETIME , 
     FLG_CustodiaEntrada BIT NOT NULL , 
     FLG_CustodiaTransicao BIT NOT NULL , 
     FLG_CustodiaSaldo BIT NOT NULL , 
     Nom_Memorando VARCHAR (80) , 
     Des_EntidadeContrato VARCHAR (50) , 
     FLG_ExecutadoRecepcao BIT NOT NULL , 
     FLG_FatEletronico BIT NOT NULL , 
     COD_FilialSAV INTEGER , 
     COD_ReduzidoSAV INTEGER , 
     COD_FilialTICKET INTEGER , 
     COD_ReduzidoTICKET INTEGER , 
     COD_FilialCHEQUES INTEGER , 
     COD_ReduzidoCHEQUES INTEGER , 
     VL_Preco DECIMAL (18,2) , 
     Tx_Advalorem DECIMAL (10,7) , 
     Tx_Pernoite DECIMAL (18,11) , 
     DT_Base DATETIME , 
     Qt_MaoObra INTEGER , 
     Vl_Franquia DECIMAL (5) , 
     Tx_AdPerm DECIMAL (18,2) , 
     Qt_IntervMinutos INTEGER , 
     DT_AdicNoturno DATETIME , 
     Perc_AdicNoturno DECIMAL (18,2) , 
     COD_RegionalRateio INTEGER , 
     COD_FilialRateio INTEGER , 
     Vl_Rateio DECIMAL (6,2) , 
     COD_TipoVal SMALLINT NOT NULL , 
     Km_Distancia INTEGER , 
     Vl_PrecoKm DECIMAL (18,2) , 
     Vl_MinimoServicoAereo DECIMAL (18,2) , 
     FLG_ImportacaoHistorico BIT NOT NULL, 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Tabela principal do sistema MSV (módulo de serviços). Função principal de realizar a gestão de preços, sobre os serviços de um Contrato. ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único do registro de preço.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'ID_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códide preço sequencial. Ao gerar um novo COD_PrecoSEQ, é o max(COD_PrecoSEQ) + 1 ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Seq_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'códipreço de origem ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_PrecoOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códido Contrato + Reduzido' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_ContratoReduzido' 
EXEC sp_addextendedproperty 'MS_Description' , 'códido serviço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_Servico' 
EXEC sp_addextendedproperty 'MS_Description' , 'Entidade (Cliente) operacional. (ref. frame dados -> Opracional Cliente -> SAVAL Cliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_EntidadeSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço operacional (SubCliente) (ref. frame dados -> Opracional SubCliente -> SAVAL SubCliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_EntidadeEnderecoSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço - Matriz/CNAB operacional (ref. frame dados -> Opracional -> SAVAL CNAB)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_EntidadeEnderecoCNAB' 
EXEC sp_addextendedproperty 'MS_Description' , 'Entidade (Cliente) Faturamento (re. frame dados -> Faturamento Cliente -> Faturamento Cliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_EntidadeFAT' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereco (SubCliente) (ref. frame dados -> Faturamento SubCliente -> Faturamento SubCliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_EntidadeEnderecoFAT' 
EXEC sp_addextendedproperty 'MS_Description' , 'Dominio de franquia relacionada.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_FranquiaGrupo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Dominio de carga horaria relacionada.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_CargaHoraria' 
EXEC sp_addextendedproperty 'MS_Description' , 'Status do registro de preço.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_PrecoStatus' 
EXEC sp_addextendedproperty 'MS_Description' , 'Fluxo operacional.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_Fluxo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códide Tributação' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_Tributacao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Iinicio da vigência do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_VigenciaInicio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Fim da vigência do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_VigenciaFim' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador de custodia de entrada (ref. SIC_Preco.FLG_CUSTODIAENTRADA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_CustodiaEntrada' 
EXEC sp_addextendedproperty 'MS_Description' , 'Inidicador de Custodia de Transição (ref. SIC_Preco.FLG_CUSTODIATRANSICAO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_CustodiaTransicao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador de custodia de saldo (ref. SIC_Preco.FLG_CUSTODIASALDO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_CustodiaSaldo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo aberto de observação sobre detalhes de faturamento. (ref. SIC_Preco.Nom_Memorando)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Nom_Memorando' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo de observaçõ ref. ao códide Contrato do cliente (ref. SIC_Preco.COD_CliServ)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Des_EntidadeContrato' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador exxecutado na recepção (ref. SIC_Preco.FLG_EXECUTADONARECEPCAO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_ExecutadoRecepcao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag indicador de faturamento eletrônico (ref. SIC_Preco.FLG_ELETRONICO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_FatEletronico' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial SAV ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_FilialSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido transf. SAV ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_ReduzidoSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial TICKET ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_FilialTICKET' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido transf. TICKET ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_ReduzidoTICKET' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial Cheques ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_FilialCHEQUES' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido Cheques ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_ReduzidoCHEQUES' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor do serviço (ref. SIC_Preco.VLR_Preco)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'VL_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa AdValorem (ref. SIC_Preco.TAX_ADVALOREM)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Tx_Advalorem' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa de pernoite (ref. SIC_Preco.TAX_PERNOITE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Tx_Pernoite' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data base de reajuste de preço (ref. SIC_Preco.DT_BASE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_Base' 
EXEC sp_addextendedproperty 'MS_Description' , 'Qtde de mão de obra (ref. SIC_Preco.QTD_MAOOBRA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Qt_MaoObra' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor da franquia (ref. SIC_Preco.FRANQUIA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Vl_Franquia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa adicional de permanencia (ref. SIC_Preco.TAX_ADPERM)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Tx_AdPerm' 
EXEC sp_addextendedproperty 'MS_Description' , 'Quantidade do intervalo em minutos (ref. SIC_Preco.VL_INTERVMINUTOS)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Qt_IntervMinutos' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data e hora do adicional noturno (ref. SIC_Preco.DT_HORAADICNOTURNO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_AdicNoturno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Precentagem de adicional noturno (ref. SIC_Preco.PERC_ADICNOTURNO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Perc_AdicNoturno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códida Regional de Rateio (ref. SIC_Preco.COD_RegionalRATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_RegionalRateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códida Filial de Rateio (ref. SIC_Preco.COD_FilialRATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_FilialRateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor do rateio (ref. SIC_Preco.VAL_RATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Vl_Rateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador do tipo de valor/moeda' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'COD_TipoVal' 
EXEC sp_addextendedproperty 'MS_Description' , 'Distância em KM (ref. SIC_Preco.KM_DISTANCIA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Km_Distancia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor cobrado do Km rodado (ref. SIC_Preco.KM_Preco)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Vl_PrecoKm' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor minimo do serviço aéreo (ref. SIC_Preco.VLR_MINIMOSERVICOAEREO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'Vl_MinimoServicoAereo' 
EXEC sp_addextendedproperty 'MS_Description' , 'indica se o registro foi importado do SICOM - importacao de historico 1, ou se o registro é produto de movimentação na nova plataforma 0' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_ImportacaoHistorico' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteracao do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_Preco' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_Situacao DEFAULT 1 FOR FLG_Situacao
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_CustodiaEntrada DEFAULT 1 FOR FLG_CustodiaEntrada
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_CustodiaTransicao DEFAULT 1 FOR FLG_CustodiaTransicao
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_CustodiaSaldo DEFAULT 1 FOR FLG_CustodiaSaldo
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_ExecutadoRecepcao DEFAULT 1 FOR FLG_ExecutadoRecepcao
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_FatEletronico DEFAULT 1 FOR FLG_FatEletronico
ALTER TABLE MSV_Preco ADD CONSTRAINT DF_MSV_Preco_FLG_ImportacaoHistorico DEFAULT 1 FOR FLG_ImportacaoHistorico

-- Primary Key e Unique Key
ALTER TABLE MSV_Preco ADD CONSTRAINT PK_MSV_Preco PRIMARY KEY CLUSTERED (ID_Preco)
ALTER TABLE MSV_Preco ADD CONSTRAINT UK_MSV_PrecoSeqPreco UNIQUE NONCLUSTERED  ( Seq_Preco )
--ALTER TABLE MSV_Preco ADD CONSTRAINT UK_MSV_PrecoChaveNegocio UNIQUE NONCLUSTERED  (COD_ContratoReduzido, COD_Servico, COD_SAVEntidade, COD_SAVEntidadeEndereco) 

--Foreign Keys
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_CLI_EntidadeFAT FOREIGN KEY ( COD_EntidadeFAT )
        REFERENCES   CLI_Entidade ( ID_Entidade )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_CLI_EntidadeSAV FOREIGN KEY ( COD_EntidadeSAV )
        REFERENCES   CLI_Entidade ( ID_Entidade )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_EntidadeEnderecoCNAB FOREIGN KEY ( COD_EntidadeEnderecoCNAB )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_EntidadeEnderecoFAT FOREIGN KEY ( COD_EntidadeEnderecoFAT )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_EntidadeEnderecoSAV FOREIGN KEY ( COD_EntidadeEnderecoSAV )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_FluxoOperacional FOREIGN KEY ( COD_Fluxo )
        REFERENCES   COR_FluxoOperacional ( COD_Fluxo )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_Servico FOREIGN KEY ( COD_Servico )
        REFERENCES   COR_Servico ( ID_Servico )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_COR_Tipo_Valor FOREIGN KEY ( COD_TipoVal )
        REFERENCES   COR_Tipo_Valor ( COD_Tipo_Val )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_MSV_CargaHoraria FOREIGN KEY ( COD_CargaHoraria )
        REFERENCES MSV_CargaHoraria ( ID_CargaHoraria )
  
/*  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_MSV_franquiagrupo FOREIGN KEY ( COD_franquiagrupo )
        REFERENCES MSV_franquiagrupo ( ID_franquiagrupo )
*/
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_MSV_Preco FOREIGN KEY ( COD_PrecoOrigem )
        REFERENCES MSV_Preco ( ID_Preco )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_MSV_ContraReduzido FOREIGN KEY ( COD_ContratoReduzido )
        REFERENCES MSV_ContratoReduzido ( ID_ContratoReduzido )
  
ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_MSV_PrecoStatus FOREIGN KEY ( COD_PrecoStatus )
        REFERENCES MSV_PrecoStatus ( ID_PrecoStatus )
  
/*ALTER TABLE MSV_Preco
    ADD CONSTRAINT FK_MSV_Preco_sic_tributacao FOREIGN KEY ( COD_tributacao )
        REFERENCES   sic_tributacao ( COD_tributacao )
*/
END 

IF object_id(N'DBO.MSV_PrecoPontoAtendimento', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoPontoAtendimento

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoPontoAtendimento 
    (
     ID_PrecoPontoAtendimento INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Preco INTEGER , 
     COD_PrecoPAFrequencia INTEGER NOT NULL , 
     COD_TipoPontoAtendimento INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAVOrigem INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAVDestino INTEGER NOT NULL , 
     COD_EntidadeEnderecoFatOrigem INTEGER NOT NULL , 
     COD_EntidadeEnderecoFatDestino INTEGER NOT NULL , 
     Qt_MediaEmbarque DECIMAL (5,3) , 
     Des_Faturamento VARCHAR (135) , 
     Des_Observacao VARCHAR (150) , 
     Des_FaturamentoPrincipal VARCHAR (40) , 
     Des_FaturamentoDetalhe VARCHAR (40) , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Conjunto de um ou mais pontos de atendimento para um serviço, de um Contrato. Ponto de atendimento é o local fisico, onde o serviço é executado.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' 

-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'ID_PrecoPontoAtendimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do preço ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do preço frequencia' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_PrecoPAFrequencia'
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Tipo de Atendimento' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_TipoPontoAtendimento'
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) SAVAL Origem (ref. frame ponto -> Operqacional Origem -> SAVAL) ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_EntidadeEnderecoSAVOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) SAVAL (ref. frame ponto -> Operqacional Origem -> SAVAL) frame ponto -> Operqacional Destino -> SAVAL Destino (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_EntidadeEnderecoSAVDestino' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) faturamento origem (ref. frame ponto -> Faturamento Origem -> Faturamento Origem (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_EntidadeEnderecoFatOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) faturamento destino (ref. frame ponto -> Faturamento Destino -> Faturamento Destino (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'COD_EntidadeEnderecoFatDestino' 
EXEC sp_addextendedproperty 'MS_Description' , 'Quantidade média de embarque (ref. SIC_PONTO.MEDIA_EMBARQUE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'Qt_MediaEmbarque' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo descritivo 1 utilizado pelo sistema de faturamento (ref. SIC_PONTO.DESCRICAO1)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'Des_Faturamento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo observação utilizado pelo sistema de faturamento (ref. SIC_PONTO.OBSERVAÇÃO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'Des_Observacao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo Diversos 1 utilizado pelo sistema de faturamento  (ref. SIC_PONTO.DIVERSOS1)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'Des_FaturamentoPrincipal' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo Diversos 2 utilizado pelo sistema de faturamento  (ref. SIC_PONTO.DIVERSOS2)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'Des_FaturamentoDetalhe' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteração do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimento' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoPontoAtendimento ADD CONSTRAINT DF_MSV_PrecoPontoAtendimento_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoPontoAtendimento ADD CONSTRAINT DF_MSV_PrecoPontoAtendimento_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoPontoAtendimento ADD CONSTRAINT PK_MSV_PrecoPontoAtendimento PRIMARY KEY CLUSTERED (ID_PrecoPontoAtendimento)

--Foreign Keys
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_COR_EntidadeEnderecoFATDestino FOREIGN KEY ( COD_EntidadeEnderecoFATDestino )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_COR_EntidadeEnderecoFATOrigem FOREIGN KEY ( COD_EntidadeEnderecoFATOrigem )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_COR_EntidadeEnderecoSAVDestino FOREIGN KEY ( COD_EntidadeEnderecoSAVDestino )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_COR_EntidadeEnderecoSAVOrigem FOREIGN KEY ( COD_EntidadeEnderecoSAVOrigem )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_MSV_Preco FOREIGN KEY ( COD_Preco )
        REFERENCES MSV_Preco ( ID_Preco )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_MSV_PrecoPAFrequencia FOREIGN KEY ( COD_PrecoPAFrequencia )
        REFERENCES MSV_PrecoPAFrequencia ( ID_PrecoPAFrequencia )
  
ALTER TABLE MSV_PrecoPontoAtendimento
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimento_MSV_TipoPontoAtendimento FOREIGN KEY ( COD_TipoPontoAtendimento )
        REFERENCES MSV_TipoPontoAtendimento ( ID_TipoPontoAtendimento )

END 

IF object_id(N'DBO.MSV_PontoHistoricoImportacao', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PontoHistoricoImportacao

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PontoHistoricoImportacao 
    (
     ID_PontoHistoricoImportacao INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Ponto INTEGER NOT NULL , 
     COD_Preco INTEGER NOT NULL , 
     COD_Regional INTEGER NOT NULL , 
     COD_Filial INTEGER NOT NULL , 
     COD_PrecoPontoAtendimento INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Historico de PONTO (origem SIC_PONTO) importação inicial. ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'ID_PontoHistoricoImportacao'  
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'COD_Ponto'  
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'COD_Preco'  
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'COD_Regional'  
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'COD_Filial'  
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'COD_PrecoPontoAtendimento'  
EXEC sp_addextendedproperty 'MS_Description' , 'Data de inclusão do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data de alteração do registro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Flag que indica a situação do registro (Ativo/Excluído logicamente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PontoHistoricoImportacao' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PontoHistoricoImportacao ADD CONSTRAINT DF_MSV_PontoHistoricoImportacao_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PontoHistoricoImportacao ADD CONSTRAINT DF_MSV_PontoHistoricoImportacao_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PontoHistoricoImportacao ADD CONSTRAINT PK_MSV_PontoHistoricoImportacao PRIMARY KEY CLUSTERED (ID_PontoHistoricoImportacao)
ALTER TABLE MSV_pontohistoricoimportacao ADD CONSTRAINT UK_MSV_PontoHistoricoImportacao UNIQUE NONCLUSTERED (COD_Ponto, COD_Preco, COD_Regional, COD_Filial)  

--Foreign Keys
ALTER TABLE MSV_PontoHistoricoImportacao
    ADD CONSTRAINT FK_MSV_pontohistoricoimportacao_MSV_PrecoPontoAtendimento FOREIGN KEY ( COD_PrecoPontoAtendimento )
        REFERENCES MSV_PrecoPontoAtendimento ( ID_PrecoPontoAtendimento )

END 


IF object_id(N'DBO.MSV_PrecoPAMaquina', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoPAMaquina

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoPAMaquina 
    (
     ID_PrecoPAMaquina INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_PrecoPontoAtendimento INTEGER NOT NULL , 
     COD_Maquina INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Lista de máquinas em um ponto de atendimento. Um ponto de atendimento pode possuir 1 ou mais máquinas vinculadas.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAMaquina'  
-- Descrição Campos

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoPAMaquina ADD CONSTRAINT DF_MSV_PrecoPAMaquina_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoPAMaquina ADD CONSTRAINT DF_MSV_PrecoPAMaquina_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoPAMaquina ADD CONSTRAINT PK_MSV_PrecoPAMaquina PRIMARY KEY CLUSTERED (ID_PrecoPAMaquina)

--Foreign Keys
ALTER TABLE MSV_PrecoPAMaquina
    ADD CONSTRAINT FK_MSV_PrecoPAMaquina_MSV_Maquina FOREIGN KEY ( COD_Maquina )
        REFERENCES MSV_Maquina ( ID_Maquina )
  
ALTER TABLE MSV_PrecoPAMaquina
    ADD CONSTRAINT FK_MSV_PrecoPAMaquina_MSV_PrecoPontoAtendimento FOREIGN KEY ( COD_PrecoPontoAtendimento )
        REFERENCES MSV_PrecoPontoAtendimento ( ID_PrecoPontoAtendimento )

END 


IF object_id(N'DBO.MSV_PrecoPAMaquinaProblema', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoPAMaquinaProblema

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoPAMaquinaProblema 
    (
     ID_PrecoPAMaquinaProblema INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_PrecoMaquina INTEGER , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL
    )
-- Descrição Tabela
EXEC sp_addextendedproperty 'MS_Description' , 'Um problema pode ser vinculada ha uma maquina, no ponto de atendimento. ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPAMaquinaProblema'  
-- Descrição Campos

-- DEFAULT Constraints
ALTER TABLE MSV_PrecoPAMaquinaProblema ADD CONSTRAINT DF_MSV_PrecoPAMaquinaProblema_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoPAMaquinaProblema ADD CONSTRAINT DF_MSV_PrecoPAMaquinaProblema_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoPAMaquinaProblema ADD CONSTRAINT PK_MSV_PrecoPAMaquinaProblema PRIMARY KEY CLUSTERED (ID_PrecoPAMaquinaProblema)

--Foreign Keys
ALTER TABLE MSV_PrecoPAMaquinaProblema
    ADD CONSTRAINT FK_MSV_PrecoPAMaquinaProblema_MSV_PrecoPAMaquina FOREIGN KEY ( COD_Precomaquina )
        REFERENCES MSV_PrecoPAMaquina ( ID_PrecoPAMaquina )

END 

IF object_id(N'DBO.MSV_PrecoHistorico', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoHistorico

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoHistorico 
    (
     ID_PrecoHistorico INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Preco INTEGER NOT NULL , 
	 Seq_Preco INTEGER NOT NULL, 
     COD_PrecoOrigem INTEGER , 
     COD_ContratoReduzido INTEGER NOT NULL , 
     COD_Servico INTEGER NOT NULL , 
     COD_EntidadeSAV INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAV INTEGER NOT NULL , 
     COD_EntidadeEnderecoCNAB INTEGER NOT NULL , 
     COD_EntidadeFAT INTEGER NOT NULL , 
     COD_EntidadeEnderecoFAT INTEGER NOT NULL , 
     COD_FranquiaGrupo INTEGER NOT NULL , /* replicação ??? */
     COD_CargaHoraria INTEGER NOT NULL , 
     COD_PrecoStatus INTEGER NOT NULL , 
     COD_Fluxo TINYINT NOT NULL , 
     COD_Tributacao SMALLINT NOT NULL , 
     DT_VigenciaInicio DATETIME NOT NULL , 
     DT_VigenciaFim DATETIME , 
     FLG_CustodiaEntrada BIT NOT NULL , 
     FLG_CustodiaTransicao BIT NOT NULL , 
     FLG_CustodiaSaldo BIT NOT NULL, 
     Nom_Memorando VARCHAR (80) , 
     Des_EntidadeContrato VARCHAR (50) , 
     FLG_ExecutadoRecepcao BIT NOT NULL , 
     FLG_FatEletronico BIT NOT NULL , 
     COD_FilialSAV INTEGER , 
     COD_ReduzidoSAV INTEGER , 
     COD_Filial_TICKET INTEGER , 
     COD_ReduzidoTICKET INTEGER , 
     COD_FilialCHEQUES INTEGER , 
     COD_ReduzidoCHEQUES INTEGER , 
     VL_Preco DECIMAL (18,2) , 
     Tx_Advalorem DECIMAL (10,7) , 
     Tx_Pernoite DECIMAL (18,11) , 
     DT_Base DATETIME , 
     Qt_MaoObra INTEGER , 
     Vl_Franquia DECIMAL (5) , 
     Tx_AdPerm DECIMAL (18,2) , 
     Qt_IntervMinutos INTEGER , 
     DT_AdicNoturno DATETIME , 
     Perc_AdicNoturno DECIMAL (18,2) , 
     COD_RegionalRateio INTEGER , 
     COD_FilialRateio INTEGER , 
     Vl_Rateio DECIMAL (6,2) , 
     COD_TipoVal SMALLINT NOT NULL , 
     Km_Distancia INTEGER , 
     Vl_PrecoKm DECIMAL (18,2) , 
     Vl_MinimoServicoAereo DECIMAL (18,2) , 
     FLG_ImportacaoHistorico BIT NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT NOT NULL 
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Tabela de registro histórico de preço histórico. Toda ação realizada sobre a tabela MSV_Preco deve ser registrada em MSV_PrecoHistorico.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único do registro de preço.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'ID_PrecoHistorico' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códide preço sequencial. Ao gerar um novo COD_PrecoSEQ, é o max(COD_PrecoSEQ) + 1 ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Seq_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'códipreço de origem ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_PrecoOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códido Contrato + Reduzido' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_ContratoReduzido' 
EXEC sp_addextendedproperty 'MS_Description' , 'códido serviço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_Servico' 
EXEC sp_addextendedproperty 'MS_Description' , 'Entidade (Cliente) operacional. (ref. frame dados -> Opracional Cliente -> SAVAL Cliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_EntidadeSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço operacional (SubCliente) (ref. frame dados -> Opracional SubCliente -> SAVAL SubCliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço - Matriz/CNAB operacional (ref. frame dados -> Opracional -> SAVAL CNAB)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoCNAB' 
EXEC sp_addextendedproperty 'MS_Description' , 'Entidade (Cliente) Faturamento (re. frame dados -> Faturamento Cliente -> Faturamento Cliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_EntidadeFAT' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereco (SubCliente) (ref. frame dados -> Faturamento SubCliente -> Faturamento SubCliente)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoFAT' 
EXEC sp_addextendedproperty 'MS_Description' , 'Dominio de franquia relacionada.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_FranquiaGrupo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Dominio de carga horaria relacionada.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_CargaHoraria' 
EXEC sp_addextendedproperty 'MS_Description' , 'Status do registro de preço.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_PrecoStatus' 
EXEC sp_addextendedproperty 'MS_Description' , 'Fluxo operacional.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_Fluxo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códide Tributação' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_Tributacao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Iinicio da vigência do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_VigenciaInicio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Fim da vigência do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_VigenciaFim' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador de custodia de entrada (ref. SIC_Preco.FLG_CUSTODIAENTRADA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_CustodiaEntrada' 
EXEC sp_addextendedproperty 'MS_Description' , 'Inidicador de Custodia de Transição (ref. SIC_Preco.FLG_CUSTODIATRANSICAO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_CustodiaTransicao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador de custodia de saldo (ref. SIC_Preco.FLG_CUSTODIASALDO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_CustodiaSaldo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo aberto de observação sobre detalhes de faturamento. (ref. SIC_Preco.Nom_Memorando)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Nom_Memorando' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo de observaçõ ref. ao códide Contrato do cliente (ref. SIC_Preco.COD_CliServ)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Des_EntidadeContrato' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador exxecutado na recepção (ref. SIC_Preco.FLG_EXECUTADONARECEPCAO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_ExecutadoRecepcao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag indicador de faturamento eletrônico (ref. SIC_Preco.FLG_ELETRONICO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_FatEletronico' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial SAV ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_FilialSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido transf. SAV ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_ReduzidoSAV' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial TICKET ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_Filial_TICKET' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido transf. TICKET ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_ReduzidoTICKET' 
EXEC sp_addextendedproperty 'MS_Description' , 'código da filial Cheques ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_FilialCHEQUES' 
EXEC sp_addextendedproperty 'MS_Description' , 'COD_Reduzido Cheques ref. SIC Contrato' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_ReduzidoCHEQUES' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor do serviço (ref. SIC_Preco.VLR_Preco)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'VL_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa AdValorem (ref. SIC_Preco.TAX_ADVALOREM)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Tx_Advalorem' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa de pernoite (ref. SIC_Preco.TAX_PERNOITE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Tx_Pernoite' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data base de reajuste de preço (ref. SIC_Preco.DT_BASE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_Base' 
EXEC sp_addextendedproperty 'MS_Description' , 'Qtde de mão de obra (ref. SIC_Preco.QTD_MAOOBRA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Qt_MaoObra' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor da franquia (ref. SIC_Preco.FRANQUIA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Vl_Franquia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Taxa adicional de permanencia (ref. SIC_Preco.TAX_ADPERM)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Tx_AdPerm' 
EXEC sp_addextendedproperty 'MS_Description' , 'Quantidade do intervalo em minutos (ref. SIC_Preco.VL_INTERVMINUTOS)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Qt_IntervMinutos' 
EXEC sp_addextendedproperty 'MS_Description' , 'Data e hora do adicional noturno (ref. SIC_Preco.DT_HORAADICNOTURNO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_AdicNoturno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Precentagem de adicional noturno (ref. SIC_Preco.PERC_ADICNOTURNO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Perc_AdicNoturno' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códida Regional de Rateio (ref. SIC_Preco.COD_RegionalRATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_RegionalRateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Códida Filial de Rateio (ref. SIC_Preco.COD_FilialRATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_FilialRateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor do rateio (ref. SIC_Preco.VAL_RATEIO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Vl_Rateio' 
EXEC sp_addextendedproperty 'MS_Description' , 'Indicador do tipo de valor/moeda' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'COD_TipoVal' 
EXEC sp_addextendedproperty 'MS_Description' , 'Distância em KM (ref. SIC_Preco.KM_DISTANCIA)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Km_Distancia' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor cobrado do Km rodado (ref. SIC_Preco.KM_Preco)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Vl_PrecoKm' 
EXEC sp_addextendedproperty 'MS_Description' , 'Valor minimo do serviço aéreo (ref. SIC_Preco.VLR_MINIMOSERVICOAEREO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'Vl_MinimoServicoAereo' 
EXEC sp_addextendedproperty 'MS_Description' , 'indica se o registro foi importado do SICOM - importacao de historico 1, ou se o registro é produto de movimentação na nova plataforma 0' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_ImportacaoHistorico' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteracao do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistorico' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_Situacao DEFAULT 1 FOR FLG_Situacao
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_CustodiaEntrada DEFAULT 1 FOR FLG_CustodiaEntrada
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_CustodiaTransicao DEFAULT 1 FOR FLG_CustodiaTransicao
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_CustodiaSaldo DEFAULT 1 FOR FLG_CustodiaSaldo
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_ExecutadoRecepcao DEFAULT 1 FOR FLG_ExecutadoRecepcao
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_FatEletronico DEFAULT 1 FOR FLG_FatEletronico
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT DF_MSV_PrecoHistorico_FLG_ImportacaoHistorico DEFAULT 1 FOR FLG_ImportacaoHistorico

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoHistorico ADD CONSTRAINT PK_MSV_PrecoHistorico PRIMARY KEY CLUSTERED (ID_PrecoHistorico)

--Foreign Keys
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_CLI_EntidadeFAT FOREIGN KEY ( COD_EntidadeFAT )
        REFERENCES   CLI_Entidade ( ID_Entidade )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_CLI_EntidadeSAV FOREIGN KEY ( COD_EntidadeSAV )
        REFERENCES   CLI_Entidade ( ID_Entidade )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_EntidadeEnderecoFAT FOREIGN KEY ( COD_EntidadeEnderecoFAT )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_EntidadeEnderecoSAV FOREIGN KEY ( COD_EntidadeEnderecoSAV )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_EntidadeEnderecoCNAB FOREIGN KEY ( COD_EntidadeEnderecoCNAB )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_FluxoOperacional FOREIGN KEY ( COD_Fluxo )
        REFERENCES   COR_FluxoOperacional ( COD_Fluxo )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_Servico FOREIGN KEY ( COD_Servico )
        REFERENCES   COR_Servico ( ID_Servico )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_COR_Tipo_Valor FOREIGN KEY ( COD_TipoVal )
        REFERENCES   COR_Tipo_Valor ( COD_Tipo_Val )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_CargaHoraria FOREIGN KEY ( COD_CargaHoraria )
        REFERENCES MSV_CargaHoraria ( ID_CargaHoraria )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_ContratoReduzido FOREIGN KEY ( COD_ContratoReduzido )
        REFERENCES MSV_ContratoReduzido ( ID_ContratoReduzido )
  
/*ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_franquiagrupo FOREIGN KEY ( COD_franquiagrupo )
        REFERENCES MSV_franquiagrupo ( ID_franquiagrupo )
*/  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_Preco FOREIGN KEY ( COD_Preco )
        REFERENCES MSV_Preco ( ID_Preco )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_PrecoHistorico FOREIGN KEY ( COD_PrecoOrigem )
        REFERENCES MSV_PrecoHistorico ( ID_PrecoHistorico )
  
ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_MSV_Precostatus FOREIGN KEY ( COD_Precostatus )
        REFERENCES MSV_Precostatus ( ID_Precostatus )

/*ALTER TABLE MSV_PrecoHistorico
    ADD CONSTRAINT FK_MSV_PrecoHistorico_sic_tributacao FOREIGN KEY ( COD_tributacao )
        REFERENCES   sic_tributacao ( COD_tributacao )
*/
END 

IF object_id(N'DBO.MSV_PrecoHistoricoImportacao', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoHistoricoImportacao

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoHistoricoImportacao 
    (
     ID_PrecoHistoricoImportacao INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_Regional INTEGER , 
     COD_Filial INTEGER , 
     COD_Preco INTEGER NOT NULL , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Historico de Preco (origem SIC_Preco) importação inicial. ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao'  
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único do registro de preço.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'ID_PrecoHistoricoImportacao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código da regional da tabela de origem SIC_Preco.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'COD_Regional' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código da filial da tabela de origem SIC_Preco.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'COD_Filial' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do preço da tabela de origem SIC_Preco.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'COD_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteracao do registro de preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoHistoricoImportacao' , 'COLUMN' , 'FLG_Situacao'  


-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoHistoricoImportacao ADD CONSTRAINT DF_MSV_PrecoHistoricoImportacao_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoHistoricoImportacao ADD CONSTRAINT DF_MSV_PrecoHistoricoImportacao_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoHistoricoImportacao ADD CONSTRAINT PK_MSV_PrecoHistoricoImportacao PRIMARY KEY CLUSTERED (ID_PrecoHistoricoImportacao)
ALTER TABLE MSV_PrecoHistoricoimportacao ADD CONSTRAINT uk_MSV_PrecoHistoricoImportacao UNIQUE NONCLUSTERED (COD_Regional, COD_Filial, COD_Preco)  

--Foreign Keys
ALTER TABLE MSV_PrecoHistoricoImportacao
    ADD CONSTRAINT FK_MSV_sicPreco_MSV_Preco FOREIGN KEY ( COD_Preco )
        REFERENCES MSV_Preco ( ID_Preco )

END 

IF object_id(N'DBO.MSV_PrecoPontoAtendimentoHistorico', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 18/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_PrecoPontoAtendimentoHistorico

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_PrecoPontoAtendimentoHistorico 
    (
     ID_MSV_PrecoPontoAtendimentoHistorico INTEGER NOT NULL IDENTITY (1, 1)  , 
     COD_PrecoPontoAtendimento INTEGER NOT NULL , 
     COD_Preco INTEGER , 
     COD_PrecoPAFrequencia INTEGER NOT NULL , 
     COD_TipoPontoAtendimento INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAVOrigem INTEGER NOT NULL , 
     COD_EntidadeEnderecoSAVDestino INTEGER NOT NULL , 
     COD_EntidadeEnderecoFatOrigem INTEGER NOT NULL , 
     COD_EntidadeEnderecoFatDestino INTEGER NOT NULL , 
     Qt_MediaEmbarque DECIMAL (5,3) , 
     Des_Faturamento VARCHAR (135) , 
     Des_Observacao VARCHAR (150) , 
     Des_FaturamentoPrincipal VARCHAR (40) , 
     Des_FaturamentoDetalhe VARCHAR (40) , 
     DT_Inclusao DATETIME NOT NULL , 
     DT_Alteracao DATETIME , 
     FLG_Situacao BIT  NOT NULL  
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Conjunto de um ou mais pontos de atendimento para um serviço, de um Contrato. Ponto de atendimento é o local fisico, onde o serviço é/será executado.' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' 
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'ID_MSV_PrecoPontoAtendimentoHistorico' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Ponto' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_PrecoPontoAtendimento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do preço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_Preco' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do preço frequência' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_PrecoPAFrequencia'
EXEC sp_addextendedproperty 'MS_Description' , 'Tipo do ponto de atendimento' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_TipoPontoAtendimento'
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) SAVAL Origem (ref. frame ponto -> Operqacional Origem -> SAVAL) ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoSAVOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) SAVAL (ref. frame ponto -> Operqacional Origem -> SAVAL) frame ponto -> Operqacional Destino -> SAVAL Destino (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoSAVDestino' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) faturamento origem (ref. frame ponto -> Faturamento Origem -> Faturamento Origem (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoFatOrigem' 
EXEC sp_addextendedproperty 'MS_Description' , 'EntidadeEndereço(SubCliente) faturamento destino (ref. frame ponto -> Faturamento Destino -> Faturamento Destino (sic_subcliente))' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'COD_EntidadeEnderecoFatDestino' 
EXEC sp_addextendedproperty 'MS_Description' , 'Quantidade média de embarque (ref. SIC_PONTO.MEDIA_EMBARQUE)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'Qt_MediaEmbarque' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo descritivo 1 utilizado pelo sistema de faturamento (ref. SIC_PONTO.DESCRICAO1)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'Des_Faturamento' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo observação utilizado pelo sistema de faturamento (ref. SIC_PONTO.OBSERVAÇÃO)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'Des_Observacao' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo Diversos 1 utilizado pelo sistema de faturamento  (ref. SIC_PONTO.DIVERSOS1)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'Des_FaturamentoPrincipal' 
EXEC sp_addextendedproperty 'MS_Description' , 'Campo Diversos 2 utilizado pelo sistema de faturamento  (ref. SIC_PONTO.DIVERSOS2)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'Des_FaturamentoDetalhe' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteração do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_PrecoPontoAtendimentoHistorico' , 'COLUMN' , 'FLG_Situacao'  

-- DEFAULT Constraints 
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico ADD CONSTRAINT DF_MSV_PrecoPontoAtendimentoHistorico_DT_Inclusao DEFAULT GETDATE() FOR DT_Inclusao
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico ADD CONSTRAINT DF_MSV_PrecoPontoAtendimentoHistorico_FLG_Situacao DEFAULT 1 FOR FLG_Situacao

-- Primary Key e Unique Key
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico ADD CONSTRAINT PK_MSV_PrecoPontoAtendimentoHistorico PRIMARY KEY CLUSTERED (ID_MSV_PrecoPontoAtendimentoHistorico)

--Foreign Keys
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_COR_EntidadeEnderecoSAVOrigem FOREIGN KEY ( COD_EntidadeEnderecoSAVOrigem )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )

ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_COR_EntidadeEnderecoSAVDestino FOREIGN KEY ( COD_EntidadeEnderecoSAVDestino )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_COR_EntidadeEnderecoFATDestino FOREIGN KEY ( COD_EntidadeEnderecoFATDestino )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_COR_EntidadeEnderecoFATOrigem FOREIGN KEY ( COD_EntidadeEnderecoFATOrigem )
        REFERENCES   COR_EntidadeEndereco ( ID_EntidadeEndereco )
  
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_MSV_Preco FOREIGN KEY ( COD_Preco )
        REFERENCES MSV_Preco ( ID_Preco )
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_MSV_PrecoPAFrequencia FOREIGN KEY ( COD_PrecoPAFrequencia )
        REFERENCES MSV_PrecoPAFrequencia ( ID_PrecoPAFrequencia )
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_MSV_PrecoPontoAtendimento FOREIGN KEY ( COD_PrecoPontoAtendimento )
        REFERENCES MSV_PrecoPontoAtendimento ( ID_PrecoPontoAtendimento )
  
ALTER TABLE MSV_PrecoPontoAtendimentoHistorico
    ADD CONSTRAINT FK_MSV_PrecoPontoAtendimentoHistorico_MSV_TipoPontoAtendimento FOREIGN KEY ( COD_TipoPontoAtendimento )
        REFERENCES MSV_TipoPontoAtendimento ( ID_TipoPontoAtendimento )

END 

IF object_id(N'DBO.MSV_TipoParametroCampo', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 26/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_TipoParametroCampo

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--  tipo de campo html (exemplo: inout, checkbox, radiobutton)
CREATE TABLE MSV_TipoParametroCampo 
    (
     ID_TipoParametroCampo   INT          IDENTITY (1, 1) NOT NULL,
     Des_TipoParametroCampo VARCHAR (100) , 
     [DT_Inclusao]        DATETIME     CONSTRAINT [DF_MSV_TipoParametroCampo_DT_Inclusao] DEFAULT (getdate()) NOT NULL,
     [DT_Alteracao]       DATETIME     NULL,
     [FLG_Situacao]       BIT          CONSTRAINT [DF_MSV_TipoParametroCampo_FLG_Situacao] DEFAULT ((1)) NOT NULL,
	 CONSTRAINT [PK_MSV_TipoParametroCampo] PRIMARY KEY CLUSTERED ([ID_TipoParametroCampo] ASC)
    );
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'tipo de campo html (exemplo: inout, checkbox, radiobutton)' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo'
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo' , 'COLUMN' , 'ID_TipoParametroCampo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo do tipo de parâmetro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo' , 'COLUMN' , 'Des_TipoParametroCampo' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteração do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_TipoParametroCampo' , 'COLUMN' , 'FLG_Situacao'  


--Foreign Keys
END 

IF object_id(N'DBO.MSV_ParametroCampo', N'U') IS NULL
BEGIN
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DATA DE CRIAÇÃO   : 25/09/2019
AUTOR             : LUIZ FERNANDO MAYER (GRUPO VICERI)
SISTEMA           : MSV
DESCRIÇÃO         : TABELA MSV_ParametroCampos

DATA DE ALTERAÇÃO :
AUTOR             :
DESCRIÇÃO         :
*/------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE MSV_ParametroCampo 
    (
     ID_ParametroCampo   INT          IDENTITY (1, 1) NOT NULL,
     COD_FamiliaProduto INTEGER NULL , 
     COD_Produto INTEGER NULL , 
     COD_Servico INTEGER NULL, 
     Nom_Campo VARCHAR (50) NOT NULL , 
     Tp_Campo VARCHAR (50) NOT NULL , 
     Des_IdentificadorHTML VARCHAR (100) NOT NULL , 
     COD_TipoParametroCampo INTEGER , 
     [DT_Inclusao]        DATETIME     CONSTRAINT [DF_MSV_ParametroCampo_DT_Inclusao] DEFAULT (getdate()) NOT NULL,
     [DT_Alteracao]       DATETIME     NULL,
     [FLG_Situacao]       BIT          CONSTRAINT [DF_MSV_ParametroCampo_FLG_Situacao] DEFAULT ((1)) NOT NULL,
	 CONSTRAINT [PK_MSV_ParametroCampo] PRIMARY KEY CLUSTERED ([ID_ParametroCampo] ASC)
    )
-- Descrição Tabela     
EXEC sp_addextendedproperty 'MS_Description' , 'Parametrizacao que habilita ou desabilita edição de campo conforme ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo'
-- Descrição Campos
EXEC sp_addextendedproperty 'MS_Description' , 'Identificador artificial único' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'ID_ParametroCampo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código da família' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'COD_FamiliaProduto' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do produto' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'COD_Produto' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do serviço' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'COD_Servico' 
EXEC sp_addextendedproperty 'MS_Description' , 'Nome do campo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'Nom_Campo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Tipo do campo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'Tp_Campo' 
EXEC sp_addextendedproperty 'MS_Description' , 'Descritivo HTML' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'Des_IdentificadorHTML' 
EXEC sp_addextendedproperty 'MS_Description' , 'Código do Tipo de Parâmetro' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'COD_TipoParametroCampo' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da inclusão do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'DT_Inclusao' 
EXEC sp_addextendedproperty 'MS_Description' , 'data e hora da alteração do registro de ponto de atendimento ' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'DT_Alteracao' 
EXEC sp_addextendedproperty 'MS_Description' , 'flag da situacao do registro 0 - inativo, 1 - ativo' , 'USER' , 'dbo' , 'TABLE' , 'MSV_ParametroCampo' , 'COLUMN' , 'FLG_Situacao'  

--Foreign Keys
ALTER TABLE MSV_ParametroCampo
    ADD CONSTRAINT FK_MSV_ParametroCampo_COR_FamiliaProduto FOREIGN KEY ( COD_FamiliaProduto )
        REFERENCES COR_FamiliaProduto ( ID_FamiliaProduto )

ALTER TABLE MSV_ParametroCampo
    ADD CONSTRAINT FK_MSV_ParametroCampo_COR_Produto FOREIGN KEY ( COD_Produto )
        REFERENCES COR_Produto ( ID_Produto )

ALTER TABLE MSV_ParametroCampo
    ADD CONSTRAINT FK_MSV_ParametroCampo_COR_Servico FOREIGN KEY ( COD_Servico )
        REFERENCES COR_Servico ( ID_servico )

ALTER TABLE MSV_ParametroCampo
    ADD CONSTRAINT FK_MSV_ParametroCampo_MSV_TipoParametroCampo FOREIGN KEY ( COD_TipoParametroCampo )
        REFERENCES MSV_TipoParametroCampo ( ID_TipoParametroCampo )        
END 
