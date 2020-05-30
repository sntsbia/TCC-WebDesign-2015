using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class CadProd : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }

        if (!IsPostBack)
        {
            carregaCor();
            carregaColecao();
            carregaTamanho();
            carregaTipo();
            lbl.Text = "R$";
        }
    }

    public void carregaCor()
    {
        // Carregando as infos criptografadas da COR
        DataView cor;
        cor = (DataView)sqlCor.Select(DataSourceSelectArguments.Empty);
        ddlCor.Items.Clear();
        for (int j = 0; j < cor.Table.Rows.Count; j++)
        {
            ddlCor.Items.Add(new ListItem(cripto.Decrypt(cor.Table.Rows[j]["det_cor"].ToString()), cor.Table.Rows[j]["id_cor"].ToString()));
        }
    }

    public void carregaColecao()
    {
        //Carregando as infos criptografadas da COLECAO
        DataView colecao;
        colecao = (DataView)sqlColecao.Select(DataSourceSelectArguments.Empty);

        // apagar valores
        ddlColecao.Items.Clear();

        for (int i = 0; i < colecao.Table.Rows.Count; i++)
        {
            ddlColecao.Items.Add(new ListItem(cripto.Decrypt(colecao.Table.Rows[i]["nome_colecao"].ToString()), colecao.Table.Rows[i]["id_colecao"].ToString()));
        }

    }

    public void carregaTipo()
    {
        DataView tipo;
        tipo = (DataView)sqlTipo.Select(DataSourceSelectArguments.Empty);

        // apagar valores
        ddlTipo.Items.Clear();

        for (int i = 0; i < tipo.Table.Rows.Count; i++)
        {
            ddlTipo.Items.Add(new ListItem(cripto.Decrypt(tipo.Table.Rows[i]["det_tipo"].ToString()), tipo.Table.Rows[i]["id_tipo"].ToString()));
        }
    }

    public void carregaTamanho()
    {
        DataView tamanho;
        tamanho = (DataView)sqlTamanho.Select(DataSourceSelectArguments.Empty);

        // apagar valores
        ddlTamanho.Items.Clear();

        for (int i = 0; i < tamanho.Table.Rows.Count; i++)
        {
            ddlTamanho.Items.Add(new ListItem(cripto.Decrypt(tamanho.Table.Rows[i]["tamanho"].ToString()), tamanho.Table.Rows[i]["id_tamanho"].ToString()));
        }
    }

    protected void BtnEnviar_Click(object sender, EventArgs e)
    {
        
        sqlProduto.InsertParameters["Prod"].DefaultValue = cripto.Encrypt(txtProd.Text);
        sqlProduto.InsertParameters["Desc"].DefaultValue = cripto.Encrypt(txtDesc.Text);
        sqlProduto.InsertParameters["Valor"].DefaultValue = cripto.Encrypt(txtValor.Text);
        sqlProduto.InsertParameters["Estq"].DefaultValue = cripto.Encrypt(txtEstoq.Text);

        //- 1
        string nomeArq, urlBd;
        nomeArq = Path.GetFileName(fupl01.PostedFile.FileName);

        if (nomeArq != "")
        {
            fupl01.PostedFile.SaveAs(Server.MapPath("Produtos\\" + nomeArq));
            urlBd = "~\\Produtos\\" + nomeArq;
        }
        else
        {
            urlBd = "~\\Produtos\\sem-imagem.jpg";
        }
        sqlProduto.InsertParameters["Img1"].DefaultValue = cripto.Encrypt(urlBd);


        //- 2
        string nomeArq2, urlBd2;
        nomeArq2 = Path.GetFileName(fupl02.PostedFile.FileName);

        if (nomeArq2 != "")
        {
            fupl01.PostedFile.SaveAs(Server.MapPath("Produtos\\" + nomeArq2));
            urlBd2 = "~\\Produtos\\" + nomeArq2;
        }
        else
        {
            urlBd2 = "~\\Produtos\\sem-imagem.jpg";
        }
        sqlProduto.InsertParameters["Img2"].DefaultValue = cripto.Encrypt(urlBd2);

        sqlProduto.Insert();

        lblErro.Text = "Produto Cadastrado com Sucesso!";
        txtDesc.Text = "";
        txtEstoq.Text = "";
        txtProd.Text = "";
        txtValor.Text = "";
        lbl.Text = "";

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