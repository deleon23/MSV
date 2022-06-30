using FluentValidation;
using MSV.Domain.Entities;
using System;

namespace MSV.Service.Validators
{
    public class FilialValidator : AbstractValidator<Filial>
    {
        public FilialValidator()
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
