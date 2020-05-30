using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterCli : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Logado"] != "OK")
        {
            //btnSair.Visible = false;
            //imgbtnLogin.Visible = true;
        }
        else
        {
            //imgbtnLogin.Visible = false;
            //btnSair.Visible = true;
        }
    }
    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
    protected void btnSair_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
        Session["Login"] = "";
    }
}
