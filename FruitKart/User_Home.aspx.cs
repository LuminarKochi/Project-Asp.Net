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
    public partial class User_Home : System.Web.UI.Page
    {
        ConnectionClass clsobj=new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Datalistdata();
                //cart_number_fetch();
            }
        }
        public void Datalistdata()
        {
            string sel = "select * from category_tb";
            DataTable dt=clsobj.fn_ExeDataTable(sel);
            DataList1.DataSource = dt;
            DataList1.DataBind();
        }
        //public void cart_number_fetch()
        //{
        //    string sel = "SELECT COUNT(cart_id) FROM cart_tb WHERE user_id='" + Session["userid"] + "'";
        //    string cart_count = clsobj.Fn_ExeScalar(sel);

        //    // Assuming you have a Literal control named CartCountLiteral on the page
        //    //CartCountLiteral.Text = cart_count;
        //}

        protected void ImageButton1_Command(object sender, CommandEventArgs e)
        {
            int categoryid=Convert.ToInt32(e.CommandArgument);
            Session["SelectedCategoryId"] = categoryid;
            Response.Redirect("User_ProductView.aspx");
        }
    }
}