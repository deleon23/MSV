using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Swashbuckle.AspNetCore.Filters;
using Swashbuckle.AspNetCore.Swagger;
using Swashbuckle.AspNetCore.SwaggerUI;
using System.Collections.Generic;
using System.Linq;

namespace MSV.Application
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Info { Title = "Modulo Serviços", Version = "v1" });
                c.OperationFilter<SecurityRequirementsOperationFilter>();

                // if you're using the SecurityRequirementsOperationFilter, you also need to tell Swashbuckle you're using OAuth2
                c.AddSecurityDefinition("MSV", new ApiKeyScheme
                {
                    In = "header",
                    Description = "Para utilização do Swagger do modulo de serviços, por favor insira a senha de acesso no autenticador no topo da documentação.",
                    Name = "AuthorizationSwagger",
                    Type = "apiKey"
                });

                c.AddSecurityRequirement(new Dictionary<string, IEnumerable<string>> { { "MSV", Enumerable.Empty<string>() }, });
            });

            services.AddMvcCore().AddJsonFormatters().AddApiExplorer();

            services.AddCors(c =>
            {
                c.AddPolicy("AllowOrigin", options => options.AllowAnyOrigin());
            });
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseSwagger();

            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Modulo Serviços v1");
                c.DefaultModelExpandDepth(2);
                c.DefaultModelRendering(ModelRendering.Model);
                c.DefaultModelsExpandDepth(-1);
                c.DisplayOperationId();
                c.DisplayRequestDuration();
                c.DocExpansion(DocExpansion.None);
                c.EnableDeepLinking();
                c.EnableFilter();
                c.ShowExtensions();
                c.EnableValidator();
                c.SupportedSubmitMethods(SubmitMethod.Get, SubmitMethod.Post, SubmitMethod.Put, SubmitMethod.Delete, SubmitMethod.Head);
                c.InjectStylesheet("/swagger-ui/custom.css");
            });

            app.UseCors(x => x.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader().AllowCredentials());

            app.UseMvc();
        }
    }
}
