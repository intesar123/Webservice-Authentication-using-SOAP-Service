using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;

namespace SOPAuthApp
{
    public class MyServiceClass
    {
        public UserDetails User;
        [WebMethod]
        [SoapHeader("User", Required = true)]
        public string SayHello(string userName)
        {
            if (User != null)
            {
                if (User.IsValid())
                    return string.Format("Hello...{0} {1} ☺ ", userName,
                        DateTime.Now.ToString("tt") == "AM" ? " good morning " : " good evening ");
                else
                    return "Error in authentication";
            }
            else
            {
                return "Error in authentication";
            }
        }
    }
}