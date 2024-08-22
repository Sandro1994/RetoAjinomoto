using RetoTecnicoAjinomoto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RetoTecnicoAjinomoto.Controllers
{
    public class TareasController : Controller
    {
        // GET: Tareas
        public ActionResult Index()
        {
            using (TareasDbModels context = new TareasDbModels())
            {
                return View(context.Tareas.ToList());
            }
        }

        // GET: Tareas/Details/5
        public ActionResult Details(int id)
        {
            using(TareasDbModels context = new TareasDbModels())
            {
                return View(context.Tareas.Where(x => x.Id == id));
            }
        }


        // POST: Tareas/Create
        [HttpPost]
        public ActionResult Create(Tareas oTareas)
        {
            try
            {
                using (TareasDbModels context = new TareasDbModels())
                {
                    context.Tareas.Add(oTareas);
                    context.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Tareas/Edit/5
        public ActionResult Edit(int id)
        {
            using (TareasDbModels context = new TareasDbModels())
            {
                return View(context.Tareas.Where(x => x.Id == id).FirstOrDefault());
            }
        }

        // POST: Tareas/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Tareas oTareas)
        {
            try
            {
                using (TareasDbModels context = new TareasDbModels())
                {
                    context.Entry(oTareas).State = System.Data.EntityState.Modified;
                    context.SaveChanges();
                }
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Tareas/Delete/5
        public ActionResult Delete(int id)
        {
            using (TareasDbModels context = new TareasDbModels())
            {
                return View(context.Tareas.Where(x => x.Id == id).FirstOrDefault());
            }
        }

        // POST: Tareas/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                using (TareasDbModels context = new TareasDbModels())
                {
                    Tareas oTareas = context.Tareas.Where(x => x.Id == id).FirstOrDefault();
                    context.Tareas.Remove(oTareas);
                    context.SaveChanges();
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
