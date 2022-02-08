using StoreFrontProject.UI.MVC.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StoreFrontProject.UI.MVC.Controllers
{
    public class ErrorsController : Controller
    {
        // GET: Errors
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult NoResultsTest()
        {
            try
            {
                bool NoResultsCheck = false;

                if (NoResultsCheck)
                {
                    return View();
                }
                else
                {
                    throw new NoResultsFound();
                }

            }
            catch (Exception)
            {

                return RedirectToAction("NoResults"); //handle error nicely: send them to a page for these errors
            }
        }

        public ActionResult NoResults()
        {
            return View();
        }
    }
}