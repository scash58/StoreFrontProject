using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Drawing; //Added for access to the Image data type
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontProject.Data.EF;
using StoreFrontProject.UI.MVC.Models; //Added for access to the CartViewModel
using StoreFrontProject.UI.MVC.Utilities; //Added for access to the ImageUtility class

namespace StoreFrontProject.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private PaintballStoreEntities db = new PaintballStoreEntities();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //Shopping Cart Step 3
        public ActionResult AddToCart(int qty, int productID)
        {
            //Create an empty shell for a local (local to this method) shopping cart variable
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //Check i f session-cart exists; If so, that means there were already item in the shopping cart and we need to put
            //those pre-existing items in the local shoppingCart collection we created above.

            if (Session["cart"] != null)
            {
                //session cart exists - put its items in the local shoppingCart collection so that they are easier to work with
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
                //This is unboxingSession objects gets cast back to its original, more specific type. This is explicit casting.
            }
            else
            {
                //if session cart doesn't exist yet, we need to instantiate it. (AKA new it up)
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            //find the product the user is trying to add to the cart
            Product product = db.Products.Where(p => p.ProductID == productID).FirstOrDefault();

            if (product == null)
            {
                //if  a bad ID was passed to this method, kick the user back to some page to try again or we could throw an error.
                return RedirectToAction("Index");
            }
            else
            {
                //if book ID is valid, add the line-item to the cart
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //put item in the local shoppingCart collection. BUT if we already have that product as a cart-item, then we will
                //update the qty only
                if (shoppingCart.ContainsKey(product.ProductID))
                {
                    shoppingCart[product.ProductID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.ProductID, item);
                }

                //now update the Session version of the cart so we can maintain that info between Request and Response cycles
                Session["cart"] = shoppingCart; //implicit casting aka boxing
            }

            //send them to a view that shows the list of all items in the cart
            return RedirectToAction("Index", "ShoppingCart");

        }

        // GET: Products/Create
        [Authorize(Roles="Admin")]
        public ActionResult Create()
        {
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName");
            ViewBag.ManufacturerID = new SelectList(db.Manufacturers, "ManufacturerID", "ManufacturerName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [Authorize(Roles = "Admin")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,ManufacturerID,CategoryID,UnitPrice,ProductDesc,ProductImage")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                //Image Upload utility step 6
                #region File Upload

                string file = "NoImage.png";

                if (productImage != null)
                {
                    //Process  the file that was uploaded by the user
                    file = productImage.FileName;
                    string ext = file.Substring(file.LastIndexOf('.'));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //This if checks to see if the file uploaded is the right type of file
                    //i.e. file extension would be included in the goodExts
                    //We will also require the file uploaded to be 4 MB or less in size
                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        //create a new file name using a GUID (Globally Unique Identifier)
                        file = Guid.NewGuid() + ext;

                        string savePath = Server.MapPath("~/Content/assets/images/products/"); //This is where the images will be saved
                        Image convertedImage = Image.FromStream(productImage.InputStream);
                        int maxImageSize = 256;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                    }

                }

                //no matter what, update the BookImage with the value of the file variable
                product.ProductImage = file;

                #endregion

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ManufacturerID = new SelectList(db.Manufacturers, "ManufacturerID", "ManufacturerName", product.ManufacturerID);
            return View(product);
        }

        // GET: Products/Edit/5
        //[Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ManufacturerID = new SelectList(db.Manufacturers, "ManufacturerID", "ManufacturerName", product.ManufacturerID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,ManufacturerID,CategoryID,UnitPrice,ProductDesc,ProductImage")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                //Image Upload utility step 10
                #region File Upload

                if (productImage != null)
                {
                    //get file name
                    string file = productImage.FileName;

                    //get the file extension
                    string ext = file.Substring(file.LastIndexOf('.'));

                    //create a list of good extensions
                    string[] gooodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    if (gooodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;
                        string savePath = Server.MapPath("~/Content/assets/images/products/");
                        Image convertedImage = Image.FromStream(productImage.InputStream);
                        int maxImageSize = 256;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/assets/images/products/");
                            ImageUtility.Delete(path, product.ProductImage);
                        }

                        product.ProductImage = file; //this updates the product obj before it is saved to the DB with the latest file name
                    }

                }

                #endregion

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryID = new SelectList(db.Categories, "CategoryID", "CategoryName", product.CategoryID);
            ViewBag.ManufacturerID = new SelectList(db.Manufacturers, "ManufacturerID", "ManufacturerName", product.ManufacturerID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);

            //Delete the image for the record that is being deleted
            string path = Server.MapPath("~/Content/assets/images/products/");
            ImageUtility.Delete(path, product.ProductImage);

            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
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
