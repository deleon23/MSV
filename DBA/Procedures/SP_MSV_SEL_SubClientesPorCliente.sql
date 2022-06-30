IF OBJECT_ID('SP_MSV_SEL_SubClientesPorCliente') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_SubClientesPorCliente]	
END;

GO

/*-------------------------------------------------------------------------------------------------
    CRIADA EM			: 25/09/2019 15:54:17
    AUTOR				: Sérgio Torres (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Módulo de Serviços 
    DESCRIÇÃO			: Pesquisar SubClientes relacionados a um determinado Cliente
*/-------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_MSV_SEL_SubClientesPorCliente]  
	@Cod_Entidade  AS INT = NULL
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
	SELECT DISTINCT
		CE_SUBCLIENTE.[ID_Entidade] AS Id
		,CE_SUBCLIENTE.[Cod_CNPJ]
		,CE_SUBCLIENTE.[Nom_RazaoSocial]
		,CE_SUBCLIENTE.[Nom_Fantasia]
		,CE_SUBCLIENTE.[Cod_InscricaoEstadual]
		,CE_SUBCLIENTE.[Cod_InscricaoMunicipal]
		,CE_SUBCLIENTE.[Flg_Situacao]
		,RTRIM(LTRIM(CE_SUBCLIENTE.[Cod_CNPJ])) + ' - ' + RTRIM(LTRIM(CE_SUBCLIENTE.[Nom_RazaoSocial])) AS Cod_Cnpj_Nom_RazaoSocial
	FROM
		CLI_Entidade CE_CLIENTE
	INNER JOIN
		CLI_Contrato CC
	ON
		CC.[COD_Entidade] = CE_CLIENTE.[ID_Entidade]
	INNER JOIN
		CLI_ContratoPontoAtendimento CCPA
	ON
		CCPA.[Cod_Contrato] = CC.[ID_Contrato]
	INNER JOIN
		COR_EntidadeEndereco CEE
	ON
		CEE.[ID_EntidadeEndereco] = CCPA.[Cod_EntidadeEndereco]
	INNER JOIN
		CLI_Entidade CE_SUBCLIENTE
	ON
		CE_SUBCLIENTE.[ID_Entidade] = CEE.[ID_Entidade]
	WHERE
		(@Cod_Entidade IS NULL OR CE_CLIENTE.[ID_Entidade] = @Cod_Entidade)
END