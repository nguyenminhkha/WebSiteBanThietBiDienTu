using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSiteBanHang
{
    public partial class GioHang : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            str = @"workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
            if (Request.Cookies["tendangnhap"] == null) Server.Transfer("DangNhap.aspx");
            string ten = Request.Cookies["tendangnhap"].Value;
            try
            {
                string q = "select donhang.mahang, tenhang,mota,dongia,soluong, soluong*dongia as thanhtien from donhang,mathang where mathang.mahang=donhang.mahang and tendangnhap='" + ten + "'";
                SqlDataAdapter da = new SqlDataAdapter(q, str);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.GridViewgiohang.DataSource = dt;
                this.GridViewgiohang.DataBind();
                //tinh thanhtien
                double tong = 0;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    double thanhtien = double.Parse(dt.Rows[i]["thanhtien"].ToString());
                    tong = tong + thanhtien;
                }
                this.Labeltongtien.Text = "TỔNG TIỀN: " + tong.ToString("0,0") + " VNĐ";

            }
            catch (SqlException ex) { Response.Write(ex.Message); }
        }
    }
}