using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SOPAuthApp
{
    public class Authentication : System.Web.Services.Protocols.SoapHeader
    {
        public string userName { get; set; }
        public string password { get; set; }
        public string authenticationToken { get; set; }

        public bool IsCredentialsAreValid()
        {
            //Write the logic to Check the User Details From DataBase
            //i can chek with some hardcode details UserName=Intesar and Password=Alam
            return this.userName == "Intesar" && this.password == "Alam";
            //it'll check the details and will return true or false 
        }
        public bool IsCredentialsAreValid(Authentication authentication)
        {
            if (authentication == null)
                return false;

            if (!string.IsNullOrEmpty(authentication.authenticationToken))
                return (HttpRuntime.Cache[authentication.authenticationToken] != null);
            //Write the logic to Check the User Details From DataBase
            //i can chek with some hardcode details UserName=Intesar and Password=Alam
            return false;
        }
    }
}