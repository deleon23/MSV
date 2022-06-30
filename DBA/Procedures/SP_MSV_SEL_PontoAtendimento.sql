USE [Corporate]
GO
IF EXISTS ( SELECT 1 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[SP_MSV_SEL_PontoAtendimento]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [DBO].[SP_MSV_SEL_PontoAtendimento] 
END
GO
/*-------------------------------------------------------------------------------------------------  
    CRIADA EM   : 26/09/2019 15:50:43  
    AUTOR    : Marco Aurélio ( Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO   : Pesquisar pontos de atendimento vinculados ao contrato

*/-------------------------------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_MSV_SEL_PontoAtendimento]  
  @Cod_Contrato  AS INT, 
  @Cod_PontoAtendimento INT  = NULL
AS      
BEGIN      
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
	SELECT
		 CCPA.Id_ContratoPontoAtendimento
		,CEE.NOM_PONTOATENDIMENTO as Nom_PontoAtendimento
		,CEE.NOM_Cidade as Nom_Cidade
		,CEE.NOM_Estado as Nom_Estado
		,CEE.NOM_Logradouro as Nom_Logradouro
		,CCPA.Cod_Contrato
	FROM 
		CLI_ContratoPontoAtendimento CCPA
	INNER JOIN 
		COR_EntidadeEndereco CEE
	ON	
		CCPA.Cod_EntidadeEndereco = CEE.ID_EntidadeEndereco
	INNER JOIN 
		CLI_Contrato CC
	ON	
		CC.ID_Contrato = CCPA.Cod_Contrato
	WHERE 
		(@Cod_Contrato IS NULL or CCPA.Cod_Contrato = @Cod_Contrato)  AND
		(@Cod_PontoAtendimento IS NULL or CCPA.[Id_ContratoPontoAtendimento] = @Cod_PontoAtendimento)
	GROUP BY 
		 CCPA.Id_ContratoPontoAtendimento
		,CEE.NOM_PONTOATENDIMENTO
		,CEE.NOM_Cidade
		,CEE.NOM_Estado
		,CEE.NOM_Logradouro
		,CCPA.Cod_Contrato

	
END


