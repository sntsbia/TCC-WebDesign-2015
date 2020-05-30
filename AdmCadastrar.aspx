<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmCadastrar.aspx.cs" Inherits="AdmCadastrar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        *
        {
            font-family: 'Roboto Light' , sans-serif;
        }
        .auto-style1
        {
            font-family: Gadugi;
            font-size: medium;
        }
        
        #ContentPlaceHolder2_btnCont1, #ContentPlaceHolder2_btnCont2, #ContentPlaceHolder2_BtnEnviar
        {
            border: 1px solid #ccc;
            color: #e241d8;
            padding: 10px 90px;
            width: 300px;
            background-color: #fff;
            cursor: pointer;
        }
        #ContentPlaceHolder2_btnCont1:hover, #ContentPlaceHolder2_btnCont2:hover, #ContentPlaceHolder2_BtnEnviar:hover
        {
            background-color: #eee;
        }
        
        #imgPrimeiro, #imgSegundo, #imgTerceito
        {
            z-index: 999;
        }
        
        #opcoes
        {
            margin-left: 5%;
            margin-right: 10%;
            font-family: Gadugi;
            font-size: 20pt;
            font-weight: 200;
            width: 200px;
            position: fixed;
            height: 100px;
            margin-bottom: 0px;
            float: left;
        }
        #opcoes ul
        {
            list-style: none;
            padding: 0px;
            margin-left: 0%;
            float: left;
        }
        #opcoes
        {
            margin-bottom: -1px;
        }
        #opcoes ul li
        {
            float: left;
            text-align: center;
            font-weight: 200;
            width: 100px;
            margin: 0px;
            position: relative;
            display: block;
        }
        #opcoes ul li a
        {
            color: #fff;
            font-weight: 200;
            text-decoration: none;
            background: #6ECABF;
            display: block;
            padding: 10px 0 10px 15px;
            padding-top: 15px;
            overflow: hidden;
            height: 20px;
            width: 185px;
            margin: 0 1px;
            padding: 15px 20px;
        }
        #opcoes ul li a:hover
        {
            background: ##87E4E4;
            overflow: visible;
            font-weight: 200;
            color: #000;
        }
        #opcoes ul li ul
        {
            display: none;
        }
        #opcoes ul li:hover ul
        {
            display: block;
            padding: 0;
            top: 0;
        }
        .auto-style1
        {
            font-family: Gadugi;
            font-size: medium;
        }
        .auto-style2 {
            height: 94px;
        }
    </style>

    <script type="text/javascript" src="js/mascara.js"></script>
</asp:Content>


<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="cabecalho" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 2%;
            margin-left: 35%; margin-bottom: -2%;" runat="server" />
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server" >
    <div id="total" style=" margin-bottom:100px; margin-top:5%;">
    <asp:Image ID="img" runat="server" ImageUrl="~/REALIZE-IT/Funcionario.png" Width="10%" style="margin-top: -2%; margin-right: 2%; margin-left: 8%; margin-bottom:-10%;" /> <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmCadastrar.jpg" Width="70%" style=" margin-top: -3%; margin-right: 5%; margin-left: 15%; margin-bottom:-10%; float:right" />
        <div id="opcoes" style="margin-top: 12%; float:left; margin-left: 2%">
             <ul>
                    <li><a style="text-align: center;">Produtos </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink1" runat="server" href="PesqProd.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink2" runat="server" href="CadProd.aspx" onclick="HyperLink2_Click"
                                    Style="text-align: center;">Cadastrar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink4" runat="server" href="PesqProd.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                    <li><a style="text-align: center;">Cliente </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink3" runat="server" href="PesqCli.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink6" runat="server" href="PesqCli.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                    <li><a style="text-align: center;">Funcionário </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink7" runat="server" href="PesqAdm.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink8" runat="server" href="AdmCadastrar.aspx" onclick="HyperLink2_Click"
                                    Style="text-align: center;">Cadastrar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink9" runat="server" href="PesqAdm.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                </ul>
        </div>

        <div id="conteudo2" style="margin-right: 15%; margin-left: 55%; float: right; width: 50%;
            margin-top: 15%; margin-bottom:200px">

             <table align="center" class="style2">
                <tr>
                    <td class="auto-style2">
         <asp:Label ID="Label1" runat="server" Text="Nome" Style="margin-right: 20px;"></asp:Label>
                <div id="nomecli" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px;
                    width: 210px;">
                    <asp:TextBox ID="txtNomeAdm" runat="server" BorderStyle="None" Style="font-size: small"
                        Width="184px" ValidationGroup="adm"></asp:TextBox>
                </div>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtNomeAdm"
                    ErrorMessage="•" ForeColor="Red" ValidationGroup="adm"></asp:RequiredFieldValidator>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lblLogin" runat="server" Text="Login" Style="margin-right: 20px;"></asp:Label>
                <asp:Label ID="lblErroLogin" runat="server" Style="color: #FF0000;"></asp:Label>
                <div id="logincli" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px;
                    margin-left: 0%;">
                    <asp:TextBox ID="txtLoginAdm" runat="server" ValidationGroup="adm" BorderStyle="None"
                        Style="font-size: small" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ValidationGroup="adm"
                        ControlToValidate="txtLoginAdm" ErrorMessage="•" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                      <asp:Label ID="Label3" runat="server" Text="E-mail" Style="margin-right: 20px;"></asp:Label>
                <div id="emailadm" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px;
                    width: 200px;">
                    <asp:TextBox ID="txtEmailAdm" runat="server" BorderStyle="None" ValidationGroup="adm"
                        Style="font-size: small" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ValidationGroup="adm"
                        ControlToValidate="txtEmailAdm" ErrorMessage="•" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>  
                    </td>
                    <td class="style7">
                    <asp:Label ID="lblCpf" runat="server" Text="CPF" Style="margin-right: 20px;"></asp:Label>
                <asp:Label ID="lblErroCpf" runat="server" Style="color: #FF0000;"></asp:Label>
                <div id="cpfcli" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; ">
                    <asp:TextBox ID="txtCpfAdm" runat="server" ValidationGroup="adm" MaxLength="14" onkeyup="formataCPF(this,event);"
                        BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator16" ValidationGroup="adm" runat="server"
                        ErrorMessage="•" ForeColor="Red" ControlToValidate="txtCpfAdm"></asp:RequiredFieldValidator>
                </div>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                   <asp:Label ID="lblSexo" runat="server" Text="Cargo"></asp:Label>
                <div id="cargoadm" style="width: 250px;">
                    <p class="auto-style1">
                        <asp:RadioButtonList ID="rdbtnCargo" runat="server" ValidationGroup="adm" RepeatDirection="Horizontal"
                            Font-Names="Gadugi" Font-Size="11pt" Width="170px">
                            <asp:ListItem Value="ADM">Adm</asp:ListItem>
                            <asp:ListItem Value="USU">Funcionário</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ValidationGroup="adm"
                            ErrorMessage="•" ForeColor="Red" ControlToValidate="rdbtnCargo"></asp:RequiredFieldValidator>
                    </p>
                </div>
                    </td>
                    <td class="style9">
                         <asp:Label ID="lblTel" runat="server" Text="Telefone"></asp:Label>
                <div id="telAdm" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; ">
                    <asp:TextBox ID="txtTelAdm" runat="server" ValidationGroup="adm" MaxLength="14" onkeyup="formataTelefone(this,event);"
                        BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ValidationGroup="adm"
                        ErrorMessage="•" ForeColor="Red" ControlToValidate="txtTelAdm"></asp:RequiredFieldValidator>
                </div>
                      
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="lblSenha" runat="server" Text="Senha"></asp:Label>
                &nbsp;&nbsp;
                <asp:Label ID="lblErroSenha" runat="server" ForeColor="Red"></asp:Label>
                <div id="senhaAdm" style="margin-top:2%">
                    <asp:TextBox ID="txtSenhaAdm" runat="server" ValidationGroup="adm" BorderStyle="None"
                        Style="font-size: small" Width="169px" TextMode="Password" ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, Números e Símbolos Especiais ($%). Sua senha deverá ter no mínimo 6 caracteres "></asp:TextBox>
                    <asp:Button ID="btnInfo" runat="server" BackColor="White" BorderStyle="None" Font-Bold="True"
                        Height="16px" Text="?" ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, Números e Símbolos Especiais ($%).   Sua senha deverá ter no mínimo 6 caracteres "
                        Width="17px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ValidationGroup="adm"
                        ErrorMessage="•" ForeColor="Red" ControlToValidate="txtSenhaAdm"></asp:RequiredFieldValidator>
                </div>
                &nbsp;<br />
                    </td>
                    <td>
                       <p class="auto-style1">
                    <asp:Label ID="lblCaptcha" runat="server" Text="Você é humano?" Style="margin-bottom: -40px;"></asp:Label><asp:Label
                        ID="lblErroCaptcha" runat="server" Text="" Style="margin-left: 20px; color: #FF0000;"></asp:Label>
                    <div id="captcha" style="height: 100px">
                        <div id="captchatext">
                            <asp:TextBox ID="txtCaptcha" runat="server" ValidationGroup="adm" BorderStyle="None"
                                Style="font-size: small;" Width="200px"></asp:TextBox>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ValidationGroup="adm"
                            ErrorMessage="•" ControlToValidate="txtCaptcha" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <%--<asp:TextBox ID="txtimgcode" runat="server"></asp:TextBox>--%>
                        <br />
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" Style="margin-top: -30px; width: 80%;" />
                        <br />
                    </div> 
                    </td>
                </tr>
            </table>

                <asp:Button ID="BtnEnviar" runat="server" ValidationGroup="adm" Style="float: left;
                    margin-right: 700px; margin-top: 0px; font-family: gadugi; color: #e241d8; text-align: center;"
                    Text="CONCLUIR" OnClick="BtnEnviar_Click" CssClass="btnFichaCadastro" />
                <br />
                <br />
                <asp:Label ID="lblErro" runat="server" Text="" ForeColor="#E260D1"></asp:Label>
            
            <p>
                <asp:SqlDataSource ID="sqlCadastraAdm" runat="server" ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>"
                    InsertCommand="INSERT INTO funcionario(nome_func, cpf_func, tipo_func, tel_func, login_func, senha_func, data_cad, email_func) VALUES (@nome, @cpf, @tipo, @tel, @login, @senha, @datacad, @email)"
                    ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>"
                    SelectCommand="SELECT * FROM funcionario">
                    <InsertParameters>
                        <asp:Parameter Name="nome" />
                        <asp:Parameter Name="cpf" />
                        <asp:Parameter Name="tipo" />
                        <asp:Parameter Name="tel" />
                        <asp:Parameter Name="login" />
                        <asp:Parameter Name="senha" />
                        <asp:Parameter Name="datacad" />
                        <asp:Parameter Name="email" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </p>
        </div>
        
    </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div id="rodape-total">
               <div id="rodape" style="align-items:center">
               <div id="rodape-fixo">
                   <asp:Image ID="Image5" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px"  />
               </div>
               <asp:Button ID="btnSair" runat="server" BorderStyle="None" BackColor="Transparent" 
                       BorderColor="Transparent" Text="Sair" ForeColor="White" Font-Size="20px" 
                       style="float:right; position:static; font-family:Gadugi; margin-right:5%;" 
                       onclick="btnSair_Click" />
            </div>
       </div>
</asp:Content>

