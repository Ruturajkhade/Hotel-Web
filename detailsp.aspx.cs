using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class detailsp : System.Web.UI.Page
{
    StringBuilder htmlTable = new StringBuilder();
    StringBuilder htmlTable2 = new StringBuilder();
    string pic;

    protected void Page_Load(object sender, EventArgs e)
    {
        double dis = 0, orgcost = 0;
        SqlConnection myconn;
        SqlCommand mycomm;
        myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        string q = "SELECT rate, description, productimage, productid, productname, discount,maxperson FROM addproduct WHERE (addproduct.productid = @pid)";
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@pid", Request.QueryString["pid"]);
        myconn.Open();
        SqlDataReader myreader = mycomm.ExecuteReader();
        if (myreader.HasRows)
        {
            myreader.Read();
            divImg.Style["background-image"] = "uploads/" + myreader["productimage"].ToString();
            lblRoomName.Text = myreader["productname"].ToString();
            lblRoomDesc.Text = myreader["description"].ToString();
            lblRate.Text = myreader["rate"].ToString();
        }

        double namt = orgcost - ((dis * orgcost) / 100);
        lblDiscount.Text = Math.Truncate(namt).ToString();
    }

    protected void btnRedirect_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckAvail.aspx?pid=" + Request.QueryString["pid"]);
    }
}