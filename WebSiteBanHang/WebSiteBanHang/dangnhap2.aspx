<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dangnhap2.aspx.cs" Inherits="WebSiteBanHang.dangnhap2" %>

<!doctype html>
<html>
<head>

	<meta charset="utf-8">

	<title>Login</title>

	<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Varela+Round">


    <style>
@charset "utf-8";
/* CSS Document */

/* ---------- FONTAWESOME ---------- */
/* ---------- http://fortawesome.github.com/Font-Awesome/ ---------- */
/* ---------- http://weloveiconfonts.com/ ---------- */

@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* ---------- ERIC MEYER'S RESET CSS ---------- */
/* ---------- http://meyerweb.com/eric/tools/css/reset/ ---------- */

@import url(http://meyerweb.com/eric/tools/css/reset/reset.css);

/* ---------- FONTAWESOME ---------- */

[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sans-serif;
}

/* ---------- GENERAL ---------- */

body {
	background-color: white;
	color: #000;
	font-family: "Varela Round", Arial, Helvetica, sans-serif;
	font-size: 16px;
	line-height: 1.5em;
}

input {
	border: none;
	font-family: inherit;
	font-size: inherit;
	font-weight: inherit;
	line-height: inherit;
	-webkit-appearance: none;
}

/* ---------- LOGIN ---------- */

#login {
	width: 400px;
    background:#c3454d;
    margin: 50px 0 0 500px;
}

#login h2 {
	background-color: #f95252;
	-webkit-border-radius: 20px 20px 0 0;
	-moz-border-radius: 20px 20px 0 0;
	border-radius: 20px 20px 0 0;
	color: #fff;
	font-size: 28px;
	padding: 20px 26px;
}

#login h2 span[class*="fontawesome-"] {
	margin-right: 14px;
}

#login fieldset {
	background-color: #fff;
	-webkit-border-radius: 0 0 20px 20px;
	-moz-border-radius: 0 0 20px 20px;
	border-radius: 0 0 20px 20px;
	padding: 20px 26px;
}

#login fieldset p {
	color: #777;
	margin-bottom: 14px;
}

#login fieldset p:last-child {
	margin-bottom: 0;
}

#login fieldset input {
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
}

#login fieldset input[type="email"], #login fieldset input[type="password"] {
	background-color: #eee;
	color: #777;
	padding: 4px 10px;
	width: 328px;
}

#login fieldset input[type="submit"] {
	background-color:#3a3731;
	color: #fff;
	display: block;
	margin: 0 auto;
	padding: 4px 0;
	width: 100px;
}

#login fieldset input[type="submit"]:hover {
	background-color: #28ad63;
}
    </style>
</head>

<body>

	<div id="login">

		<h2><span class="fontawesome-lock"></span>LOGIN</h2>

		<form>

			<fieldset>

				<p><label for="email">Email-User</label></p>
               <p style="margin-top:3px;"><input type="text" id="username" placeholder=" Input Name" runat="server" /></p> 
				<p><label for="password">Password</label><input type="password" id="password" placeholder="********" runat="server" /></p>
				
                <div style="display:-webkit-box">
				    <p style="margin-right:3px">
                         <%--<button id="btdangnhap" runat="server" onserverclick="btdangnhap_Click">Sign In</button>--%>
                       <%-- <p><input type="submit" value="Sign In"></p>--%>
                    <%--<p><input type="submit" name="btnSubmit" id="btnSubmit" value="Login" runat="server" onserverclick="Submit_Click"/></p>--%>
                    <%--<p>
                        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" /></p>--%>
                </div>
			</fieldset>

		</form>

	</div> <!-- end login -->
</body>	
</html>
