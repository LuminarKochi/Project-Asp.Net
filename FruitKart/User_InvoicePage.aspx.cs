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
    public partial class User_InvoicePage : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Get_Amount();
                Get_Balance();
            }
        }

        public void Get_Amount()
        {
            string userid = Session["userid"].ToString();
            ServiceBank.ServiceClient obj = new ServiceBank.ServiceClient();
            string amount = obj.Amount_fetch(userid);
            Label5.Text = amount;
        }

        public void Get_Balance()
        {
            string userid = Session["userid"].ToString();
            ServiceBank.ServiceClient obj = new ServiceBank.ServiceClient();
            Label6.Text = obj.Balance_fetch(userid);
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();
            string txtbox1 = TextBox1.Text;
            int txt = Convert.ToInt32(TextBox1.Text);
            ServiceBank.ServiceClient obj = new ServiceBank.ServiceClient();
            int s = obj.Acoount_number_fetch(userid, txtbox1);
            if (s != txt)
            {
                Label7.Text = "Account number not found";
            }
            else
            {
                Label7.Text = "Account number found";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strup1 = "update order_tb set order_status='pending' where user_id='" + Session["userid"] + "' and order_status='order'";
            clsobj.Fn_ExeNonQuery(strup1);
            Response.Redirect("User_Home.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SavingAmount_update();
            Stock_Update();
            ClientScript.RegisterStartupScript(this.GetType(), "OrderSuccess", "document.getElementById('successAlert').style.display='block';", true);
            string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'User_Feedback.aspx'; }, 2000);</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
        }

        public void Stock_Update()
        {
            string sel = "select product_id, quantity from order_tb where user_id='" + Session["userid"] + "' and order_status='order'";
            DataTable dt = clsobj.fn_ExeDataTable(sel);

            if (dt.Rows.Count == 0)
            {
                Response.Redirect("User_Home.aspx");
            }
            else
            {
                foreach (DataRow row in dt.Rows)
                {
                    int productId = Convert.ToInt32(row["product_id"]);
                    int quantity = Convert.ToInt32(row["quantity"]);
                    string strup = "update product_tb set stock = stock - " + quantity + " where product_id = " + productId;
                    clsobj.Fn_ExeNonQuery(strup);
                }
                string strup1 = "update order_tb set order_status='paid' where user_id='" + Session["userid"] + "' and order_status='order'";
                clsobj.Fn_ExeNonQuery(strup1);
            }
        }

        public void SavingAmount_update()
        {
            string sel = "select SUM(sub_total) from order_tb where order_status='order' and user_id='" + Session["userid"] + "'";
            string tot = clsobj.Fn_ExeScalar(sel);
            int total = Convert.ToInt32(tot);
            string sel1 = "select savings_amount from account_tb where user_id='" + Session["userid"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel1);
            int sav = 0;
            if (dr.Read())
            {
                sav = Convert.ToInt32(dr["savings_amount"]);
            }
            if (total <= sav)
            {
                string strup = "update account_tb set savings_amount= savings_amount - " + tot + " where user_id='" + Session["userid"] + "'";
                clsobj.Fn_ExeNonQuery(strup);
            }
            else
            {
                Label1.Text = "Order can't be placed due to insufficient savings amount";
            }
        }
    }
}
