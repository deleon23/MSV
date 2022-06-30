﻿using MSV.Infra.Data.StoredProcedure;
using MSV.Domain.MapHelperStoreProcedure;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using MSV.Domain.Dto.ProceduresEntities;
using MSV.Infra.Data.Repository;

namespace MSV.Service.Services
{
    public class PontoAtendimentoOrigemService : BaseService<PontoAtendimentoOrigemDto>
    {
        private readonly BaseRepository<PontoAtendimentoOrigemDto> _repository = new BaseRepository<PontoAtendimentoOrigemDto>();

        public IEnumerable<PontoAtendimentoOrigemDto> ListPontoAtendimentoOrigem(int cod_contrato, int? id_contratopontoatendimento = 0)
        {
            List<SqlParameter> lstSqlParams = new List<SqlParameter>();
            List<PontoAtendimentoOrigemDto> selectPontoAtendimentoOrigemDto = new List<PontoAtendimentoOrigemDto>();

            try
            {
                if (cod_contrato > 0)
                {
                    lstSqlParams.Add(ParamsDefine("@Cod_Contrato", cod_contrato, SqlDbType.Int));

                    if (id_contratopontoatendimento > 0)
                        lstSqlParams.Add(ParamsDefine("@Cod_PontoAtendimento", id_contratopontoatendimento, SqlDbType.Int));

                    var myDataSet = new DataSet();
                    myDataSet = _repository.SelectRowsProc(myDataSet, StoredProcedures.SelectPontoAtendimentoOrigem, lstSqlParams);

                    var mapper = new DataNamesMapper<PontoAtendimentoOrigemDto>();

                    selectPontoAtendimentoOrigemDto = mapper.Map(myDataSet).ToList();
                }
                else
                {
                    throw new ArgumentException("Código de contrato inválido. Favor enviar novamente.");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return selectPontoAtendimentoOrigemDto;
        }
    }
}
