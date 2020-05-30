using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdmCadastrar : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }

        btnInfo.Enabled = false;
    }
    protected void BtnEnviar_Click(object sender, EventArgs e)
    {
        int qtdLetras;
        int qtdLMai = 0, qtdLMin = 0, qtdNum = 0, qtdCar = 0;

        qtdLetras = txtSenhaAdm.Text.Length; // contar caracteres

        if (qtdLetras < 6)
        {
            lblErroSenha.Text = " <font color = red> Favor digitar outra senha com 6 caracteres no mínimo </font>";
        }

        else
        {
            for (int i = 0; i < qtdLetras; i++) // exibir força
            {
                if (char.IsLower(txtSenhaAdm.Text[i])) // verificar cada caracter minusculo (cada caixinha de cada vcaracter)
                {
                    qtdLMin++; // qtdLMin = qtdLMin + 1
                }
                else
                {
                    if (char.IsUpper(txtSenhaAdm.Text[i])) // verificar caracter maiusculo
                    {
                        qtdLMai++;
                    }
                    else
                    {
                        if (char.IsNumber(txtSenhaAdm.Text[i])) // verificar numero
                        {
                            qtdNum++;
                        }
                        else
                        {
                            if (!char.IsWhiteSpace(txtSenhaAdm.Text[i]))
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
            Session["senha"] = txtSenhaAdm.Text;

            sqlCadastraAdm.InsertParameters["nome"].DefaultValue = cripto.Encrypt(txtNomeAdm.Text);
            sqlCadastraAdm.InsertParameters["cpf"].DefaultValue = cripto.Encrypt(txtCpfAdm.Text);
            sqlCadastraAdm.InsertParameters["tipo"].DefaultValue = cripto.Encrypt(rdbtnCargo.Text);
            sqlCadastraAdm.InsertParameters["tel"].DefaultValue = cripto.Encrypt(txtTelAdm.Text);
            sqlCadastraAdm.InsertParameters["login"].DefaultValue = cripto.Encrypt(txtLoginAdm.Text);
            sqlCadastraAdm.InsertParameters["email"].DefaultValue = cripto.Encrypt(txtEmailAdm.Text);
            sqlCadastraAdm.InsertParameters["senha"].DefaultValue = cripto.Encrypt(Session["senha"].ToString());

            DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            String dataCorreta2 = dt2.ToString("yyyy/MM/dd");

            sqlCadastraAdm.InsertParameters["datacad"].DefaultValue = dataCorreta2;

           if (Session["forca"] == "Forte" )
            {

                sqlCadastraAdm.Insert();

                txtCaptcha.Text = "";
                txtSenhaAdm.Text = "";
                txtCpfAdm.Text = "";
                txtEmailAdm.Text = "";
                txtLoginAdm.Text = "";
                txtNomeAdm.Text = "";
                txtSenhaAdm.Text = "";
                txtTelAdm.Text = "";
                lblErroCaptcha.Text = "";
                lblErroSenha.Text = "";
                lblErro.Text = "Cadastro concluído!";
            }
            else
            {
               if (Session["forca"] == "Media")
                {
                    sqlCadastraAdm.Insert();

                    txtCaptcha.Text = "";
                    txtSenhaAdm.Text = "";
                    txtCpfAdm.Text = "";
                    txtEmailAdm.Text = "";
                    txtLoginAdm.Text = "";
                    txtNomeAdm.Text = "";
                    txtSenhaAdm.Text = "";
                    txtTelAdm.Text = "";
                    lblErroCaptcha.Text = "";
                    lblErroSenha.Text = "";
                    lblErro.Text = "Cadastro concluído!";

                }
                else 
                { 
                lblErroSenha.Text = "<font color = olive> Senha Fraca.</font>";
                txtSenhaAdm.Text = "";
                }
            }
        }
        else
        {
            lblErroCaptcha.Text = "Texto não correspondente!";
            txtCaptcha.Text = "";
            txtSenhaAdm.Text = "";
        }
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