using StoreFrontProject.Data.EF; //added to gain access to PaintballStoreEntities
using StoreFrontProject.UI.MVC.Models; //added for access to the ContactViewModel
using System; //added
using System.Configuration;
using System.Net;
using System.Net.Mail; //added
using System.Web.Mvc; //added
using System.Data.Entity;
using System.Linq;
using PagedList; //added this using statement after installing pagedList.MVC through the Nuget Package Manager
using PagedList.Mvc;

namespace StoreFrontProject.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        private PaintballStoreEntities db = new PaintballStoreEntities();

        [HttpGet]
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer);
            return View(products.ToList());
        }

        [HttpGet]
        //[Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            //ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                //send the cvm back to the form with completed inputs
                return View(cvm);
            }

            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject} from storefont. Please respond to {cvm.Email} with your response to the following message: <br/>{cvm.Message}";
            //MailMessage - What sends the email
            MailMessage mm = new MailMessage(

                //FROM
                ConfigurationManager.AppSettings["EmailUser"].ToString(),

                //TO
                ConfigurationManager.AppSettings["EmailTo"].ToString(),

                //SUBJECT
                cvm.Subject,

                //BODY
                message

                );

            //MailMessage properties
            //Allow HTML in the email
            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            //Respond to the sender, and not our website
            mm.ReplyToList.Add(cvm.Email);

            //SmtpClient - This is the info from the host that allows this to be sent
            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["EmailClient"].ToString());
            //client.Port = 8889; //alternative port number is 8889 or 25
            //client.EnableSsl = false;

            //Client Credentials
            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["EmailUser"].ToString(),
                ConfigurationManager.AppSettings["EmailPass"].ToString());

            //Try to send the email
            try
            {
                //attempt to send
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We're sorry your request could not be completed at this time. Please try again later. Error Message: " +
                    $"{ex.Message}<br/>{ex.StackTrace}";

                return View(cvm);
            }

            return View("EmailConfirmation", cvm);
        }

        [HttpGet]
        public ActionResult Products(string searchString, int page = 1)
        {
            ViewBag.Message = "Your products page.";

            int pageSize = 6; //Set how many records/objects are shown per "page"

            var products = db.Products.Include(p => p.Category).Include(p => p.Manufacturer).OrderBy(p => p.ProductName).ToList();

            if (!String.IsNullOrEmpty(searchString))
            {
                products = (
                                from p in products
                                where p.ProductName.ToLower().Contains(searchString.ToLower()) || 
                                    p.Manufacturer.ManufacturerName.ToLower().Contains(searchString.ToLower()) ||
                                    p.Category.CategoryName.ToLower().Contains(searchString.ToLower())
                                select p
                         ).ToList();
            }

            ViewBag.SearchString = searchString;

            return View(products.ToPagedList(page, pageSize));
        }
    }
}
