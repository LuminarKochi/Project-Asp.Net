using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace FruitKart
{
    public partial class User_AccountCreation : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();
            ServiceBank.ServiceClient obj = new ServiceBank.ServiceClient();
            int s = obj.AddAccount(userid, TextBox1.Text, DropDownList1.Text, Convert.ToInt32(TextBox2.Text));
            if (s == 1)
            {
                Label2.Text = "Account Created Successfully";
                Label2.CssClass = "success-message";
                string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'User_InvoicePage.aspx'; }, 1500);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
            }
            else
            {
                Label2.Text = "Account Creation Failed";
                Label2.CssClass = "error-message";
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string sel = "select count(account_id) from account_tb where account_number='" + TextBox1.Text + "'";
            string s = clsobj.Fn_ExeScalar(sel);
            if (s != "0")
            {
                Label1.Text = "Account Number Already Exists";
                Label1.CssClass = "error-message";
                string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'User_AccountCreation.aspx'; }, 1500);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
            }
        }
    }
}
