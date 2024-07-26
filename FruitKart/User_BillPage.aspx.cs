using System;
using System.Data.SqlClient;

namespace FruitKart
{
    public partial class User_BillPage : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Bill_Details1();
                Bill_Details2();
                Bill_Details3();
            }
        }

        public void Bill_Details1()
        {
            string sel = "SELECT firstname + ' ' + lastname AS Name, address, email, phonenumber, city, state, pincode FROM user_reg_tb WHERE user_id = " + Session["userid"];
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            if (dr.Read())
            {
                NAME.Text = dr["Name"].ToString();
                ADDRESS.Text = dr["address"].ToString();
                EMAIL.Text = dr["email"].ToString();
                PHONE.Text = dr["phonenumber"].ToString();
                CITY.Text = dr["city"].ToString();
                STATE.Text = dr["state"].ToString();
                PINCODE.Text = dr["pincode"].ToString();
            }
            dr.Close();
        }

        public void Bill_Details2()
        {
            string sel = "SELECT p.product_name, o.quantity, o.sub_total FROM order_tb o JOIN product_tb p ON o.product_id = p.product_id WHERE o.user_id = " + Session["userid"] + " AND o.order_date = '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and o.order_status='order'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            PRODUCTS.Text = ""; // Clear any existing text
            while (dr.Read())
            {
                PRODUCTS.Text += dr["product_name"].ToString() + " x " + dr["quantity"].ToString() + " = ₹" + dr["sub_total"].ToString() + "<br/>";
            }
            dr.Close();
        }

        public void Bill_Details3()
        {
            //string sel = "SELECT total_amount FROM bill_tb WHERE user_id = " + Session["userid"] + " AND date = '" + DateTime.Now.Date.ToString("yyyy-MM-dd") +  "'";
            string sel1 = "select SUM(sub_total) from order_tb where user_id = " + Session["userid"] + " AND order_date = '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "' and order_status='order' ";
            string grandtotal = clsobj.Fn_ExeScalar(sel1);
           // SqlDataReader dr = clsobj.fn_ExeReader(sel);
            //if (dr.Read())
            //{
            //    decimal totalAmount = Convert.ToDecimal(dr["total_amount"]);
            //    TOTALPRICE.Text = "₹" + totalAmount.ToString("F2") + "/-";
            //}
            //dr.Close();
            decimal totalAmount = Convert.ToDecimal(grandtotal);
            TOTALPRICE.Text = "₹" + totalAmount.ToString("F2") + "/-";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string sel = "select count(account_id) from account_tb where user_id='" + Session["userid"] + "'";
            string count = clsobj.Fn_ExeScalar(sel);
            if (count == "0")
            {
                Response.Redirect("User_AccountCreation.aspx");
            }
            else
            {
                string script = @"
                    <script type='text/javascript'>
                        showCustomConfirm();
                    </script>";
                ClientScript.RegisterStartupScript(this.GetType(), "customConfirmScript", script);
            }
        }
    }
}
