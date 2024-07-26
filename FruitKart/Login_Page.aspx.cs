using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

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
                    FormsAuthentication.RedirectFromLoginPage(roletype, true);
                    Response.Redirect("Admin_Home.aspx");
                }
                else if(roletype=="user")
                {
                    FormsAuthentication.RedirectFromLoginPage(roletype, false);
                    Response.Redirect("User_Home.aspx");
                }
                else
                {
                    Label1.Text = "Invalid User";
                }
            }
            else
            {
                Label1.Text = "Invalid User";
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Registration.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin_Registration.aspx");
        }
    }
}