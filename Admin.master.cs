using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["nm"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            Label1.Text = Session["nm"].ToString(); //reading from session
            LinkButton1.Visible = false;
            LinkButton2.Visible = true;
            if (Session["ut"].ToString() == "admin")
            {
                LinkButton6.Visible = true;
            }
        }        
    }

    protected void LinkButton2_Click1(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void LinkButton1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void LinkButton6_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminPanel.aspx");
    }
}
