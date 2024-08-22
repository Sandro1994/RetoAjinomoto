using Microsoft.IdentityModel.Tokens;
using RetoTecnicoAjinomoto.Models;
using RetoTecnicoAjinomoto.ViewModels;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace RetoTecnicoAjinomoto.Controllers
{
    public class AccesoController : Controller
    {

        private const string SecretKey = "HFmNLA8TSttPzq6lVGlG";

        public ActionResult Login(Login oLogin)
        {
            if (!string.IsNullOrWhiteSpace(oLogin.Usuario) && !string.IsNullOrWhiteSpace(oLogin.Contrasena))
            {
                using (TareasDbModels context = new TareasDbModels())
                {
                    oLogin.Contrasena = Base64Encode(oLogin.Contrasena);
                    var ListaUsuarioEntity = context.Usuarios.Where(x => x.Correo == oLogin.Usuario && x.Contrasena == oLogin.Contrasena).ToList();
                    if (ListaUsuarioEntity.Count == 0)
                    {
                        ViewData["Respuesta"] = "Usuario no encontrado";
                        return View();

                    }
                    else
                    {
                        var token = GenerateJwtToken(); //generación JWT para ser utilizado como seguridad en todo el proyecto
                        //return Ok(new { token });

                        var listadoTareas = context.Tareas.ToList();
                        foreach (var item in listadoTareas)
                        {
                            item.DescripcionEstado = context.EstadoTarea.Where(x => x.Id == item.IdEstadoTarea).FirstOrDefault().Nombre;
                        }
                        ViewBag.ItemsTarea = listadoTareas;


                        var estadosTarea = context.EstadoTarea.ToList();

                        var modelo = new TareasViewModelRegister
                        {
                            JWT = token,
                            ListaEstadoTareas = estadosTarea
                        };

                        return View("~/Views/Tareas/Index.cshtml", modelo);
                    }
                }
            }
            else
            {
                return View();
            }
            
        }

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);
        }

        private string GenerateJwtToken()
        {
            var key = Encoding.ASCII.GetBytes(SecretKey);
            var tokenHandler = new JwtSecurityTokenHandler();
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim(ClaimTypes.Name, "usuario")
                }),
                Expires = DateTime.UtcNow.AddHours(1),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}