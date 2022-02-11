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

public partial class CheckAvail : System.Web.UI.Page
{
    static Int32 bookingid;
    static String startdate;
    static String enddate;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["nm"] == null)
            {
                try
                {
                    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                    SqlCommand cmdzs = new SqlCommand("SELECT MAX(TransNo) FROM RoomBooking ", myconn);
                    cmdzs.CommandType = CommandType.Text;
                    myconn.Open();
                    string maxNo = cmdzs.ExecuteScalar().ToString();
                    myconn.Close();
                    if (maxNo == "")
                    {
                        maxNo = 0.ToString();
                        lblTransNo.Text = 1.ToString();
                    }
                    else
                    {
                        lblTransNo.Text = Convert.ToString(Convert.ToInt32(maxNo) + 1);
                    }

                    if (Request.QueryString["pid"] != null)
                    {
                        //String myquery1 = "select productid, productname from [dbo].[addproduct] where productid = " + Request.QueryString["pid"];
                        String myquery1 = "select productid, productname from [dbo].[addproduct]";
                        SqlDataAdapter adpt = new SqlDataAdapter(myquery1, myconn);
                        DataTable dt = new DataTable();
                        adpt.Fill(dt);
                        ddlAllRooms.Items.Clear();
                        ddlAllRooms.DataSource = dt;
                        ddlAllRooms.DataBind();
                        ddlAllRooms.DataTextField = "productname";
                        ddlAllRooms.DataValueField = "productid";
                        ddlAllRooms.DataBind();
                    }
                    else
                    {
                        String myquery1 = "select productid, productname from [dbo].[addproduct]";
                        SqlDataAdapter adpt = new SqlDataAdapter(myquery1, myconn);
                        DataTable dt = new DataTable();
                        adpt.Fill(dt);
                        ddlAllRooms.Items.Clear();
                        ddlAllRooms.DataSource = dt;
                        ddlAllRooms.DataBind();
                        ddlAllRooms.DataTextField = "productname";
                        ddlAllRooms.DataValueField = "productid";
                        ddlAllRooms.DataBind();
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            string q = "SELECT rate FROM addproduct WHERE productid = " + ddlAllRooms.SelectedValue;
            SqlCommand mycomm = new SqlCommand(q, myconn);
            myconn.Open();
            SqlDataReader myreader = mycomm.ExecuteReader();
            if (myreader.HasRows)
            {
                myreader.Read();
                lblPrice.Text = myreader["rate"].ToString();
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void txtChkInDt_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtChkInDt.Text == "")
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Enter Check-In Date";
            }
            else
            {
                string dt = txtChkInDt.Text;
                DateTime currentdate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                DateTime ToDate = DateTime.ParseExact(txtChkInDt.Text.Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                if (ToDate < currentdate)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Check-In Date should not be older than the current date.";
                    return;
                }
                else
                {
                    lblmsg.Visible = false;
                    lblmsg.Text = "";

                    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                    SqlCommand check_start_date = new SqlCommand("select count(*) from RoomBooking where (RoomStatus!='Book' or (TransNo!='" + lblTransNo.Text + "')) and RoomNo='" + ddlAllRooms.SelectedValue + "' and ('" + dt + "'=dtStart or '" + dt + "' Between dtStart and DATEADD(day, -1, dtEnd))", myconn);
                    myconn.Open();
                    int UserExist = (int)check_start_date.ExecuteScalar();
                    myconn.Close();
                    if (UserExist > 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Room No. " + ddlAllRooms.SelectedItem.ToString() + " is Already Booked On Particular Date " + txtChkInDt.Text + ".";
                        txtPersonNo.Focus();
                        //Response.Write("<script>alert('Room Maximum Person Limit is " + person + "')</script>");
                    }
                    else
                    {
                        lblmsg.Visible = false;
                    }
                }
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void txtChkOutDt_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtChkOutDt.Text == "")
            {
                lblmsg.Visible = true;
                lblmsg.Text = "Enter Check-Out Date";
            }
            else
            {
                
                string dt = txtChkOutDt.Text;
                DateTime currentdate = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
                DateTime ToDate = DateTime.ParseExact(txtChkOutDt.Text.Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime CheckInDate = DateTime.ParseExact(txtChkInDt.Text.Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                DateTime CheckOutDate = DateTime.ParseExact(txtChkOutDt.Text.Trim(), "yyyy-MM-dd", CultureInfo.InvariantCulture);
                if (ToDate < currentdate)
                {
                    lblmsg.Visible = true;
                    lblmsg.Text = "Check-Out Date should not be older than the current date.";
                    return;
                }
                else
                {
                    if (CheckInDate > CheckOutDate)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Check-Out Date should not be Greater than the current date.";
                        return;
                    }
                    else
                    {
                        lblmsg.Visible = false;
                        lblmsg.Text = "";

                        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                        SqlCommand check_start_date = new SqlCommand("select count(*) from RoomBooking where (RoomStatus!='Book' or (TransNo!='" + lblTransNo.Text + "')) and RoomNo='" + ddlAllRooms.SelectedValue + "' and ('" + dt + "'=dtStart or '" + dt + "' Between dtStart and DATEADD(day, -1, dtEnd))", myconn);
                        myconn.Open();
                        int UserExist = (int)check_start_date.ExecuteScalar();
                        myconn.Close();
                        if (UserExist > 0)
                        {
                            lblmsg.Visible = true;
                            lblmsg.Text = "Room No. " + ddlAllRooms.SelectedItem.ToString() + " is Already Booked On Particular Date " + txtChkOutDt.Text + ".";
                            txtPersonNo.Focus();
                            //Response.Write("<script>alert('Room Maximum Person Limit is " + person + "')</script>");
                        }
                        else
                        {
                            lblmsg.Visible = false;
                        }
                    }                    
                }
            }
        }
        catch (Exception ex)
        {

        }
    }

    protected void txtPersonNo_TextChanged(object sender, EventArgs e)
    {
        if (txtPersonNo.Text == "")
        {
            lblmsg.Visible = true;
            lblmsg.Text = "Enter No. of Person";
        }
        else
        {
            try
            {
                SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                string q = "SELECT minperson,maxperson,rate FROM addproduct WHERE productid = " + ddlAllRooms.SelectedValue;
                SqlCommand mycomm = new SqlCommand(q, myconn);
                myconn.Open();
                SqlDataReader myreader = mycomm.ExecuteReader();
                if (myreader.HasRows)
                {
                    myreader.Read();
                    Int32 Minperson = Convert.ToInt32(myreader["minperson"].ToString());
                    Int32 Maxperson = Convert.ToInt32(myreader["maxperson"].ToString());
                    
                    lblPrice.Text = myreader["rate"].ToString();

                    if (Convert.ToInt32(txtPersonNo.Text) <= 0)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Room Minimum Person Limit is " + Minperson + ". Person per room should be greater than Manimum Limit.";
                        txtPersonNo.Focus();
                    }
                    else if (Convert.ToInt32(txtPersonNo.Text) > Maxperson)
                    {
                        lblmsg.Visible = true;
                        lblmsg.Text = "Room Maximum Person Limit is " + Maxperson + ". Person per room should be less than Maximum Limit.";
                        txtPersonNo.Focus();
                        //Response.Write("<script>alert('Room Maximum Person Limit is " + person + "')</script>");
                    }
                    else
                    {
                        lblmsg.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {

            }
        }
    }

    public void GenerateBookingID()
    {
        String mycon = "Persist Security Info=False;User ID=sa;PWD=admin123;Initial Catalog=HotelBooking;Data Source=JAY\\SQLEXPRESS";
        SqlConnection scon = new SqlConnection(mycon);
        String myquery = "select BookingID from RoomBooking";
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = myquery;
        cmd.Connection = scon;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        scon.Close();
        if (ds.Tables[0].Rows.Count < 1)
        {
            bookingid = 50001;
        }
        else
        {
            String mycon1 = "Persist Security Info=False;User ID=sa;PWD=admin123;Initial Catalog=HotelBooking;Data Source=JAY\\SQLEXPRESS";
            SqlConnection scon1 = new SqlConnection(mycon1);
            String myquery1 = "select max(BookingID) from RoomBooking";
            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = myquery1;
            cmd1.Connection = scon1;
            SqlDataAdapter da1 = new SqlDataAdapter();
            da1.SelectCommand = cmd1;
            DataSet ds1 = new DataSet();
            da1.Fill(ds1);

            bookingid = Convert.ToInt32(ds1.Tables[0].Rows[0][0].ToString());
            bookingid = bookingid + 1;
            scon1.Close();
        }
    }

    protected void cmd_Book_Click(object sender, EventArgs e)
    {
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand mycomm;
        string q = "update RoomBooking set PayMode=@PayMode,PayStatus=@PayStatus,RoomStatus=@RoomStatus where TransNo=" + lblTransNo.Text;
        mycomm = new SqlCommand(q, myconn);
        mycomm.Parameters.AddWithValue("@PayMode", txtDebtCardNo.Text);
        mycomm.Parameters.AddWithValue("@PayStatus", "Pay");
        mycomm.Parameters.AddWithValue("@RoomStatus", "Book");
        myconn.Open();
        int res = mycomm.ExecuteNonQuery();
        myconn.Close();
        if (res == 1)
        {
            clear();
            Response.Write("<script>alert('Room Booked Successfully')</script>");
        }
        else
        {
            Response.Write("<script>alert('Room Not Booked')</script>");
        }
    }

    protected void btnBookNow_Click(object sender, EventArgs e)
    {
        if (txtCustNm.Text == "")
        {
            Response.Write("<script>alert('Enter Customer Name')</script>");
            return;
        }
        if (txtCustAdd.Text == "")
        {
            Response.Write("<script>alert('Enter Customer Address')</script>");
            return;
        }
        if (txtCustIDProof.Text == "")
        {
            Response.Write("<script>alert('Enter Customer ID Proof')</script>");
            return;
        }
        if (txtPersonNo.Text == "")
        {
            Response.Write("<script>alert('Enter total no of persons')</script>");
            return;
        }
        var time = TimeSpan.Parse("00:00:01");
        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        SqlCommand mycomm;

        string qr = "insert into RoomBooking(TransNo,RoomNo,RoomPrice,CustomerName,CustAddress,CustIdProof,TotalPerson,dtStart,dtEnd,RoomStatus,CheckIn,CheckOut,PhoneNo,EmailId,TranDate) values('" + lblTransNo.Text + "','" + ddlAllRooms.SelectedValue + "','" + lblPrice.Text + "','" + txtCustNm.Text + "','" + txtCustAdd.Text + "','" + txtCustIDProof.Text + "','" + txtPersonNo.Text + "','" + txtChkInDt.Text + "','" + txtChkOutDt.Text + "','Hold','" + time + "','" + time + "','" + txtPhnNo.Text + "','" + txtEmail.Text + "','" + System.DateTime.Now.ToString("yyyy-MM-dd") + "')";
        myconn.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = qr;
        cmd1.Connection = myconn;
        int res = cmd1.ExecuteNonQuery();
        myconn.Close();

        if (res == 1)
        {
            string query = "select * from RoomBooking where TransNo =" + lblTransNo.Text;
            mycomm = new SqlCommand(query, myconn);
            mycomm.Connection = myconn;
            SqlDataAdapter sda = new SqlDataAdapter();
            sda.SelectCommand = mycomm;
            using (DataTable dt = new DataTable())
            {
                sda.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            cmd_Book.Visible = true;
            double price = Convert.ToDouble(lblbill.Text);
            lblbill.Text = Convert.ToString(Convert.ToDouble(lblPrice.Text) + price);
        }
        else
        {
            //Response.Write("<script>alert('New Room added Successfully')</script>");
        }
        
        
        
        
        //BookingID,TransNo,RoomNo,RoomPrice,CustomerName,CustAddress,CustIdProof,TotalPerson,dtStart,dtEnd,RoomStatus,PayMode,PayStatus,BankName,PayDetails,CheckIn,CheckOut,PhoneNo,EmailId,TranDate

        ////string q = "insert into RoomBooking values(@TransNo,@RoomNo,@RoomPrice,@CustomerName,@CustAddress,@CustIdProof,@TotalPerson,@dtStart,@dtEnd,@RoomStatus,@PayMode,@PayStatus, @BankName,@PayDetails,@CheckIn,@CheckOut,@PhoneNo,@EmailId,@TranDate)";
        ////mycomm = new SqlCommand(q, myconn);
        ////mycomm.Parameters.AddWithValue("@TransNo", lblTransNo.Text);
        ////mycomm.Parameters.AddWithValue("@RoomNo", ddlAllRooms.SelectedValue);
        ////mycomm.Parameters.AddWithValue("@RoomPrice", lblPrice.Text);

        ////mycomm.Parameters.AddWithValue("@CustomerName", txtCustNm.Text);
        ////mycomm.Parameters.AddWithValue("@CustAddress", txtCustAdd.Text);
        ////mycomm.Parameters.AddWithValue("@CustIdProof", txtCustIDProof.Text);
        ////mycomm.Parameters.AddWithValue("@TotalPerson", txtPersonNo.Text);
        ////mycomm.Parameters.AddWithValue("@dtStart", txtChkInDt.Text);
        ////mycomm.Parameters.AddWithValue("@dtEnd", txtChkOutDt.Text);
        ////mycomm.Parameters.AddWithValue("@RoomStatus", "Hold");
        ////mycomm.Parameters.AddWithValue("@PayMode", "");
        ////mycomm.Parameters.AddWithValue("@PayStatus", "");
        ////mycomm.Parameters.AddWithValue("@BankName", "");
        ////mycomm.Parameters.AddWithValue("@PayDetails", "");
        ////mycomm.Parameters.AddWithValue("@CheckIn", time);
        ////mycomm.Parameters.AddWithValue("@CheckOut", time);
        ////mycomm.Parameters.AddWithValue("@PhoneNo", txtPhnNo.Text);
        ////mycomm.Parameters.AddWithValue("@EmailId", txtEmail.Text);
        ////mycomm.Parameters.AddWithValue("@TranDate", System.DateTime.Now.ToString("yyyy-MM-dd"));

        ////myconn.Open();
        ////int res = mycomm.ExecuteNonQuery();
        ////myconn.Close();
        ////if (res == 1)
        ////{
        ////    //Response.Write("<script>alert('New Room added Successfully')</script>");
        ////    string query = "select * from RoomBooking where TransNo =" + lblTransNo.Text;
        ////    mycomm = new SqlCommand(query, myconn);
        ////    mycomm.Connection = myconn;
        ////    SqlDataAdapter sda = new SqlDataAdapter();
        ////    sda.SelectCommand = mycomm;
        ////    using (DataTable dt = new DataTable())
        ////    {
        ////        sda.Fill(dt);
        ////        GridView1.DataSource = dt;
        ////        GridView1.DataBind();
        ////    }
        ////    cmd_Book.Visible = true;
        ////    double price = Convert.ToDouble(lblbill.Text);
        ////    lblbill.Text = Convert.ToString(Convert.ToDouble(lblPrice.Text) + price);
        ////}
        ////else
        ////{
        ////    //Response.Write("<script>alert('New Room added Successfully')</script>");
        ////}
        clear();

        //SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        String myquery1 = "select productid, productname from [dbo].[addproduct]";
        SqlDataAdapter adpt = new SqlDataAdapter(myquery1, myconn);
        DataTable dt1 = new DataTable();
        adpt.Fill(dt1);
        ddlAllRooms.Items.Clear();
        ddlAllRooms.DataSource = dt1;
        ddlAllRooms.DataBind();
        ddlAllRooms.DataTextField = "productname";
        ddlAllRooms.DataValueField = "productid";
        ddlAllRooms.DataBind();
    }

    public void clear()
    {
        txtCustNm.Text = "";
        txtCustAdd.Text = "";
        txtCustIDProof.Text = "";
        txtPersonNo.Text = "";
        txtPhnNo.Text = "";
        txtEmail.Text = "";
    }

    //protected void gvrecords_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.DataRow)
    //    {
    //        //getting username from particular row
    //        string username = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "UserName"));
    //        LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
    //        lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + username + "')");
    //    }
    //}

    //protected void lnkdelete_Click(object sender, EventArgs e)
    //{
    //    LinkButton lnkbtn = sender as LinkButton;
    //    //getting particular row linkbutton
    //    GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
    //    //getting userid of particular row
    //    int userid = Convert.ToInt32(GridView1.DataKeys[gvrow.RowIndex].Value.ToString());
    //    int result;
    //    using (SqlConnection con = new SqlConnection("Data Source=SureshDasari;Integrated Security=true;Initial Catalog=MySampleDB"))
    //    {
    //        con.Open();
    //        SqlCommand cmd = new SqlCommand("delete from UserDetails where UserId=" + userid, con);
    //        result = cmd.ExecuteNonQuery();
    //        con.Close();
    //    }
    //    if (result == 1)
    //    {
    //        BindUserDetails();
    //    }
    //}


    //protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    //{
    //    int deleteR= Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
    //   //have a sql statement here that add's the parameter ID for the row you want to delete, something like
    //    SqlCommand com  = new SqlCommand ("Delete FROM RoomBooking Where BookingID = @BookingID");
    //    com.Parameters.AddWithValue("@BookingID", deleteR);
    //}
}