USE [Corporate]
GO
IF EXISTS ( SELECT 1 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[SP_MSV_SEL_ParametroCampo]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [DBO].[SP_MSV_SEL_ParametroCampo] 
END
GO
/*-------------------------------------------------------------------------------------------------  
    CRIADA EM			: 02/10/2019 13:54:43  
    AUTOR				: Marco Aurélio ( Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Pesquisar campos parametrizados para interacao com o FRONT

*/-------------------------------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_MSV_SEL_ParametroCampo]  

 @COD_FamiliaProduto INT  = NULL,
 @COD_Produto INT  = NULL,
 @COD_Servico INT  = NULL,
 @Nom_Campo    AS VARCHAR(50) = NULL,
 @Des_IdentificadorHTML    AS VARCHAR(50) = NULL,
 @Des_TipoParametroCampo    AS VARCHAR(50) = NULL

AS      
BEGIN      
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT 
	   MPC.[ID_ParametroCampo]
      ,MPC.[COD_FamiliaProduto]
      ,MPC.[COD_Produto]
      ,MPC.[COD_Servico]
      ,MPC.[Nom_Campo]
      ,MPC.[Tp_Campo]
      ,MPC.[Des_IdentificadorHTML]
      ,MPC.[COD_TipoParametroCampo]
      ,MPC.[DT_Inclusao]
      ,MPC.[DT_Alteracao]
      ,MPC.[FLG_Situacao]

	  ,MTPC.[ID_TipoParametroCampo]
      ,MTPC.[Des_TipoParametroCampo]
      --,MTPC.[DT_Inclusao]
      --,MTPC.[DT_Alteracao]
      --,MTPC.[FLG_Situacao]

	   FROM [dbo].[MSV_ParametroCampo] MPC

	   JOIN [dbo].[MSV_TipoParametroCampo] MTPC 
	   ON MPC.[COD_TipoParametroCampo] = MTPC.[ID_TipoParametroCampo]

	   WHERE
	   MTPC.[FLG_Situacao] = 1 AND MPC.[FLG_Situacao] = 1 AND
	   (@COD_FamiliaProduto IS NULL OR MPC.[COD_FamiliaProduto] = @COD_FamiliaProduto) AND
	   (@COD_Produto IS NULL OR MPC.[COD_Produto] = @COD_Produto) AND
	   (@COD_Servico IS NULL OR MPC.[COD_Servico] = @COD_Servico) AND 
	   (@Nom_Campo IS NULL OR MPC.[Nom_Campo] LIKE '%'+@Nom_Campo+'%') AND
	   (@Des_IdentificadorHTML IS NULL OR MPC.[Des_IdentificadorHTML] LIKE '%'+@Des_IdentificadorHTML+'%') AND
	   (@Des_TipoParametroCampo IS NULL OR MTPC.[Des_TipoParametroCampo] LIKE '%'+@Des_TipoParametroCampo+'%')

END;