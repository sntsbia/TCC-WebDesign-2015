using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AlterarSenhaCli : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        btnInfo.Enabled = false;
    }
    protected void btnAlteraSenha_Click(object sender, EventArgs e)
    {
        if (Session["tipoSenha"] == "ADM")
        {
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
            if (txtCaptcha.Text == Session["CaptchaImageText"].ToString())
            {
                DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                String dataCorreta2 = dt2.ToString("yyyy/MM/dd");

                sqlAlterarAdm.UpdateParameters["DataCad"].DefaultValue = dataCorreta2;
                sqlAlterarAdm.UpdateParameters["Senha"].DefaultValue = cripto.Encrypt(txtsenhacli.Text);


                if (txtsenhacli.Text == txtsenhaconfcli.Text)
                {

                    if (Session["forca"] == "Forte" | Session["forca"] == "Media")
                    {
                        sqlAlterarAdm.Update();
                        lblErro.Text = "Senha do Funcioário alterada com sucesso";
                        Response.Redirect("AdmLogin.aspx");
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
                    txtsenhacli.Text = "";
                    txtsenhaconfcli.Text = "";
                    lblErroCaptcha.Text = "";
                    txtCaptcha.Text = "";
                    lblErroSenha.Text = "";
                    lblErro.Text = "Senhas não conferem.";
                }
            }

            lblErroCaptcha.Text = "Texto não correspondente!";
            txtCaptcha.Text = "";
            txtsenhacli.Text = "";
            txtsenhaconfcli.Text = "";
            lblErroSenha.Text = "";
            lblErro.Text = "";

        }
        else
        {
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
            if (txtCaptcha.Text == Session["CaptchaImageText"].ToString())
            {
                DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                String dataCorreta2 = dt2.ToString("yyyy/MM/dd");

                sqlAlterarCli.UpdateParameters["DataCad"].DefaultValue = dataCorreta2;
                sqlAlterarCli.UpdateParameters["Senha"].DefaultValue = cripto.Encrypt(txtsenhacli.Text);


                if (txtsenhacli.Text == txtsenhaconfcli.Text)
                {

                    if (Session["forca"] == "Forte" | Session["forca"] == "Media")
                    {
                        sqlAlterarCli.Update();
                        lblErro.Text = "Senha do cliente alterada com sucesso";
                        Response.Redirect("Login.aspx");
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
                    txtsenhacli.Text = "";
                    txtsenhaconfcli.Text = "";
                    lblErroCaptcha.Text = "";
                    txtCaptcha.Text = "";
                    lblErroSenha.Text = "";
                    lblErro.Text = "Senhas não conferem.";
                }
            }

            lblErroCaptcha.Text = "Texto não correspondente!";
            txtCaptcha.Text = "";
            txtsenhacli.Text = "";
            txtsenhaconfcli.Text = "";
            lblErroSenha.Text = "";
            lblErro.Text = "";

        }
    }

    protected void ImageButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
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