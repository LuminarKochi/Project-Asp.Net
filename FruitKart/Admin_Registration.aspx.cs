using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class Admin_Registration1 : System.Web.UI.Page
    {
        ConnectionClass clsobj=new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sel = "select max(reg_id) from log_tb";
            string regid=clsobj.Fn_ExeScalar(sel);
            int reg_id = 0;
            if (regid == "")
            {
                reg_id = 1;
            }
            else
            {
                int newregid = Convert.ToInt32(regid);
                reg_id=newregid+1;
            }
            string ins = "insert into admin_reg_tb values("+reg_id+",'"+TextBox1.Text+"','"+TextBox2.Text+"')";
            int i = clsobj.Fn_ExeNonQuery(ins);
            if (i == 1)
            {
                string inslog = "insert into log_tb values("+reg_id+",'"+TextBox3.Text+"','"+TextBox4.Text+ "','admin','active')";
                int j = clsobj.Fn_ExeNonQuery(inslog);
                if (j == 1)
                {
                    Label1.Text = "Registration Successfully";
                }
                else
                {
                    Label1.Text = "Registration Failed";
                }
            }
        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            string sel = "select count(log_id) from log_tb where username = '"+TextBox3.Text+"'";
            string s = clsobj.Fn_ExeScalar(sel);
            if (s != "0")
            {
               Label1.Text="Admin ID already exist";
                //Add JavaScript to introduce a delay before redirecting
                string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'Admin_Registration.aspx'; }, 1000);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
            }
        }
    }
}