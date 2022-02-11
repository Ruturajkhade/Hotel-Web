using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand mycomm;

        if (txtgnm.Text == "")
        {
            Response.Write("<script>alert('Enter Guest Name')</script>");
            return;
        }

        if (txtgadd.Text == "")
        {
            Response.Write("<script>alert('Enter Guest Address')</script>");
            return;
        }

        if (txtcity.Text == "")
        {
            Response.Write("<script>alert('Enter City')</script>");
            return;
        }

        if (txtstate.Text == "")
        {
            Response.Write("<script>alert('Enter State')</script>");
            return;
        }

        if (txtphone.Text == "")
        {
            Response.Write("<script>alert('Enter Phone')</script>");
            return;
        }

        if (txtemail.Text == "")
        {
            Response.Write("<script>alert('Enter Email')</script>");
            return;
        }
        else
        {
            string tsql1;
            SqlCommand cmd = new SqlCommand();
            myconn.Open();
            tsql1 = "select COUNT(id) FROM signup where Username='" + txtemail.Text.ToString() + "'";
            cmd = new SqlCommand(tsql1, myconn);
            string cntID = cmd.ExecuteScalar().ToString();
            myconn.Close();
            if (cntID == "1")
            {
                Response.Write("<script>alert('Email Already Present. Try Another!')</script>");
                return;
            }         
        }

        if (txtpass.Text == "")
        {
            Response.Write("<script>alert('Enter Password')</script>");
            return;
        }

        if (ddlgender.SelectedValue == "0")
        {
            Response.Write("<script>alert('Select Gender')</script>");
            return;
        }

        //Name,Address,City,State,Phone,Username,Password,Image,gender,country,UserType
        string qr = "insert into signup(Name,Address,City,State,Phone,Username,Password,gender,country,UserType) values('" + txtgnm.Text + "','" + txtgadd.Text+ "','" + txtcity.Text + "','" + txtstate.Text + "','" + txtphone.Text + "','" + txtemail.Text + "','" + txtpass.Text + "','" + ddlgender.SelectedItem.ToString() + "','India','normal')";
        myconn.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = qr;
        cmd1.Connection = myconn;
        int res = cmd1.ExecuteNonQuery();
        myconn.Close();

        if (res == 1)
        {
            clearcontrols();
            Response.Write("<script>alert('Success! You are successfully Register.')</script>");
        }
        else
        {
            Response.Write("<script>alert('Server Error!')</script>");
        }
    }

    protected void clearcontrols()
    {
        txtgnm.Text = "";
        txtgadd.Text = "";
        txtcity.Text = "";
        txtstate.Text = "";;
        txtphone.Text = "";
        txtemail.Text = "";
        txtpass.Text = "";
        ddlgender.SelectedValue = "0";
    }
}