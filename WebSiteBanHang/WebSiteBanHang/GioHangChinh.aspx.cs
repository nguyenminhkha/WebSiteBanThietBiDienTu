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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kết nối CSDL
            str = @"	workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
            if (Page.IsPostBack) return;
            if (Request.Cookies["tendangnhap"] == null) Server.Transfer("DangNhap.aspx");
            this.docDL();
        }
        /*Hàm docDL load lại CSDL*/
        private void docDL()
        {
            string ten = Request.Cookies["tendangnhap"].Value;
            try
            {
                string q = "select donhang.mahang,tenhang,mota,dongia,soluong,hinh," + "soluong*dongia as thanhtien from donhang, mathang " + " where tendangnhap='" + ten + "' and mathang.mahang=donhang.mahang and soluong>=0";
                SqlDataAdapter da = new SqlDataAdapter(q, str);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataList1.DataSource = dt;
                this.DataList1.DataBind();

                //tổng thành tiền
                double tong = 0;
                foreach(DataRow row in dt.Rows)
                {
                    double thanhtien = Convert.ToDouble(row["thanhtien"]);
                    tong = tong + thanhtien;
                }
                this.Labelthanhtien.Text=tong.ToString("0,0") + " ₫";
                this.Label2.Text= tong.ToString("0,0") + " ₫";
            }
            catch (SqlException ex) { Response.Write(ex.Message); }
        }

        /*Button trừ*/
        protected void Buttontru_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null) return;
            string ten = Request.Cookies["tendangnhap"].Value;
            string mahang = ((Button)sender).CommandArgument;
            string sql = "update donhang set soluong=soluong-1 where tendangnhap='" + ten + "' and mahang='" + mahang + "' and soluong>1";
            SqlConnection con = new SqlConnection(str);
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand(sql, con);
                command.ExecuteNonQuery();
                Response.Redirect("GioHangChinh.aspx");

            }
            catch (SqlException ex) { Response.Write(ex.Message); }
            finally { con.Close(); }
            this.docDL();
        }

        /*Button cộng*/
        protected void Buttoncong_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null) return;
            string ten = Request.Cookies["tendangnhap"].Value;
            string mahang = ((Button)sender).CommandArgument;
            string sql = "update donhang set soluong=soluong+1 where tendangnhap='" + ten + "' and mahang='" + mahang + "'";
            SqlConnection con = new SqlConnection(str);
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand(sql, con);
                command.ExecuteNonQuery();
                Response.Redirect("GioHangChinh.aspx");

            }
            catch (SqlException ex) { Response.Write(ex.Message); }
            finally { con.Close(); }
            this.docDL();
        }

        /*ImageButton quay lại MatHangChiTiet*/
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string mahang = ((ImageButton)sender).CommandArgument;
            Context.Items["mh"] = mahang;
            Server.Transfer("MatHangChiTietChinh.aspx");
        }

        /*Linkbutton Trở về trang chủ*/
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("Default.aspx");
        }

        /*Linkbutton xóa sản phẩm trong giỏ hàng*/
        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null) return;
            string ten = Request.Cookies["tendangnhap"].Value;
            string mahang = ((LinkButton)sender).CommandArgument;
            string sql = "delete from donhang where tendangnhap='" + ten + "' and mahang='" + mahang + "'";
            SqlConnection con = new SqlConnection(str);
            try
            {
                con.Open();
                SqlCommand command = new SqlCommand(sql, con);
                command.ExecuteNonQuery();
                Response.Redirect("GioHangchinh.aspx");

            }
            catch (SqlException ex) { Response.Write(ex.Message); }
            finally { con.Close(); }
            this.docDL();
        }

        //Button thông tin người nhận hàng
        protected void Button1_Click(object sender, EventArgs e)
        {
            Server.Transfer("ThongTinNhanHang.aspx");
        }
    }
    }