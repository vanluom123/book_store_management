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
    using ViewModel;

    public partial class KHUYENMAI:BaseViewModel
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public KHUYENMAI()
        {
            this.CTKHUYENMAIs = new HashSet<CTKHUYENMAI>();
        }

        private string _MAKM;
        public string MAKM { get { return _MAKM; } set { _MAKM = value; OnPropertyChanged(); } }
        private string _TENKM;
        public string TENKM { get { return _TENKM; } set { _TENKM = value; OnPropertyChanged(); } }
        private System.DateTime _NGAYBD;
        public System.DateTime NGAYBD { get { return _NGAYBD; } set { _NGAYBD = value; OnPropertyChanged(); } }
        private System.DateTime _NGAYKT;
        public System.DateTime NGAYKT { get { return _NGAYKT; } set { _NGAYKT = value; OnPropertyChanged(); } }
        public string GHICHU { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTKHUYENMAI> CTKHUYENMAIs { get; set; }
    }
}