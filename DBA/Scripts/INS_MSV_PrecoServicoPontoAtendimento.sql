/*
	Carga basica de ponto de atendimento
	[MSV_PrecoServicoPontoAtendimento]
	Marco
	10-10-2019
*/


USE [Corporate]
GO

--RECOLHIMENTO / 'Ponto Genérico'

INSERT INTO [dbo].[MSV_PrecoServicoPontoAtendimento]
           (
				[COD_PrecoServico]
			   ,[COD_EntidadeEnderecoSAVOrigem]
			   ,[COD_EntidadeEnderecoSAVDestino]
			   ,[COD_EntidadeEnderecoFATOrigem]
			   ,[COD_EntidadeEnderecoFATDestino]
			   ,[COD_PrecoServicoPAFrequencia]
			   ,[COD_TipoPontoAtendimento]
			   ,[QT_MediaEmbarque]
			   ,[DES_Faturamento]
			   ,[DES_Observacao]
			   ,[DES_FaturamentoPrincipal]
			   ,[DES_FaturamentoDetalhe]
			   ,[DT_Inclusao]
			   ,[DT_Alteracao]
			   ,[FLG_Situacao]
			   ,[COD_TipoTransporte]
		   )

SELECT 
		    P.[ID_Preco]
           ,P.[COD_SAV_EntidadeEndereco]
           ,P.[COD_SAV_EntidadeEndereco]
           ,P.[COD_FAT_EntidadeEndereco]
           ,P.[COD_FAT_EntidadeEndereco]
           ,(select ID_PRECOPAFREQUENCIA from MSV_PrecoPAFrequencia WHERE ID_PRECOPAFREQUENCIA = 6) --[COD_PrecoServicoPAFrequencia]
           ,(SELECT ID_TIPOPONTOATENDIMENTO FROM MSV_TipoPontoAtendimento where DS_TIPOPONTOATENDIMENTO = 'Ponto Genérico')
           ,CONVERT([decimal](5, 3), 3.3)
           ,'DES_Faturamento'
           ,'DES_Observacao'
           ,'DES_FaturamentoPrincipal'
           ,'DES_FaturamentoDetalhe'
           ,getDate()
           ,NULL
           ,1
           ,(SELECT ID_TIPOTRANSPORTE FROM MSV_TipoTransporte where DES_TIPOTRANSPORTE = 'RECOLHIMENTO')		   
		   FROM MSV_PRECO P
			
--------------

-- SUPRIMENTO / 'Ponto Operacional'

INSERT INTO [dbo].[MSV_PrecoServicoPontoAtendimento]
           (
				[COD_PrecoServico]
			   ,[COD_EntidadeEnderecoSAVOrigem]
			   ,[COD_EntidadeEnderecoSAVDestino]
			   ,[COD_EntidadeEnderecoFATOrigem]
			   ,[COD_EntidadeEnderecoFATDestino]
			   ,[COD_PrecoServicoPAFrequencia]
			   ,[COD_TipoPontoAtendimento]
			   ,[QT_MediaEmbarque]
			   ,[DES_Faturamento]
			   ,[DES_Observacao]
			   ,[DES_FaturamentoPrincipal]
			   ,[DES_FaturamentoDetalhe]
			   ,[DT_Inclusao]
			   ,[DT_Alteracao]
			   ,[FLG_Situacao]
			   ,[COD_TipoTransporte]
		   )

SELECT 
		    P.[ID_Preco]
           ,P.[COD_SAV_EntidadeEndereco]
           ,P.[COD_SAV_EntidadeEndereco]
           ,P.[COD_FAT_EntidadeEndereco]
           ,P.[COD_FAT_EntidadeEndereco]
           ,(select ID_PRECOPAFREQUENCIA from MSV_PrecoPAFrequencia WHERE ID_PRECOPAFREQUENCIA = 6) --[COD_PrecoServicoPAFrequencia]
           ,(SELECT ID_TIPOPONTOATENDIMENTO FROM MSV_TipoPontoAtendimento where DS_TIPOPONTOATENDIMENTO = 'Ponto Operacional')
           ,CONVERT([decimal](5, 3),6.6)
           ,'DES_Faturamento'
           ,'DES_Observacao'
           ,'DES_FaturamentoPrincipal'
           ,'DES_FaturamentoDetalhe'
           ,getDate()
           ,NULL
           ,1
           ,(SELECT ID_TIPOTRANSPORTE FROM MSV_TipoTransporte where DES_TIPOTRANSPORTE = 'SUPRIMENTO')		   
		   FROM MSV_PRECO P

		   
	