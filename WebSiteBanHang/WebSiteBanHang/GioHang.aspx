<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="WebSiteBanHang.GioHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridViewgiohang" runat="server">
        </asp:GridView>
        <br />
        <asp:Label ID="Labeltongtien" runat="server" Text="Tổng tiền"></asp:Label>
</asp:Content>
