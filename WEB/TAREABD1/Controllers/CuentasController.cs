using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using TAREABD1;

namespace TAREABD1.Controllers
{
    public class CuentasController : Controller
    {
        private Tarea1_BDEntities db = new Tarea1_BDEntities();
        static string username;
        // GET: Cuentas
        public ActionResult Index(string usuario)
        {
            username = usuario;
            return View(db.CUENTAS_POR_USUARIO(username).ToList());
        }

        public ActionResult Edit(int NumeroCuenta)
        {
            return RedirectToAction("Index", "BENEFICIARIOS_POR_CUENTA_Result", new { NumeroCuenta });
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
