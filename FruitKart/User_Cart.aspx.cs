using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class User_Cart : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridData();
                GrandTotal();
            }
        }

        public void GridData()
        {
            string sel = "SELECT c.cart_id, c.user_id, c.product_id, p.product_name, p.product_image, c.quantity, p.product_price, " +
                         "(CAST(c.quantity AS INT) * CAST(p.product_price AS DECIMAL(18, 2))) AS total_price " +
                         "FROM cart_tb c INNER JOIN product_tb p ON c.product_id = p.product_id " +
                         "WHERE c.user_id = '" + Session["userid"] + "'";
            DataTable dt = clsobj.fn_ExeDataTable(sel);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int getid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string del = "DELETE FROM cart_tb WHERE cart_id = " + getid;
            clsobj.fn_ExeDataTable(del);
            GridData();
            GrandTotal(); // Update grand total after deleting a row
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int i = e.RowIndex;
            int getid = Convert.ToInt32(GridView1.DataKeys[i].Value);
            TextBox quantity = (TextBox)GridView1.Rows[i].FindControl("TextBox1");
            int newQuantity = Convert.ToInt32(quantity.Text);

            // Check if the new quantity exceeds the stock
            int total_qty = Stock_fetch(getid);
            if (newQuantity > total_qty)
            {
                // Registering a script to show an alert box
                string script = "alert('Quantity exceeds stock: Only " + total_qty + " items are available');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "QtyExceedsStock", script, true);
            }
            else
            {
                // Fetch price and quantity from the database
                var price = Price_fetch(getid);

                int newTotalPrice = newQuantity * price;

                // Build update query using concatenated values
                string strup = "UPDATE cart_tb SET quantity = " + newQuantity + ", total = " + newTotalPrice + " WHERE cart_id = " + getid;
                clsobj.Fn_ExeNonQuery(strup);
                GridView1.EditIndex = -1;
                GridData();
                GrandTotal(); // Recalculate the grand total after updating the quantity
            }
        }

        public void GrandTotal()
        {
            string sel = "SELECT SUM(total) FROM cart_tb WHERE user_id = '" + Session["userid"] + "'";
            string grandTotal = clsobj.Fn_ExeScalar(sel);
            Label4.Text = grandTotal != null ? grandTotal : "0";
        }

        public int Price_fetch(int getid)
        {
            string sel = "SELECT p.product_price, c.quantity FROM product_tb p INNER JOIN cart_tb c ON p.product_id = c.product_id WHERE c.cart_id = " + getid + " AND c.user_id = '" + Session["userid"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            int price = 0;
            if (dr.Read())
            {
                price = Convert.ToInt32(dr["product_price"].ToString());
            }
            dr.Close();
            return price;
        }

        public int Stock_fetch(int getid)
        {
            string sel = "SELECT p.stock FROM product_tb p INNER JOIN cart_tb c ON p.product_id = c.product_id WHERE c.cart_id = " + getid + " AND c.user_id = '" + Session["userid"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            int total_qty = 0;
            if (dr.Read())
            {
                total_qty = Convert.ToInt32(dr["stock"].ToString());
            }
            dr.Close();
            return total_qty;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Retrieve all cart_ids for the current user
            string sel = "SELECT cart_id FROM cart_tb WHERE user_id='" + Session["userid"] + "'";
            List<int> cartIds = new List<int>();

            // Use ConnectionClass to execute the SQL query
            SqlDataReader reader = clsobj.fn_ExeReader(sel);

            while (reader.Read())
            {
                int cartId = Convert.ToInt32(reader["cart_id"]);
                cartIds.Add(cartId);
            }

            reader.Close();
            int user_id = 0, product_id = 0, quantity = 0, total = 0;
            // Process each cart_id and its details
            foreach (int cartId in cartIds)
            {
                // Fetch cart details for the current cart_id
                string sel1 = "SELECT user_id, product_id, quantity, total FROM cart_tb WHERE cart_id=" + cartId + " AND user_id='" + Session["userid"] + "'";
                SqlDataReader dr = clsobj.fn_ExeReader(sel1);

                
                if (dr.Read())
                {
                    user_id = Convert.ToInt32(dr["user_id"]);
                    product_id = Convert.ToInt32(dr["product_id"]);
                    quantity = Convert.ToInt32(dr["quantity"]);
                    total = Convert.ToInt32(dr["total"]);

                    // Insert order details into the order_tb
                    string ins = "INSERT INTO order_tb VALUES (" + user_id + ", " + product_id + ", " + quantity + ", " + total + ", 'order', '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "')";

                    int x = clsobj.Fn_ExeNonQuery(ins);

                    // Delete item from cart_tb if order insertion is successful
                    if (x > 0)
                    {
                        string del = "DELETE FROM cart_tb WHERE cart_id=" + cartId;
                        clsobj.Fn_ExeNonQuery(del);
                    }
                    else
                    {
                        Response.Write("<script>alert('Order not placed')</script>");
                    }
                }

                dr.Close();
            }
            // Redirect to User_Home.aspx after processing orders
            Bill_Tb_Insert();
        }
        //calling bill_tb_insert function
        public void Bill_Tb_Insert()
        {
            string sel = "select MAX(bill_id) from bill_tb";
            string billid = clsobj.Fn_ExeScalar(sel);
            int bill_id = 0;
            if (billid == "")
            {
                bill_id = 1;
            }
            else
            {
                int newbillid = Convert.ToInt32(billid);
                bill_id = newbillid + 1;
            }
            int total = Fetch_Sum();
            string ins= "insert into bill_tb values("+bill_id+",'"+Session["userid"]+"',"+total+",'" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "')";
            clsobj.Fn_ExeNonQuery(ins);
            Response.Redirect("User_BillPage.aspx");
        }
        public int Fetch_Sum()
        {
            string sel = "SELECT SUM(sub_total) FROM order_tb WHERE user_id = '" + Session["userid"] + "' AND order_date = '" + DateTime.Now.Date.ToString("yyyy-MM-dd") + "'";
            string sum = clsobj.Fn_ExeScalar(sel);
            return string.IsNullOrEmpty(sum) ? 0 : Convert.ToInt32(sum);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Home.aspx");
        }
    }
}
