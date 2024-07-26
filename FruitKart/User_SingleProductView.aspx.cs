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
    public partial class User_SingleProductView : System.Web.UI.Page
    {
        ConnectionClass clsobj=new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string sel = "select * from product_tb where product_id='" + Session["SelectedProductId"] + "'";
                SqlDataReader dr = clsobj.fn_ExeReader(sel);
                while (dr.Read())
                {
                    Image1.ImageUrl = dr["product_image"].ToString();
                    Label1.Text = dr["product_name"].ToString();
                    Label2.Text = dr["product_price"].ToString();
                    Label3.Text = dr["product_description"].ToString();
                   // int quantity = Convert.ToInt32(dr["stock"].ToString());
                }

            }
        }
        public int Quantity_Fetch()
        {
            int quantity = 0;
            string sel = "select stock from product_tb where product_id='" + Session["SelectedProductId"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            while (dr.Read())
            {
                quantity = Convert.ToInt32(dr["stock"].ToString());
            }
            return quantity;
        }
        public int Price_Fetch()
        {
            int price = 0;
            string sel = "select product_price from product_tb where product_id='" + Session["SelectedProductId"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            while (dr.Read())
            {
                price = Convert.ToInt32(dr["product_price"].ToString());
            }
            return price;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int qty = Quantity_Fetch(); // total stock available
            int price = Price_Fetch(); // price of product
            Session["price"] = price;
            int quantity = Convert.ToInt32(TextBox1.Text); // user entered quantity
            if (quantity > qty)
            {
                Label5.Text="Only "+qty+" items are available";
            }
            else
            {
                int total=price*quantity;
                // Check if the product is already in the cart
                string checkProductInCart = "SELECT cart_id, quantity FROM cart_tb WHERE user_id = '" + Session["userid"] + "' AND product_id = '" + Session["SelectedProductId"] + "'";
                SqlDataReader dr = clsobj.fn_ExeReader(checkProductInCart);
                if (dr.Read())
                {
                    // Product is already in the cart, update the quantity
                    int existingCartId = Convert.ToInt32(dr["cart_id"]);
                    int existingQuantity = Convert.ToInt32(dr["quantity"]);
                    int newQuantity = existingQuantity + quantity;
                    int newTotal = price * newQuantity;

                    string updateCart = "UPDATE cart_tb SET quantity = " + newQuantity + ", total = " + newTotal + " WHERE cart_id = " + existingCartId;
                    clsobj.Fn_ExeNonQuery(updateCart);
                }
                else
                {
                     string sel = "select max(cart_id) from cart_tb";
                     string cartid = clsobj.Fn_ExeScalar(sel);
                     int cart_id = 0;
                     if (cartid == "")
                     {
                         cart_id = 1;
                     }
                     else
                     {
                      int newcartid = Convert.ToInt32(cartid);
                      cart_id = newcartid + 1;
                      }
                      string ins = "insert into cart_tb values(" + cart_id + "," + Session["userid"] + "," + Session["SelectedProductId"] +",'"+quantity+"','"+total+"')";
                      clsobj.Fn_ExeNonQuery(ins);
                }
                Response.Redirect("User_Cart.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Home.aspx");
        }
    }
}