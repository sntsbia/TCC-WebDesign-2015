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

public partial class Cadastre_se : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        cadastro1.Visible = true;
        cadastro2.Visible = false;
        cadastro3.Visible = false;
        lblEndereco.Visible = false;
        btnInfo.Enabled = false;
    }

    public static bool ValidarEmail(string strEmail)
    {
        string strModelo = "^([0-9a-zA-Z]([-.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$";
        if (System.Text.RegularExpressions.Regex.IsMatch(strEmail, strModelo))
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void btnCont1_Click(object sender, EventArgs e)
    {
        DataView dvEmail;
        dvEmail = (DataView)sqlEmail.Select(DataSourceSelectArguments.Empty);

        if (dvEmail.Table.Rows.Count == 0)
        {
            DataView dvLogin;
            dvLogin = (DataView)sqlLogin.Select(DataSourceSelectArguments.Empty);

            if (dvLogin.Table.Rows.Count == 0)
            {
                if (ValidarEmail(txtEmailCli.Text) == true)
                {
                    cadastro1.Visible = false;
                    cadastro2.Visible = true;
                    lblEndereco.Visible = false;
                    cadastro3.Visible = false;
                }

                if (ValidarEmail(txtEmailCli.Text) == false)
                {
                    lblErroEmail.Text = "Email inválido";
                    txtEmailCli.Text = "";
                    lblErroLogin.Text = "";
                }
            }
            else
            {
                lblErroLogin.Text = "Login já existente";
                txtLoginCli.Text = "";
                lblErroEmail.Text = "";
            }
        }
        else
        {
            txtEmailCli.Text = "";
            lblErroEmail.Text = "Email já existe";
        }




    }

    protected void imgbtnCep_Click(object sender, ImageClickEventArgs e)
    {
        lblEndereco.Visible = true;

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
            lblCidade.Text = "Cidade: " + Regex.Matches(pagina, "<td width=\"140\" style=\"padding: 2px\">(.*)</td>")[1].Groups[1].Value + ", " + Regex.Match(pagina, "<td width=\"25\" style=\"padding: 2px\">(.*)</td>").Groups[1].Value;
            lblErroCep.Text = "";
        }
        cadastro1.Visible = false;
        cadastro2.Visible = true;
        cadastro3.Visible = false;
    }

    protected void btnCont2_Click(object sender, EventArgs e)
    {


        DataView dvCpf;
        dvCpf = (DataView)sqlCpf.Select(DataSourceSelectArguments.Empty);

        if (dvCpf.Table.Rows.Count == 0)
        {
            cadastro1.Visible = false;
            cadastro2.Visible = false;
            cadastro3.Visible = true;
        }
        else
        {
            cadastro1.Visible = false;
            cadastro2.Visible = true;
            cadastro3.Visible = false;
            lblErroCpf.Text = "Cpf já existente";
            txtcpfcli.Text = "";
        }

    }

    protected void BtnEnviar_Click(object sender, EventArgs e)
    {
        {
            cadastro1.Visible = false;
            cadastro2.Visible = false;
            cadastro3.Visible = true;

            int qtdLetras;
            int qtdLMai = 0, qtdLMin = 0, qtdNum = 0, qtdCar = 0;

            qtdLetras = txtsenhacli.Text.Length; // contar caracteres

            if (qtdLetras < 6)
            {
                lblErroSenha.Text = " <font color = red> Favor digitar outra senha com 6 caracteres no mínimo </font>";
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
            Session["senha"] = txtsenhacli.Text;

            sqlCadastraCli.InsertParameters["Nome"].DefaultValue = cripto.Encrypt(txtNomeCli.Text);
            sqlCadastraCli.InsertParameters["Cpf"].DefaultValue = cripto.Encrypt(txtcpfcli.Text);
            sqlCadastraCli.InsertParameters["Sexo"].DefaultValue = cripto.Encrypt(rdbtnSexo.Text);
            sqlCadastraCli.InsertParameters["EstCiv"].DefaultValue = cripto.Encrypt(rdbtnEst.Text);
            sqlCadastraCli.InsertParameters["Tel"].DefaultValue = cripto.Encrypt(txttelcli.Text);
            sqlCadastraCli.InsertParameters["Cel"].DefaultValue = cripto.Encrypt(txtcelcli.Text);
            sqlCadastraCli.InsertParameters["Cep"].DefaultValue = cripto.Encrypt(txtcepcli.Text);
            sqlCadastraCli.InsertParameters["Num"].DefaultValue = cripto.Encrypt(txtnumcli.Text);
            sqlCadastraCli.InsertParameters["Comp"].DefaultValue = cripto.Encrypt(txtcompcli.Text);
            sqlCadastraCli.InsertParameters["Email"].DefaultValue = cripto.Encrypt(txtEmailCli.Text);
            sqlCadastraCli.InsertParameters["Login"].DefaultValue = cripto.Encrypt(txtLoginCli.Text);

            DateTime dt = Convert.ToDateTime(txtdtnasccli.Text);
            String dataCorreta = dt.ToString("yyyy/MM/dd");

            DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            String dataCorreta2 = dt2.ToString("yyyy/MM/dd");

            sqlCadastraCli.InsertParameters["Nasc"].DefaultValue = cripto.Encrypt(dataCorreta);
            sqlCadastraCli.InsertParameters["DataCad"].DefaultValue = dataCorreta2;
            sqlCadastraCli.InsertParameters["Senha"].DefaultValue = cripto.Encrypt(Session["senha"].ToString());

            if (txtsenhacli.Text == txtsenhaconfcli.Text)
            {

                if (Session["forca"] == "Forte" | Session["forca"] == "Media")
                {
                    cadastro1.Visible = false;
                    cadastro2.Visible = false;
                    cadastro3.Visible = true;

                    sqlCadastraCli.Insert();

                    txtCaptcha.Text = "";
                    txtsenhacli.Text = "";
                    txtcelcli.Text = "";
                    txtcepcli.Text = "";
                    txtcompcli.Text = "";
                    txtsenhaconfcli.Text = "";
                    txtcpfcli.Text = "";
                    txtEmailCli.Text = "";
                    txtLoginCli.Text = "";
                    txtdtnasccli.Text = "";
                    txtNomeCli.Text = "";
                    txtnumcli.Text = "";
                    txtsenhacli.Text = "";
                    txttelcli.Text = "";
                    lblErroCaptcha.Text = "";
                    lblErroSenha.Text = "";
                    lblErro.Text = "Cadastro concluído!";
                }
                else
                {
                    lblErroSenha.Text = "<font color = olive> Senha Fraca.</font>";
                    txtsenhacli.Text = "";
                    txtsenhaconfcli.Text = "";
                }
            }
            else
            {
                cadastro1.Visible = false;
                cadastro2.Visible = false;
                cadastro3.Visible = true;

                txtsenhacli.Text = "";
                txtsenhaconfcli.Text = "";
                lblErroCaptcha.Text = "";
                txtCaptcha.Text = "";
                lblErroSenha.Text = "";
                lblErro.Text = "Senhas não conferem.";
            }
        }

        else
        {
            lblErroCaptcha.Text = "Texto não correspondente!";
            txtCaptcha.Text = "";
            cadastro1.Visible = false;
            cadastro2.Visible = false;
            cadastro3.Visible = true;
            txtsenhacli.Text = "";
            txtsenhaconfcli.Text = "";
            lblErroSenha.Text = "";
            lblErro.Text = "";

        }
    }

    protected void btnInfo_Click(object sender, EventArgs e)
    {
        cadastro1.Visible = false;
        cadastro2.Visible = false;
        cadastro3.Visible = true;

    }
}
