using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail

// NÃO TA FUNCIONANDO ---> TEM QUE MUDAR NO sqlLogin E COLOCAR PARA SELECIONAR O id_cli

public partial class Login : System.Web.UI.Page
{
    int qtdErros;
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        btnRecuperar.Visible = false;
    }
    protected void btnCadastrar_Click(object sender, EventArgs e)
    {
        Response.Redirect("Cadastre-se.aspx");
        Session["qtdErros"] = null;
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        DataView dv;

        sqlLogin.SelectParameters["Login"].DefaultValue = cripto.Encrypt(txtLogin.Text);
        sqlLogin.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenha.Text);

        dv = (DataView)sqlLogin.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count != 0)
        {
            Session["qtdErros"] = null;
            btnRecuperar.Visible = false;
            Session["CodCli"] = dv.Table.Rows[0]["id_cli"].ToString();
            Response.Redirect("Home.aspx");
            Session["Logado"] = "OK";

            string login;

            if (chkLogado.Checked == true)
            {
                login = txtLogin.Text;
                Session["Login"] = login.ToString();
                if (Session["Login"] != null)
                {
                    txtLogin.Text = Session["Login"].ToString();
                }
            }
            else
            {
                Session["Login"] = "";

            }
        }
        else
        {
            txtSenha.Text = "";
            lblErroLogin.Text = "Digite um usuário ou senha existentes";
            Session["Logado"] = "";
            //somando a qtd de erros
            if (Session["qtdErros"] != null)
            {
                qtdErros = (int)Session["qtdErros"];
            }

            qtdErros++;
            Session["qtdErros"] = qtdErros;

            if (qtdErros == 3) // não aceita mais de 3 erros
            {
                btnRecuperar.Visible = true;
            }
        }

        DataView dv2 = (DataView)sqlDataCliente.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            DateTime dt = Convert.ToDateTime(dv.Table.Rows[i]["data_cad"].ToString());
            String dataCorreta = dt.ToString("yyyy/MM/dd");

            DateTime dtSenhaVal = DateTime.Now.AddMonths(+6);

            if (dt < dtSenhaVal)
            {
                Response.Redirect("AlterarSenhaCli.aspx");
                Session["data_cad"] = dv.Table.Rows[i]["data_cad"].ToString();
                Session["idCli"] = dv.Table.Rows[0]["id_cli"].ToString();
                Session["tipo"] = "CLI";
            }
        }
    }

    protected void recuperarsenha(object sender, EventArgs e)
    {
        Session["qtdErros"] = null;
        Response.Redirect("RecuperarSenha.aspx");
        Session["tipoSenha"] = "CLI";
    }
    protected void btnSair_Click(object sender, EventArgs e)
    {
        string login;

        login = txtLogin.Text;
        Session["Login"] = login.ToString();
        Session["Logado"] = "";

        Response.Redirect("Login.aspx");
    }

    protected void imgbtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}