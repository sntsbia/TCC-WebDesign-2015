using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }

    }
    protected void btnSair_Click(object sender, EventArgs e)
    {
        if (Session["logado"] == "Ok")
        {
            btnSair.Visible = true;
        }
        else
        {
            btnSair.Visible = false;
        }

        Session["logado"] = null;
        Response.Redirect("ADMLogin.aspx");
    }
}