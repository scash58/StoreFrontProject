using StoreFrontProject.UI.MVC.Models;
using System.Data.Entity;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace StoreFrontProject.UI.MVC
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            #region Common Step: Logging
            /* We may show the user a custom error page - but usually we'd log this error, too.
             * We could even put the exception into a variable - get the last error & clear it:
             * Exception ex = Server.GetLastError();
             * Server.ClearError();
             * 
             * But to use this info later easily (especially for the user), could put it into their session.
             * Session["LastError"] = ex;
             * 
             * Could use ex.StackTrace / ex.Message / ex.GetType() to show or log.
             * */
            #endregion

            //-Here: send them to "default custom error page".
            //v1 - will work as long as mvc routing still works:
            //Response.Redirect("~/Errors/Unresolved");

            //v2 - SUPER SAFE - send them to a basic HTML page that's hard to fail
            Response.Redirect("~/error.html");

            //commented this out to suppress it while we're still developing & troubleshooting
            //uncomment it before publishing for better user experience.
        }

    }
}
