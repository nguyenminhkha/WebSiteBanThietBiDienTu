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
    public partial class index : System.Web.UI.MasterPage
    {
        protected DataTable dt;
        string query;
        SqlCommand command;
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kết nối CSDL
            str = @"workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2
";

            //Sub Menu
            string q = "select * from loaihang";
            SqlDataAdapter da = new SqlDataAdapter(q, str);
            dt = new DataTable();
            da.Fill(dt);

            //Xử lý Lable đăng nhập đăng xuất
            SqlConnection con = new SqlConnection(str);
            if (Request.Cookies["tendangnhap"] != null)
            {
                string ten = Request.Cookies["tendangnhap"].Value;
                con.Open();
                query = "select sum(soluong) as dem from donhang where tendangnhap='" + ten + "'";
                command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader();
                reader.Read();
                this.Labeldem.Text = reader["dem"].ToString();
                this.Labeltentk.Text = ten;
                this.Labellogin.Text = "Đăng xuất";
                con.Close();
            }
            else
            {
                this.Labeldem.Text = "0";
                this.Labeltentk.Text = "Khách";
                this.Labellogin.Text = "Đăng nhập";
            }
        }

        /*Button html đăng xuất*/
        protected void btndx(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] != null)
            {
                Response.Cookies["tendangnhap"].Expires = DateTime.Now.AddDays(-1);
                this.Labeltentk.Text = "Khách";
                Response.Redirect("DangNhap.aspx");
                Server.Transfer("DangNhap.aspx");               
            }
            else
            {
                this.Labellogin.Text = "Đăng Nhập";
                Server.Transfer("DangNhap.aspx");
            }
        }

        /*Button html search*/
        protected void btnsearch(object sender, EventArgs e)
        {
            //string maloai = this.timkiem.Value;
            //Server.Transfer("MatHang.aspx?ml=" + maloai + "");
            string tenhang = this.timkiemtext.Value;
            //string sql = "select * from mathang where tenhang like '%" + tenhang + "%' and maloai='"+maloai+"'";
            string sql = "select * from mathang where tenhang like '%" + tenhang + "%'";
            Context.Items["sql"] = sql;
            //Context.Items["loai"] = tenhang;         
            Server.Transfer("Default.aspx");
        }

    }
}
