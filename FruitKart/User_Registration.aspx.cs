using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class User_Registration : System.Web.UI.Page
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
                reg_id = 1001;
            }
            else
            {
                int newregid=Convert.ToInt32(regid);
                reg_id = newregid + 1;
            }
            string ins = "insert into user_reg_tb values("+reg_id+",'"+TextBox1.Text+"','"+TextBox2.Text+"',"+TextBox3.Text+",'"+TextBox4.Text+ "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "'," + TextBox8.Text + ")";
            int i=clsobj.Fn_ExeNonQuery(ins);
            if (i == 1)
            {
                string inslog = "insert into log_tb values("+reg_id+",'"+TextBox9.Text+"','"+TextBox10.Text+ "','user','active')";
                int j=clsobj.Fn_ExeNonQuery(inslog);
                if (j == 1)
                {
                    Label1.Text = "Registration Successfull";
                }
                else
                {
                    Label1.Text = "Registration Failed";
                }
            }
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {
            string sel = "select count(log_id) from log_tb where username = '" + TextBox9.Text + "'";
            string s = clsobj.Fn_ExeScalar(sel);
            if (s != "0")
            {
                Label1.Text = "User ID already exist";
                //Add JavaScript to introduce a delay before redirecting
                string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'User_Registration.aspx'; }, 1500);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
            }
        }
    }
}