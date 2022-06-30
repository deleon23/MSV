IF OBJECT_ID('SP_MSV_SEL_ServicosContrato') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_ServicosContrato]	
END;
GO
/*-------------------------------------------------------------------------------------------------  
    CRIADA EM			: 19/09/2019 17:53:43  
    AUTOR				: Deleon Henrique (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Pesquisar Servicos vinculados ao contrato	
----------------------------------------------------------------------------------------------------  
    ALTERADA EM			: 25/09/2019 17:53:43  
    AUTOR				: Marco Aurelio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Obter Familia 
----------------------------------------------------------------------------------------------------  
    ALTERADA EM			: 26/09/2019 14:06:03  
    AUTOR				: Marco Aurelio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Obter Ponto entre outras infos para filtro de servicos por ponto
----------------------------------------------------------------------------------------------------  
    ALTERADA EM			: 03/10/2019 11:57:03  
    AUTOR				: Marco Aurelio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Cod_ponto deve ser Cod_preco conforme reuniao de alinhamento com Caio
----------------------------------------------------------------------------------------------------  
    ALTERADA EM			: 15/10/2019 
    AUTOR				: Deleon Henrique (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Adicionado novo retorno de nome reduzido para o serviço
*/-------------------------------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_MSV_SEL_ServicosContrato]  
  @Cod_Contrato  AS INT, 
  @Cod_PontoAtendimento INT  = NULL,
  @Cod_Reduzido INT  = NULL
AS      
BEGIN      
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
	
	IF(EXISTS(
			  SELECT 1 
			  FROM MSV_CONTRATOREDUZIDO  cr
			  INNER JOIN MSV_PRECOSERVICO ps
			  	ON ps.COD_ContratoReduzido = cr.ID_ContratoReduzido
			  WHERE cr.COD_CONTRATO = @Cod_Contrato
				AND cr.COD_Reduzido = @Cod_Reduzido)) 
		BEGIN
			SELECT 
			 cs.ID_Servico
			 ,cs.DES_CodigoInterno 
			 ,cs.DES_Servico
			 ,cp.COD_FamiliaProduto
			 ,ccpa.Id_ContratoPontoAtendimento
			 ,ccpa.Cod_Contrato
			 ,cr.Cod_Reduzido
			 ,('Serv_Cod_Int:' + convert( varchar,isnull(cs.DES_CodigoInterno,0)) + ' | Serv.:' + convert(varchar, isnull(cs.DES_Servico,0))) as DES_ServicoLabelResum 
			 ,('Serv_Cod_Int:' + convert( varchar,isnull(cs.DES_CodigoInterno,0)) + ' | Serv.:' + convert(varchar, isnull(cs.DES_Servico,0)) + ' | Cod_Preco:' + convert(varchar,isnull(p.ID_PrecoServico,0))) as DES_ServicoLabel 
			FROM MSV_CONTRATOREDUZIDO cr
			INNER JOIN MSV_PRECOSERVICO p
				ON p.COD_CONTRATOREDUZIDO = cr.ID_CONTRATOREDUZIDO
			INNER JOIN COR_Servico cs
				ON cs.ID_Servico = p.COD_SERVICO
			INNER JOIN COR_Produto cp
				ON cs.COD_Produto = cp.ID_Produto
			LEFT JOIN CLI_ContratoPontoAtendimento ccpa
				ON ccpa.[Cod_Contrato] = cr.[COD_CONTRATO]
			WHERE 
				(@Cod_Contrato IS NULL or cr.[COD_CONTRATO] = @Cod_Contrato)  AND
				(@Cod_PontoAtendimento IS NULL or ccpa.[Id_ContratoPontoAtendimento] = @Cod_PontoAtendimento)  AND
				(@Cod_Reduzido IS NULL or cr.COD_REDUZIDO = @Cod_Reduzido)

			GROUP BY 
				 cs.ID_Servico
				 ,cs.DES_CodigoInterno 
				 ,cs.DES_Servico
				 ,cp.COD_FamiliaProduto
				 ,ccpa.Id_ContratoPontoAtendimento
				 ,ccpa.Cod_Contrato
				 ,cr.Cod_Reduzido
				 ,p.ID_PrecoServico
		END
	ELSE
		BEGIN
			SELECT 
			 cs.ID_Servico
			 ,cs.DES_CodigoInterno 
			 ,cs.DES_Servico
			 ,cp.COD_FamiliaProduto
			 ,ccpa.Id_ContratoPontoAtendimento
			 ,ccpa.Cod_Contrato
			 ,0 as Cod_Reduzido
			 ,('Serv_Cod_Int:' + convert( varchar,isnull(cs.DES_CodigoInterno,0)) + ' | Serv.:' + convert(varchar, isnull(cs.DES_Servico,0))) as DES_ServicoLabelResum 
			 ,('Serv_Cod_Int:' + convert( varchar,isnull(cs.DES_CodigoInterno,0)) + ' | Serv.:' + convert(varchar, isnull(cs.DES_Servico,0)) + ' | Preco:' + convert(varchar,isnull(NULL,0))) as DES_ServicoLabel 
			FROM CLI_ContratoServico ccs
			INNER JOIN COR_Servico cs
				ON cs.ID_Servico = ccs.COD_Servico
			INNER JOIN COR_Produto cp
				ON cs.COD_Produto = cp.ID_Produto
			LEFT JOIN CLI_ContratoPontoAtendimento ccpa
				ON ccpa.[Cod_Contrato] = ccs.[COD_CONTRATO]
			WHERE 
				(@Cod_Contrato IS NULL or ccs.[COD_CONTRATO] = @Cod_Contrato)  AND
				(@Cod_PontoAtendimento IS NULL or ccpa.[Id_ContratoPontoAtendimento] = @Cod_PontoAtendimento)
			GROUP BY 
				 cs.ID_Servico
				 ,cs.DES_CodigoInterno 
				 ,cs.DES_Servico
				 ,cp.COD_FamiliaProduto
				 ,ccpa.Id_ContratoPontoAtendimento
				 ,ccpa.Cod_Contrato
		END
END
