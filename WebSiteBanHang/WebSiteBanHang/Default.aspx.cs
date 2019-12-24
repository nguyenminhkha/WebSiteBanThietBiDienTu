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
    public partial class MatHang2 : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            string q;           
            //Kết nối CSDL
            str = @"	workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
            if (Page.IsPostBack) return;
            
            if (Context.Items["sql"] != null)
            {
                q = Context.Items["sql"].ToString();
            }
            else
            {
                string maloai = Request.QueryString["ml"];
                string tenloai = Request.QueryString["tl"];
                //string q;
                if (maloai == null)
                    q = "select * from mathang";
                else
                {
                    q = "select * from mathang where maloai='" + maloai + "'";
                }
            }

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(q, str);
                DataTable dt = new DataTable();
                da.Fill(dt);
                this.DataListmathang.DataSource = dt;
                this.DataListmathang.DataBind();
            }
            catch (SqlException ex) { Response.Write(ex.Message); }
        }

        /*ImageButton qua MatHangChiTiet*/
        protected void ImageButtonmathang_Click1(object sender, ImageClickEventArgs e)
        {
            string mahang = ((ImageButton)sender).CommandArgument;
            Context.Items["mh"] = mahang;
            Server.Transfer("MatHangChiTietChinh.aspx");
        }

        /*LinkButton qua MatHangChiTiet*/
        protected void LinkButton1mathang_Click1(object sender, EventArgs e)
        {
            string mahang = ((LinkButton)sender).CommandArgument;
            Context.Items["mh"] = mahang;
            Server.Transfer("MatHangChiTietChinh.aspx");
        }

        /*LinkButton qua MatHangChitiet*/
        protected void LinkButton2mathang_Click1(object sender, EventArgs e)
        {
            string mahang = ((LinkButton)sender).CommandArgument;
            Context.Items["mh"] = mahang;
            Server.Transfer("MatHangChiTietChinh.aspx");
        }

        //Button mua ngay
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Request.Cookies["tendangnhap"] == null)
            {
                Server.Transfer("DangNhap.aspx");
            }
            Button mua = (Button)sender;
            string mahang = mua.CommandArgument.ToString();
            DataListItem item = (DataListItem)mua.Parent;
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
                    command = new SqlCommand("update donhang set soluong=soluong+1 where tendangnhap='" + ten + "' and mahang='" + mahang + "'", con);
                }
                else
                {
                    reader.Close();
                    command = new SqlCommand("insert into donhang(tendangnhap,mahang,soluong) values ('" + ten + "','" + mahang + "','1')", con);
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
    }
}
