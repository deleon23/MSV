IF OBJECT_ID('SP_MSV_SEL_PrecoServicoContrato') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_PrecoServicoContrato]	
END;
GO
/*-------------------------------------------------------------------------------------------------  
    CRIADA EM			: 20/09/2019 17:53:43  
    AUTOR				: Deleon Henrique (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Pesquisar Preços Servicos vinculados ao contrato
--------------------------------------------------------------------------------------------------- 
    CRIADA EM			: 03/10/2019 14:35:43  
    AUTOR				: Marco Aurelio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: fornecer colunas para facilitar a busca dos parametros dinamicos 
						: ( exibicao dos campos )
--------------------------------------------------------------------------------------------------- 
    CRIADA EM			: 09/10/2019 12:03:43  
    AUTOR				: Marco Aurelio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: add cnoj junto a razao
						: ( exibicao dos campos )
*/-------------------------------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_MSV_SEL_PrecoServicoContrato]  
  @Cod_Contrato AS INT,
  @Cod_Servico AS INT,
  @Cod_Reduzido AS INT = NULL
AS      
BEGIN      
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
SELECT
		--Informações de Clientes - Modulos Serviços--
		E.Nom_RazaoSocial + ' - ' + E.Cod_CNPJ	AS  Cliente
		, E_SubCliente.Nom_RazaoSocial + ' - ' + E_SubCliente.Cod_CNPJ		AS	SubCliente
		, E_Matriz.Nom_RazaoSocial + ' - ' + E_Matriz.Cod_CNPJ			AS	Matriz
		, E_FAT.Nom_RazaoSocial + ' - ' + E_FAT.Cod_CNPJ				AS	Cliente_Fat
		, E_FAT_SubCliente.Nom_RazaoSocial + ' - ' + E_FAT_SubCliente.Cod_CNPJ	AS	Cliente_Fat_SubCliente
		--Serviços--
		-- Status do Serviço (Ativo/Suspenso/Cancelado)
		-- Data Início do Local de Atendimento
		-- Data Fim do Local de Atendimento
		-- Código do Serviço para o cliente
		, SCP.Des_Composicao
		, P.COD_FLUXO
		, CP.NOM_Produto
		, S.DES_CodigoInterno
		, P.FLG_SITUACAO
		, P.DT_VIGENCIAINICIO
		, P.DT_VIGENCIAFIM
		, P.DT_BASE
		, F.Nom_Abvd_Filial
		--Valores--
		, P.VL_PRECO
		, P.TX_ADVALOREM
		, P.TX_PERNOITE
		, P.VL_FRANQUIA
		, P.TX_ADPERM
		, P.VL_INTERVMINUTOS
		, P.PERC_ADICNOTURNO
		--Complementar para aplicação
		, P.COD_CONTRATOREDUZIDO 
		-- para carregamento de ParametroCampo
		,CP.COD_FamiliaProduto as COD_FamiliaProduto
		,CP.ID_Produto as COD_Produto
		,S.ID_Servico as COD_Servico

	FROM MSV_PRECO P
	INNER JOIN MSV_CONTRATOREDUZIDO CR
		ON CR.ID_CONTRATOREDUZIDO = P.COD_CONTRATOREDUZIDO
	INNER JOIN COR_Servico S
		ON S.ID_Servico = P.COD_SERVICO
	LEFT JOIN SIC_Servico SS
		ON SS.Cod_Contabil = S.DES_CodigoInterno
	LEFT JOIN SIC_Composicao_Preco SCP
		ON SCP.Cod_Composicao = SS.Cod_Composicao
	INNER JOIN COR_Produto CP
		ON CP.ID_Produto = S.COD_Produto
	INNER JOIN COR_Filial F
		ON F.Cod_Filial = P.COD_FILIALRATEIO
		AND F.Cod_Regional = P.COD_REGIONALRATEIO
	INNER JOIN CLI_Entidade E
		ON E.ID_Entidade = P.COD_SAV_ENTIDADE
	INNER JOIN COR_EntidadeEndereco EE
		ON EE.ID_EntidadeEndereco = P.COD_SAV_ENTIDADEENDERECO
	INNER JOIN CLI_Entidade E_SubCliente
		ON E_SubCliente.ID_Entidade = EE.ID_Entidade
	INNER JOIN COR_EntidadeEndereco EE_Cnab
		ON EE_Cnab.ID_EntidadeEndereco = P.COD_SAV_CNAB_ENTIDADEENDERECO
	INNER JOIN CLI_Entidade E_Matriz
		ON E_Matriz.ID_Entidade = EE_Cnab.ID_Entidade
	INNER JOIN CLI_Entidade E_FAT
		ON E_FAT.ID_Entidade = P.COD_FAT_ENTIDADE
	INNER JOIN COR_EntidadeEndereco EE_FAT
		ON EE_FAT.ID_EntidadeEndereco = P.COD_FAT_ENTIDADEENDERECO
	INNER JOIN CLI_Entidade E_FAT_SubCliente
		ON E_FAT_SubCliente.ID_Entidade = EE_FAT.ID_Entidade
	WHERE 
		CR.COD_CONTRATO = @Cod_Contrato
		AND S.ID_Servico = @Cod_Servico
		AND (@Cod_Reduzido IS NULL OR CR.COD_REDUZIDO = @Cod_Reduzido)
END