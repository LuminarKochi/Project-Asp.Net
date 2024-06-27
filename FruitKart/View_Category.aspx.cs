using System;
using System.Data;
using System.Web.UI.WebControls;

namespace FruitKart
{
    public partial class View_Category : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Dropdowndata();
                GridData();
            }
            
        }

        public void GridData()
        {
            string sel = "select * from category_tb";
            DataTable dt = clsobj.fn_ExeDataTable(sel);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int getid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
            string del = "delete from category_tb where category_id=" + getid;
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
            TextBox txtname = (TextBox)GridView1.Rows[i].FindControl("TextBoxNameEdit");
            FileUpload image = (FileUpload)GridView1.Rows[i].FindControl("FileUpload2");
            HiddenField hiddenImagePath = (HiddenField)GridView1.Rows[i].FindControl("HiddenFieldImagePathEdit");
            TextBox txtdes = (TextBox)GridView1.Rows[i].FindControl("TextBoxDescEdit");
            DropDownList dpd = (DropDownList)GridView1.Rows[i].FindControl("DropDownList2");

            string path = hiddenImagePath.Value;
            if (image.HasFile)
            {
                // Save the uploaded file
                path = "~/catimgnew/" + image.FileName;
                image.SaveAs(Server.MapPath(path));
            }

            string strup = "update category_tb set category_name='" + txtname.Text + "', category_image='" + path + "', category_description='" + txtdes.Text + "', category_status='" + dpd.SelectedValue + "' where category_id=" + getid;
            clsobj.Fn_ExeNonQuery(strup);
            GridView1.EditIndex = -1;
            GridData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridData();
        }
        public void Dropdowndata()
        {
            string strsel = "select category_id,category_name from category_tb";
            DataSet ds = clsobj.fn_ExeDataSet(strsel);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "category_name";
            DropDownList1.DataValueField = "category_id";
            DropDownList1.DataBind();
           // DropDownList1.Items.Insert(0, "-select-");
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string sel = "select * from category_tb where category_id=" + DropDownList1.SelectedValue + "";
            DataTable dt = clsobj.fn_ExeDataTable(sel);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}
