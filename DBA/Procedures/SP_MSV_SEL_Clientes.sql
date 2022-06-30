IF OBJECT_ID('SP_MSV_SEL_Clientes') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_Clientes]	
END;

GO

/*-------------------------------------------------------------------------------------------------
    CRIADA EM			: 25/09/2019 17:06:59
    AUTOR				: Sérgio Torres (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Módulo de Serviços 
    DESCRIÇÃO			: Pesquisar Clientes
*/-------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_MSV_SEL_Clientes]
AS
BEGIN
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
	SELECT DISTINCT
		CE_CLIENTE.[ID_Entidade] AS Id
		,CE_CLIENTE.[Cod_CNPJ]
		,CE_CLIENTE.[Nom_RazaoSocial]
		,CE_CLIENTE.[Nom_Fantasia]
		,CE_CLIENTE.[Cod_InscricaoEstadual]
		,CE_CLIENTE.[Cod_InscricaoMunicipal]
		,CE_CLIENTE.[Flg_Situacao]
		,RTRIM(LTRIM(CE_CLIENTE.[Cod_CNPJ])) + ' - ' + RTRIM(LTRIM(CE_CLIENTE.[Nom_RazaoSocial])) AS Cod_Cnpj_Nom_RazaoSocial
	FROM
		CLI_Entidade CE_CLIENTE
	INNER JOIN
		CLI_Contrato CC
	ON
		CC.[COD_Entidade] = CE_CLIENTE.[ID_Entidade]
END