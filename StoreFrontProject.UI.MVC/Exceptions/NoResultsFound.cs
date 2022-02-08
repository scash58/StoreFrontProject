using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StoreFrontProject.UI.MVC.Exceptions
{
    public class NoResultsFound : Exception
    {
        public NoResultsFound()
        {

        }

        public NoResultsFound(string message) : base(message)
        {

        }

        public NoResultsFound(string message, Exception inner) : base(message, inner)
        {

        }
    }
}