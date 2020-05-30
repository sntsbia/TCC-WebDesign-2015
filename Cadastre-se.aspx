<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="Cadastre-se.aspx.cs" Inherits="Cadastre_se" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        *{font-family: 'Roboto Light', sans-serif;}
        .auto-style1 {
            font-family: Gadugi;
            font-size: medium;
        }
              
         #ContentPlaceHolder2_btnCont1, 
         #ContentPlaceHolder2_btnCont2,
         #ContentPlaceHolder2_BtnEnviar{border:1px solid #ccc; color:#e241d8; padding:10px 90px; width:300px; background-color:#fff; cursor:pointer}
        #ContentPlaceHolder2_btnCont1:hover,
        #ContentPlaceHolder2_btnCont2:hover,
        #ContentPlaceHolder2_BtnEnviar:hover{background-color:#eee;}
        
        #imgPrimeiro, #imgSegundo, #imgTerceito{z-index:999;}
    </style>
    <script type="text/javascript" src="js/mascara.js"></script>

</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
  

    <div id="cadastro1" runat="server" style="margin-bottom: 170px; margin-left: 6%;">
        <asp:Image name="imgPrimeiro" ID="imgPrimeiro" runat="server" 
            ImageUrl="~/REALIZE-IT/primeiro (2).png" 
            style="width: 1000px; margin-left: 0px; margin-bottom: 80px; margin-top: 80px;" />
        <div id="1" style="margin-left: 6%;">
    <p class="auto-style1">
        <asp:Label ID="lblEmail" runat="server" Text="E-mail" style="margin-right:20px;" Font-Size="14pt"></asp:Label>
         <asp:Label ID="lblErroEmail" runat="server" style="color: #FF0000;"></asp:Label>
         <div id="emailcli"  style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtEmailCli" runat="server" BorderStyle="None" 
                 style=" font-size: small" Width="184px" 
                 ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtEmailCli" ErrorMessage="Preencha os campos" ValidationGroup="1" ForeColor="Red">•</asp:RequiredFieldValidator>
        </div>
        </p>
        <p class="auto-style1">
        <asp:Label ID="lblLogin" runat="server" Text="Login" style="margin-right:20px;" EnableViewState="True" Font-Size="14pt"></asp:Label>
        <asp:Label ID="lblErroLogin" runat="server" style="color: #FF0000;"></asp:Label>
        <div id="logincli" style="background-image: url('REALIZE-IT/busca.png'); height: 20px;">
        <asp:TextBox ID="txtLoginCli" runat="server" BorderStyle="None" 
                style="font-size: small" Width="184px"></asp:TextBox>
           
        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtLoginCli" ValidationGroup="1" ForeColor="Red">•</asp:RequiredFieldValidator>
        </div>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="1" ForeColor="Red" />
           
        <asp:Button ID="btnCont1" runat="server" Text="Continuar" OnClick="btnCont1_Click" CssClass="btnFichaCadastro" ValidationGroup="1" Font-Size="14pt" Font-Names="Gadugi" />
    
                </p>

</div>
        </div>
    <div id="cadastro2" runat="server" style="margin-bottom: 170px; margin-left: 19%;">
    <asp:Image name="imgSegundo" ID="imgSegundo" runat="server" 
            ImageUrl="~/REALIZE-IT/segundo.png" 
            style="width: 1000px; margin-left: 0px; margin-bottom: 80px; margin-top: 80px;" />
        <div id="2" style="margin-left: 6%;">
    <p class="auto-style1">
        <asp:Label ID="lblNome" runat="server" Text="Nome" Font-Size="14pt"></asp:Label>
    <div id="nomecli" style="background-image: url('REALIZE-IT/busca.png')" >
        <asp:TextBox ID="txtNomeCli" runat="server" BorderStyle="None" 
            style="font-size: small" Width="184px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtNomeCli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
     </p>
    <p class="auto-style1">
<asp:Label ID="lblCpf" runat="server" Text="CPF" style= "margin-right:20px;" Font-Size="14pt"></asp:Label>
<asp:Label ID="lblErroCpf" runat="server" style="color: #FF0000;" ></asp:Label>
    <div id="cpfcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtcpfcli" runat="server" MaxLength="14" 
            onkeyup="formataCPF(this,event);" BorderStyle="None" style="font-size: small" 
            Width="184px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtcpfcli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
     </p>
     <p class="auto-style1">   
        <asp:Label ID="lblSexo" runat="server" Text="Sexo" Font-Size="14pt"></asp:Label>
        <div id="sexocli">
            <p class="auto-style1">
            <asp:RadioButtonList ID="rdbtnSexo" runat="server" RepeatDirection="Horizontal" 
                    Font-Names="Gadugi" Font-Size="11pt" Width="256px">
                <asp:ListItem>Feminino</asp:ListItem>
                <asp:ListItem>Masculino</asp:ListItem>
                <asp:ListItem>Outro</asp:ListItem>
            </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="rdbtnSexo" ValidationGroup="2">•</asp:RequiredFieldValidator>
                </p>
        </div>
    </p>
        <br />
    <p class="auto-style1">
    <asp:Label ID="lblEstCiv"  runat="server" Text="Estado Civil" Font-Size="14pt"></asp:Label>
        <div id="estcivcli">
            <p class="auto-style1">
            <asp:RadioButtonList ID="rdbtnEst" runat="server" RepeatDirection="Horizontal" 
                    Font-Names="Gadugi"  Font-Size="11pt" Width="304px">
                <asp:ListItem>Casado(a)</asp:ListItem>
                <asp:ListItem>Solteiro(a)</asp:ListItem>
                <asp:ListItem>Viúvo(a)</asp:ListItem>
                <asp:ListItem>Outro(a)</asp:ListItem>
            </asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="rdbtnEst" ValidationGroup="2">•</asp:RequiredFieldValidator>
                </p>
        </div>
    </p>
        <br />
    <p class="auto-style1">
    <asp:Label ID="lblDtnasc" runat="server" Text="Data de Nascimento" Font-Size="14pt"></asp:Label>
        <div id="dtnasccli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtdtnasccli" runat="server" MaxLength="10" 
                onkeyup="formataData(this,event);" BorderStyle="None" style="font-size: small" 
                Width="184px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtdtnasccli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
    </p>
    <p class="auto-style1">
    <asp:Label ID="lblTel" runat="server" Text="Telefone" Font-Size="14pt"></asp:Label>
        <div id="telcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txttelcli" runat="server" MaxLength="14" 
                onkeyup="formataTelefone(this,event);" BorderStyle="None" 
                style="font-size: small" Width="184px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txttelcli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
    </p>
    <p class="auto-style1">
    <asp:Label ID="lblCel" runat="server" Text="Celular" Font-Size="14pt"></asp:Label>
        <div id="celcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtcelcli" runat="server" MaxLength="15" 
                onkeyup="formataTelefone(this,event);" BorderStyle="None" 
                style="font-size: small" Width="184px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtcelcli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
    </p>
   <p class="auto-style1">
       <div id="cepcepcli">
           <p class="auto-style1">
    <asp:Label ID="lblCep" runat="server" Text="CEP" style="margin-right:20px;" Font-Size="14pt"></asp:Label> 
               <asp:Label ID="lblErroCep" runat="server" style="color: #FF0000;" ></asp:Label>
               </p>
        <div id="cepcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtcepcli" runat="server" MaxLength="9" 
                onkeyup="formataCEP(this,event);"  BorderStyle="None" 
                style="font-size: small; float: left; margin-top: 0px;" Width="184px" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtcepcli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
       <asp:ImageButton ID="imgbtnCep" runat="server" ImageUrl="~/REALIZE-IT/gps.png" 
               Width="20px" style="float: right; margin-top: -35px;" OnClick="imgbtnCep_Click" 
               Height="20px"/>
    </div>
           </p>
        <div id="lblEndereco" runat="server">
        <p class="auto-style1" style="margin-top: -15px;">
            <asp:Label ID="lblRua" runat="server" Font-Size="11pt"></asp:Label>
            <br />
            <asp:Label ID="lblBairro" runat="server" Font-Size="11pt"></asp:Label>
            <br />
            <asp:Label ID="lblCidade" runat="server" Font-Size="11pt" ></asp:Label>
            <br />
            <asp:Label ID="lblUF" runat="server" Font-Size="11pt" ></asp:Label>
        </p>
        </div>

    <p class="auto-style1">
    <asp:Label ID="lblNum" runat="server" Text="Número" Font-Size="14pt"></asp:Label>
        <div id="numcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtnumcli" runat="server" BorderStyle="None" 
                style="font-size: small" Width="184px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Preencha os campos" ControlToValidate="txtnumcli" ValidationGroup="2">•</asp:RequiredFieldValidator>
        </div>
    </p>
    <p class="auto-style1">
    <asp:Label ID="lblComp" runat="server" Text="Complemento" Font-Size="14pt"></asp:Label>
        <div id="compcli" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtcompcli" runat="server" BorderStyle="None" style="font-size: small" Width="200px"></asp:TextBox>
            <br />
            <br />
           
        </div>
    </p>
                <asp:ValidationSummary ID="ValidationSummary2" runat="server" />
        <br />
                <asp:Button ID="btnCont2" runat="server"  style="float: left;  font-family: gadugi; color: #e241d8;  text-align: center;" Text="Continuar" OnClick="btnCont2_Click" CssClass="btnFichaCadastro" ValidationGroup="2" />
        </div>
        </div>

    <div id="cadastro3" runat="server" style="margin-bottom: 170px; margin-left: 19%;">
    
    <asp:Image name="imgTerceiro" ID="imgTerceiro" runat="server" 
            ImageUrl="~/REALIZE-IT/terceiro.png" 
            style="width: 1000px; margin-left: 0px; margin-bottom: 80px; margin-top: 80px;" />
        <div id="3" style="margin-left: 6%;">
     <p class="auto-style1" runat="server">
         <asp:Label ID="lblSenha" runat="server" Text="Senha" Font-Size="14pt"></asp:Label>
    &nbsp;&nbsp;
         <asp:Label ID="lblErroSenha" runat="server"></asp:Label>
    <div id="senhacli">
        <asp:TextBox ID="txtsenhacli" runat="server" BorderStyle="None" 
            style="font-size: small" Width="177px" TextMode="Password"></asp:TextBox>
        <asp:Button ID="btnInfo" runat="server" BackColor="White" BorderStyle="None" 
            Font-Bold="True" Height="16px" Text="?" 
            ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, números e símbolos especiais ($%).   Sua senha deverá ter no mínimo 6 caracteres " 
            Width="16px" OnClick="btnInfo_Click" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="•" ControlToValidate="txtsenhacli" ValidationGroup="3"></asp:RequiredFieldValidator>
        </div>
        &nbsp;</p>
    <p class="auto-style1">
    <asp:Label ID="lblConfSenha" runat="server" Text="Confirmar Senha" Font-Size="14pt"></asp:Label>
    <div id="senhaconfcli">
        <asp:TextBox ID="txtsenhaconfcli" runat="server" BorderStyle="None" 
            style="font-size: small" Width="179px" TextMode="Password"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="•" ControlToValidate="txtsenhaconfcli" ValidationGroup="3"></asp:RequiredFieldValidator>
    </div>
     </p>
     <p class="auto-style1">
    <asp:Label ID="lblCaptcha" runat="server" Text="Você é humano?" style="margin-bottom: -40px;" Font-Size="14pt"></asp:Label><asp:Label ID="lblErroCaptcha" runat="server" Text="" style="margin-left: 20px; color: #FF0000;"></asp:Label>
    <div id="captcha" style="height: 100px">
        <div id="captchatext">
        <asp:TextBox ID="txtCaptcha" runat="server" BorderStyle="None" style="font-size: small; margin-top:-200px;" Width="200px"></asp:TextBox>
        </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="•" ControlToValidate="txtCaptcha" ValidationGroup="3"></asp:RequiredFieldValidator>
         
        <br />
        <%--<asp:TextBox ID="txtimgcode" runat="server"></asp:TextBox>--%>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" style="margin-top: -30px;"/>
    <br />
    </div>
     </p>
     <asp:Button ID="BtnEnviar" runat="server"  style="float: left; margin-right: 700px; margin-top:10px; font-family: gadugi; color: #e241d8; text-align: left; text-align: center;" Text="CONCLUIR" OnClick="BtnEnviar_Click" CssClass="btnFichaCadastro" ValidationGroup="3" />

        <br />
        <asp:SqlDataSource ID="sqlCadastraCli" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT  FROM cliente" 
            
            InsertCommand="INSERT INTO cliente(nome_cli, cpf_cli, sx_cli, estciv_cli, dtnasc_cli, tel_cli, cel_cli, cep, num_cli, comp_cli, email_cli, login_cli, senha_cli, datacad_cli) VALUES (@Nome, @Cpf, @Sexo, @EstCiv, @Nasc, @Tel, @Cel, @Cep, @Num, @Comp, @Email, @Login, @Senha, @DataCad)">
            <InsertParameters>
                <asp:Parameter Name="Nome" />
                <asp:Parameter Name="Cpf" />
                <asp:Parameter Name="Sexo" />
                <asp:Parameter Name="EstCiv" />
                <asp:Parameter Name="Nasc" />
                <asp:Parameter Name="Tel" />
                <asp:Parameter Name="Cel" />
                <asp:Parameter Name="Cep" />
                <asp:Parameter Name="Num" />
                <asp:Parameter Name="Comp" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Login" />
                <asp:Parameter Name="Senha" />
                <asp:Parameter Name="DataCad" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlEmail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT id_cli, email_cli FROM cliente WHERE (email_cli = @Email)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtEmailCli" Name="Email" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlLogin" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT login_cli FROM cliente WHERE (login_cli = @Login)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtLoginCli" Name="Login" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="sqlCpf" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT cpf_cli FROM cliente WHERE (cpf_cli = @Cpf)">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtcpfcli" Name="Cpf" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <p class="auto-style1">
            <br />
            <br />
            <br />
            <br />
            <br />
        <asp:Label ID="lblErro" runat="server" ForeColor="#E260D1" style="margin-left: 0px; margin-bottom: -50px;" Font-Size="13pt"></asp:Label>
        </p>
        <br />
            </div>    
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
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


