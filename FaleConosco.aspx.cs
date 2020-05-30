using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Net.Mail;

public partial class FaleConosco : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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

    protected void btnEnviar_Click(object sender, EventArgs e)
    {
        if (ValidarEmail(txtEmaill.Text) == false)
        {
            lblResp.Text = "Email inválido";
            txtEmaill.Text = "";

        }
        else
        {
            SmtpClient cliente = new SmtpClient("smtp.live.com", 587);
            cliente.EnableSsl = true;

            MailAddress remetente = new MailAddress(txtEmaill.Text, txtNomee.Text);
            MailAddress destinatario = new MailAddress("projetorealize@hotmail.com", "Realize");
            MailMessage mensagem = new MailMessage(remetente, destinatario);

            mensagem.Body = "Nome:" + txtNomee.Text + "\r\n" +
                            "Email:" + txtEmaill.Text + "\r\n" +
                            "Assunto:" + txtAssuntoo.Text + "\r\n" +
                            "Mensagem: " + txtMensagemm.Text;
            mensagem.Subject = txtAssuntoo.Text;

            NetworkCredential credenciais = new NetworkCredential("generico6wa@hotmail.com", "generico3g", "");
            cliente.Credentials = credenciais;

            try
            {
                cliente.Send(mensagem);
                lblResp.Text = "E-mail enviado!";
                txtNomee.Text = "";
                txtEmaill.Text = "";
                txtAssuntoo.Text = "";
                txtMensagemm.Text = "";
            }
            catch (Exception ex)
            {
                lblResp.Text = ex.ToString();
            }
        }
    }
}