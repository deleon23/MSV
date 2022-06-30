using Dapper;
using FluentValidation;
using MSV.Domain.Entities;
using MSV.Domain.Interfaces;
using MSV.Infra.Data.Repository;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace MSV.Service.Services
{
    public class BaseService<T> : IService<T> where T : BaseEntity
    {
        private readonly BaseRepository<T> _repository = new BaseRepository<T>();

        public T Post<V>(T obj) where V : AbstractValidator<T>
        {
            Validate(obj, Activator.CreateInstance<V>());

            _repository.Insert(obj);
            return obj;
        }

        public T Put<V>(T obj) where V : AbstractValidator<T>
        {
            Validate(obj, Activator.CreateInstance<V>());

            _repository.Update(obj);
            return obj;
        }

        public void Delete(int id)
        {
            if (id == 0)
                throw new ArgumentException("Id não pode ser zero.");

            _repository.Delete(id);
        }

        public IList<T> Get()
        {
            return _repository.Select();
        }

        public T Get(int id)
        {
            if (id == 0)
                throw new ArgumentException("Id não pode ser zero.");

            return _repository.Select(id);
        }

        private void Validate(T obj, AbstractValidator<T> validator)
        {
            if (obj == null)
                throw new Exception("Registros não detectados!");

            validator.ValidateAndThrow(obj);
        }

        public void ExecProc(string proc, List<DynamicParameters> dynamicParams)
        {
            _repository.ExecProc(proc, dynamicParams);

        }

        public SqlParameter ParamsDefine(string param, object value, SqlDbType type)
        {
            SqlParameter sqlParameter = new SqlParameter();

            sqlParameter.ParameterName = param;
            sqlParameter.Value = value;
            sqlParameter.SqlDbType = type;     

            return sqlParameter;
        }
    }
}
