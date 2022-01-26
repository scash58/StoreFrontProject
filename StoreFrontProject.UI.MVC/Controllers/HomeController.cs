using StoreFrontProject.UI.MVC.Models; //added for access to the ContactViewModel
using System; //added
using System.Net;
using System.Net.Mail; //added
using System.Web.Mvc; //added

namespace StoreFrontProject.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
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
            ViewBag.Message = "Your contact page.";

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

            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br/>{cvm.Message}";
            //MailMessage - What sends the email
            MailMessage mm = new MailMessage("admin@scott-cashion.com", "scashion58@gmail.com", cvm.Subject, message);

            //MailMessage properties
            //Allow HTML in the email
            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;
            //Respond to the sender, and not our website
            mm.ReplyToList.Add(cvm.Email);

            //SmtpClient - This is the info from the host that allows this to be sent
            SmtpClient client = new SmtpClient("mail.scott-cashion.com");
            //client.Port = 8889; //alternative port number is 8889 or 25
            //client.EnableSsl = false;

            //Client Credentials
            client.Credentials = new NetworkCredential("admin@scott-cashion.com", "P@ssw0rd");

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
        public ActionResult Products()
        {
            ViewBag.Message = "Your products page.";

            return View();
        }
    }
}
