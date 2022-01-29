using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFrontProject.Data.EF; //added for access to the domain models
using System.ComponentModel.DataAnnotations; //added for validation/display metadata

namespace StoreFrontProject.UI.MVC.Models
{
    //Shopping cart Step 1

    //Added this viewModel to combine domain-related info (Book Product) with other information (int Qty)
    public class CartItemViewModel
    {
        //properties
        [Range(1, int.MaxValue)]
        public int Qty { get; set; }
        public Product Product { get; set; }

        //FQ CTOR
        public CartItemViewModel(int qty, Product product)
        {
            Qty = qty;
            Product = product;
        }
    }
}
