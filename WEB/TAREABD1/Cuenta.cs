//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TAREABD1
{
    using System;
    using System.Collections.Generic;
    
    public partial class Cuenta
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Cuenta()
        {
            this.Beneficiarios = new HashSet<Beneficiario>();
            this.Usuarios_Ver = new HashSet<Usuarios_Ver>();
        }
    
        public int NumeroCuenta { get; set; }
        public int ValorDocuIdentidadDelCliente { get; set; }
        public int TipoCuentaId { get; set; }
        public System.DateTime FechaCreacion { get; set; }
        public string Saldo { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Beneficiario> Beneficiarios { get; set; }
        public virtual Persona Persona { get; set; }
        public virtual TipoCuentaAhorro TipoCuentaAhorro { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Usuarios_Ver> Usuarios_Ver { get; set; }
    }
}
