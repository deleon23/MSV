 /*-------------------------------------------------------------------------------------------------
 Script insert tabelas de campos dinamicos
 * o que inserir vai esconder para a respectiva [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico] 
 
 
--------------------------------------------------------------------------------------------------*/

/*
-- seleção da familia , produto e servico do contrato teste 100 que utilizamos

select
COR_Produto.COD_FamiliaProduto, COR_Produto.Id_Produto, COR_Servico.ID_Servico 
from MSV_PRECO 
JOIN COR_Servico ON COR_Servico.ID_Servico = MSV_PRECO.COD_SERVICO
JOIN COR_Produto ON COR_Produto.Id_Produto = COR_Servico.Cod_Produto
where COD_CONTRATOREDUZIDO = (select id_contratoreduzido from MSV_CONTRATOREDUZIDO where COD_CONTRATO  = 100)

1	5	1 
1	5	2
1	5	3
1	5	4
1	5	5

*/

USE [Corporate]
GO

--DROP TABLE [MSV_ParametroCampo]
--DROP TABLE [MSV_TipoParametroCampo]

DELETE FROM [MSV_ParametroCampo]
DELETE FROM [MSV_TipoParametroCampo]

--[MSV_TipoParametroCampo]
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'input',		GETDATE(),	NULL,	1
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'label',	GETDATE(),	NULL,	1
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'div',		GETDATE(),	NULL,	1
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'accordion',	GETDATE(),	NULL,	1
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'row',	GETDATE(),	NULL,	1
INSERT INTO [dbo].[MSV_TipoParametroCampo] ([Des_TipoParametroCampo],[DT_Inclusao],[DT_Alteracao],[FLG_Situacao])
SELECT 'card',	GETDATE(),	NULL,	1

------------------------
--[MSV_ParametroCampo]-- 
------------------------
/*
-- accordionClientes --
INSERT INTO [dbo].[MSV_ParametroCampo]  ( [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico]  ,[Nom_Campo]  ,[Tp_Campo]   ,[Des_IdentificadorHTML]   
,[COD_TipoParametroCampo]  ,[DT_Inclusao]  ,[DT_Alteracao] ,[FLG_Situacao])
VALUES ( 1, 5, 1, 'Clientes', 'accordion','accordionClientes'
,(select ID_TipoParametroCampo FROM MSV_TipoParametroCampo WHERE Des_TipoParametroCampo='accordion'), getdate(), NULL, 1 )

-- accordionServicos --
INSERT INTO [dbo].[MSV_ParametroCampo]  ( [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico]  ,[Nom_Campo]  ,[Tp_Campo]   ,[Des_IdentificadorHTML]   
,[COD_TipoParametroCampo]  ,[DT_Inclusao]  ,[DT_Alteracao] ,[FLG_Situacao])
VALUES ( 1, 5, 1, 'Serviços', 'accordion','accordionServicos'
,(select ID_TipoParametroCampo FROM MSV_TipoParametroCampo WHERE Des_TipoParametroCampo='accordion'), getdate(), NULL, 1 )
*/

-- accordionValores --
INSERT INTO [dbo].[MSV_ParametroCampo]  ( [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico]  ,[Nom_Campo]  ,[Tp_Campo]   ,[Des_IdentificadorHTML]   
,[COD_TipoParametroCampo]  ,[DT_Inclusao]  ,[DT_Alteracao] ,[FLG_Situacao])
VALUES ( 1, 5, 1, 'Valores', 'accordion','accordionValores'
,(select ID_TipoParametroCampo FROM MSV_TipoParametroCampo WHERE Des_TipoParametroCampo='accordion'), getdate(), NULL, 1 )

-----------

INSERT INTO [dbo].[MSV_ParametroCampo]  ( [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico]  ,[Nom_Campo]  ,[Tp_Campo]   ,[Des_IdentificadorHTML]   
,[COD_TipoParametroCampo]  ,[DT_Inclusao]  ,[DT_Alteracao] ,[FLG_Situacao])
VALUES ( 1, 5, 1, 'Dados Servico', 'label','id_cardDadosServico'
,(select ID_TipoParametroCampo FROM MSV_TipoParametroCampo WHERE Des_TipoParametroCampo='row'), getdate(), NULL, 1 )

INSERT INTO [dbo].[MSV_ParametroCampo]  ( [COD_FamiliaProduto]  ,[COD_Produto] ,[COD_Servico]  ,[Nom_Campo]  ,[Tp_Campo]   ,[Des_IdentificadorHTML]   
,[COD_TipoParametroCampo]  ,[DT_Inclusao]  ,[DT_Alteracao] ,[FLG_Situacao])
VALUES ( 1, 5, 1, 'Tipo Transporte', 'label','id_cardTipoTransporte'
,(select ID_TipoParametroCampo FROM MSV_TipoParametroCampo WHERE Des_TipoParametroCampo='div'), getdate(), NULL, 1 )


 /*
select
SIC_Produto.Cod_Familia, SIC_Produto.Cod_Produto, SIC_Servico.Cod_Servico 
from MSV_PRECO 
JOIN SIC_Servico ON SIC_Servico.Cod_Servico = MSV_PRECO.COD_SERVICO
JOIN SIC_Produto ON SIC_Produto.Cod_Produto = SIC_Servico.Cod_Produto
where COD_CONTRATOREDUZIDO = (select id_contratoreduzido from MSV_CONTRATOREDUZIDO where COD_CONTRATO  = 100)

familia | produto | servico
1			100			1

*/


