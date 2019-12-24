using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSiteBanHang
{
    public partial class DangNhapChinh : System.Web.UI.Page
    {
        string str;
        protected void Page_Load(object sender, EventArgs e)
        {
            //Kết nối CSDL
           str = @"	workstation id=banhang2.mssql.somee.com;packet size=4096;user id=NMK;pwd=01686739610;data source=banhang2.mssql.somee.com;persist security info=False;initial catalog=banhang2";
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

        /*Button html đăng nhập sử dụng phương thức onserverclick */
        protected void FancyBtn_Click(object sender, EventArgs e)
        {
           
            string ten = this.user.Value;
            string matkhau = this.pass.Value;
            string sql = "select * from khachhang where tendangnhap='" + ten + "' and matkhau='" + GetMD5(matkhau) + "'";
            DataTable dt = new DataTable();
            if (ten == "")
            {
                this.Label1.Text = "Vui lòng nhập thông tin!";
                return;
            }
            try
            {
                SqlDataAdapter da = new SqlDataAdapter(sql, str);
                da.Fill(dt);
            }
            catch (SqlException err) { Response.Write(err.Message); }
            if (dt.Rows.Count != 0)
            {
                Response.Cookies["tendangnhap"].Value = ten;
                Server.Transfer("Default.aspx");
            }
            else this.Label1.Text = "Tên đăng nhập hoặc mật khẩu sai! Vui lòng nhập lại.";
        }

        /*Chuyển qua form đăng ký*/
        protected void FancyBtn_Click1(object sender, EventArgs e)
        {
            Server.Transfer("DangKy.aspx");
        }
    }
}