using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace StoreFrontLab.DATA.EF//.StoreFrontMetadata
{
    public class ProductMetaData
    {
        //public int ProductID { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Must be 50 characters or less")]
        [Display(Name = "Product Name")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Category")]
        public int CategoryID { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Must be a valid number, 0 or larger")]
        [DisplayFormat(NullDisplayText = "[-N/A-]", DataFormatString = "{0:c}")]
        public Nullable<decimal> Price { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Stock Status")]
        public int StockStatusID { get; set; }

        [Range(0, int.MaxValue, ErrorMessage = "* Must be a valid number, 0 or larger")]
        [Required(ErrorMessage ="*")]
        public int Quantity { get; set; }

        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }

        [StringLength(100, ErrorMessage = "* Must be 100 characters or less")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Image { get; set; }
    }

    [MetadataType(typeof(ProductMetaData))]
    public partial class Product { }

    public class CategoryMetadata
    {
        //public int CategoryID { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Must be 50 characters or less")]
        [Display(Name = "Category Name")]
        public string CategoryName { get; set; }

        [StringLength(100, ErrorMessage = "* Must be 100 characters or less")]
        [UIHint("MultilineText")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public string Description { get; set; }
    }

    [MetadataType(typeof(CategoryMetadata))]
    public partial class Catgeory { }

    public class StockStatusMetadata
    {
        //public int StockStatusID { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Must be 50 characters or less")]
        [Display(Name = "Category Name")]
        public string StockStatusName { get; set; }
    }

    [MetadataType(typeof(StockStatusMetadata))]
    public partial class StockStatus { }

    public class DepartmentMetadata
    {
        [Display(Name = "Direct Report")]
        public int DepartmentID { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Must be 50 characters or less")]
        [Display(Name = "Department Name")]
        public string DepartmentName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department { }

    public class EmployeeMetadata
    {
        //public int EmployeeID { get; set; }

        [StringLength(100, ErrorMessage = "* Must be 100 characters or less")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Employee Name")]
        public string EmployeeName { get; set; }


        //public Nullable<int> DirectReportID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Department")]
        public int DepartmentID { get; set; }

        [StringLength(50, ErrorMessage = "* Must be 50 characters or less")]
        [DisplayFormat(NullDisplayText = "[-N/A]-")]
        public string Title { get; set; }
    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee { }
}
