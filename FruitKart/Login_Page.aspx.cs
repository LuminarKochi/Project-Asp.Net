using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class Admin_Registration : System.Web.UI.Page
    {
        ConnectionClass clsobj=new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string str = "select count(reg_id) from log_tb where username ='"+TextBox1.Text+"' and password ='"+TextBox2.Text+"'";
            string cid=clsobj.Fn_ExeScalar(str);
            int cid1=Convert.ToInt32(cid);
            if (cid1 == 1)
            {
                string str1 = "select reg_id from log_tb where username ='" + TextBox1.Text + "' and password ='" + TextBox2.Text + "'";
                string regid=clsobj.Fn_ExeScalar(str1);
                Session["userid"] = regid;

                string str2 = "select role from log_tb where username ='" + TextBox1.Text + "' and password ='" + TextBox2.Text + "'";
                string roletype = clsobj.Fn_ExeScalar(str2);
                if (roletype == "admin")
                {
                    Response.Redirect("Admin_Home.aspx");
                }
                else
                {
                    Response.Redirect("index.html");
                }
            }

        }
    }
}