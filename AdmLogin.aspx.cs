using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail

public partial class AdmLogin : System.Web.UI.Page
{
    int qtdErros;
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEntrar_Click(object sender, EventArgs e)
    {
       DataView dv;

        sqlAdm.SelectParameters["Login"].DefaultValue = cripto.Encrypt(txtLoginAdm.Text);
        sqlAdm.SelectParameters["Senha"].DefaultValue = cripto.Encrypt(txtSenhaAdm.Text);

        dv = (DataView)sqlAdm.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count != 0)
        {
            if (txtCaptcha.Text == Session["CaptchaImageText"].ToString())
            {
                Session["senha"] = txtSenhaAdm.Text;
                Session["qtdErros"] = null;
                btnRecuperar.Visible = false;
                Session["logado"] = "OK";
                Response.Redirect("AdmPage.aspx");
                Session["CodFunc"] = dv.Table.Rows[0]["id_func"].ToString();
            }
            else
            {
                txtCaptcha.Text = "";
                lblErroCaptcha.Text = "Caracteres não correspondentes";
            }
        }
        else
        {
            txtSenhaAdm.Text = "";
            lblErro.Text = "Senha incorreta";

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

        DataView dv2 = (DataView)sqlDataFunc.Select(DataSourceSelectArguments.Empty);
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            DateTime dt = Convert.ToDateTime(dv2.Table.Rows[i]["data_cad"].ToString());
            String dataCorreta = dt.ToString("yyyy/MM/dd");

            DateTime dtSenhaVal = DateTime.Now.AddMonths(+6);

            if (dt < dtSenhaVal)
            {
                Response.Redirect("AlterarSenhaCli.aspx");
                Session["idFunc"] = dv2.Table.Rows[0]["id_func"].ToString();
                Session["tipo"] = "ADM";
            }
        }
    }

    protected void recuperarsenha(object sender, EventArgs e)
    {
        Session["qtdErros"] = null;
        Session["tipoSenha"] = "ADM";
        Response.Redirect("RecuperarSenha.aspx");

    }

    protected void btnSair_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdmLogin.aspx");
    }
}