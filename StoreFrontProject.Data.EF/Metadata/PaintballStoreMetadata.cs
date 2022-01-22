using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations; //added for metadata and validation

namespace StoreFrontProject.Data.EF//.Metadata - name must match namespace of classes these partial classes will buddy up with.
{
    class PaintballStoreMetadata
    {
    }

    #region Category

    public class CategoryMetadata
    {
        //public int CategoryID { get; set; }

        [Required(ErrorMessage ="*")]
        [Display(Name = "Category")]
        [StringLength(30, ErrorMessage = "* Value must be 30 characters or less.")]
        public string CategoryName { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Category Description")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string CategoryDesc { get; set; }
    }

    [MetadataType(typeof(CategoryMetadata))]
    public partial class Category { }

    #endregion

    #region Customer

    public class CustomerMetadata
    {

        //public int CustomerID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "First Name")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Last Name")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string LastName { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string Address { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string City { get; set; }

        [Required(ErrorMessage = "*")]
        [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
        public string State { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Zip Code")]
        [StringLength(9, ErrorMessage = "* Value must be 9 characters or less.")]
        public string ZipCode { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(10, ErrorMessage = "* Value must be 10 characters or less.")]
        public string Phone { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string Email { get; set; }

    }

    [MetadataType(typeof(CustomerMetadata))]
    public partial class Customer
    {
        //Custom props - defined in the BUDDY (partial) class with the same name as the Model
        [Display(Name = "Full Name")]
        public string FullName
        {
            get { return $"{FirstName} {LastName}"; }
        }
    }

    #endregion

    #region Department

    public class DepartmentMetadata
    {
        //public int DepartmentID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Department")]
        [StringLength(30, ErrorMessage = "* Value must be 30 characters or less.")]
        public string DepartmentName { get; set; }
    }

    [MetadataType(typeof(DepartmentMetadata))]
    public partial class Department { }

    #endregion

    #region Employee

    public class EmployeeMetadata
    {
        //public int EmployeeID { get; set; }


        [Required(ErrorMessage = "*")]
        [Display(Name = "First Name")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string FirstName { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Last Name")]
        [StringLength(25, ErrorMessage = "* Value must be 25 characters or less.")]
        public string LastName { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string Address { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(20, ErrorMessage = "* Value must be 20 characters or less.")]
        public string Title { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string City { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
        public string State { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Zip Code")]
        [StringLength(9, ErrorMessage = "* Value must be 9 characters or less.")]
        public string ZipCode { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Reports to")]
        public Nullable<int> ReportsToID { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Department")]
        public Nullable<int> DepartmentID { get; set; }
    }

    [MetadataType(typeof(EmployeeMetadata))]
    public partial class Employee
    {
        //Custom props - defined in the BUDDY (partial) class with the same name as the Model
        [Display(Name = "Full Name")]
        public string FullName
        {
            get { return $"{FirstName} {LastName}"; }
        }
    }

    #endregion

    #region Manufacturer

    public class ManufacturerMetadata
    {
        //public int ManufacturerID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Manufacturer")]
        [StringLength(30, ErrorMessage = "* Value must be 30 characters or less.")]
        public string ManufacturerName { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Manufacturer Description")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string ManufacturerDesc { get; set; }
    }

    [MetadataType(typeof(ManufacturerMetadata))]
    public partial class Manufacturer { }

    #endregion

    #region Order

    public class OrderMetadata
    {
        //public int OrderID { get; set; }

        //public Nullable<int> CustomerID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Order Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public System.DateTime OrderDate { get; set; }

        [Display(Name = "Shipped Date")]
        [DisplayFormat(DataFormatString = "{0:d}", ApplyFormatInEditMode = true, NullDisplayText = "[-N/A-]")]
        public Nullable<System.DateTime> ShippedDate { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number, 0 or larger.")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[-N/A-]")]
        public Nullable<decimal> Freight { get; set; }

        [Display(Name = "Address")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string ShipAddress { get; set; }

        [Display(Name = "City")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(50, ErrorMessage = "* Value must be 50 characters or less.")]
        public string ShipCity { get; set; }

        [Display(Name = "State")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(2, ErrorMessage = "* Value must be 2 characters or less.")]
        public string ShipState { get; set; }

        [Display(Name = "County")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [StringLength(30, ErrorMessage = "* Value must be 30 characters or less.")]
        public string ShipCountry { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Zip Code")]
        [StringLength(9, ErrorMessage = "* Value must be 9 characters or less.")]
        public string ShipZip { get; set; }
    }

    [MetadataType(typeof(OrderMetadata))]
    public partial class Order { }

    #endregion

    #region OrderDetails

    public class OrderDetailsMetadata
    {
        [Required(ErrorMessage = "*")]
        public int OrderID { get; set; }

        [Required(ErrorMessage = "*")]
        public int ProductID { get; set; }

        [Required(ErrorMessage = "*")]
        [Range(0, int.MaxValue, ErrorMessage = "* Value must be a valid number greater than 0")]
        public int Quantity { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number greater than 0")]
        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        public Nullable<float> Discount { get; set; }
    }


    [MetadataType(typeof(OrderDetailsMetadata))]
    public partial class OrderDetails { }

    #endregion

    #region Product

    public class ProductMetadata
    {
        //public int ProductID { get; set; }

        [Required(ErrorMessage = "*")]
        [Display(Name = "Product")]
        [StringLength(50, ErrorMessage = "* The value must be 50 characters or less")]
        public string ProductName { get; set; }

        //public Nullable<int> ManufacturerID { get; set; }

        //public Nullable<int> CategoryID { get; set; }

        [Range(0, double.MaxValue, ErrorMessage = "* Value must be a valid number, 0 or larger.")]
        [DisplayFormat(DataFormatString = "{0:c}", NullDisplayText = "[-N/A-]")]
        public Nullable<decimal> UnitPrice { get; set; }

        [DisplayFormat(NullDisplayText = "[-N/A-]")]
        [Display(Name = "Description")]
        [StringLength(50, ErrorMessage = "* The value must be 50 characters or less")]
        public string ProductDesc { get; set; }

        [Display(Name = "Image")]
        //all validation, etc will be done when we MANUALLY process the image in the controller.
        public string ProductImage { get; set; }
    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product { }

    #endregion

}
