//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BookStoreManagerment.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class CTPHIEUNHAP
    {
        public string MAPHIEUNHAP { get; set; }
        public string MASACH { get; set; }
        public int SOLUONG { get; set; }
        public decimal DONGIA { get; set; }
        public Nullable<decimal> THANHTIEN { get; set; }
    
        public virtual PHIEUNHAPSACH PHIEUNHAPSACH { get; set; }
        public virtual SACH SACH { get; set; }
    }
}
