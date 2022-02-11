using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class CheckAvail : System.Web.UI.Page
{
    static Int32 bookingid;
    static String startdate;
    static String enddate;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //TextBox1.Text=Session["UserName"].ToString();
            //Calendar1.SelectedDate = DateTime.Now.Date;
            //Calendar2.SelectedDate = DateTime.Now.Date;
            //string a = DateTime.

            //if (Session["nm"].ToString() == "Guest")
            //{
            //    Response.Redirect("Login.aspx");
            //}

            SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
            SqlCommand mycomm;
            string query = "select * from RoomBooking";
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
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
                
    }

    public void clear()
    {

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
        //SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
        //SqlCommand mycomm;
        //string q = "update RoomBooking set PayMode=@PayMode,PayStatus=@PayStatus,RoomStatus=@RoomStatus where TransNo=" + lblTransNo.Text;
        //mycomm = new SqlCommand(q, myconn);
        //mycomm.Parameters.AddWithValue("@PayMode", txtDebtCardNo.Text);
        //mycomm.Parameters.AddWithValue("@PayStatus", "Pay");
        //mycomm.Parameters.AddWithValue("@RoomStatus", "Book");
        //myconn.Open();
        //int res = mycomm.ExecuteNonQuery();
        //myconn.Close();
        //if (res == 1)
        //{
        //    clear();
        //    Response.Write("<script>alert('Room Booked Successfully')</script>");
        //}
        //else
        //{
        //    Response.Write("<script>alert('Room Not Booked')</script>");
        //}
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "Pay")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                if (row != null)
                {
                    //string a,b,c,d,ee,f,g,h;

                    //a = row.Cells[0].Text;
                    //b = row.Cells[1].Text;
                    //c = row.Cells[2].Text;
                    //d = row.Cells[3].Text;
                    //ee = row.Cells[4].Text;
                    //f = row.Cells[5].Text;
                    //g = row.Cells[6].Text;
                    //h = row.Cells[7].Text;

                    //string xyz = a + " " + b + " " + c + " " + d + " " + ee + " " + f + " " + g + " ";

                    //return;
                    
                    string isPay = row.Cells[6].Text;

                    if (isPay == "Pay")
                    {
                        Response.Write("<script>alert('Already Paid')</script>");
                        return;
                    }
                    else 
                    {
                        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                        SqlCommand mycomm;
                        string q = "update RoomBooking set PayMode=@PayMode,PayStatus=@PayStatus,RoomStatus=@RoomStatus where BookingID=" + rowIndex;
                        mycomm = new SqlCommand(q, myconn);
                        mycomm.Parameters.AddWithValue("@PayMode", "Cash");
                        mycomm.Parameters.AddWithValue("@PayStatus", "Pay");
                        mycomm.Parameters.AddWithValue("@RoomStatus", "Book");
                        myconn.Open();
                        int res = mycomm.ExecuteNonQuery();
                        myconn.Close();
                        if (res == 1)
                        {
                            clear();
                            Response.Write("<script>alert('Pay Successfully')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Not Pay')</script>");
                        }    
                    }                    
                }
                else
                {
                    Response.Write("<script>alert('Server Error.')</script>");
                }
            }

            else if (e.CommandName == "cIn")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                if (row != null)
                {
                    //string name = row.Cells[7].Text;
                    //string country = row.Cells[1].Text;
                    string isPay = row.Cells[6].Text;

                    if (isPay != "&nbsp;")
                    {
                        TimeSpan ts = TimeSpan.Parse(DateTime.Now.ToString("HH:mm"));
                        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                        SqlCommand mycomm;
                        string q = "update RoomBooking set CheckIn=@CheckIn,RoomStatus=@RoomStatus where BookingID=" + rowIndex;
                        mycomm = new SqlCommand(q, myconn);
                        mycomm.Parameters.AddWithValue("@CheckIn", ts);
                        mycomm.Parameters.AddWithValue("@RoomStatus", "CheckIn");
                        myconn.Open();
                        int res = mycomm.ExecuteNonQuery();
                        myconn.Close();
                        if (res == 1)
                        {
                            clear();
                            Response.Write("<script>alert('Room Check-In Successfully.')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Server Error! Room Check-In Unsuccessful.')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Server Error!')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Make Payment First')</script>");
                    return; 
                }
            }

            else if (e.CommandName == "cOut")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                if (row != null)
                {
                    string isCheckIN = row.Cells[4].Text;
                    if (isCheckIN != "&nbsp;")
                    {
                        TimeSpan ts = TimeSpan.Parse(DateTime.Now.ToString("12:00"));
                        SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                        SqlCommand mycomm;
                        string q = "update RoomBooking set CheckIn=@CheckIn,RoomStatus=@RoomStatus where BookingID=" + rowIndex;
                        mycomm = new SqlCommand(q, myconn);
                        mycomm.Parameters.AddWithValue("@CheckIn", ts);
                        mycomm.Parameters.AddWithValue("@RoomStatus", "CheckOut");
                        myconn.Open();
                        int res = mycomm.ExecuteNonQuery();
                        myconn.Close();
                        if (res == 1)
                        {
                            clear();
                            Response.Write("<script>alert('Room Check Out Successfully')</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Server Error! Room Checked-Out Unsuccessful.')</script>");
                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('User Not Checked-In')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Make Payment First')</script>");
                    return;
                }
            }

            else if (e.CommandName == "cancel")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = (GridViewRow)((Button)e.CommandSource).NamingContainer;
                if (row != null)
                {
                    TimeSpan ts = TimeSpan.Parse(DateTime.Now.ToString("12:00"));
                    SqlConnection myconn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString);
                    SqlCommand mycomm;
                    string q = "DELETE FROM RoomBooking WHERE BookingID=" + rowIndex;
                    mycomm = new SqlCommand(q, myconn);
                    myconn.Open();
                    int res = mycomm.ExecuteNonQuery();
                    myconn.Close();
                    if (res == 1)
                    {
                        clear();
                        Response.Write("<script>alert('Room Booking Canceled Successfully')</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Server Error! Booking Cancelation Unsuccessful.')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Server Error!')</script>");
                }
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        try
        {
            e.Row.Cells[6].Visible = false;
        }
        catch (Exception ex)
        {
        }
    }
}