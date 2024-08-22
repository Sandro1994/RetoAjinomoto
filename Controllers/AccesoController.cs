using RetoTecnicoAjinomoto.Models;
using RetoTecnicoAjinomoto.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RetoTecnicoAjinomoto.Controllers
{
    public class AccesoController : Controller
    {
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
                        var listadoTareas = context.Tareas.ToList();
                        foreach (var item in listadoTareas)
                        {
                            item.DescripcionEstado = context.EstadoTarea.Where(x => x.Id == item.IdEstadoTarea).FirstOrDefault().Nombre;
                        }
                        ViewBag.ItemsTarea = listadoTareas;


                        var estadosTarea = context.EstadoTarea.ToList();

                        var modelo = new TareasViewModelRegister
                        {
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
    }
}