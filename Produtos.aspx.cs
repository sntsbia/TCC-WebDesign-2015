using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Produtos : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");
    protected void Page_Load(object sender, EventArgs e)
    {
        DescriptoGrid();
    }

    public void DescriptoGrid()
    {
        DataView dv;

        dv = (DataView)sqlProdutos.Select(DataSourceSelectArguments.Empty);

        ////Armazenar dados descripgrafados

        DataTable novaTb = new DataTable();
        //novaTb = dv.Table.Clone(); // copia colunas da tabela

        //- Criar colunas para colocar cada tipo de informação após a criptografia
        novaTb.Columns.Add("id_prod", typeof(int));
        novaTb.Columns.Add("nome_prod", typeof(string));
        novaTb.Columns.Add("desc_prod", typeof(string));
        novaTb.Columns.Add("val_prod", typeof(string));
        novaTb.Columns.Add("nome_colecao", typeof(string));
        novaTb.Columns.Add("det_tipo", typeof(string));
        novaTb.Columns.Add("det_cor", typeof(string));
        novaTb.Columns.Add("tamanho", typeof(string));
        novaTb.Columns.Add("img_prod", typeof(string));
        novaTb.Columns.Add("img2_prod", typeof(string));
        novaTb.Columns.Add("estq_prod", typeof(string));

        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            //1-Criar linha 
            DataRow linha = novaTb.NewRow();

            //2-Descriptografar
            linha["id_prod"] = dv.Table.Rows[i]["id_prod"].ToString();
            linha["nome_prod"] = cripto.Decrypt(dv.Table.Rows[i]["nome_prod"].ToString());
            linha["desc_prod"] = cripto.Decrypt(dv.Table.Rows[i]["desc_prod"].ToString());
            linha["val_prod"] = cripto.Decrypt(dv.Table.Rows[i]["val_prod"].ToString());
            linha["nome_colecao"] = cripto.Decrypt(dv.Table.Rows[i]["nome_colecao"].ToString());
            linha["det_tipo"] = cripto.Decrypt(dv.Table.Rows[i]["det_tipo"].ToString());
            linha["tamanho"] = cripto.Decrypt(dv.Table.Rows[i]["tamanho"].ToString());
            linha["img_prod"] = cripto.Decrypt(dv.Table.Rows[i]["img_prod"].ToString());
            linha["img2_prod"] = cripto.Decrypt(dv.Table.Rows[i]["img2_prod"].ToString());
            linha["estq_prod"] = cripto.Decrypt(dv.Table.Rows[i]["estq_prod"].ToString());

            novaTb.Rows.Add(linha);

        }
        dlProdutos.DataSource = novaTb;
        dlProdutos.DataBind(); // Refresh
    }
}