using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSiteBanHang
{
    public partial class DangKyChinh : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kết nối CSDL
            str = @"workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
        }

        /*Hàm MD5 mã hóa chuỗi mật khẩu*/
        public static string GetMD5(string str)
        {
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));
            StringBuilder sbHash = new StringBuilder();
            foreach (byte b in bHash)
            {
                sbHash.Append(String.Format("{0:x2}", b));
            }
            return sbHash.ToString();
        }

        /*Button đăng ký thành viên*/
        protected void FancyBtn_Click(object sender, EventArgs e)
        {
            string ten = this.user.Value;
            string matkhau = this.pass.Value;
            string email = this.email1.Value;
            string dienthoai = this.Tel1.Value;
            SqlConnection con = null;
            try
            {
                con = new SqlConnection(str);
                con.Open();
                string query = "select tendangnhap from khachhang where tendangnhap='" + ten + "'";
                SqlCommand command = new SqlCommand(query, con);
                SqlDataReader reader = command.ExecuteReader();
                
                if (reader.Read())
                {
                    reader.Close();
                    this.Label1.Text = "Tên đăng nhập đã tồn tại!";
                }
                else
                {
                    reader.Close();
                    command = new SqlCommand("insert into khachhang(tendangnhap,matkhau,email,sodienthoai) values ('" + ten + "','" + GetMD5(matkhau) + "','" + email + "','" + dienthoai + "')", con);
                    command.ExecuteNonQuery();
                    this.Label1.Text = "Đăng ký thành công!";
                }
            }
            catch (SqlException ex)
            {
                Response.Write(ex.Message);
            }
            finally { con.Close(); }
        }

    }
}