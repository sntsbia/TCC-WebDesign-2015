<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AlterarCli.aspx.cs" Inherits="AlterarCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        * {
            font-family: 'Roboto Light', sans-serif;
        }

        #ContentPlaceHolder2_btnCont1, #ContentPlaceHolder2_btnCont2, #ContentPlaceHolder2_BtnEnviar {
            border: 1px solid #ccc;
            color: #e241d8;
            padding: 10px 90px;
            width: 300px;
            background-color: #fff;
            cursor: pointer;
        }

            #ContentPlaceHolder2_btnCont1:hover, #ContentPlaceHolder2_btnCont2:hover, #ContentPlaceHolder2_BtnEnviar:hover {
                background-color: #eee;
            }

        #imgPrimeiro, #imgSegundo, #imgTerceito {
            z-index: 999;
        }

        #opcoes {
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

            #opcoes ul {
                list-style: none;
                padding: 0px;
                margin-left: 0%;
                float: left;
            }

        #opcoes {
            margin-bottom: -1px;
        }

            #opcoes ul li {
                float: left;
                text-align: center;
                font-weight: 200;
                width: 100px;
                margin: 0px;
                position: relative;
                display: block;
            }

                #opcoes ul li a {
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

                    #opcoes ul li a:hover {
                        background: ##87E4E4;
                        overflow: visible;
                        font-weight: 200;
                        color: #000;
                    }

                #opcoes ul li ul {
                    display: none;
                }

                #opcoes ul li:hover ul {
                    display: block;
                    padding: 0;
                    top: 0;
                }

        .auto-style1 {
            width: 100%;
        }
    </style>
    <script type="text/javascript" src="js/mascara.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="total" style="margin-top: 5%; margin-bottom: 100px;">
        <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmAlterar.png" Width="60%"
            Style="margin-top: 3%; margin-right: 10%; margin-left: 22%; margin-bottom: -10%;" />
        <div id="opcoes" style="margin-top: 10%; float: left;">
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

        <div id="conteudo2" style="margin-right: 20%; margin-left: 50%; float: right; width: 50%; margin-top: 15%; margin-bottom: 200px">

            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblNome" runat="server" Text="Nome" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="nomecli" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%;">
                            <asp:TextBox ID="txtNomeCli" runat="server" BorderStyle="None"
                                Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="login" runat="server" Text="Login" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div1" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtLoginCli" runat="server" BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Cpf" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div2" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtcpfcli" runat="server" MaxLength="14"
                                onkeyup="formataCPF(this,event);" BorderStyle="None" Style="font-size: small"
                                Width="184px"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Sexo" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div3">
                            <asp:RadioButtonList ID="rdbtnSexo" runat="server" RepeatDirection="Horizontal"
                                Font-Names="Gadugi" Font-Size="11pt" Width="250px">
                                <asp:ListItem>Feminino</asp:ListItem>
                                <asp:ListItem>Masculino</asp:ListItem>
                                <asp:ListItem>Outro</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Estado Civil" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div4">
                            <asp:RadioButtonList ID="rdbtnEst" runat="server" RepeatDirection="Horizontal"
                                Font-Names="Gadugi" Font-Size="11pt" Width="304px">
                                <asp:ListItem>Casado(a)</asp:ListItem>
                                <asp:ListItem>Solteiro(a)</asp:ListItem>
                                <asp:ListItem>Viúvo(a)</asp:ListItem>
                                <asp:ListItem>Outro(a)</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Data de Nascimento" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div5" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtdtnasccli" runat="server" MaxLength="10"
                                onkeyup="formataData(this,event);" BorderStyle="None" Style="font-size: small"
                                Width="184px"></asp:TextBox>
                        </div>

                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label2" runat="server" Text="Telefone" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div6" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txttelcli" runat="server" MaxLength="14"
                                onkeyup="formataTelefone(this,event);" BorderStyle="None"
                                Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label6" runat="server" Text="Celular" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div7" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtcelcli" runat="server" MaxLength="15"
                                onkeyup="formataTelefone(this,event);" BorderStyle="None"
                                Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label7" runat="server" Text="Cep" Style="margin-right: 20px; font-size: 11pt"></asp:Label> <asp:Label ID="lblErroCep" runat="server" Text="" ForeColor="#E260D1" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div8" runat="server" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 204px;">
                            <asp:TextBox ID="txtcepcli" runat="server" MaxLength="9"
                                onkeyup="formataCEP(this,event);" BorderStyle="None"
                                Style="font-size: small; float: left; margin-top: 0px;" Width="184px"></asp:TextBox>
                            <asp:ImageButton ID="imgbtnCep" runat="server" ImageUrl="~/REALIZE-IT/gps.png"
                                Width="20px" Style="float: right; margin-top: -5px"
                                Height="20px" onclick="imgbtnCep_Click" />
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label8" runat="server" Text="Número" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div9" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtNumero" runat="server" BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="lblRua" runat="server" Font-Size="11pt"></asp:Label>
                        <br />
                        <asp:Label ID="lblBairro" runat="server" Font-Size="11pt"></asp:Label>
                        <br />
                        <asp:Label ID="lblCidade" runat="server" Font-Size="11pt"></asp:Label>
                        <br />
                        <asp:Label ID="lblUF" runat="server" Font-Size="11pt"></asp:Label>
                        <br />
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label9" runat="server" Text="Complemento" Style="margin-right: 20px; font-size: 11pt"></asp:Label>
                        <div id="div10" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; margin-left: 0%; width: 200px;">
                            <asp:TextBox ID="txtComp" runat="server" BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label10" runat="server" Text="E-mail" Style="margin-right: 20px; font-size:11pt"></asp:Label>
                        <div id="div11" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; width: 200px;">
                            <asp:TextBox ID="txtEmailCli" runat="server" BorderStyle="None" Style="font-size: small" Width="184px"></asp:TextBox>
                        </div>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text="Senha" Style="margin-right: 20px; font-size:11pt"></asp:Label>
                        <div id="div12" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; width: 200px;">
                            <asp:TextBox ID="txtsenhacli" runat="server" BorderStyle="None"
                                Style="font-size: small" Width="177px" TextMode="Password"></asp:TextBox>
                            <asp:Button ID="btnInfo" runat="server" BackColor="White" BorderStyle="None"
                                Font-Bold="True" Height="16px" Enabled="false" Text="?"
                                ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, números e símbolos especiais ($%).   Sua senha deverá ter no mínimo 6 caracteres "
                                Width="16px" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label12" runat="server" Text="Confirmar Senha" Style="margin-right: 20px; font-size:11pt"></asp:Label>
                        <div id="div13" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 2%; height: 20px; width: 200px;">
                            <asp:TextBox ID="txtConfSenhaCli" runat="server" BorderStyle="None"
                                Style="font-size: small" Width="177px" TextMode="Password"></asp:TextBox>
                        </div>

                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lblCaptcha" runat="server" Text="Você é humano?" Font-Size="11pt"></asp:Label><asp:Label
                        ID="lblErroCaptcha" runat="server" Text="" Style="margin-left: 20px; color: #FF0000;"></asp:Label>
                    <div id="captcha" style="height: 85px; margin-top:7%">
                        <div id="captchatext">
                            <asp:TextBox ID="txtCaptcha" runat="server" BorderStyle="None"
                                Style="font-size: small;" Width="200px"></asp:TextBox>
                        </div>
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" Style="margin-top: 3%; " Height="55px" Width="200px" />
                        <br />
                    </div> 
                    </td>
                </tr>
            </table>

            <div style="margin-left:30%; margin-right:50%;"><asp:Label ID="lblErro" runat="server" Text="" ForeColor="#E260D1"></asp:Label></div>
                <br />
                <br />
            <div>
             <asp:Button ID="btnExcluir" runat="server"  Style="float: left;
                    margin-top: 2%; font-family: gadugi; color: #e241d8; text-align: center; float:left;"
                    Text="Excluir" CssClass="btnFichaCadastro" onclick="btnExcluir_Click"  /> 
                 
                        <asp:Button ID="btnAlterar" runat="server"  Style="
                    margin-top:2%; font-family: gadugi; color: #e241d8; text-align: center; float:right; margin-right:12%"
                    Text="Salvar" CssClass="btnFichaCadastro" onclick="btnAlterar_Click" /> 
                 </div>

            <asp:SqlDataSource ID="sqlCli" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT id_cli, nome_cli, cpf_cli, sx_cli, estciv_cli, dtnasc_cli, tel_cli, cel_cli, cep, num_cli, comp_cli, email_cli, login_cli, senha_cli, datacad_cli FROM cliente WHERE (id_cli = @CodCli)" 
                DeleteCommand="DELETE FROM cliente WHERE (id_cli = @CodCli)" 
                UpdateCommand="UPDATE cliente SET nome_cli = @Nome, cpf_cli = @Cpf, sx_cli = @Sexo, estciv_cli = @EstCiv, dtnasc_cli = @DtNasc, tel_cli = @Tel, cel_cli = @Cel, cep = @Cep, num_cli = @Num, comp_cli = @Comp, email_cli = @Email, login_cli = @Login, senha_cli = @Senha, datacad_cli = @DataCad WHERE (id_cli = @CodCli)">
                <DeleteParameters>
                    <asp:QueryStringParameter Name="CodCli" QueryStringField="idcli" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CodCli" QueryStringField="idcli" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:QueryStringParameter Name="CodCli" QueryStringField="idcli" />
                    <asp:Parameter Name="Nome" />
                    <asp:Parameter Name="Cpf" />
                    <asp:Parameter Name="Sexo" />
                    <asp:Parameter Name="EstCiv" />
                    <asp:Parameter Name="DtNasc" />
                    <asp:Parameter Name="Tel" />
                    <asp:Parameter Name="Cel" />
                    <asp:Parameter Name="Cep" />
                    <asp:Parameter Name="Num" />
                    <asp:Parameter Name="Comp" />
                    <asp:Parameter Name="Email" />
                    <asp:Parameter Name="Login" />
                    <asp:Parameter Name="Senha" />
                    <asp:Parameter Name="DataCad" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
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

