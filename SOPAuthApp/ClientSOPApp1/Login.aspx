<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ClientSOPApp1.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#btnLogin").click(function () {
                var webserUrl = "http://localhost:51181/MyService.asmx";

                var soapRequest = '<?xml version="1.0" encoding="utf-8"?>' +
                    '<soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">' +
                    '<soap:Header>' +
                    '<UserDetails xmlns="http://tempuri.org/">' +
                    '<userName>'+$("#txtUser").val()+'</userName>' +
                    '<password>'+$("#txtPassword").val()+'</password>' +
                    '</UserDetails>' +
                    '</soap:Header>' +
                    '<soap:Body>' +
                    '<SayHello xmlns="http://tempuri.org/">' +
                    '<userName>' + $("#txtUser").val() + '</userName>' +
                    '</SayHello>' +
                    '</soap:Body>' +
                    '</soap:Envelope>';

                $.ajax({

                    type: "POST",
                    url: webserUrl,
                    contentType: "text/xml",
                    dataType: "xml",
                    data: soapRequest,
                    success: SuccessOccur,
                    error: ErrorOccur

                });

            });

        });


        function SuccessOccur(data, status, req) {

            if (status == "success")

                alert(req.responseText);

        }

        function ErrorOccur(data, status, req) {
            console.log(req);
            console.log(status);
            console.log(data.responseText);
            alert(req.responseText + " " + status);

        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h4>Code Behind Login</h4>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">User Name :</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Password :</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login &amp; Call Say Hello" />
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <h4>Script Login</h4>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">User Name :</td>
                    <td>
                        <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Password :</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <button type="button" id="btnLogin">Login &amp; Call Say Hello</button>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
