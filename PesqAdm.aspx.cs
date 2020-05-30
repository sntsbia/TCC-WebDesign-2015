using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class PesqAdm : System.Web.UI.Page
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

        dv = (DataView)sqlPesqAdm.Select(DataSourceSelectArguments.Empty);

        ////Armazenar dados descripgrafados

        DataTable novaTb = new DataTable();
        //novaTb = dv.Table.Clone(); // copia colunas da tabela

        //- Criar colunas para colocar cada tipo de informação após a criptografia
        novaTb.Columns.Add("id_func", typeof(int));
        novaTb.Columns.Add("nome_func", typeof(string));
        novaTb.Columns.Add("cpf_func", typeof(string));
        novaTb.Columns.Add("tipo_func", typeof(string));
        novaTb.Columns.Add("tel_func", typeof(string));
        novaTb.Columns.Add("email_func", typeof(string));
        novaTb.Columns.Add("login_func",typeof(string));
        novaTb.Columns.Add("senha_func",typeof(string));
        novaTb.Columns.Add("data_cad", typeof(DateTime));


        novaTb.DefaultView.RowFilter = "nome_func like '" + txtNomePesq.Text + "%'";

        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            //1-Criar linha 
            DataRow linha = novaTb.NewRow();

            //2-Descriptografar
            linha["id_func"] = dv.Table.Rows[i]["id_func"].ToString();
            linha["nome_func"] = cripto.Decrypt(dv.Table.Rows[i]["nome_func"].ToString());
            linha["cpf_func"] = cripto.Decrypt(dv.Table.Rows[i]["cpf_func"].ToString());
            linha["tipo_func"] = cripto.Decrypt(dv.Table.Rows[i]["tipo_func"].ToString());
            linha["tel_func"] = cripto.Decrypt(dv.Table.Rows[i]["tel_func"].ToString());
            linha["email_func"] = cripto.Decrypt(dv.Table.Rows[i]["email_func"].ToString());
            linha["login_func"] = cripto.Decrypt(dv.Table.Rows[i]["login_func"].ToString());
            linha["senha_func"] = cripto.Decrypt(dv.Table.Rows[i]["senha_func"].ToString());
            linha["data_cad"] = dv.Table.Rows[i]["data_cad"].ToString();

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
