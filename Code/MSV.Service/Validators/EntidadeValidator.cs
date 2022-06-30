using FluentValidation;
using MSV.Domain.Entities;
using System;

namespace MSV.Service.Validators
{
    public class EntidadeValidator : AbstractValidator<Entidade>
    {
        public EntidadeValidator()
        {
            RuleFor(c => c)
             .NotNull()
             .OnAnyFailure(x =>
             {
                 throw new ArgumentNullException("Objeto não encontrado ou inválido.");
             });
        }
    }
}
