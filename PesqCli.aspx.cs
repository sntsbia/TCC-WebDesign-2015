using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PesqCli : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }
    }
    public void DescriptoGrid()
    {
        DataView dv;

        dv = (DataView)sqlPesq.Select(DataSourceSelectArguments.Empty);

        ////Armazenar dados descripgrafados

        DataTable novaTb = new DataTable();
        //novaTb = dv.Table.Clone(); // copia colunas da tabela

        //- Criar colunas para colocar cada tipo de informação após a criptografia
        novaTb.Columns.Add("id_cli", typeof(int));
        novaTb.Columns.Add("nome_cli", typeof(string));
        novaTb.Columns.Add("cpf_cli", typeof(string));
        novaTb.Columns.Add("sx_cli", typeof(string));
        novaTb.Columns.Add("estciv_cli", typeof(string));
        novaTb.Columns.Add("dtnasc_cli", typeof(string));
        novaTb.Columns.Add("tel_cli", typeof(string));
        novaTb.Columns.Add("cel_cli", typeof(string));
        novaTb.Columns.Add("cep", typeof(string));
        novaTb.Columns.Add("num_cli", typeof(int));
        novaTb.Columns.Add("comp_cli", typeof(string));
        novaTb.Columns.Add("email_cli", typeof(string));
        novaTb.Columns.Add("login_cli", typeof(string));
        novaTb.Columns.Add("senha_cli", typeof(string));
        novaTb.Columns.Add("datacad_cli", typeof(DateTime));

        novaTb.DefaultView.RowFilter = "nome_cli like '" + txtNomeCli.Text + "%'";

        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            //1-Criar linha 
            DataRow linha = novaTb.NewRow();

            //2-Descriptografar
            linha["id_cli"] = dv.Table.Rows[i]["id_cli"].ToString();
            linha["nome_cli"] = cripto.Decrypt(dv.Table.Rows[i]["nome_cli"].ToString());
            linha["cpf_cli"] = cripto.Decrypt(dv.Table.Rows[i]["cpf_cli"].ToString());
            linha["sx_cli"] = cripto.Decrypt(dv.Table.Rows[i]["sx_cli"].ToString());
            linha["estciv_cli"] = cripto.Decrypt(dv.Table.Rows[i]["estciv_cli"].ToString());
            linha["dtnasc_cli"] = cripto.Decrypt(dv.Table.Rows[i]["dtnasc_cli"].ToString());
            linha["tel_cli"] = dv.Table.Rows[i]["tel_cli"].ToString();
            linha["cel_cli"] = cripto.Decrypt(dv.Table.Rows[i]["cel_cli"].ToString());
            linha["cep"] = cripto.Decrypt(dv.Table.Rows[i]["cep"].ToString());
            linha["num_cli"] = cripto.Decrypt(dv.Table.Rows[i]["num_cli"].ToString());
            linha["comp_cli"] = cripto.Decrypt(dv.Table.Rows[i]["comp_cli"].ToString());
            linha["email_cli"] = cripto.Decrypt(dv.Table.Rows[i]["email_cli"].ToString());
            linha["login_cli"] = cripto.Decrypt(dv.Table.Rows[i]["login_cli"].ToString());
            linha["senha_cli"] = cripto.Decrypt(dv.Table.Rows[i]["senha_cli"].ToString());
            linha["datacad_cli"] = dv.Table.Rows[i]["datacad_cli"].ToString();

            //3-Add linha na nova tb
            novaTb.Rows.Add(linha);

        }
        dlPesq.DataSource = novaTb;
        dlPesq.DataBind(); // Refresh
    }
    protected void btnPesq_Click(object sender, ImageClickEventArgs e)
    {
            DescriptoGrid();
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