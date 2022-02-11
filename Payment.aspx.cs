using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    //public void saveaddress()
    //{
    //    String updatepass = "insert into OrderAddress(orderid,username,email,mobileno,address,pincode,city,state,country) values('" + Label4.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + DropDownList1.SelectedItem + "','" + DropDownList2.SelectedItem + "','" + DropDownList3.SelectedItem + "')";
    //    String mycon1 = "Data Source=pritam-pc;Initial Catalog=shop;User ID=sa; password=as;";
    //    SqlConnection s = new SqlConnection(mycon1);
    //    s.Open();
    //    SqlCommand cmd1 = new SqlCommand();
    //    cmd1.CommandText = updatepass;
    //    cmd1.Connection = s;
    //    cmd1.ExecuteNonQuery();
    //    s.Close();
    //}

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    DataTable dt;
    //    dt = (DataTable)Session["buyitems"];



    //    for (int i = 0; i <= dt.Rows.Count - 1; i++)
    //    {
    //        //string s1;
    //        //s1 =Convert.ToString(Label5.Text);
    //        String updatepass = "insert into Orderdetails(orderid,srno,productid,productname,grossweight,netweight,size,quantity,price,totalprice,dateoforder) values('" + Label4.Text + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["productid"] + ",'" + dt.Rows[i]["productname"] + "'," + dt.Rows[i]["grossweight"] + "," + dt.Rows[i]["netweight"] + "," + dt.Rows[i]["size"] + "," + dt.Rows[i]["quantity"] + "," + dt.Rows[i]["price"] + "," + dt.Rows[i]["totalprice"] + ", '" + Label5.Text + "')";
    //        String mycon1 = "Data Source=pritam-pc;Initial Catalog=shop;User ID=sa; password=as;";
    //        SqlConnection s = new SqlConnection(mycon1);
    //        s.Open();
    //        SqlCommand cmd1 = new SqlCommand();
    //        cmd1.CommandText = updatepass;
    //        cmd1.Connection = s;
    //        cmd1.ExecuteNonQuery();
    //        s.Close();

    //    }
    //    saveaddress();
    //    Response.Redirect("PlaceSuccessfully.aspx");
    //}

    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    Panel1.Visible = true;
    //    Random random = new Random();
    //    int value = random.Next(1001, 9999);
    //    string destinationaddr = "91" + TextBox3.Text;
    //    string message = "Your OTP to Verify Number is " + value + " ( Sent By : Tambe Jewellers... )";
    //    Label3.Text = message;
    //    String message1 = HttpUtility.UrlEncode(message);

    //    using (var wb = new WebClient())
    //    {
    //        byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
    //            {
    //            {"apikey" , "Tr/6H3G2nyk-ekX9emlO96nTOy5nDrWoDFUaN8E0l4"},
    //            {"numbers" , destinationaddr},
    //            {"message" , message1},
    //            {"sender" , "TXTLCL"}
    //            });
    //        string result = System.Text.Encoding.UTF8.GetString(response);
    //        Session["otp"] = value;
    //        Label19.Text = "" + value;

    //    }
    //}

    //protected void Button3_Click(object sender, EventArgs e)
    //{
    //    if (TextBox6.Text == Session["otp"].ToString())
    //    {
    //        Panel1.Visible = false;
    //        Label18.Text = "Your Mobile Number Has Been Verified Successfully - Thanks";
    //        Button1.Visible = true;
    //        Label17.Visible = false;
    //    }
    //    else
    //    {
    //        Label18.Text = "OTP Number is Not Correct : Your Mobile Number not Verified";
    //        Panel1.Visible = true;
    //    }

    //}

    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Panel3.Visible = false;
    }

    protected void RadioButton2_CheckedChanged(object sender, EventArgs e)
    {
        Panel2.Visible = false;
        Panel3.Visible = true;
    }


}