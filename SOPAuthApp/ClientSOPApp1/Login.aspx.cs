using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClientSOPApp1.MySerivice;

namespace ClientSOPApp1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            MySerivice.MyServiceClassSoapClient client = new MyServiceClassSoapClient();
           string Message= client.SayHello(new UserDetails {userName= TextBox1.Text, password = TextBox2.Text }, TextBox1.Text);

            //MyService.SayHelloRequest service = new UserDetails()
            //{
            //    userName = TextBox1.Text,
            //    password = TextBox2.Text
            //};
            Response.Write(Message);
        }
    }
}