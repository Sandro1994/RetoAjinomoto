﻿using RetoTecnicoAjinomoto.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RetoTecnicoAjinomoto.ViewModels
{
    public class TareasViewModelRegister
    {
        public Tareas Tarea { get; set; }
        public List<EstadoTarea> ListaEstadoTareas { get; set; }
    }
}