using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net; // importe o namespace .Net
using System.Net.Mail; // importe o namespace .Net.Mail

public partial class RecuperarSenha : System.Web.UI.Page
{
    Criptografia cripto = new Criptografia("REALIZEit");

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnPesqCpf_Click(object sender, EventArgs e)
    {
        if (Session["tipo"] == "CLI")
        {
            sqlPesqCpfCli.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCpf.Text);

            DataView dv;

            dv = (DataView)sqlPesqCpfCli.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count != 0)
            {
                Session["nome"] = cripto.Decrypt(dv.Table.Rows[0]["nome_cli"].ToString());
                Session["login"] = cripto.Decrypt(dv.Table.Rows[0]["login_cli"].ToString());
                Session["senha"] = cripto.Decrypt(dv.Table.Rows[0]["senha_cli"].ToString());
                Session["email"] = cripto.Decrypt(dv.Table.Rows[0]["email_cli"].ToString());

                SmtpClient cliente = new SmtpClient("smtp-mail.outlook.com");
                cliente.EnableSsl = true;

                // email do remetente -> quem está enviando
                MailAddress remetente = new MailAddress("projetorealize@outlook.com", "Grupo PROJETO Realizeit");

                // email do destinatario -> quem irá receber
                MailAddress destinatario = new MailAddress
                    (Session["email"].ToString(), Session["nome"].ToString());

                // criando a mensagem
                MailMessage mensagem = new MailMessage(remetente, destinatario);

                mensagem.Body = "Caro " + Session["nome"] + ", seu login no site REALIZEit é " + Session["login"] + " e sua senha é " + Session["senha"];
                mensagem.IsBodyHtml = true;
                mensagem.Subject = "Recuperação de Senha"; // assunto

                // criar um email no HOTMAIL para ser o gerenciador de envio de email´s
                // aqui precisa do email completo e da senha
                NetworkCredential credenciais = new NetworkCredential("generico6wa@hotmail.com", "generico3g", "");

                cliente.Credentials = credenciais;

                try
                {
                    cliente.Send(mensagem);
                    lblErro.Text = "Seu email foi enviado com sucesso. Aguarde contato.";
                }
                catch (Exception ex)
                {
                    lblErro.Text = ex.ToString();
                }
            }
        }
        else
        {
            sqlPesqCpfAdm.SelectParameters["Cpf"].DefaultValue = cripto.Encrypt(txtCpf.Text);

            DataView dv;

            dv = (DataView)sqlPesqCpfCli.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count != 0)
            {
                Session["nome"] = cripto.Decrypt(dv.Table.Rows[0]["nome_func"].ToString());
                Session["login"] = cripto.Decrypt(dv.Table.Rows[0]["login_func"].ToString());
                Session["senha"] = cripto.Decrypt(dv.Table.Rows[0]["senha_func"].ToString());
                Session["email"] = cripto.Decrypt(dv.Table.Rows[0]["email_func"].ToString());

                SmtpClient cliente = new SmtpClient("smtp-mail.outlook.com");
                cliente.EnableSsl = true;

                // email do remetente -> quem está enviando
                MailAddress remetente = new MailAddress("projetorealize@outlook.com", "Grupo PROJETO Realizeit");

                // email do destinatario -> quem irá receber
                MailAddress destinatario = new MailAddress
                    (Session["email"].ToString(), Session["nome"].ToString());

                // criando a mensagem
                MailMessage mensagem = new MailMessage(remetente, destinatario);

                mensagem.Body = "Caro " + Session["nome"] + ", seu login no site REALIZEit é " + Session["login"] + " e sua senha é " + Session["senha"];
                mensagem.IsBodyHtml = true;
                mensagem.Subject = "Recuperação de Senha"; // assunto

                // criar um email no HOTMAIL para ser o gerenciador de envio de email´s
                // aqui precisa do email completo e da senha
                NetworkCredential credenciais = new NetworkCredential("generico6wa@hotmail.com", "generico3g", "");

                cliente.Credentials = credenciais;

                try
                {
                    cliente.Send(mensagem);
                    lblErro.Text = "Seu email foi enviado com sucesso. Aguarde contato.";
                }
                catch (Exception ex)
                {
                    lblErro.Text = ex.ToString();
                }
            }
        }

    }

}