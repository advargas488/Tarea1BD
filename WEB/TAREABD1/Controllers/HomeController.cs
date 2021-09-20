using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TAREABD1.Controllers
{
    public class HomeController : Controller
    {
        private Tarea1_BDEntities db = new Tarea1_BDEntities();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index([Bind(Include = "Username,Pass")] Usuario usuario)
        {
            if(usuario.Username == null || usuario.Pass == null)
            {
                ViewBag.Message = "Ingrese todos los datos necesarios";
                return View();
            }       
            if (ModelState.IsValid)
            {
                if (db.INICIO_SESION2(usuario.Username, usuario.Pass).First() == null)
                {
                    ViewBag.Message = "Usuario o contraseña incorrectos";
                    return View();
                }
                int numCuenta = (int)db.INICIO_SESION2(usuario.Username,usuario.Pass).First();
                
                return RedirectToAction("Index", "Cuentas", new { usuario = usuario.Username });
            }

            return View();
        }
    }
}