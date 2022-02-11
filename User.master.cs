using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class MasterPage_1 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null)
        {
            lblUsrNm.Text = "Guest";
            lnkLogIn.Visible = true;
            lnkLogOut.Visible = false;
        }
        else
        {
            if (Session["ut"] == "normal")
            {
                lblUsrNm.Text = Session["nm"].ToString(); //reading from session
                lnkLogOut.Visible = true;
                lnkLogIn.Visible = false;
                //lnkSignIn.Visible = false;
            }
            else
            {
                Response.Redirect("login.aspx");                
            }
        }

        //if (Session["ut"].ToString() == "admin")
        //{
        //    Response.Redirect("Login.aspx");
        //}

        StringBuilder htmlTable = new StringBuilder();
        SqlConnection myconn1, myconn2;
        SqlCommand mycomm1, mycomm2;
        myconn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        myconn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q1 = "select * from addcat";
        mycomm1 = new SqlCommand(q1, myconn1);
        myconn1.Open();
        SqlDataReader myreader1;
        myreader1 = mycomm1.ExecuteReader();
        if (myreader1.HasRows)
        {
            while (myreader1.Read())
            {
                htmlTable.Append("<li class='has-dropdown'>");
                htmlTable.Append("<a href='displaysubcategory.aspx?cid=" + myreader1["catid"].ToString() + "'>" + myreader1["catname"].ToString() + "</a>");
                string q2 = "select * from addsubcat where catid=@catid order by SubCatID desc";
                mycomm2 = new SqlCommand(q2, myconn2); 
                mycomm2.Parameters.AddWithValue("@catid", myreader1["catid"].ToString());
                myconn2.Open();
                SqlDataReader myreader2;
                myreader2 = mycomm2.ExecuteReader();
                //if (myreader2.HasRows)
                //{
                //    while (myreader2.Read())
                //    {
                //        htmlTable.Append("<ul class='dropdown'>");                        
                //        htmlTable.Append("<li>" + "<a href='displayproducts.aspx?cid=" + myreader2["subcatid"].ToString() + "'>" + myreader2["subcatname"].ToString() + "</a>" + "</li>");
                //        htmlTable.Append("<hr></ul>");
                //    }
                //}
                myreader2.Close();
                myreader2.Dispose();
                myconn2.Close();
                htmlTable.Append("</li>");
            }
        }
        myreader1.Close();
        myreader1.Dispose();
        myconn1.Close();
        PlaceHolder1.Controls.Add(new Literal { Text = htmlTable.ToString() });
    }
}