using System;

namespace MSV.Domain.Entities
{
    public abstract class BaseEntity
    {
        public virtual int? Id { get; set; }

        public virtual bool? Flg_Situacao { get; set; }
    }
}