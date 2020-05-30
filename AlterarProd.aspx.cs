using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;

public partial class AlterarProd : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }
       
       
        DataView dv = (DataView)sqlProd.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count == 0)
        {
            Response.Redirect("PesqAdm.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                carregarDropDownColecao();
                carregarDropDownCor();
                carregarDropDownTamanho();
                carregarDropDownTipo();
            
            lbl.Text = "R$";
            txtProd.Text = cripto.Decrypt(dv.Table.Rows[0]["nome_prod"].ToString());
            txtDesc.Text = cripto.Decrypt(dv.Table.Rows[0]["desc_prod"].ToString());
            txtEstoq.Text = cripto.Decrypt(dv.Table.Rows[0]["estq_prod"].ToString());
            txtValor.Text = cripto.Decrypt(dv.Table.Rows[0]["val_prod"].ToString());
            ddlColecao.SelectedValue = dv.Table.Rows[0]["id_colecao"].ToString();
            ddlCor.SelectedValue = dv.Table.Rows[0]["id_cor"].ToString();
            ddlTamanho.SelectedValue = dv.Table.Rows[0]["id_tamanho"].ToString();
            ddlTipo.SelectedValue = dv.Table.Rows[0]["id_tipo"].ToString();

            }
        }

    }

    public void carregarDropDownColecao()
    {
        DataView dv;

        dv = (DataView)sqlColecao.Select(DataSourceSelectArguments.Empty);

        // APAGAR OS VALORES ANTIGOS
       ddlColecao.Items.Clear();

        // varrendo os dados criptografados para
        // descriptografar e adicionar ao DropDownList
        for (int i = 0; i < dv.Table.Rows.Count; i++)
        {
            ddlColecao.Items.Add(
                new ListItem(
                    cripto.Decrypt(dv.Table.Rows[i]["nome_colecao"].ToString()),
                    dv.Table.Rows[i]["id_colecao"].ToString()));
        }
    }

    public void carregarDropDownCor()
    {
        DataView dv2;

        dv2 = (DataView)sqlCor.Select(DataSourceSelectArguments.Empty);

        // APAGAR OS VALORES ANTIGOS
        ddlCor.Items.Clear();

        // varrendo os dados criptografados para
        // descriptografar e adicionar ao DropDownList
        for (int i = 0; i < dv2.Table.Rows.Count; i++)
        {
            ddlCor.Items.Add(
                new ListItem(
                    cripto.Decrypt(dv2.Table.Rows[i]["det_cor"].ToString()),
                    dv2.Table.Rows[i]["id_cor"].ToString()));
        }
    }

    public void carregarDropDownTamanho()
    {
        DataView dv3;

        dv3 = (DataView)sqlTamanho.Select(DataSourceSelectArguments.Empty);

        // APAGAR OS VALORES ANTIGOS
        ddlTamanho.Items.Clear();

        // varrendo os dados criptografados para
        // descriptografar e adicionar ao DropDownList
        for (int i = 0; i < dv3.Table.Rows.Count; i++)
        {
            ddlTamanho.Items.Add(
                new ListItem(
                    cripto.Decrypt(dv3.Table.Rows[i]["tamanho"].ToString()),
                    dv3.Table.Rows[i]["id_tamanho"].ToString()));
        }
    }

    public void carregarDropDownTipo()
    {
        DataView dv4;

        dv4 = (DataView)sqlTipo.Select(DataSourceSelectArguments.Empty);

        // APAGAR OS VALORES ANTIGOS
        ddlTipo.Items.Clear();

        // varrendo os dados criptografados para
        // descriptografar e adicionar ao DropDownList
        for (int i = 0; i < dv4.Table.Rows.Count; i++)
        {
            ddlTipo.Items.Add(
                new ListItem(
                    cripto.Decrypt(dv4.Table.Rows[i]["det_tipo"].ToString()),
                    dv4.Table.Rows[i]["id_tipo"].ToString()));
        }
    }

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
            sqlProd.Delete();
            lblErro.Text = "Produto excluído com sucesso!";
            txtDesc.Text = "";
            txtEstoq.Text = "";
            txtProd.Text = "";
            txtValor.Text = "";
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {

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

            sqlProd.UpdateParameters["Img"].DefaultValue = cripto.Encrypt(urlBd);
            sqlProd.UpdateParameters["Img2"].DefaultValue = cripto.Encrypt(urlBd2);
            sqlProd.UpdateParameters["Nome"].DefaultValue = cripto.Encrypt(txtProd.Text);
            sqlProd.UpdateParameters["Desc"].DefaultValue = cripto.Encrypt(txtDesc.Text);
            sqlProd.UpdateParameters["Valor"].DefaultValue = cripto.Encrypt(txtValor.Text);
            sqlProd.UpdateParameters["Estoque"].DefaultValue = cripto.Encrypt(txtEstoq.Text);

            sqlProd.Update();

            lblErro.Text = "Dados Alterados com Sucesso!";
            txtDesc.Text = "";
            txtEstoq.Text = "";
            txtProd.Text = "";
            txtValor.Text = "";
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