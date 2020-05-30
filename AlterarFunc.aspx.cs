using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AlterarFunc : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["logado"] != "OK")
        {
            Response.Redirect("AdmLogin.aspx");
        }

        btnInfo.Enabled = false;

        DataView dv = (DataView)sqlAdm.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count == 0)
        {
            Response.Redirect("PesqAdm.aspx");
        }
        else
        {
            txtCpfAdm.Enabled = false;

            txtEmailAdm.Text = cripto.Decrypt(dv.Table.Rows[0]["email_func"].ToString());
            txtLoginAdm.Text = cripto.Decrypt(dv.Table.Rows[0]["login_func"].ToString());
            txtNomeAdm.Text = cripto.Decrypt(dv.Table.Rows[0]["nome_func"].ToString());
            txtCpfAdm.Text = cripto.Decrypt(dv.Table.Rows[0]["cpf_func"].ToString());
            txtTelAdm.Text = cripto.Decrypt(dv.Table.Rows[0]["tel_func"].ToString());

            if (cripto.Decrypt(dv.Table.Rows[0]["tipo_func"].ToString()) == "ADM")
            {
                rdbtnCargo.SelectedIndex = 0;
            }
            else
            {
                rdbtnCargo.SelectedIndex = 1;
            }


        }


    }

    protected void btnAlterar_Click(object sender, EventArgs e)
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

        if (Session["CaptchaImageText"].ToString() == txtCaptcha.Text)
        {

            sqlAdm.UpdateParameters["nome"].DefaultValue = cripto.Encrypt(txtNomeAdm.Text);
            sqlAdm.UpdateParameters["cpf"].DefaultValue = cripto.Encrypt(txtCpfAdm.Text);
            sqlAdm.UpdateParameters["tipo"].DefaultValue = cripto.Encrypt(rdbtnCargo.Text);
            sqlAdm.UpdateParameters["tel"].DefaultValue = cripto.Encrypt(txtTelAdm.Text);
            sqlAdm.UpdateParameters["login"].DefaultValue = cripto.Encrypt(txtLoginAdm.Text);
            sqlAdm.UpdateParameters["email"].DefaultValue = cripto.Encrypt(txtEmailAdm.Text);
            sqlAdm.UpdateParameters["senha"].DefaultValue = cripto.Encrypt(txtSenhaAdm.Text);


            if (Session["forca"] == "Forte")
            {

                sqlAdm.Update();

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
                lblErro.Text = "Dados alterados com sucesso!";
            }
            else
            {
                if (Session["forca"] == "Media")
                {
                    sqlAdm.Update();

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
                    lblErro.Text = "Dados alterados com sucesso! ";

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

    protected void btnExcluir_Click(object sender, EventArgs e)
    {
        sqlAdm.Delete();
        txtCaptcha.Text = "";
        txtCpfAdm.Text = "";
        txtEmailAdm.Text = "";
        txtLoginAdm.Text = "";
        txtNomeAdm.Text = "";
        txtSenhaAdm.Text = "";
        txtTelAdm.Text = "";
        lblErro.Text = "Funcionário excluído!";
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