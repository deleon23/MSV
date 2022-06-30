using System;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Domain.MapHelperStoreProcedure.Attributes
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DataNamesAttribute : Attribute
    {
        protected List<string> _valueNames { get; set; }

        public List<string> ValueNames
        {
            get
            {
                return _valueNames;
            }
            set
            {
                _valueNames = value;
            }
        }

        public DataNamesAttribute()
        {
            _valueNames = new List<string>();
        }

        /// <summary>
        /// Método de annotation para map de procedure para dto
        /// </summary>
        /// <param name="valueNames">Primeiro parametro é a propriedade do dto. Segundo parametro é o nome/alias da coluna de retorno da procedures</param>
        public DataNamesAttribute(params string[] valueNames)
        {
            _valueNames = valueNames.ToList();
        }
    }
}
