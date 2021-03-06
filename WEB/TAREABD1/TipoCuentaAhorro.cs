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
    
    public partial class TipoCuentaAhorro
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TipoCuentaAhorro()
        {
            this.Cuentas = new HashSet<Cuenta>();
        }
    
        public int Id { get; set; }
        public string Nombre { get; set; }
        public int IdTipoMoneda { get; set; }
        public string SaldoMinimo { get; set; }
        public string MultaSaldoMin { get; set; }
        public int CargoAnual { get; set; }
        public int NumRetirosHumanos { get; set; }
        public int NumRetirosAutomaticos { get; set; }
        public int ComisionHumano { get; set; }
        public int ComisionAutomatico { get; set; }
        public int Interes { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cuenta> Cuentas { get; set; }
        public virtual TipoMoneda TipoMoneda { get; set; }
    }
}
