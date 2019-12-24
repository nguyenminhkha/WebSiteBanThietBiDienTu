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
    public partial class MatHangChiTietChinh : System.Web.UI.Page
    {
        string str;

        protected void Page_Load(object sender, EventArgs e)
        {
            str = @"	workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
            if (Page.IsPostBack) return;
            if (Request.Cookies["tendangnhap"] == null) this.Labelmuathanhcong.Text = "Vui lòng đăng nhập để mua hàng!!";
            if (Context.Items["mh"] == null) return;
            string mahang = Context.Items["mh"].ToString();

            try
            {
                string query = "select * from mathang where mahang='" + mahang + "'";
                SqlDataAdapter da = new SqlDataAdapter(query, str);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataListmathangchitiet.DataSource = dt;
                this.DataListmathangchitiet.DataBind();

            }
            catch (SqlException ex) { Response.Write(ex.Message); }
        }

        protected void btntru_Click(object sender, EventArgs e)
        {

            //Duyệt trong datalist để tìm đối tượng TextBox1
            foreach (DataListItem item in DataListmathangchitiet.Items)
            {
                TextBox txtsoluong = (TextBox)item.FindControl("TextBox1");
                string dem = txtsoluong.Text;
                int soluong;
                int.TryParse(dem, out soluong);
                if (soluong == 0) return;
                else txtsoluong.Text = (soluong - 1).ToString();

            }

        }
        /*Button html trừ*/

        /*Button html cộng*/
        protected void btncong_Click(object sender, EventArgs e)
        {
            foreach (DataListItem item in DataListmathangchitiet.Items)
            {
                TextBox txtsoluong = (TextBox)item.FindControl("TextBox1");
                string dem = txtsoluong.Text;
                int soluong;
                int.TryParse(dem, out soluong);
                txtsoluong.Text = (soluong + 1).ToString();

            }
        }

        /*Button html mua ngay*/
        protected void Buttonmuangay_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null)
            {
                Server.Transfer("DangNhap.aspx");
            }
            Button mua = (Button)sender;
            string mahang = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
            string soluong = ((TextBox)item.FindControl("TextBox1")).Text;
            if (Request.Cookies["tendangnhap"] == null) return;
            string ten = Request.Cookies["tendangnhap"].Value;
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(str);
                con.Open();
                string query = "select * from donhang where mahang='" + mahang + "' and tendangnhap='" + ten + "'";
                SqlCommand command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    command = new SqlCommand("update donhang set soluong=soluong+" + soluong + " where tendangnhap='" + ten + "' and mahang='" + mahang + "'", con);
                }
                else
                {
                    reader.Close();
                    command = new SqlCommand("insert into donhang(tendangnhap,mahang,soluong) values ('" + ten + "','" + mahang + "'," + soluong + ")", con);
                }
                command.ExecuteNonQuery();


            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally { con.Close(); }
            Server.Transfer("GioHangChinh.aspx");
        }

        /*Button html thêm vào giỏ hàng dùng phương thức onserverclick*/
        protected void Buttonthemgiohang_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null)
            {
                Server.Transfer("DangNhap.aspx");
            }
            Button mua = (Button)sender;
            string mahang = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
            string soluong = ((TextBox)item.FindControl("TextBox1")).Text;
            if (Request.Cookies["tendangnhap"] == null) return;
            string ten = Request.Cookies["tendangnhap"].Value;
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(str);
                con.Open();
                string query = "select * from donhang where mahang='" + mahang + "' and tendangnhap='" + ten + "'";
                SqlCommand command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    reader.Close();
                    command = new SqlCommand("update donhang set soluong=soluong+" + soluong + " where tendangnhap='" + ten + "' and mahang='" + mahang + "'", con);
                }
                else
                {
                    reader.Close();
                    command = new SqlCommand("insert into donhang(tendangnhap,mahang,soluong) values ('" + ten + "','" + mahang + "'," + soluong + ")", con);
                }
                command.ExecuteNonQuery();


            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally { con.Close(); }
            this.Labelmuathanhcong.Text = ("Đã thêm sản phẩm vào giỏ hàng!");
            Context.Items["mh"] = mahang;
            Server.Transfer("MatHangChiTietChinh.aspx?ml=" + mahang + "");
        }

        /*Chuyển đến trang like page*/
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("");
        }

        /*Chuyển đến trang share*/
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("");
        }
    }
}