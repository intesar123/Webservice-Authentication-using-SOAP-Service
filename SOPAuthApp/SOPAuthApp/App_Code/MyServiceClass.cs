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

        /******************************************Token based authentication*************************************************/
        public Authentication authentication;

        [WebMethod]
        [System.Web.Services.Protocols.SoapHeader("authentication")]
        public string AuthenticateUser()
        {
            if (authentication == null)
               return "Please Enter User Name and Password 1"+ authentication.userName;
            if(string.IsNullOrEmpty(authentication.userName) || string.IsNullOrEmpty(authentication.password))
                return "Please Enter User Name and Password 2";

            //checking if user credential are valied
            if (!authentication.IsCredentialsAreValid())
                return "Invalid User Name or Password";

            string token = Guid.NewGuid().ToString();
            HttpRuntime.Cache.Add(
                token,
                authentication.userName,
                null,
                System.Web.Caching.Cache.NoAbsoluteExpiration,
                TimeSpan.FromMinutes(1),
                System.Web.Caching.CacheItemPriority.NotRemovable,
                null
                );
            return token;
        }
        [WebMethod]
        [System.Web.Services.Protocols.SoapHeader("authentication")]
        public string SendMessage()
        {
            if (authentication == null)
                return "Invalid Token!" + authentication.authenticationToken;

            if(!authentication.IsCredentialsAreValid(authentication))
                return "Invalid Token!" + authentication.authenticationToken;

            return "Hello  " + HttpRuntime.Cache[authentication.authenticationToken];
        }

    }
}