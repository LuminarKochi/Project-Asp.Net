using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class Category : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string p = "~/catimg/" + FileUpload1.FileName;
            FileUpload1.SaveAs(MapPath(p));
            string catadd = "insert into category_tb values('" + TextBox1.Text + "','" + p + "','" + TextBox2.Text + "','" + DropDownList1.Text + "')";
            int ins = clsobj.Fn_ExeNonQuery(catadd);
            if (ins > 0)
            {
                Label6.Text = "Category Added Successfully";
                string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'Add_Category.aspx'; }, 1500);</script>";
                ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);
            }
            else
            {
                Label6.Text = "Category Not Added";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("View_Category.aspx");
        }
    }
}
