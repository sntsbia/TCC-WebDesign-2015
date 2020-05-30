<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="PesqCli.aspx.cs" Inherits="PesqCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        #opcoes
        {
            margin-left: 5%;
            margin-right: 10%;
            font-family: Gadugi;
            font-size: 20pt;
            font-weight: 200;
            width: 200px;
            position: absolute;
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
        .style1
        {
            font-family: Gadugi;
        }
        .style2
        {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cabecalho" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 2%;
            margin-left: 35%; margin-bottom: -2%;" runat="server" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="total" style="margin-bottom: 100px; margin-top: 5%;">
        <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmPesquisar.jpg" Width="70%"
            Style="margin-top: 5%; margin-right: 10%; margin-left: 15%; margin-bottom: -10%;" />
        <div id="opcoes" style="margin-top: 14%; float: left;">
             <ul>
                    <li><a style="text-align: center;">Produtos </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink11" runat="server" href="PesqProd.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink12" runat="server" href="CadProd.aspx" onclick="HyperLink2_Click"
                                    Style="text-align: center;">Cadastrar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink13" runat="server" href="PesqProd.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                    <li><a style="text-align: center;">Cliente </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink14" runat="server" href="PesqCli.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink16" runat="server" href="PesqCli.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                    <li><a style="text-align: center;">Funcionário </a>
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink17" runat="server" href="PesqAdm.aspx" onclick="HyperLink1_Click"
                                    Style="text-align: center;">Alterar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink18" runat="server" href="AdmCadastrar.aspx" onclick="HyperLink2_Click"
                                    Style="text-align: center;">Cadastrar</asp:HyperLink>
                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink19" runat="server" href="PesqAdm.aspx" onclick="HyperLink4_Click"
                                    Style="text-align: center;">Pesquisar</asp:HyperLink>
                            </li>
                        </ul>
                    </li>
                </ul>
        </div>
        <div id="conteudo" style="margin-right: 10%; margin-left: 60%; float: right; width: 50%;
            margin-top: 10%">
            <br />
            <br />
            <br />
            <p class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="Digite o nome do cliente: " Style="margin-bottom: -5%;"></asp:Label>
                <div id="nomeCli" style="background-image: url('REALIZE-IT/busca.png'); width: 210px;
                    height: 20px; margin-left: 0%; margin-top: -2%;">
                    <asp:TextBox ID="txtNomeCli" runat="server" BorderStyle="None" Style="font-size: small"
                        Width="184px"></asp:TextBox>
                    <asp:ImageButton ID="btnPesq" runat="server" ImageUrl="~/REALIZE-IT/busca1.png" Width="20px"
                        Style="float: right; margin-left: 3%; margin-top: -20px;" Height="20px" OnClick="btnPesq_Click" />
                </div>
                <asp:Label ID="lblErro" runat="server" Text="" Style="color: #e241d8; font-size: small;"></asp:Label>
            <asp:SqlDataSource ID="sqlPesq" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM cliente ">
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:DataList ID="dlPesq" runat="server" BackColor="#CCCCCC" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" 
                CellSpacing="2" DataKeyField="id_cli" ForeColor="Black" GridLines="Both" 
                RepeatColumns="4" Width="326px">
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" />
                <ItemTemplate>
                    <div class="style2">
                        <asp:Label ID="id_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("id_cli") %>' />
                        <br 
    class="style1" />
                        <asp:Label ID="nome_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("nome_cli") %>' />
                        <br 
    class="style1" />
                        <asp:Label ID="cpf_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("cpf_cli") %>' />
                        <br 
    class="style1" />
                        <asp:Label ID="dtnasc_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("dtnasc_cli","{0:d}") %>' />
                        <br 
    class="style1" />
                        <asp:Label ID="email_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("email_cli") %>' />
                        <br 
    class="style1" />
                        <asp:Label ID="login_cliLabel" runat="server" CssClass="style1" 
                            Text='<%# Eval("login_cli") %>' />
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink10" runat="server" ImageUrl="~/REALIZE-IT/plus.png" 
                            NavigateUrl='<%# Eval("id_cli", "AlterarCli.aspx?idcli={0}") %>'>HyperLink</asp:HyperLink>
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
            </p>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">
    <div id="rodape-total">
        <div id="rodape" style="align-items: center">
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

