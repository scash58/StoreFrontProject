using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFrontProject.Data.EF;

namespace StoreFrontProject.UI.MVC.Controllers
{

    public class CategoriesController : Controller
    {
        private PaintballStoreEntities db = new PaintballStoreEntities();

        // GET: Categories
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }

        #region Original, Scaffolded, Non-AJAX CRUD functionlity

        //// GET: Categories/Details/5
        //public ActionResult Details(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Create
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create()
        //{
        //    return View();
        //}

        //// POST: Categories/Create
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Create([Bind(Include = "CategoryID,CategoryName,CategoryDesc")] Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Categories.Add(category);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(category);
        //}

        //// GET: Categories/Edit/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// POST: Categories/Edit/5
        //// To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        //// more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult Edit([Bind(Include = "CategoryID,CategoryName,CategoryDesc")] Category category)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(category).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    return View(category);
        //}

        //// GET: Categories/Delete/5
        //[Authorize(Roles = "Admin")]
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Category category = db.Categories.Find(id);
        //    if (category == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(category);
        //}

        //// POST: Categories/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //[Authorize(Roles = "Admin")]
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Category category = db.Categories.Find(id);
        //    db.Categories.Remove(category);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}
        #endregion

        //AJAX - Step 4
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Category category = db.Categories.Find(id);
            db.Categories.Remove(category);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Category '{0}' from the database!", category.CategoryName);
            return Json(new { id = id, message = confirmMessage });
        }

        //Ajax - Step 9
        [HttpGet]
        public PartialViewResult CategoryDetails(int id)
        {
            Category category = db.Categories.Find(id);
            return PartialView(category);
        }

        //Ajax - Step 15
        //Creates a new publisher record and returns that new records info as JSON
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Category category)
        {
            db.Categories.Add(category);
            db.SaveChanges();
            return Json(category);
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
