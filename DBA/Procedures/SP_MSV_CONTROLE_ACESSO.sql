IF OBJECT_ID('SP_MSV_CONTROLE_ACESSO') IS NOT NULL
	BEGIN
		DROP PROCEDURE [DBO].[SP_MSV_CONTROLE_ACESSO]
	END;
	GO
/*-------------------------------------------------------------------------------------------------------------------------------------------------------

CRIADA EM                    : 10/10/2019
AUTOR                        : Deleon Henrique(VICERI)
SISTEMA QUE UTILIZA          : MSV
DESCRIÇÃO                    : Controle de acesso ao MSV

*/-------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE PROCEDURE [dbo].[SP_MSV_CONTROLE_ACESSO]  
	@Nom_Usuario Varchar(20)  
AS
 
BEGIN  
	SELECT DISTINCT
		S.ID_SistemaPerfil
	FROM COR_ACESSO A
	INNER JOIN COR_FUNCIONARIO F
		ON F.COD_FUNC = A.COD_FUNC
	INNER JOIN COR_OPERADOR O
		ON O.COD_FUNC = F.COD_FUNC
	INNER JOIN brkmtz004.corporate.dbo.SSA_FuncionarioPerfil FP
		ON FP.Cod_Func = F.Cod_Func 
	INNER JOIN brkmtz004.corporate.dbo.SSA_SistemaPerfil S
		ON S.Cod_Sistema = A.Cod_Sistema
		AND S.ID_SistemaPerfil = FP.Id_SistemaPerfil
	WHERE A.COD_SISTEMA IN (1, 146) 
	AND A.FLG_SITUACAOREGISTRO = 1
	AND S.Flg_Situacao = 1
	AND UPPER(O.Nom_Usuario) = UPPER(@Nom_Usuario)
END 