IF OBJECT_ID('SP_MSV_SEL_PrecoServicoPontoAtendimento') IS NOT NULL
BEGIN
	DROP PROCEDURE [dbo].[SP_MSV_SEL_PrecoServicoPontoAtendimento]	
END;
GO
/*-------------------------------------------------------------------------------------------------  
    CRIADA EM			: 10/10/2019 10:36:43  
    AUTOR				: Marco Aurélio (Grupo Viceri)  
    SISTEMA QUE UTILIZA : Módulo de Serviços   
    DESCRIÇÃO			: Pesquisar pontos de atendimento
	EXEMPLO				: exec SP_MSV_SEL_PrecoServicoPontoAtendimento 100
*/-------------------------------------------------------------------------------------------------  
CREATE PROCEDURE [dbo].[SP_MSV_SEL_PrecoServicoPontoAtendimento]  
  @Cod_Contrato AS INT,
  @Cod_Servico AS INT = NULL,
  @Cod_Reduzido AS INT = NULL,
  @Cod_Preco AS INT = NULL
AS      
BEGIN      
    SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
		
SELECT 
	 MPSPA.[ID_PrecoServicoPontoAtendimento]
	,MPSPA.[COD_PrecoServico]
	,MPSPA.[COD_EntidadeEnderecoSAVOrigem]
	,MPSPA.[COD_EntidadeEnderecoSAVDestino]
	,MPSPA.[COD_EntidadeEnderecoFATOrigem]
	,MPSPA.[COD_EntidadeEnderecoFATDestino]
	,MPSPA.[COD_PrecoServicoPAFrequencia]
	,MPSPA.[COD_TipoPontoAtendimento]
	,MPSPA.[QT_MediaEmbarque]
	,MPSPA.[DES_Faturamento]
	,MPSPA.[DES_Observacao]
	,MPSPA.[DES_FaturamentoPrincipal]
	,MPSPA.[DES_FaturamentoDetalhe]
	,MPSPA.[DT_Inclusao]
	,MPSPA.[DT_Alteracao]
	,MPSPA.[FLG_Situacao]
	--,MPSPA.[COD_TipoTransporte]
	,'' AS [COD_TipoTransporte]
	--MTT
	--,MTT.[DES_TipoTransporte]
	,'' AS [DES_TipoTransporte]
	--MTPA
	,MTPA.[DES_TipoPontoAtendimento]
FROM 
	[dbo].[MSV_PrecoServicoPontoAtendimento] MPSPA
INNER JOIN MSV_PRECOSERVICO P
	ON MPSPA.COD_PrecoServico = P.ID_PrecoServico
INNER JOIN MSV_CONTRATOREDUZIDO CR
	ON CR.ID_CONTRATOREDUZIDO = P.COD_CONTRATOREDUZIDO
INNER JOIN COR_Servico S
	ON S.ID_Servico = P.COD_SERVICO
--INNER JOIN MSV_TipoTransporte MTT
--	ON MTT.ID_TipoTransporte = MPSPA.[COD_TipoTransporte]
INNER JOIN MSV_TipoPontoAtendimento MTPA
	ON MTPA.ID_TipoPontoAtendimento = MPSPA.[COD_TipoPontoAtendimento]
WHERE 
	CR.COD_CONTRATO = @Cod_Contrato
	AND (@Cod_Servico IS NULL OR S.ID_Servico = @Cod_Servico)
	AND (@Cod_Reduzido IS NULL OR CR.COD_REDUZIDO = @Cod_Reduzido)
	AND (@Cod_Preco IS NULL OR P.ID_PrecoServico = @Cod_Preco)

END



