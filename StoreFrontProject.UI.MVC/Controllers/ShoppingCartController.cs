﻿using StoreFrontProject.UI.MVC.Models; //Added for access tothe CartItemViewModel class
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFrontProject.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {

        //Shopping Cart Step 4
        // GET: ShoppingCart
        public ActionResult Index()
        {
            //pull session based shopping cart into a local variable that we can pass to the view
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                //the user has either not put anything in their cart, or removed it all, or session expired
                //set cart to an empty object. We can still send this to the view, unlike null.
                shoppingCart = new Dictionary<int, CartItemViewModel>();

                ViewBag.Message = "There are no items in your cart.";
            }
            else
            {
                ViewBag.Message = null; //explicity clearing out the ViewBag variable
            }
            return View(shoppingCart);
        }

        //Shopping Cart Step 6
        public ActionResult RemoveFromCart(int id)
        {
            //get the shopping cart out of the session variable and into a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //remove the item
            shoppingCart.Remove(id);

            //Update Session
            Session["cart"] = shoppingCart;

            return RedirectToAction("index");
        }

        //Shopping Cart Step 7
        public ActionResult UpdateCart(int productID, int qty)
        {
            //get the shopping cart out of the session variable and into a local variable
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];

            //target the correct cart item using bookID and update its qty
            shoppingCart[productID].Qty = qty;

            //Update Session
            Session["cart"] = shoppingCart;

            return RedirectToAction("index");
        }
    }
}