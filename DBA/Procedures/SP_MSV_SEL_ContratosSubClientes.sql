IF OBJECT_ID('SP_MSV_SEL_ContratosSubClientes') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_ContratosSubClientes]	
END;

GO

/*-------------------------------------------------------------------------------------------------
    CRIADA EM			: 19/09/2019 17:53:43
    AUTOR				: Sérgio Torres (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Módulo de Serviços 
    DESCRIÇÃO			: Pesquisar SubClientes, Clientes, Contratos e Reduzidos relacionados.
*/-------------------------------------------------------------------------------------------------
CREATE PROCEDURE [dbo].[SP_MSV_SEL_ContratosSubClientes]
       
 @Cod_Empresa  AS INT = NULL,
 @Cod_Regional AS INT = NULL,
 @Cod_Filial AS INT = NULL,
 @Cod_Reduzido AS INT = NULL,
 @Cod_ClienteEntidade AS INT = NULL,
 @Cod_SubClienteEntidade AS INT = NULL,
 --@Des_Aditivo AS VARCHAR(1000) = NULL,
 @Cod_TipoSubCliente AS INT = NULL,
 @Cod_Familia AS INT = NULL,
 @Cod_Contrato AS INT = NULL,
 @FLG_ExibeInativos BIT = 0,
 @CampoOrdenacao AS VARCHAR(128),
 @TamanhoPagina AS SMALLINT = NULL,
 @PaginaAtual AS SMALLINT

AS    
BEGIN    
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;    

	IF @TamanhoPagina = 0 
	BEGIN
		DECLARE @QuantidadeRegistros INT
		SELECT @QuantidadeRegistros = COUNT(1) FROM [PCO_Proposta]

		SELECT @TamanhoPagina = @QuantidadeRegistros;
	END	

    DECLARE @DE INT = 0,    
            @ATE INT = 0;    
    
    IF @PaginaAtual >= 2 SET @DE = ((@PaginaAtual - 1) * (@TamanhoPagina)) + 1    
    ELSE SET @DE = (@PaginaAtual - 1) * (@TamanhoPagina+ 1)    
    
    SET @ATE = (@PaginaAtual * @TamanhoPagina);

	--CREATE TABLE #CONTRATOANEXO (
	--	[COD_CONTRATO] INT NULL,
	--	[Nom_Aditivo] VARCHAR(15) NULL
	--);

	--INSERT
	--	#CONTRATOANEXO
	--SELECT
	--	[COD_CONTRATO],
	--	[Nom_Aditivo]
	--FROM
	--	CLI_ContratoAnexo
	--WHERE
	--	(@Des_Aditivo IS NULL OR Nom_Aditivo = @Des_Aditivo)
	--	AND (@Cod_Contrato IS NULL OR COD_Contrato = @Cod_Contrato)
	--	AND COD_ContratoTipoAnexo = 2
    
    SET NOCOUNT ON ;
    
    WITH ResultadoConsulta AS
    (    
		SELECT
			ROW_NUMBER() OVER (    
							ORDER BY     
				CASE WHEN @CampoOrdenacao = 'Empresa ASC' THEN CE.[RazaoSocial] END ASC,
				CASE WHEN @CampoOrdenacao = 'Empresa DESC' THEN CE.[RazaoSocial] END DESC,
				CASE WHEN @CampoOrdenacao = 'Filial ASC' THEN CF.[Nom_Abvd_Filial] END ASC,
				CASE WHEN @CampoOrdenacao = 'Filial DESC' THEN CF.[Nom_Abvd_Filial] END DESC,
				CASE WHEN @CampoOrdenacao = 'Cliente ASC' THEN CE_CLIENTE.[Nom_RazaoSocial] END ASC,
				CASE WHEN @CampoOrdenacao = 'Cliente DESC' THEN CE_CLIENTE.[Nom_RazaoSocial] END DESC,
				CASE WHEN @CampoOrdenacao = 'CNPJ ASC' THEN CE_CLIENTE.[Cod_CNPJ]  END ASC,
				CASE WHEN @CampoOrdenacao = 'CNPJ DESC' THEN CE_CLIENTE.[Cod_CNPJ]  END DESC,
				CASE WHEN @CampoOrdenacao = 'TipoContrato ASC' THEN CCT.[DES_Tipo] END ASC,
				CASE WHEN @CampoOrdenacao = 'TipoContrato DESC' THEN CCT.[DES_Tipo] END DESC,
				CASE WHEN @CampoOrdenacao = 'Reduzido ASC' THEN MR.[ID_REDUZIDO] END ASC,
				CASE WHEN @CampoOrdenacao = 'Reduzido DESC' THEN MR.[ID_REDUZIDO] END DESC,
				CASE WHEN @CampoOrdenacao = 'Contrato ASC' THEN CC.[ID_Contrato] END ASC,
				CASE WHEN @CampoOrdenacao = 'Contrato DESC' THEN CC.[ID_Contrato] END DESC,
				CASE WHEN @CampoOrdenacao = 'SubCliente ASC' THEN CE_SUBCLIENTE.[Nom_RazaoSocial] END ASC,
				CASE WHEN @CampoOrdenacao = 'SubCliente DESC' THEN CE_SUBCLIENTE.[Nom_RazaoSocial] END DESC,
				CASE WHEN @CampoOrdenacao = 'PontoOperacional ASC' THEN CEE.[NOM_PONTOOPERACIONAL] END ASC,
				CASE WHEN @CampoOrdenacao = 'PontoOperacional DESC' THEN CEE.[NOM_PONTOOPERACIONAL] END DESC,
				CASE WHEN @CampoOrdenacao = 'Logradouro ASC' THEN CEE.[NOM_Logradouro] END ASC,
				CASE WHEN @CampoOrdenacao = 'Logradouro DESC' THEN CEE.[NOM_Logradouro] END DESC,
				CASE WHEN @CampoOrdenacao = 'Numero ASC' THEN CEE.[NUM_Numero] END ASC,
				CASE WHEN @CampoOrdenacao = 'Numero DESC' THEN CEE.[NUM_Numero] END DESC
			) AS NumeroLinha               
			,CE.[RazaoSocial] AS Empresa
			,CF.[Nom_Abvd_Filial] AS Filial
			,CE_CLIENTE.[Nom_RazaoSocial] AS Cliente
			,CE_CLIENTE.[Cod_CNPJ] AS CNPJ
			,CCT.[DES_Tipo] AS TipoContrato
			,MR.[ID_REDUZIDO] AS Reduzido
			,CC.[ID_Contrato] AS Contrato
			,CE_SUBCLIENTE.[Nom_RazaoSocial] AS SubCliente
			,CEE.[NOM_PONTOOPERACIONAL] AS PontoOperacional
			,CEE.[NOM_Logradouro] AS Logradouro
			,CEE.[NUM_Numero] AS Numero
		FROM
			COR_EntidadeEndereco CEE
		INNER JOIN
			CLI_Entidade CE_SUBCLIENTE
		ON
			CEE.[ID_Entidade] = CE_SUBCLIENTE.[ID_Entidade]
		INNER JOIN
			CLI_ContratoPontoAtendimento CCPA
		ON
			CCPA.[Cod_EntidadeEndereco] = CEE.[ID_EntidadeEndereco]
		INNER JOIN
			CLI_Contrato CC
		ON
			CC.[ID_Contrato] = CCPA.[Cod_Contrato]
		INNER JOIN
			CLI_ContratoTipo CCT
		ON
			CCT.[ID_ContratoTipo] = CC.[COD_ContratoTipo]
		INNER JOIN
			CLI_Entidade CE_CLIENTE
		ON
			CC.[COD_Entidade] = CE_CLIENTE.[ID_Entidade]
		INNER JOIN
			COR_Filial CF
		ON
			CF.[Cod_Regional] = CCPA.[Cod_Regional]
			AND CF.[Cod_Filial] = CCPA.[Cod_Filial]
		INNER JOIN
			COR_Empresa CE
		ON
			CE.[Cod_Empresa] = CF.[Cod_Empresa]
		LEFT JOIN
			MSV_CONTRATOREDUZIDO MCR
		ON
			MCR.[COD_CONTRATO] = CC.[ID_Contrato]
		LEFT JOIN
			MSV_REDUZIDO MR
		ON
			MR.[ID_REDUZIDO] = MCR.[COD_REDUZIDO]
		LEFT JOIN
			CLI_ContratoServico CCS
		ON
			CCS.[COD_Contrato] = CC.[ID_Contrato]
		LEFT JOIN
			COR_Servico CS
		ON
			CS.[ID_Servico] = CCS.[COD_Servico]
		LEFT JOIN
			COR_Produto CP
		ON
			CP.[ID_Produto] = CS.COD_Produto
		LEFT JOIN
			COR_FamiliaProduto CFP
		ON
			CFP.[ID_FamiliaProduto] = CP.[COD_FamiliaProduto]
		--LEFT JOIN
		--	#CONTRATOANEXO CCA
		--ON
		--	CCA.[COD_Contrato] = CC.[ID_Contrato]
		LEFT JOIN
			MSV_PRECOSERVICO MP
		ON
			MP.[COD_CONTRATOREDUZIDO] = MCR.[ID_CONTRATOREDUZIDO]
			AND MP.[COD_SERVICO] = CS.[ID_Servico]
		WHERE
		(@FLG_ExibeInativos = 0 OR (@FLG_ExibeInativos = 1 AND MR.FLG_SITUACAO = 0 OR MP.[FLG_SITUACAO] = 0)) AND
		(@Cod_Empresa IS NULL OR CF.[Cod_Empresa] = @Cod_Empresa) AND
		(@Cod_Regional IS NULL OR CCPA.[Cod_Regional] = @Cod_Regional) AND
		(@Cod_Filial IS NULL OR CCPA.[Cod_Filial] = @Cod_Filial) AND
		(@Cod_ClienteEntidade IS NULL OR CE_CLIENTE.[ID_Entidade] = @Cod_ClienteEntidade) AND
		(@Cod_SubClienteEntidade IS NULL OR CE_SUBCLIENTE.[ID_Entidade] = @Cod_SubClienteEntidade) AND
		(@Cod_Reduzido IS NULL OR MR.[ID_REDUZIDO] = @Cod_Reduzido) AND
		(@Cod_Contrato IS NULL OR CC.[Id_Contrato] = @Cod_Contrato) AND
		(@Cod_Familia IS NULL OR CFP.[ID_FamiliaProduto] = @Cod_Familia)
		--(@Des_Aditivo IS NULL OR CCA.[Nom_Aditivo] = @Des_Aditivo)
		GROUP BY
			CE.[RazaoSocial]
			,CF.[Nom_Abvd_Filial]
			,CE_CLIENTE.[Nom_RazaoSocial]
			,CE_CLIENTE.[Cod_CNPJ]
			,CCT.[DES_Tipo]
			,MR.[ID_REDUZIDO]
			,CC.[ID_Contrato]
			,CE_SUBCLIENTE.[Nom_RazaoSocial]
			,CEE.[NOM_PONTOOPERACIONAL]
			,CEE.[NOM_Logradouro]
			,CEE.[NUM_Numero]
    ), ContagemTotal AS (    
        SELECT COUNT_BIG(1) AS TotalRows FROM ResultadoConsulta    
    )    

    SELECT             
		[Empresa]
		,[Filial]
		,[Cliente]
		,[CNPJ]
		,[TipoContrato]
		,[Reduzido]
		,[Contrato]
		,[SubCliente]
		,[PontoOperacional]
		,[Logradouro]
		,[Numero]
		,CT.[TotalRows] , NumeroLinha   
    FROM ResultadoConsulta as RC, ContagemTotal CT    
    WHERE RC.NumeroLinha BETWEEN @DE AND @ATE    
  
 END;  