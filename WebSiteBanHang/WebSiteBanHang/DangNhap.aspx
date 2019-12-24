<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="WebSiteBanHang.DangNhapChinh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1" />
    <link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
  <link rel='stylesheet prefetch' href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'/>
<link rel='stylesheet prefetch' href='http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'/>
</head>
<body>
<div style="margin-left:500px">

<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
  </div>
  <div class="form" style="border: 1px solid gainsboro">
    <h2>ĐĂNG NHẬP</h2>
      <form ">
          <input type="text" placeholder="Tài khoản" id="user" runat="server">
          <input type="password" placeholder="Mật khẩu" id="pass" runat="server" />
          <div style="margin: 2px">
             
              <button onserverclick=" FancyBtn_Click" runat="server" id="BUTTON1"  >
                  <b>Đăng nhập</b>
              </button>
                  
          </div>
          <div style="margin: 2px">
              <button onserverclick=" FancyBtn_Click1" runat="server" id="BUTTON3">
                  <b>Đăng ký</b>
              </button>
          </div>
          <div style="margin-top: 2px">
              <asp:Label ID="Label1" runat="server" ForeColor="#FF3300"></asp:Label>
          </div>
      </form>
  </div>
  <div class="cta" style="border: 1px solid gainsboro"><a href="#">Quên mật khẩu?</a></div>
</div>
    </div>
</body>
</html>

</asp:Content>
