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
    public partial class User_ProductView : System.Web.UI.Page
    {
        ConnectionClass clsobj=new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Datalistdata();
                HeaderName();
            }
        }
        public void Datalistdata()
        {
            string sel = "select * from product_tb where category_id='" + Session["SelectedCategoryId"] + "'";
            DataTable dt = clsobj.fn_ExeDataTable(sel);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        public void HeaderName()
        {
            string sel = "select category_name from category_tb where category_id='" + Session["SelectedCategoryId"] + "'";
            string catname = "";
            // Execute the query and handle SqlDataReader
            SqlDataReader reader = clsobj.fn_ExeReader(sel);
            if (reader.Read())
            {
                catname = reader["category_name"].ToString();
            }
            reader.Close(); // Close the reader after use
            Label1.Text = catname;
        }

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int productid = Convert.ToInt32(e.CommandArgument);
            Session["SelectedProductId"] = productid;
            Response.Redirect("User_SingleProductView.aspx");
        }
    }
}