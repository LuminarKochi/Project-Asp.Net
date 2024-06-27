using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class View_Product : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dropdowndata();
                // No need to call GridData() here on initial load
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // Always bind GridView data during Page_Init to ensure events (like GridView events) are handled correctly
            GridData();
        }

        public void GridData()
        {
            // Initially load all products
            string sel = "SELECT p.product_id, p.category_id, c.category_name, p.product_name, p.product_image, p.product_price, p.product_description, p.stock, p.product_status FROM product_tb p JOIN category_tb c ON p.category_id = c.category_id";
            DataTable dt = clsobj.fn_ExeDataTable(sel);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int getid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string del = "DELETE FROM product_tb WHERE product_id = " + getid;
            clsobj.Fn_ExeNonQuery(del);
            GridData();
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
            TextBox productname = (TextBox)GridView1.Rows[i].FindControl("TextBox1");
            FileUpload productimage = (FileUpload)GridView1.Rows[i].FindControl("FileUpload1");
            HiddenField hiddenImagePath = (HiddenField)GridView1.Rows[i].FindControl("HiddenFieldImagePathEdit");
            TextBox productprice = (TextBox)GridView1.Rows[i].FindControl("TextBox2");
            TextBox productdescription = (TextBox)GridView1.Rows[i].FindControl("TextBox3");
            TextBox productstock = (TextBox)GridView1.Rows[i].FindControl("TextBox4");
            DropDownList productstatus = (DropDownList)GridView1.Rows[i].FindControl("DropDownList2");

            string path = hiddenImagePath.Value;
            if (productimage.HasFile)
            {
                path = "~/prodimgnew/" + productimage.FileName;
                productimage.SaveAs(Server.MapPath(path));
            }

            string strup = "UPDATE product_tb SET product_name = '" + productname.Text + "', product_image = '" + path + "', product_price = '" + productprice.Text + "', product_description = '" + productdescription.Text + "', stock = '" + productstock.Text + "', product_status = '" + productstatus.SelectedValue + "' WHERE product_id = " + getid;
            clsobj.Fn_ExeNonQuery(strup);
            GridView1.EditIndex = -1;
            GridData();
        }

        public void Dropdowndata()
        {
            string strsel = "SELECT category_id, category_name FROM category_tb";
            DataSet ds = clsobj.fn_ExeDataSet(strsel);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "category_name";
            DropDownList1.DataValueField = "category_id";
            DropDownList1.DataBind();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Load products based on selected category
            string sel = "SELECT p.product_id, p.category_id, c.category_name, p.product_name, p.product_image, p.product_price, p.product_description, p.stock, p.product_status FROM product_tb p JOIN category_tb c ON p.category_id = c.category_id WHERE p.category_id = " + DropDownList1.SelectedValue;
            DataTable dt = clsobj.fn_ExeDataTable(sel);

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
