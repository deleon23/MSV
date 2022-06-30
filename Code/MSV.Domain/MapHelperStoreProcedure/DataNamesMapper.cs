using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace MSV.Domain.MapHelperStoreProcedure
{
    public class DataNamesMapper<TEntity> where TEntity : class, new()
    {
        public TEntity Map(DataRow row)
        {
            TEntity entity = new TEntity();
            return Map(row, entity);
        }

        public TEntity Map(DataRow row, TEntity entity)
        {
            try
            {
                var properties = (typeof(TEntity)).GetProperties()
                                                  .Where(x => x.GetCustomAttributes(typeof(DataNamesAttribute), true).Any())
                                                  .ToList();
                foreach (var prop in properties)
                {
                    PropertyMapHelper.Map(typeof(TEntity), row, prop, entity);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entity;
        }

        public IEnumerable<TEntity> Map(DataTable table)
        {
            List<TEntity> entities = new List<TEntity>();

            try
            { 
                var properties = (typeof(TEntity)).GetProperties()
                                                  .Where(x => x.GetCustomAttributes(typeof(DataNamesAttribute), true).Any())
                                                  .ToList();
                foreach (DataRow row in table.Rows)
                {
                    TEntity entity = new TEntity();
                    foreach (var prop in properties)
                    {
                        PropertyMapHelper.Map(typeof(TEntity), row, prop, entity);
                    }
                    entities.Add(entity);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entities;
        }

        public IEnumerable<TEntity> Map(DataSet ds)
        {
            List<TEntity> entities = new List<TEntity>();

            try
            {
                DataTable table = ds.Tables[0];

                var properties = (typeof(TEntity)).GetProperties()
                                            .Where(x => x.GetCustomAttributes(typeof(DataNamesAttribute), false).Any())
                                            .ToList();
                
                foreach (DataRow row in table.Rows)
                {
                    TEntity entity = new TEntity();
                    foreach (var prop in properties)
                    {
                        PropertyMapHelper.Map(typeof(TEntity), row, prop, entity);
                    }

                    entities.Add(entity);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

            return entities;
        }
    }
}
