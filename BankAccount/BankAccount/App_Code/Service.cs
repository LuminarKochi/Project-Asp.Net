using System;
using System.ServiceModel;
using System.Data.SqlClient;
using System.Activities.Statements;

public class Service : IService
{
    SqlConnection con;
    SqlCommand cmd;

    // Constructor to initialize the SqlConnection
    public Service()
    {
        con = new SqlConnection(@"server=DESKTOP-RBMGJPL\SQLEXPRESS01;database=FruitKart;Integrated security=true");
    }

    public string GetData(int value)
    {
        return string.Format("You entered: {0}", value);
    }

    public int AddAccount(string userid, string AccountNumber, string AccountType, int Amount)
    {
        // Construct the SQL query using string interpolation
        string ins ="insert into account_tb values(" + userid + ",'" + AccountNumber + "','" + AccountType + "'," + Amount + ")";

        cmd = new SqlCommand(ins, con);

        con.Open();
        int x = cmd.ExecuteNonQuery(); // Execute the command

        // Ensure the connection is closed
        con.Close();

        if (x > 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }

    public int Acoount_number_fetch(string userid,string txtbox1)
    {
        string sel = "select account_number from account_tb where user_id='" + userid + "' and account_number='"+txtbox1+"'";
        cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            int account_number = Convert.ToInt32(dr["account_number"]);
            return account_number;
        }
        else
        {
            return 0;
        }
        con.Close();
    }
    public string Amount_fetch(string userid)
    {
       // string sel = "SELECT a.savings_amount, o.sub_total FROM account_tb a INNER JOIN order_tb o ON a.user_id = o.user_id WHERE a.user_id = '" + userid + "'";
       string sel= "select SUM(sub_total) from order_tb where user_id='"+userid+"' and order_status='order'";
        cmd = new SqlCommand(sel, con);
        con.Open();
        string sub_total = cmd.ExecuteScalar().ToString();
        con.Close();
        return sub_total;
    }
    public string Balance_fetch(string userid)
    {
        string sel = "select savings_amount from account_tb where user_id='" + userid + "'";
        cmd = new SqlCommand(sel, con);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        string savings_amount = string.Empty;
        if (dr.Read())
        {
            savings_amount = dr["savings_amount"].ToString();
        }
        return savings_amount;
        con.Close();
    }

public CompositeType GetDataUsingDataContract(CompositeType composite)
    {
        if (composite == null)
        {
            throw new ArgumentNullException("composite");
        }
        if (composite.BoolValue)
        {
            composite.StringValue += "Suffix";
        }
        return composite;
    }
}
