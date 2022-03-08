﻿using System.Web.Optimization;

namespace StoreFrontProject.UI.MVC
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
            //            "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            //bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
            //          "~/Scripts/bootstrap.js",
            //          "~/Scripts/respond.js"));

            bundles.Add(new ScriptBundle("~/bundles/template").Include(
                        "~/Content/assets/js/jquery-2.1.0.min.js",
                        "~/Content/assets/js/popper.min.js",
                        "~/Content/assets/js/bootstrap.min.js",
                        "~/Content/assets/js/owl-carousel.min.js",
                        "~/Content/assets/js/accordions.min.js",
                        "~/Content/assets/js/datepicker.min.js",
                        "~/Content/assets/js/scrollreveal.min.js",
                        "~/Content/assets/js/waypoints.min.js",
                        "~/Content/assets/js/jquery.counterup.min.js",
                        "~/Content/assets/js/imgfix.min.js",
                        "~/Content/assets/js/slick.min.js",
                        "~/Content/assets/js/lightbox.min.js",
                        "~/Content/assets/js/isotope.min.js",
                        "~/Content/assets/js/custom.min.js"
                        ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                        "~/Content/assets/css/bootstrap.min.css",
                        "~/Content/assets/css/font-awesome.min.css",
                        "~/Content/assets/css/all.min.css",
                        "~/Content/assets/css/templatemo-hexashop.min.css",
                        "~/Content/assets/css/owl-carousel.min.css",
                        "~/Content/assets/css/lightbox.min.css",
                        "~/Content/assets/css/Style.min.css"
                      ));
        }
    }
}
