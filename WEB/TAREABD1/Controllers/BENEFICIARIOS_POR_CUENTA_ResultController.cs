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
    public class BENEFICIARIOS_POR_CUENTA_ResultController : Controller
    {
        private Tarea1_BDEntities db = new Tarea1_BDEntities();
        static int n;
        static int porcentaje;
        // GET: BENEFICIARIOS_POR_CUENTA_Result
        public ActionResult Index(int NumeroCuenta)
        {
            n = NumeroCuenta;
            if(db.CHECK_PORCENTAJES2(n).First() == null)
            {
                porcentaje = 0;
            }
            else
            {
                porcentaje = (int)db.CHECK_PORCENTAJES2(n).First();
            }
            
            if (porcentaje < 100) 
            {
                ViewBag.Message = "El porcentaje no llega a 100%, porfavor corregir";
            }
            return View(db.BENEFICIARIOS_POR_CUENTA(NumeroCuenta));
        }

        // GET: BENEFICIARIOS_POR_CUENTA_Result/Details/5
        public ActionResult Details(int numeroCuenta, int valorDocu)
        {
            if (valorDocu == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BENEFICIARIO_POR_CUENTA_Result bENEFICIARIO_POR_CUENTA_Result = db.BENEFICIARIO_POR_CUENTA(numeroCuenta,valorDocu).First();
            if (bENEFICIARIO_POR_CUENTA_Result == null)
            {
                return HttpNotFound();
            }
            return View(bENEFICIARIO_POR_CUENTA_Result);
        }

        // GET: BENEFICIARIOS_POR_CUENTA_Result/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: BENEFICIARIOS_POR_CUENTA_Result/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,NumeroCuenta,ValorDocuIdentidadBeneficiario,ParentezcoId,Porcentaje,Activo")] BENEFICIARIOS_POR_CUENTA_Result bENEFICIARIOS_POR_CUENTA_Result)
        {
            if (ModelState.IsValid)
            {
                
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bENEFICIARIOS_POR_CUENTA_Result);
        }

        // GET: BENEFICIARIOS_POR_CUENTA_Result/Edit/5
        public ActionResult Edit(int numeroCuenta, int ValorDocu)
        {
            if (ValorDocu == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BENEFICIARIO_POR_CUENTA2_Result bENEFICIARIO_POR_CUENTA2_Result = db.BENEFICIARIO_POR_CUENTA2(numeroCuenta,ValorDocu).First();
            if (bENEFICIARIO_POR_CUENTA2_Result == null)
            {
                return HttpNotFound();
            }
            return View(bENEFICIARIO_POR_CUENTA2_Result);
        }

        // POST: BENEFICIARIOS_POR_CUENTA_Result/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Nombre,ValorDocuIdentidadBeneficiario,ParentezcoId,Porcentaje,FechaNacimiento,Email,Telefono1,Telefono2")] BENEFICIARIO_POR_CUENTA2_Result beneficiario)
        {
            if (ModelState.IsValid)
            {
                db.ACTUALIZAR_PERSONA_BENEFICIARIO(n, beneficiario.ValorDocuIdentidadBeneficiario, beneficiario.Nombre, beneficiario.ParentezcoId, beneficiario.Porcentaje, beneficiario.FechaNacimiento, beneficiario.Email, beneficiario.Telefono1, beneficiario.Telefono2);
                db.SaveChanges();
                return RedirectToAction("Index", new { numeroCuenta = n });
            }
            BENEFICIARIO_POR_CUENTA2_Result bENEFICIARIO_POR_CUENTA2_Result = db.BENEFICIARIO_POR_CUENTA2(n, beneficiario.ValorDocuIdentidadBeneficiario).First();
            return View(bENEFICIARIO_POR_CUENTA2_Result);
        }

        // GET: BENEFICIARIOS_POR_CUENTA_Result/Delete/5
        public ActionResult Delete(int numeroCuenta, int valorDocu)
        {
            if (valorDocu == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BENEFICIARIO_POR_CUENTA2_Result bENEFICIARIO_POR_CUENTA2_Result = db.BENEFICIARIO_POR_CUENTA2(numeroCuenta,valorDocu).First();
            if (bENEFICIARIO_POR_CUENTA2_Result == null)
            {
                return HttpNotFound();
            }
            db.ELIMINAR_BENEFICIARIO(numeroCuenta, valorDocu);
            return View(bENEFICIARIO_POR_CUENTA2_Result);
        }

        // POST: BENEFICIARIOS_POR_CUENTA_Result/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed()
        {
            db.SaveChanges();
            return RedirectToAction("Index", new { numeroCuenta = n });
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
