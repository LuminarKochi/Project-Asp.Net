using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class Add_Product : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dropdowndata();
            }
        }
        public void Dropdowndata()
        {
            string strsel = "select category_id,category_name from category_tb";
            DataSet ds = clsobj.fn_ExeDataSet(strsel);
            DropDownList1.DataSource = ds;
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "category_name";
            DropDownList1.DataValueField = "category_id";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string p = "~/prodimg/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(p));
            string categoryId = DropDownList1.SelectedValue;
            string str = "insert into product_tb values(" + categoryId + ",'"+TextBox1.Text+"','"+p+"','" + TextBox2.Text+"','"+TextBox3.Text+"','"+convertQuotes(TextBox4.Text)+"','"+DropDownList2.Text+"')";
            int i=clsobj.Fn_ExeNonQuery(str);
            if (i > 0)
            {
                Label1.Text = "Product Added Successfully";
            }
            else
            {
                Label1.Text = "Product Not Added";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Product.aspx");
        }

        public string convertQuotes(string str)
        {
            return str.Replace("'", "''");
        }
    }
}