using System;
using System.Data.SqlClient;

namespace FruitKart
{
    public partial class User_MyAccount : System.Web.UI.Page
    {
        ConnectionClass clsobj = new ConnectionClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Fetch_AccountDetails();
            }
        }

        public void Fetch_AccountDetails()
        {
            Label3.Visible = true;
            Label4.Visible = true;
            Label5.Visible = true;
            Button2.Visible = true;
            Label6.Visible = false;
            Label7.Visible = false;
            TextBox1.Visible = false;
            Button3.Visible = false;

            string selcount = "select count(account_id) from account_tb where user_id='" + Session["userid"] + "'";
            string count = clsobj.Fn_ExeScalar(selcount);

            if (count == "1")
            {
                string sel = "select * from account_tb where user_id='" + Session["userid"] + "'";
                SqlDataReader dr = clsobj.fn_ExeReader(sel);
                if (dr.Read())
                {
                    Label3.Text = dr["account_number"].ToString();
                    Label4.Text = dr["account_type"].ToString();
                    Label5.Text = dr["savings_amount"].ToString();
                }
                dr.Close();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('You have not created an account yet.');", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            Label4.Visible = false;
            Label5.Visible = false;
            Button2.Visible = false;
            Label6.Visible = true;
            Label7.Visible = true;
            TextBox1.Visible = true;
            Button3.Visible = true;

            string sel = "select * from account_tb where user_id='" + Session["userid"] + "'";
            SqlDataReader dr = clsobj.fn_ExeReader(sel);
            if (dr.Read())
            {
                Label6.Text = dr["account_number"].ToString();
                Label7.Text = dr["account_type"].ToString();
                TextBox1.Text = dr["savings_amount"].ToString();
            }
            dr.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string strup = "update account_tb set savings_amount='" + TextBox1.Text + "' where user_id='" + Session["userid"] + "'";
            clsobj.Fn_ExeNonQuery(strup);
            Label1.Text = "Amount Updated Successfully";
            Fetch_AccountDetails();
            string script = "<script type=\"text/javascript\">setTimeout(function(){ window.location = 'User_InvoicePage.aspx'; }, 1500);</script>";
            ClientScript.RegisterStartupScript(this.GetType(), "Redirect", script);

        }
    }
}
