using MSV.Domain.MapHelperStoreProcedure.Attributes;
using System;
using System.Collections.Generic;
using System.Text;

namespace MSV.Domain.Entities
{
    public class UserDto : BaseEntity
    {
        [DataNames("ID_SistemaPerfil", "ID_SistemaPerfil")]
        public int ID_SistemaPerfil { get; set; }
    }
}

