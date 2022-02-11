using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (txtFnm.Text == "")
        {
            Response.Write("<script>alert('Enter First Name')</script>");
            return;
        }
        if (txtLnm.Text == "")
        {
            Response.Write("<script>alert('Enter Last Name')</script>");
            return;
        }
        if (txtEmail.Text == "")
        {
            Response.Write("<script>alert('Enter Email')</script>");
            return;
        }
        if (txtSub.Text == "")
        {
            Response.Write("<script>alert('Enter Subject')</script>");
            return;
        }
        if (txtMsg.Text == "")
        {
            Response.Write("<script>alert('Enter Message')</script>");
            return;
        }

        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand mycomm;
        string q = "insert into ContactUs values(@FirstName,@LastName,@Email,@Subject,@Message,@TranDate)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@FirstName", txtFnm.Text.ToUpper());
        mycomm.Parameters.AddWithValue("@LastName", txtLnm.Text.ToUpper());
        mycomm.Parameters.AddWithValue("@Email", txtEmail.Text.ToLower());
        mycomm.Parameters.AddWithValue("@Subject", txtSub.Text);
        mycomm.Parameters.AddWithValue("@Message", txtMsg.Text);
        mycomm.Parameters.AddWithValue("@TranDate", System.DateTime.Now.ToString("yyyy-MM-dd"));
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            clear();
            Response.Write("<script>alert('Success! Your feedback has been Successfully Saved.')</script>");
        }
        else
        {
            Response.Write("<script>alert('Server Error')</script>");
        }
    }

    public void clear()
    {
        txtFnm.Text = "";
        txtLnm.Text = "";
        txtEmail.Text = "";
        txtSub.Text = "";
        txtMsg.Text = "";
    }
}