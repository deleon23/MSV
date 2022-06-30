IF OBJECT_ID('SP_MSV_SEL_DadosCadPreco') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_DadosCadPreco]	
END;

GO

/*-------------------------------------------------------------------------------------------------
    CRIADA EM			: 23/09/2019 09:25:42 
    AUTOR				: Marco Aurélio (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Gestão de Serviços WEB 
    DESCRIÇÃO			: Pesquisar Dados pelo Reduzido. (v1)
 -------------------------------------------------------------------------------------------------
	ALTERADA 	EM		: 10/10/2019 14:17 
    AUTOR				: Marco Aurélio (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Gestão de Serviços WEB 
    DESCRIÇÃO			: Pesquisar Dados pelo Reduzido. (v2)
 -------------------------------------------------------------------------------------------------
	ALTERADA 	EM		: 11/10/2019 15:17 
    AUTOR				: Marco Aurélio (Grupo Viceri)
    SISTEMA QUE UTILIZA	: Gestão de Serviços WEB 
    DESCRIÇÃO			: Obter dados bancarios de maneira diferente

	EXEC SP_MSV_SEL_DadosCadPreco 101
*/-------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SP_MSV_SEL_DadosCadPreco]

@COD_CONTRATO INT,
@COD_REDUZIDO INT  = NULL

AS  
BEGIN  
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  
		

	SELECT 

		--cli
		 CE_CLIENTE.[Nom_RazaoSocial] as Cli_RazaoSocial
		,CE_CLIENTE.[Cod_CNPJ] as Cli_Cnpj
		,CF.[Nom_Abvd_Filial]
		,(CEB.Cod_Banco + ' - ' + CEB.Nom_Banco) as Banco
		,CA.Cod_Agencia
		,'87445-0' as Cod_Conta --TODO
	    ,1 as Modalidade 
		,Convert(varchar, CC.DT_VigenciaInicio, 3) +  ' até ' + Convert(varchar, CC.DT_VigenciaFim, 3) as DT_VigenciaContrato
		,COF.Nom_Func as Responsavel
		,CC.ID_Contrato as Cod_Contrato
		--subcli
		,CE_SUBCLIENTE.[Nom_RazaoSocial] as SubCli_RazaoSocial
		,CEE.[NOM_PONTOOPERACIONAL] AS PontoOperacional
		,CE_SUBCLIENTE.[Cod_CNPJ]  as SubCli_Cnpj
		,MR.ID_Reduzido
		,CCPA.Id_ContratoPontoAtendimento
		
		,CEB.Cod_Banco
		,CEB.Nom_Banco

		,pc.NOM_MEMORANDO
		
	INTO #temp
	FROM
		COR_EntidadeEndereco CEE

	INNER JOIN
		CLI_Entidade CE_SUBCLIENTE WITH (NOLOCK)
	ON
		CEE.[ID_Entidade] = CE_SUBCLIENTE.[ID_Entidade]
	INNER JOIN
		CLI_ContratoPontoAtendimento CCPA WITH (NOLOCK)
	ON
		CCPA.[Cod_EntidadeEndereco] = CEE.[ID_EntidadeEndereco]
	INNER JOIN
		CLI_Contrato CC WITH (NOLOCK)
	ON
		CC.[ID_Contrato] = CCPA.[Cod_Contrato]
	INNER JOIN
		CLI_ContratoTipo CCT WITH (NOLOCK)
	ON
		CCT.[ID_ContratoTipo] = CC.[COD_ContratoTipo]
	INNER JOIN
		CLI_Entidade CE_CLIENTE WITH (NOLOCK)
	ON
		CC.[COD_Entidade] = CE_CLIENTE.[ID_Entidade]
	INNER JOIN
		COR_Filial CF WITH (NOLOCK)
	ON
		CF.[Cod_Regional] = CCPA.[Cod_Regional]
		AND CF.[Cod_Filial] = CCPA.[Cod_Filial]
	INNER JOIN
		COR_Empresa CE WITH (NOLOCK)
	ON
		CE.[Cod_Empresa] = CF.[Cod_Empresa]
	LEFT JOIN
		MSV_CONTRATOREDUZIDO MCR WITH (NOLOCK)
	ON
		MCR.[COD_CONTRATO] = CC.[ID_Contrato]
	LEFT JOIN
		MSV_REDUZIDO MR WITH (NOLOCK)
	ON
		MR.[ID_REDUZIDO] = MCR.[COD_REDUZIDO]

	LEFT JOIN CLI_EntidadeBanco CEB WITH (NOLOCK)
	ON
		CEB.ID_EntidadeBanco = CCPA.Cod_EntidadeBanco

	LEFT JOIN CLI_Banco CB  WITH (NOLOCK)
	ON
		CB.ID_Banco = CEB.Cod_Banco
	
	LEFT JOIN COR_Agencia CA   WITH (NOLOCK)
	ON
		CA.Cod_Banco = CB.ID_Banco
	
	INNER JOIN COR_Funcionario COF WITH (NOLOCK)
	ON
		CC.Cod_Func = COF.Cod_Func
		
	LEFT JOIN MSV_PRECOSERVICO pc
				ON pc.COD_CONTRATOREDUZIDO = MCR.ID_CONTRATOREDUZIDO

	WHERE
		(@COD_CONTRATO IS NULL or CC.[ID_Contrato] = @COD_CONTRATO)  AND
		(@COD_REDUZIDO IS NULL OR MR.[ID_Reduzido] = @COD_REDUZIDO) 
	
	ORDER BY 1 DESC
	
	SELECT
		 Cli_RazaoSocial
		,Cli_Cnpj
		,Nom_Abvd_Filial
		,Banco
		,Cod_Agencia
		,Cod_Conta
	    ,Modalidade
		,DT_VigenciaContrato
		,Responsavel
		,Cod_Contrato
		
		--subcli
		,SubCli_RazaoSocial
		,PontoOperacional
		,SubCli_Cnpj
		,ID_Reduzido
		,Id_ContratoPontoAtendimento
		
		,Cod_Banco
		,Nom_Banco
		,NOM_MEMORANDO

	FROM
		#temp
	GROUP BY
		 Cli_RazaoSocial
		,Cli_Cnpj
		,Nom_Abvd_Filial
		,Banco
		,Cod_Agencia
		,Cod_Conta
	    ,Modalidade
		,DT_VigenciaContrato
		,Responsavel
		,Cod_Contrato

		--subcli
		,SubCli_RazaoSocial
		,PontoOperacional
		,SubCli_Cnpj
		,Id_Reduzido
		,Id_ContratoPontoAtendimento
		
		,Cod_Banco
		,Nom_Banco
		,NOM_MEMORANDO

END;

