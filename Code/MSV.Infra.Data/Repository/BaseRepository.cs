using Dapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Query;
using Microsoft.EntityFrameworkCore.Query.Internal;
using Microsoft.EntityFrameworkCore.Storage;
using System.Reflection;
using System.Linq;
using MSV.Domain.Entities;
using MSV.Domain.Interfaces;
using MSV.Infra.Data.Context;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace MSV.Infra.Data.Repository
{
    public class BaseRepository<T> : IRepository<T> where T : BaseEntity
    {
        private SqlContext _context = new SqlContext();

        public void Insert(T obj)
        {
            _context.Set<T>().Add(obj);
            _context.SaveChanges();
        }

        public void Update(T obj)
        {
            _context.Entry(obj).State = EntityState.Modified;
            _context.SaveChanges();
        }

        public void Delete(int id)
        {
            _context.Set<T>().Remove(Select(id));
            _context.SaveChanges();
        }

        public IList<T> Select()
        {
#if (DEBUG)
            var query = _context.Set<T>().AsNoTracking().ToSql(); //Retorno da query realizada no entity, utilizar apenas no DEBUG.
#endif

            return _context.Set<T>().AsNoTracking().AsEnumerable().Where(c => c.Flg_Situacao != null ? c.Flg_Situacao == true : c.Flg_Situacao == null).ToList();
        }

        public T Select(int id)
        {
            return _context.Set<T>().Find(id);
        }

        public void ExecProc(string proc, List<DynamicParameters> dynamicParams)
        {
            using (SqlConnection connection = (SqlConnection)_context.Database.GetDbConnection())
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = proc;
                    command.CommandTimeout = 500;

                    foreach (DynamicParameters par in dynamicParams)
                    {
                        command.Parameters.Add(par);
                    }

                    command.ExecuteNonQuery();
                }
            }
        }

        public DataSet SelectRowsProc(DataSet dataSet, string proc, List<SqlParameter> sqlParams)
        {
            using (SqlConnection connection = (SqlConnection)_context.Database.GetDbConnection())
            {
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(proc, connection);
                adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                adapter.SelectCommand.Parameters.AddRange(sqlParams.ToArray());
                adapter.SelectCommand.CommandTimeout = 500;
                adapter.Fill(dataSet);
                return dataSet;
            }
        }
    }

    /// <summary>
    /// Método reflection para pegar a query gerada pelo entity
    /// </summary>
    public static class IQueryableExtensions
    {
        private static readonly TypeInfo QueryCompilerTypeInfo = typeof(QueryCompiler).GetTypeInfo();

        private static readonly FieldInfo QueryCompilerField = typeof(EntityQueryProvider).GetTypeInfo().DeclaredFields.First(x => x.Name == "_queryCompiler");

        private static readonly FieldInfo QueryModelGeneratorField = QueryCompilerTypeInfo.DeclaredFields.First(x => x.Name == "_queryModelGenerator");

        private static readonly FieldInfo DataBaseField = QueryCompilerTypeInfo.DeclaredFields.Single(x => x.Name == "_database");

        private static readonly PropertyInfo DatabaseDependenciesField = typeof(Microsoft.EntityFrameworkCore.Storage.Database).GetTypeInfo().DeclaredProperties.Single(x => x.Name == "Dependencies");

        public static string ToSql<TEntity>(this IQueryable<TEntity> query) where TEntity : class
        {
            var queryCompiler = (QueryCompiler)QueryCompilerField.GetValue(query.Provider);
            var modelGenerator = (QueryModelGenerator)QueryModelGeneratorField.GetValue(queryCompiler);
            var queryModel = modelGenerator.ParseQuery(query.Expression);
            var database = (Microsoft.EntityFrameworkCore.Storage.Database)DataBaseField.GetValue(queryCompiler);
            var databaseDependencies = (DatabaseDependencies)DatabaseDependenciesField.GetValue(database);
            var queryCompilationContext = databaseDependencies.QueryCompilationContextFactory.Create(false);
            var modelVisitor = (RelationalQueryModelVisitor)queryCompilationContext.CreateQueryModelVisitor();
            modelVisitor.CreateQueryExecutor<TEntity>(queryModel);
            var sql = modelVisitor.Queries.First().ToString();

            return sql;
        }
    }
}
