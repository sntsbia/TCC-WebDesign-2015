using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using System.Data;

public partial class AlterarCli : System.Web.UI.Page
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
            DataView dv = (DataView)sqlCli.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count == 0)
            {
                Response.Redirect("PesqAdm.aspx");
            }
            else
            {
                txtcpfcli.Enabled = false;
                txtcelcli.Text = cripto.Decrypt(dv.Table.Rows[0]["cel_cli"].ToString());
                txtcepcli.Text = cripto.Decrypt(dv.Table.Rows[0]["cep"].ToString());
                txtComp.Text = cripto.Decrypt(dv.Table.Rows[0]["comp_cli"].ToString());
                txtcpfcli.Text = cripto.Decrypt(dv.Table.Rows[0]["cpf_cli"].ToString());
                txtdtnasccli.Text = cripto.Decrypt(dv.Table.Rows[0]["dtnasc_cli"].ToString());
                txtEmailCli.Text = cripto.Decrypt(dv.Table.Rows[0]["email_cli"].ToString());
                txtLoginCli.Text = cripto.Decrypt(dv.Table.Rows[0]["login_cli"].ToString());
                txtNomeCli.Text = cripto.Decrypt(dv.Table.Rows[0]["nome_cli"].ToString());
                txtNumero.Text = cripto.Decrypt(dv.Table.Rows[0]["num_cli"].ToString());
                txttelcli.Text = cripto.Decrypt(dv.Table.Rows[0]["tel_cli"].ToString());

                if (cripto.Decrypt(dv.Table.Rows[0]["estciv_cli"].ToString()) == "Casado(a)")
                {
                    rdbtnEst.SelectedIndex = 0;
                }
                else
                {
                    if (cripto.Decrypt(dv.Table.Rows[0]["estciv_cli"].ToString()) == "Solteiro(a)")
                    {
                        rdbtnEst.SelectedIndex = 1;
                    }
                    else
                    {
                        if (cripto.Decrypt(dv.Table.Rows[0]["estciv_cli"].ToString()) == "Viúvo(a)")
                        {
                            rdbtnEst.SelectedIndex = 2;
                        }
                        else
                        {
                            rdbtnEst.SelectedIndex = 3;
                        }
                    }
                }
                if (cripto.Decrypt(dv.Table.Rows[0]["sx_cli"].ToString()) == "Feminino")
                {
                    rdbtnSexo.SelectedIndex = 0;
                }
                else
                {
                    if (cripto.Decrypt(dv.Table.Rows[0]["sx_cli"].ToString()) == "Masculino")
                    {
                        rdbtnSexo.SelectedIndex = 1;
                    }
                    else
                    {
                        rdbtnSexo.SelectedIndex = 2;
                    }
                }

            }
        }
    }

    protected void imgbtnCep_Click(object sender, ImageClickEventArgs e)
    {

        div8.Visible = true;

        HttpWebRequest requisicao = (HttpWebRequest)WebRequest.Create("http://www.buscacep.correios.com.br/servicos/dnec/consultaLogradouroAction.do?Metodo=listaLogradouro&CEP=" + txtcepcli.Text + "&TipoConsulta=cep");
        HttpWebResponse resposta = (HttpWebResponse)requisicao.GetResponse();

        int cont;
        byte[] buffer = new byte[1000];
        StringBuilder sb = new StringBuilder();
        string temp;

        Stream stream = resposta.GetResponseStream();

        do
        {
            cont = stream.Read(buffer, 0, buffer.Length);
            temp = Encoding.Default.GetString(buffer, 0, cont).Trim();
            sb.Append(temp);

        } while (cont > 0);

        string pagina = sb.ToString();

        if (pagina.IndexOf("<font color=\"black\">CEP NAO ENCONTRADO</font>") >= 0)
        {
            lblErroCep.Text = "CEP não localizado.";
            lblBairro.Text = "";
            lblRua.Text = "";
            lblCidade.Text = "";
            txtcepcli.Text = "";
        }
        else
        {
            lblRua.Text = "Rua: " + Regex.Match(pagina, "<td width=\"268\" style=\"padding: 2px\">(.*)</td>").Groups[1].Value;
            lblBairro.Text = "Bairro: " + Regex.Matches(pagina, "<td width=\"140\" style=\"padding: 2px\">(.*)</td>")[0].Groups[1].Value;
            lblCidade.Text = "Cidade: " + Regex.Matches(pagina, "<td width=\"140\" style=\"padding: 2px\">(.*)</td>")[1].Groups[1].Value;
            lblErroCep.Text = "";
        }
    }

    protected void btnAlterar_Click(object sender, EventArgs e)
    {
        {
        int qtdLetras;
        int qtdLMai = 0, qtdLMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtsenhacli.Text.Length; // contar caracteres

        if (qtdLetras < 6)
        {
            lblErro.Text = " <font color = red> Favor digitar outra senha com 6 caracteres no mínimo </font>";
        }

        else
        {
            for (int i = 0; i < qtdLetras; i++) // exibir força
            {
                if (char.IsLower(txtsenhacli.Text[i])) // verificar cada caracter minusculo (cada caixinha de cada vcaracter)
                {
                    qtdLMin++; // qtdLMin = qtdLMin + 1
                }
                else
                {
                    if (char.IsUpper(txtsenhacli.Text[i])) // verificar caracter maiusculo
                    {
                        qtdLMai++;
                    }
                    else
                    {
                        if (char.IsNumber(txtsenhacli.Text[i])) // verificar numero
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtsenhacli.Text[i]))
                            {
                                qtdCar++;
                            }
                        }
                    }
                }
            }
            if (qtdCar != 0 && qtdLMai != 0 && qtdLMin != 0 && qtdNum != 0) // 4 comb vdd
            {
                Session["forca"] = "Forte";
            }
            else // não combinou as 4
            {
                if (qtdCar != 0) // 1 e combina 3 delas
                {
                    if (qtdLMai != 0 && qtdLMin != 0) // @Nn
                    {
                        Session["forca"] = "Media";
                    }
                    else
                    {
                        if (qtdLMai != 0 && qtdNum != 0) // @N1
                        {
                            Session["forca"] = "Media";
                        }
                        else
                        {
                            if (qtdLMin != 0 && qtdNum != 0) // @n2
                            {
                                Session["forca"] = "Media";
                            }
                            else
                            {
                                Session["forca"] = "Fraca";
                            }
                        }
                    }

                }
                else
                {
                    if (qtdLMai != 0) // não dig Caracter(&) mas dig letra maiuscula
                    {
                        if (qtdLMin != 0 && qtdNum != 0) // Nv2
                        {
                            Session["forca"] = "Media";
                        }
                        else
                        {
                            Session["forca"] = "Fraca";
                        }
                    }
                    else // não tem os 4, não tem CARACTER ESPECIAL nem MAIUSCULA
                    {
                        Session["forca"] = "Fraca";
                    }
                }
            }
        }
        }

        if (txtCaptcha.Text == Session["CaptchaImageText"].ToString())
        {

            DateTime dt = Convert.ToDateTime(txtdtnasccli.Text);
            String dataCorreta = dt.ToString("yyyy/MM/dd");

            DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            String dataCorreta2 = dt2.ToString("yyyy/MM/dd");

            sqlCli.UpdateParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeCli.Text);
            sqlCli.UpdateParameters["Cpf"].DefaultValue = cripto.Encrypt(txtcpfcli.Text);
            sqlCli.UpdateParameters["Sexo"].DefaultValue = cripto.Encrypt(rdbtnSexo.Text);
            sqlCli.UpdateParameters["EstCiv"].DefaultValue = cripto.Encrypt(rdbtnEst.Text);
            sqlCli.UpdateParameters["Tel"].DefaultValue = cripto.Encrypt(txttelcli.Text);
            sqlCli.UpdateParameters["Cel"].DefaultValue = cripto.Encrypt(txtcelcli.Text);
            sqlCli.UpdateParameters["Cep"].DefaultValue = cripto.Encrypt(txtcepcli.Text);
            sqlCli.UpdateParameters["Num"].DefaultValue = cripto.Encrypt(txtNumero.Text);
            sqlCli.UpdateParameters["Comp"].DefaultValue = cripto.Encrypt(txtComp.Text);
            sqlCli.UpdateParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailCli.Text);
            sqlCli.UpdateParameters["Login"].DefaultValue = cripto.Encrypt(txtLoginCli.Text);
            sqlCli.UpdateParameters["DtNasc"].DefaultValue = cripto.Encrypt(dataCorreta);
            sqlCli.UpdateParameters["DataCad"].DefaultValue = dataCorreta2;
            sqlCli.UpdateParameters["Senha"].DefaultValue = cripto.Encrypt(txtsenhacli.Text);

            if (txtsenhacli.Text == txtConfSenhaCli.Text)
            {

                if (Session["forca"] == "Forte" | Session["forca"] == "Media")
                {

                    sqlCli.Update();

                    txtCaptcha.Text = "";
                    txtsenhacli.Text = "";
                    txtcelcli.Text = "";
                    txtcepcli.Text = "";
                    txtComp.Text = "";
                    txtConfSenhaCli.Text = "";
                    txtcpfcli.Text = "";
                    txtEmailCli.Text = "";
                    txtLoginCli.Text = "";
                    txtdtnasccli.Text = "";
                    txtNomeCli.Text = "";
                    txtNumero.Text = "";
                    txtsenhacli.Text = "";
                    txttelcli.Text = "";
                    lblErroCaptcha.Text = "";
                    lblErro.Text = "";
                    lblErro.Text = "Dados Alterados com Sucesso";
                }
                else
                {
                    lblErro.Text = "<font color = olive> Senha Fraca.</font>";
                    txtsenhacli.Text = "";
                    txtConfSenhaCli.Text = "";
                }
            }

            else
            {

                txtsenhacli.Text = "";
                txtConfSenhaCli.Text = "";
                lblErroCaptcha.Text = "";
                txtCaptcha.Text = "";
                lblErro.Text = "";
                lblErro.Text = "Senhas não conferem.";
            }
        }

        else
        {
            lblErroCaptcha.Text = "Texto não correspondente!";
            txtCaptcha.Text = "";

            txtsenhacli.Text = "";
            txtConfSenhaCli.Text = "";
            lblErro.Text = "";

        }
    

    }


    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        sqlCli.Delete();

        txtcelcli.Text = "";
        txtcepcli.Text = "";
        txtComp.Text = "";
        txtcpfcli.Text = "";
        txtdtnasccli.Text = "";
        txtEmailCli.Text = "";
        txtLoginCli.Text = "";
        txtNomeCli.Text = "";
        txtNumero.Text = "";
        txttelcli.Text = "";
        lblErro.Text = "Cliente excluído com sucesso!";
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