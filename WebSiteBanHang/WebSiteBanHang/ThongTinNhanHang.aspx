<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="ThongTinNhanHang.aspx.cs" Inherits="WebSiteBanHang.ThongTinNhanHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>

       .btn-dongy{
                    background: #ff424e;
                    width: auto;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color:#ff424e;
                    text-align: center;
                }
                .btn-dongy:hover{
                    background:#e20c19;
                }
                .btn-huy{
                    background: #888a8e;
                    width: auto;
                    border: 1px solid transparent;
                    padding: 10px 15px;
                    color: #ffffff;
                    border-color:#888a8e;
                    text-align: center;
                }
                .btn-huy:hover{
                    background:#989ca2;
                }
       .auto-style1 {
           text-align: right;
           font-weight: bold;
       }
   </style>
    
     <div style="    margin-left: 500px;
    padding: 2px;
    font-size: 16px;
}">
        <h2>ĐỊA CHỈ NHẬN HÀNG</h2>
    <table style="width: 100%">
        <tr>
            <td class="auto-style1">Họ tên người nhận</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="366px" Height="36px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Số điện thoại</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="366px" Height="36px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" style="height: 20px">Tỉnh thành</td>
            <td style="height: 20px">
                <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="366px" Height="36px">
                    <asp:ListItem>Hà Nội</asp:ListItem>
                    <asp:ListItem>Đà Nẵng</asp:ListItem>
                    <asp:ListItem>Tp. Hồ Chí Minh</asp:ListItem>
                    <asp:ListItem>Bình Dương</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Phường xã</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" Width="366px" Height="36px">
                    <asp:ListItem>Quận 1</asp:ListItem>
                    <asp:ListItem>Quận 2</asp:ListItem>
                    <asp:ListItem>Quận 3</asp:ListItem>
                    <asp:ListItem>Quận 4</asp:ListItem>
                    <asp:ListItem>Tp. Thủ Dầu Một</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Địa chỉ</td>
            <td>
                <asp:TextBox ID="TextBox3" runat="server" Width="366px" Height="36px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td style="height: 20px"></td>
            <td style="height: 20px">
               
                <asp:CheckBox ID="CheckBox1" runat="server" Text="Đặt làm mặc định" Height="36px" />
               
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <table style="width: 100%">
                    <tr>
                        <td>
                            <asp:Button ID="Button2" runat="server" CssClass="btn-huy" Text="Hủy" Height="36px" />
                            <asp:Button ID="Button3" runat="server" CssClass="btn-dongy" Text="Xác nhận" Height="36px" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

        </div>

</asp:Content>
