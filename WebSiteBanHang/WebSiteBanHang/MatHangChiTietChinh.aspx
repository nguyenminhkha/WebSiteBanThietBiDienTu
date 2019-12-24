<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="MatHangChiTietChinh.aspx.cs" Inherits="WebSiteBanHang.MatHangChiTietChinh" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body>
<%--Style--%>
     <style>
         .btn-muangay{
              background: #ff424e;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color:#ff424e;
                    margin-top: 10px;
                    border-radius: 6px;
                    text-align: center;
         }
         .btn-muangay:hover{
             background:#e20c19;
         }
         .btn-themgiohang{
                    background: #fdce03;
                    width: 100%;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color: #fdce03;
                    margin-top: 10px;
                    border-radius: 6px;
                    text-align: center;
                    margin-top: -10px;

                }
         .btn-themgiohang:hover{
                    background:#efc408;
                }

         .text-box{
             text-align:center;
             border: 1px solid #dfdfdf;
         }
         .btn-cong{
              border: 1px solid #dfdfdf;
              border-radius: 0 5px 5px 0px;
         }
         .btn-tru{
             border: 1px solid #dfdfdf;
             border-radius: 5px 0 0 5px;
         }
            .khungtraimhct{
                width:10%
            }
            .khungphaimhct{
                width:35%
            }
         
            .khunggiuamhct{
                width:55%
            }
        .auto-style1 {
            text-align: left;
            font-weight: bold;
        }
        .auto-style2 {
            font-size: medium;
        }
        .auto-style3 {
            text-align: left;
            font-weight: bold;
            width: 103px;
            height: 59px;
        }
        .auto-style4 {
            height: 59px;
        }
        .hv-cart:hover{
                         -webkit-transform: scale(1.1);
                         -ms-transform: scale(0,7.1);
                          transform: scale(1.1);
                          transition: 0.5s;
                        }
        </style>
<%--/Style--%>

<%-- Main--%>
    <table class="nav-justified">
        <tr>
            <td class="khungtraimhct"></td>
            <td class="khunggiuamhct">&nbsp;
            <asp:DataList ID="DataListmathangchitiet" runat="server" Width="100%">
            <ItemTemplate>
                <table class="nav-justified">
                    <tr>
                        <td rowspan="6" style="width: 55px">
                            <asp:Image ID="Imagemathangchitiet" runat="server" Height="301px" Width="346px" ImageUrl='<%# "~/image/" + Eval("hinh") %>' />
                        </td>
                        <td class="text-left" colspan="2">
                            <asp:Label ID="Label1" runat="server" CssClass="auto-style2" Font-Bold="true" Font-Size="16px" Text='<%# Eval("tenhang") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px; height: 24px;" class="auto-style1">Mô tả</td>
                        <td style="height: 24px; width:auto">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("mota") %>' CssClass="auto-style2"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">Đơn giá</td>
                        <td class="auto-style4">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("dongia","{0:0,0}") + " ₫" %>' CssClass="auto-style2" ForeColor="Black"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px" class="auto-style1">Số lượng</td>
                        <td>
                            <div style="width:auto; height:30px">
                            <asp:Button ID="btntru" runat="server" Text="-" OnClick="btntru_Click" ForeColor="#000333" Height="30px" Width="30px" CssClass="btn-tru" /><asp:TextBox ID="TextBox1" Text="1" runat="server" Width="50px" CssClass="text-box" Height="29px"></asp:TextBox><asp:Button ID="btncong" runat="server" Text="+" OnClick="btncong_Click" ForeColor="#000333" Height="30px" Width="30px" CssClass="btn-cong"  />
                            </div>
                     </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="26px" Width="90px" ImageUrl="~/img/facebook-like.png" style="margin-top: 11px; display:block" OnClick="ImageButton1_Click"/></td>
                        <td>
                            <asp:Button ID="Buttonmuangay" runat="server" Text="Mua ngay" CssClass="btn-muangay" CommandArgument='<%# Eval("mahang") %>' OnClick="Buttonmuangay_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 103px">
                            <asp:ImageButton ID="ImageButton2" runat="server" Width="90px" Height="26px" ImageUrl="~/img/share.png" style="margin-bottom: 10px;display: block;" OnClick="ImageButton2_Click"/></td>
                        <td>
                            <asp:Button ID="Buttonthemgiohang" runat="server" Text="Thêm vào giỏ hàng" CssClass="btn-themgiohang" CommandArgument='<%# Eval("mahang") %>' OnClick="Buttonthemgiohang_Click"/>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Labelmuathanhcong" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        &nbsp;<br />
            </td>
            <td class="khungtraimhct"></td>
            <td class="khungphaimhct">
                <table class="nav-justified">
                    <tr>
                        <td><h3>CHÍNH SÁCH BÁN HÀNG</h3><br />
                            <ul style="box-sizing: border-box; margin: 0px; list-style: none; padding: 0px; counter-reset: item 0; color: rgb(60, 63, 68); font-family: Tahoma; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <li style="box-sizing: border-box; margin-bottom: 5px;">Giao hàng TOÀN QUỐC</li>
                                <li style="box-sizing: border-box; margin-bottom: 5px;">Thanh toán khi nhận hàng</li>
                                <li style="box-sizing: border-box; margin-bottom: 5px; width: 368px;">Đổi trả trong<span>&nbsp;</span><span style="box-sizing: border-box; color: rgb(237, 76, 76);">10 ngày</span></li>
                                <li style="box-sizing: border-box; margin-bottom: 5px;">Hoàn ngay tiền mặt</li>
                                <li style="box-sizing: border-box; margin-bottom: 5px;">Chất lượng đảm bảo</li>
                                <li style="box-sizing: border-box; margin-bottom: 5px;">Miễn phí vận chuyển:<span style="box-sizing: border-box; color: rgb(237, 76, 76);">Đơn hàng từ 5 món trở lên</span></li>
                                <li style="box-sizing: border-box; margin-bottom: 5px;"></li>
                                <li></li>
                            </ul>
                        </td>
                    </tr>
                   
                    <tr>
                        
                        <td><h3>HƯỚNG DẪN MUA HÀNG</h3><br />
                                <ul style="box-sizing: border-box; margin: 0px; list-style: none; padding: 10px; border: 1px solid rgb(195, 195, 195); counter-reset: item 0; color: rgb(60, 63, 68); font-family: Tahoma; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;">
                                <li style="box-sizing: border-box; margin-bottom: 10px;"><span>&nbsp;</span>Mua hàng trực tiếp tại website: <b class="ng-binding" style="box-sizing: border-box; font-weight: 700;"><a href="http://nmkshop.somee.com">nmkshop.somee.com</a></b></li>
                                <li style="box-sizing: border-box; margin-bottom: 10px;"><span>&nbsp;</span>Gọi điện thoại<span>&nbsp;</span><strong class="ng-binding" style="box-sizing: border-box; font-weight: 700; color: rgb(237, 76, 76);">+84827040213<span>&nbsp;</span></strong>để mua hàng</li>
                                <li style="box-sizing: border-box; margin-bottom: 10px;"><span>&nbsp;</span>Mua tại Trung tâm CSKH:<br style="box-sizing: border-box;" />
                                    <strong class="ng-binding" style="box-sizing: border-box; font-weight: 700; color: rgb(237, 76, 76);">Thủ Dầu Một</strong><span>&nbsp;</span><a href="https://www.google.com/maps/place/Tr%C6%B0%E1%BB%9Dng+%C4%90%E1%BA%A1i+h%E1%BB%8Dc+Th%E1%BB%A7+D%E1%BA%A7u+M%E1%BB%99t/@10.9806598,106.672259,17z/data=!3m1!4b1!4m5!3m4!1s0x3174d12739bb468f:0xe2bf4f397d0aa76!8m2!3d10.9806545!4d106.6744477?hl=vi-VN" rel="nofollow" style="box-sizing: border-box; background-color: transparent; color: rgb(170, 170, 170); text-decoration: none; outline: none; transition: all 0.3s ease-in-out;" target="_blank">Xem Bản Đồ</a></li>
                                <li style="box-sizing: border-box; margin-bottom: 10px;"><span>&nbsp;</span>Mua sỉ/buôn xin gọi<span>&nbsp;</span><strong class="ng-binding" style="box-sizing: border-box; font-weight: 700; color: rgb(237, 76, 76);">+84827040213<span>&nbsp;</span></strong>để được hỗ trợ.</li>
                            </ul>
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
<%-- Main--%>
    <%--<div class="fb-comments" data-href="http://localhost:52569/MatHang.aspx" data-numposts="5"></div>--%>
   <%--<div id="fb-root"></div>--%>
<%--<script async defer crossorigin="anonymous" src="https://connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v3.2"></script>--%>
</body> 
    </html> 
</asp:Content>
