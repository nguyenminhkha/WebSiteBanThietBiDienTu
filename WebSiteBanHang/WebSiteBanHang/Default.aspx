<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSiteBanHang.MatHang2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!DOCTYPE html>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title></title>
</head>
<body>
    <%--Style--%>
    <style>
        .hv-anh:hover{
                         -webkit-transform: scale(1.1);
                         -ms-transform: scale(1.1);
                          transform: scale(1.1);
                          transition: 0.5s;
                        }
            
            .khung {
                    border-style: groove;
                    margin: 4px;
                    width: 310px;
                    text-align: left;
                    height: 330px;
                    border-radius: 10px;
                    border: 1px solid #dfdfdf;
                    padding: 15px;
             }   
            .btn-muangay{
                    background: #ff424e;
                    width: 80px;
                    border: 1px solid transparent;
                    padding: 7px;
                    color: #ffffff;
                    border-color: #ff424e;
                    margin-top: 10px;
                    border-radius: 5px;
                    text-align: center;
                    }
            .btn-muangay:hover{
                background:#e20c19;
            }
        /*jssor slider loading skin spin css*/
        .jssorl-009-spin img {
            animation-name: jssorl-009-spin;
            animation-duration: 1.6s;
            animation-iteration-count: infinite;
            animation-timing-function: linear;
        }

        @keyframes jssorl-009-spin {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /*jssor slider bullet skin 052 css*/
        .jssorb052 .i {position:absolute;cursor:pointer;}
        .jssorb052 .i .b {fill:#000;fill-opacity:0.3;}
        .jssorb052 .i:hover .b {fill-opacity:.7;}
        .jssorb052 .iav .b {fill-opacity: 1;}
        .jssorb052 .i.idn {opacity:.3;}

        /*jssor slider arrow skin 053 css*/
        .jssora053 {display:block;position:absolute;cursor:pointer;}
        .jssora053 .a {fill:none;stroke:#fff;stroke-width:640;stroke-miterlimit:10;}
        .jssora053:hover {opacity:.8;}
        .jssora053.jssora053dn {opacity:.5;}
        .jssora053.jssora053ds {opacity:.3;pointer-events:none;}    
    </style>
    <%--/Style--%>
    <script src="js/jssor.slider-27.5.0.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        jssor_1_slider_init = function() {

            var jssor_1_SlideoTransitions = [
              [{b:0,d:600,y:-290,e:{y:27}}],
              [{b:0,d:1000,y:185},{b:1000,d:500,o:-1},{b:1500,d:500,o:1},{b:2000,d:1500,r:360},{b:3500,d:1000,rX:30},{b:4500,d:500,rX:-30},{b:5000,d:1000,rY:30},{b:6000,d:500,rY:-30},{b:6500,d:500,sX:1},{b:7000,d:500,sX:-1},{b:7500,d:500,sY:1},{b:8000,d:500,sY:-1},{b:8500,d:500,kX:30},{b:9000,d:500,kX:-30},{b:9500,d:500,kY:30},{b:10000,d:500,kY:-30},{b:10500,d:500,c:{x:125.00,t:-125.00}},{b:11000,d:500,c:{x:-125.00,t:125.00}}],
              [{b:0,d:600,x:535,e:{x:27}}],
              [{b:-1,d:1,o:-1},{b:0,d:600,o:1,e:{o:5}}],
              [{b:-1,d:1,c:{x:250.0,t:-250.0}},{b:0,d:800,c:{x:-250.0,t:250.0},e:{c:{x:7,t:7}}}],
              [{b:-1,d:1,o:-1},{b:0,d:600,x:-570,o:1,e:{x:6}}],
              [{b:-1,d:1,o:-1,r:-180},{b:0,d:800,o:1,r:180,e:{r:7}}],
              [{b:0,d:1000,y:80,e:{y:24}},{b:1000,d:1100,x:570,y:170,o:-1,r:30,sX:9,sY:9,e:{x:2,y:6,r:1,sX:5,sY:5}}],
              [{b:2000,d:600,rY:30}],
              [{b:0,d:500,x:-105},{b:500,d:500,x:230},{b:1000,d:500,y:-120},{b:1500,d:500,x:-70,y:120},{b:2600,d:500,y:-80},{b:3100,d:900,y:160,e:{y:24}}],
              [{b:0,d:1000,o:-0.4,rX:2,rY:1},{b:1000,d:1000,rY:1},{b:2000,d:1000,rX:-1},{b:3000,d:1000,rY:-1},{b:4000,d:1000,o:0.4,rX:-1,rY:-1}]
            ];

            var jssor_1_options = {
              $AutoPlay: 1,
              $Idle: 2000,
              $CaptionSliderOptions: {
                $Class: $JssorCaptionSlideo$,
                $Transitions: jssor_1_SlideoTransitions,
                $Breaks: [
                  [{d:2000,b:1000}]
                ]
              },
              $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$
              },
              $BulletNavigatorOptions: {
                $Class: $JssorBulletNavigator$
              }
            };

            var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

            /*#region responsive code begin*/

            var MAX_WIDTH = 980;

            function ScaleSlider() {
                var containerElement = jssor_1_slider.$Elmt.parentNode;
                var containerWidth = containerElement.clientWidth;

                if (containerWidth) {

                    var expectedWidth = Math.min(MAX_WIDTH || containerWidth, containerWidth);

                    jssor_1_slider.$ScaleWidth(expectedWidth);
                }
                else {
                    window.setTimeout(ScaleSlider, 30);
                }
            }

            ScaleSlider();

            $Jssor$.$AddEvent(window, "load", ScaleSlider);
            $Jssor$.$AddEvent(window, "resize", ScaleSlider);
            $Jssor$.$AddEvent(window, "orientationchange", ScaleSlider);
            /*#endregion responsive code end*/
        };
    </script>
    <link href="//fonts.googleapis.com/css?family=Oswald:200,300,regular,500,600,700&subset=latin-ext,vietnamese,latin,cyrillic" rel="stylesheet" type="text/css" />
<%-- Main--%>
    <table class="nav-justified">
                <tr>
                    <td>
                     <div style="margin-top:5px">
                        <table>
                            <tr>
                                <td>
                                    <table>
                                        <tr>
                                            <td><h2 style="text-align:center">CAM KẾT</h2>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                                <asp:Image ID="Image2" runat="server" Height="45px" ImageUrl="~/img/giaohang.png" Width="45px" />
&nbsp;<b>GIAO HÀNG MIỄN PHÍ</b><br />
                                                <br />
                                                <asp:Image ID="Image3" runat="server" Height="45px" ImageUrl="~/img/dola.png" Width="45px" />
&nbsp;<b>THANH TOÁN LINH HOẠT</b><br />
                                                <br />
                                                <asp:Image ID="Image4" runat="server" Height="45px" ImageUrl="~/img/doitra.gif" Width="45px" />
&nbsp;<b>ĐỔI TRẢ HÀNG TRONG 30 NGÀY</b><br />

                                            </td>
                                        </tr>
                                    </table>
                                    
                                </td>
                                <td>
                                     <div id="jssor_1" style="position:relative;margin:0 auto;top:0px;left:0px;width:980px;height:380px;overflow:hidden;visibility:hidden;">
        <!-- Loading Screen -->
        <div data-u="loading" class="jssorl-009-spin" style="position:absolute;top:0px;left:0px;width:100%;height:100%;text-align:center;background-color:rgba(0,0,0,0.7);">
            <img style="margin-top:-19px;position:relative;top:50%;width:38px;height:38px;" src="image/1.png" />
        </div>
        <div data-u="slides" style="cursor:default;position:relative;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
            <div>
                <img data-u="image" src="image/2.jpg" />
                
            </div>
            <div>
                <img data-u="image" src="image/3.jpg" />
                <div data-ts="flat" data-p="1360" style="position:absolute;top:0px;left:0px;width:980px;height:380px;overflow:hidden;">
             
                </div>
            </div>
            <div>
                <img data-u="image" src="image/4.jpg" />
                <div data-ts="flat" data-p="1360" style="position:absolute;top:0px;left:0px;width:980px;height:380px;">
                    
                </div>
            </div>
        </div>
        <!-- Bullet Navigator -->
        <div data-u="navigator" class="jssorb052" style="position:absolute;bottom:12px;right:12px;" data-autocenter="1" data-scale="0.5" data-scale-bottom="0.75">
            <div data-u="prototype" class="i" style="width:16px;height:16px;">
                <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                    <circle class="b" cx="8000" cy="8000" r="5800"></circle>
                </svg>
            </div>
        </div>
        <!-- Arrow Navigator -->
        <div data-u="arrowleft" class="jssora053" style="width:55px;height:55px;top:0px;left:25px;" data-autocenter="2" data-scale="0.75" data-scale-left="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="11040,1920 4960,8000 11040,14080 "></polyline>
            </svg>
        </div>
        <div data-u="arrowright" class="jssora053" style="width:55px;height:55px;top:0px;right:25px;" data-autocenter="2" data-scale="0.75" data-scale-right="0.75">
            <svg viewbox="0 0 16000 16000" style="position:absolute;top:0;left:0;width:100%;height:100%;">
                <polyline class="a" points="4960,1920 11040,8000 4960,14080 "></polyline>
            </svg>
        </div>
    </div>
    <script type="text/javascript">jssor_1_slider_init();</script>
                                </td>
                            </tr>
                      
                            <tr>
                                <td><h1>SẢN PHẨM</h1></td>
                                <td colspan="2">
                                    
                                    <asp:Image ID="Image5" runat="server" Height="70px" ImageUrl="~/img/burbery.png" Width="220px" />
&nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image6" runat="server" Height="70px" ImageUrl="~/img/canon.jpg" Width="220px" />
&nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image7" runat="server" Height="70px" ImageUrl="~/img/guhi.jpg" Width="220px" />
&nbsp;&nbsp;&nbsp;
                                    <asp:Image ID="Image8" runat="server" Height="70px" ImageUrl="~/img/nikon.jpg" Width="220px" />
                                    
                                </td>
                                <td></td>
                            </tr>
                        </table>
                </div>
                    </td>
                    <td rowspan="2"></td>
                </tr>
                
                <tr>
                    
                    <td>
                       
                        <asp:DataList ID="DataListmathang" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" Width="80%">
                        <ItemTemplate>
                            <p class="khung">
                            <asp:ImageButton ID="ImageButtonmathang" runat="server" CssClass="hv-anh" Height="200px" Width="200px" CommandArgument='<%# Eval("mahang") %>' ImageUrl='<%# "~/image/" + Eval("hinh") %>' OnClick="ImageButtonmathang_Click1" />
                                &nbsp;<asp:Image ID="Image1" runat="server" Height="50px" ImageUrl="~/image/giamgia.png" Width="50px" />
                            <br />
                            <asp:LinkButton ID="LinkButton1mathang" runat="server" CommandArgument='<%# Eval("mahang") %>' Text='<%# Eval("tenhang") %>' OnClick="LinkButton1mathang_Click1"></asp:LinkButton>
                            <br />
                            <asp:LinkButton ID="LinkButton2mathang" runat="server" CommandArgument='<%# Eval("mahang") %>' Text='<%# "Giá:  "+Eval("dongia","{0:0,0}") + " ₫" %>' OnClick="LinkButton2mathang_Click1" Font-Size="20px" ForeColor="Red"></asp:LinkButton>
                                &nbsp;&nbsp;&nbsp;
                                <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("mahang") %>' OnClick="Button2_Click" Text="Mua ngay" CssClass="btn-muangay" />
                            </p>
                           </ItemTemplate>
                    </asp:DataList>
                       
                    </td>
                </tr>
        
            </table>
<%--Style--%> 
    </body>
    </html>
</asp:Content>
