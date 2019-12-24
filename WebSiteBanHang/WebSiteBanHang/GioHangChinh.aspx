<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="GioHangChinh.aspx.cs" Inherits="WebSiteBanHang.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
    <html xmlns="http://www.w3.org/1999/xhtml">
        <head>
             <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	          <meta name="viewport" content="width=device-width,initial-scale=1" />
            <link rel="stylesheet" type="text/css" href="css/demo.css" media="all" />
            <title></title>
        </head>
        <body>
            <style>

                .btn-cong{
                    border: 1px solid #dfdfdf;
                    border-radius: 0 5px 5px 0px;
                }
                .btn-tru{
                border: 1px solid #dfdfdf;
                border-radius: 5px 0 0 5px;
            }
                .text-box{
                     height:29px;
                     width:50px;
                     text-align:center;
                     border: 1px solid #dfdfdf;
                }
                .btn-tienhanhdathang{
                    background: #ff424e;
                    width: 100%;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color:#ff424e;
                    margin-top: 10px;
                    border-radius: 10px;
                    text-align: center;

                }
                .btn-tienhanhdathang:hover{
                    background:#e20c19;
                }

                .btn-guiquatang{
                    background: #fdce03;
                    width: 100%;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color: #fdce03;
                    margin-top: 10px;
                    border-radius: 10px;
                    text-align: center;

                }
                .btn-guiquatang:hover{
                    background:#efc408;
                }

                .btn-dongy{
                    background: #fdce03;
                    width: auto;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #333;
                    border-color:#fdce03;
                    text-align: center;
                }
                .btn-dongy:hover{
                    background:#fbdd5c;
                }
                .auto-style1 {
                    width: 100%;
                }
                .auto-style2 {
                    height: 0px;
                }
                .auto-style4 {
                    height: 29px;
                }
                .auto-style5 {
                    width: 100px;
                    height: 29px;
                }
                .auto-style6 {
                    width: 100px;
                    height: 34px;
                }
                .auto-style7 {
                    height: 34px;
                }
            </style>
            <%--GIỎ HÀNG--%>
    <div style="width:1220px; margin-left:20px; height:auto; margin-top:30px">
        <table>
            <h1 style="left:5px" class="text-left">Giỏ hàng<asp:Label ID="Labeldem" runat="server"></asp:Label>
            </h1>
           <tr>
               <%--Datalist giỏ hàng--%>
            <td>
                 <div style="width:900px;height:auto; margin-bottom: 300px;">
                     <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" RepeatDirection="Horizontal">
                         <ItemTemplate>
                             <table style="width: 900px;margin-top: 10px;">
                                 <tr>
                                     <td rowspan="3" style="width:150px">
                                         <asp:ImageButton ID="ImageButton1" runat="server" Height="150px" ImageUrl='<%# "~/image/" + Eval("hinh") %>' Width="150px" CommandArgument='<%# Eval("mahang") %>' OnClick="ImageButton1_Click" />
                                         &nbsp; <%--Hình--%></td>
                                     <td style="width:450px">
                                         <asp:Label ID="Labelten" runat="server" style="font-size: medium" Text='<%# Eval("tenhang") %>'></asp:Label>
                                     </td>
                                     <td style="width:150px">
                                         <asp:Label ID="Labeldongia" runat="server" style="font-size: medium" Text='<%# Eval("dongia","{0:0,0}") + " ₫" %>' Font-Bold="True" ForeColor="Red"></asp:Label>
                                     </td>
                                     <td style="width:150px; text-align: left;">
                                         <asp:Button ID="Buttontru" runat="server" Height="30px" Text="-" Width="30px" ForeColor="#333" CssClass="btn-tru" OnClick="Buttontru_Click" CommandArgument='<%# Eval("mahang") %>'/><asp:TextBox ID="TextBox1" runat="server" CssClass="text-box" Text='<%# Eval("soluong") %>'></asp:TextBox><asp:Button ID="Buttoncong" runat="server" Height="30px" Text="+" ForeColor="#333" Width="30px" CssClass="btn-cong" OnClick="Buttoncong_Click" CommandArgument='<%# Eval("mahang") %>' />
                                     </td>
                                 </tr>
                                 <tr>
                                     <td style="width:450px; height: 44px;">
                                         <asp:Label ID="Labelmota" runat="server" style="font-size: medium" Text='<%# Eval("mota") %>'></asp:Label>
                                         <br />
                                         <br />
                                         <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("mahang") %>' Font-Bold="True" ForeColor="#FB1700" OnClick="LinkButton2_Click">Xóa</asp:LinkButton>
                                         &nbsp;&nbsp;&nbsp;&nbsp;
                                         <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="False" ForeColor="#007FF0" OnClick="LinkButton1_Click">Tiếp tục mua hàng !!</asp:LinkButton>
                                     </td>
                                     <td style="width:150px; height: 44px;"></td>
                                     <td style="width:150px; height: 44px;"></td>
                                 </tr>
                                 <tr>
                                     <td style="width:450px">
                                         &nbsp;</td>
                                     <td style="width:150px">&nbsp;</td>
                                     <td style="width:150px">&nbsp;</td>
                                 </tr>
                             </table>
                         </ItemTemplate>
                     </asp:DataList>
                 </div>
            </td>
                <%--/Datalist giỏ hàng--%>

              <%-- Thanh toán ngay--%>
                <td>
                          <div style="margin-left: 10px;
                                width: 300px;
                                height: auto;
                                position: fixed;
                                /* margin: auto; */
                                top: 280px;">
                         
                      <table class="auto-style1">
                          <tr>
                              <td class="auto-style5"><strong>Tạm tính: </strong> </td>
                              <td class="auto-style4">
                                  <asp:Label ID="Label2" runat="server" Text="Label" style="text-align: right"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="auto-style6"><strong>Thành tiền</strong></td>
                              <td class="auto-style7">
                                  <asp:Label ID="Labelthanhtien" runat="server" Text="Label" ForeColor="Red" Font-Bold="True" Font-Size="16px"></asp:Label>
                              </td>                              
                          </tr>
                          <tr>
                              <td style="width:100px"></td>
                              <td><i>(Đã bao gồm VAT)</i></td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                 <%--<button class="btn-tienhanhdathang" id="btndathang" runat="server">Tiến hành đặt hàng</button>--%>
                                  <asp:Button ID="Button1" CssClass="btn-tienhanhdathang" runat="server" Text="Tiến hành đặt hàng" OnClick="Button1_Click" />
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2" class="auto-style2">
                                  <button class="btn-guiquatang">
                                   Gửi quà tặng</button>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">
                                  <h4>Mã giảm giá / Quà tặng</h4>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="2">

                                  <asp:TextBox ID="TextBox2" runat="server" Height="39px" placeholder="Nhập ở đây..."></asp:TextBox>
                                   <button class="btn-dongy">Đồng ý</button></td>
                          </tr>
                      </table>
                         
                      </div>
                </td>
               <%-- /Thanh toán ngay--%>
           </tr>
        </table>
    </div>
             <%--/GIỎ HÀNG--%>
            </body>
     </html>
</asp:Content>
