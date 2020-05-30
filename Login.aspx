<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content4" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         *{font-family: 'Roboto Light', sans-serif;}
        #midddle{float:left; width:2%; height: 450px; background-image: url('REALIZE-IT/centro.png'); background-repeat:repeat-y;}
        h1{font-size:20pt; font-weight:100;}
        #cabecalho_entrar{margin-left:40px;}
        #cabecalho_cadastrar{margin-left:-80px;}
        center{width: 1280px; position: center; margin-left: auto; margin-right: auto;}
        
        #btnLogin{border:1px solid #ccc; color:#e241d8; padding:10px 90px; width:280px; background-color:#fff; cursor:pointer; margin-left: -19px;}
        #btnCadastrar{border:1px solid #ccc; color:#e241d8; padding:10px 90px; width:300px; background-color:#fff; cursor:pointer}
        #btnCadastrar:hover{ background-color:#d4d4d4;}
        #btnLogin:hover{background-color:#d4d4d4;}
        #login_container{margin-left:200px;}  
        
        #ContentPlaceHolder1_btnCadastrar{border:1px solid #ccc; color:#e241d8;font-size:15pt; 
                      padding:10px 90px; width:400px; background-color:#fff; 
                      cursor:pointer; margin-left:-75px;}
        #ContentPlaceHolder1_btnCadastrar:hover{background-color:#d4d4d4;}
        
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="conteudo" style="margin-bottom: 30%;">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/REALIZE-IT/LOGIN2.png" style="margin-top:0px; margin-bottom: 5%; margin-left: 20%; width: 800px;"/>


    <div id="login_container" style="width:25%; float:left; margin-top:0% ;margin-left: 25%; border-right: 1px solid #000;">
            <h1 id="cabecalho_entrar" style="margin-left:15%; margin-right:17%;">Entre aqui</h1>
            <div id="logincli" style="margin-left:8%; margin-right:17%;">
                <asp:TextBox type="text" id= "txtLogin" runat = "server" BorderStyle="None" 
                style="font-size: small;" Width="184px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLogin" ErrorMessage="•" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div id="senhacli" style="margin-left:8%; margin-right:17%;">
                 <asp:TextBox type="text" id = "txtSenha" runat = "server"  BorderStyle="None" style="font-size: small;" Width="184px" TextMode="Password" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSenha" ErrorMessage="•" ValidationGroup="login" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <asp:Label ID="lblErroLogin" runat="server" Font-Size="14px" Font-Names="Gadugi" ForeColor="#be36b6" style="margin-left:5%; margin-right:17%;"></asp:Label>
                 <br />
            <br />
            <br />
            <asp:CheckBox ID="chkLogado" runat="server" Font-Size="12px" Text="Manter Logado?" Font-Names="Gadugi" style="margin-bottom:10%; margin-left:15%; margin-right:17%;"></asp:CheckBox>
            <br />
            <asp:Button  ID="btnLogin" runat="server"  Text="ENTRAR" 
                style="color:#e241d8; width:280px; height: 40px; background-color:#fff; margin-top:5%; margin-left:0%; margin-right:17%;" Font-Size="13pt" 
                BorderColor="Silver" BorderWidth="1px" onclick="btnLogin_Click" ValidationGroup="login"></asp:Button>
        <asp:Label ID="lblErro" runat="server" Text="" ></asp:Label>
             
            <br />
            <asp:Button ID="btnRecuperar" runat="server" onclick="recuperarsenha" 
                style="color:#e241d8; background-color:#fff; margin-left: 14%; margin-top: 3%;" Text = "Recuperar Senha" 
                BorderStyle="None" Font-Size="13pt"></asp:Button>
        </div>

    <div id="cadastrar_container" style="width:25%; float:right; margin-top: 0%; margin-left: 5%; margin-right:8%;">
            <h1 id="cabecalho_cadastrar" style="font-size:20pt; font-weight:100; margin-left:-50%; margin-right:17%;">Ainda não é Cadastrado?</h1>
            <!--<input type="button" value="CADASTRE-SE JÁ!" id="btnCadastrar">-->
            <asp:Button ID="btnCadastrar" runat="server" Text="CADASTRE-SE JÁ!" 
                onclick="btnCadastrar_Click" style="color:#e241d8; width:300px; height:40px; background-color:#fff; margin-left:-50%; margin-right:17%;" Font-Size="13pt" 
                BorderColor="Silver" BorderWidth="1px"></asp:Button>
            <asp:SqlDataSource ID="sqlLogin" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT id_cli, login_cli, senha_cli FROM cliente WHERE (login_cli = @Login) AND (senha_cli = @Senha)">
                <SelectParameters>
                    <asp:Parameter Name="Login" />
                    <asp:Parameter Name="Senha" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlRecSenha" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT id_cli, login_cli, senha_cli, email_cli FROM cliente WHERE (login_cli = @Login)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtLogin" Name="Login" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sqlDataCliente" runat="server" ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" SelectCommand="SELECT datacad_cli, id_cli FROM cliente"></asp:SqlDataSource>
        </div></center>
    
    </right>
 </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="rodape-total">
               <div id="rodape" style="align-items:center">
               <div id="rodape-fixo">
                   <asp:Image ID="Image2" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px"  />
               </div>
            </div>
               <div id="rodape-cinza" style="
    margin-left: -8px;
    height: 300px;
    width: 100%;
    background-color: #9f9e9e;">
                <br />
                   <div id="rodape-final">
                      <asp:Image ID="Image8" runat="server" ImageUrl="~/REALIZE-IT/Rodape23.png" Width="900px" Height="269px" style="margin-top:0%;" usemap="#Map3" />
<map name="Map3" id="Map3">
  <area shape="rect" coords="246,74,337,92" href="SobreNos.aspx" />
  <area shape="rect" coords="248,108,358,124" href="FaleConosco.aspx" />
  <area shape="rect" coords="245,141,346,159" href="Campanhas.aspx" />
  <area shape="rect" coords="246,175,326,191" href="Produtos.aspx" />
  <area shape="rect" coords="247,210,357,225" href="MinhaSacola.aspx" />
  <area shape="rect" coords="470,73,496,117" href="https://www.facebook.com/projetohibiscus?fref=nf" />
  <area shape="rect" coords="465,158,503,194" href="http://re-alize.blogspot.com.br/" />
  <area shape="rect" coords="552,76,578,114" href="#Tumblr" />
  <area shape="rect" coords="550,157,586,194" href="https://instagram.com/projetorealize/" />
</map>
                   </div>
               </div>
       </div>
</asp:Content>



