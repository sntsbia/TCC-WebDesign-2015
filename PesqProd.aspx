<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true"
    CodeFile="PesqProd.aspx.cs" Inherits="PesqProd" %>

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
            background: #87E4E4;
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
            text-align: center;
            width: 188px;
            height: 151px;
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
    <div id="total" style=" margin-bottom:100px; margin-top:5%;">
           <asp:Image ID="img" runat="server" ImageUrl="~/REALIZE-IT/Produto.png" Width="13%" style="margin-top: -2%; margin-right: 2%; margin-left: 7%; margin-bottom:-10%;" /> <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmPesquisar.jpg" Width="70%" style=" margin-top: -3%; margin-right: 5%; margin-left: 15%; margin-bottom:-10%; float:right" />
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
        <div id="conteudo" style="margin-right: 10%; margin-left: 60%; float: right; width: 50%;
            margin-top: 10%">
            <br />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server" Text="Digite o nome do Produto: " Style="margin-bottom: -5%;font-family:Gadugi"></asp:Label>
                <div id="prod" style="background-image: url('REALIZE-IT/busca.png'); width: 210px;
                    height: 20px; margin-left: 0%; margin-top: 0%;">
                    <asp:TextBox ID="txtNomeProd" runat="server" BorderStyle="None" Style="font-size: small"
                        Width="184px"></asp:TextBox>
                    <asp:ImageButton ID="btnPesq" runat="server" ImageUrl="~/REALIZE-IT/busca1.png" Width="20px"
                        Style="float: right; margin-left: 3%; margin-top: -20px;" Height="20px" onclick="btnPesq_Click" 
                         />
                </div>
                <asp:Label ID="lblErro" runat="server" Text="" Style="color: #e241d8; font-size: small;"></asp:Label>
            <asp:SqlDataSource ID="sqlPesq" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                            
                
                SelectCommand="SELECT produto.id_prod, produto.nome_prod, produto.desc_prod, produto.val_prod, produto.img_prod, produto.img2_prod, produto.estq_prod, cor.det_cor, tamanho.tamanho, colecao.nome_colecao, tipo.det_tipo FROM produto INNER JOIN cor ON produto.id_cor = cor.id_cor INNER JOIN colecao ON produto.id_colecao = colecao.id_colecao INNER JOIN tipo ON produto.id_tipo = tipo.id_tipo INNER JOIN tamanho ON produto.id_tamanho = tamanho.id_tamanho">
                        </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:DataList ID="dlPesq" runat="server" BackColor="White" 
                BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" 
                DataKeyField="id_prod" Font-Names="Gadugi" GridLines="Horizontal" 
                RepeatColumns="3" Width="197px">
                <FooterStyle BackColor="White" ForeColor="#333333" />
                <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                <ItemStyle BackColor="White" ForeColor="#333333" />
                <ItemTemplate>
                    <div class="style1">
                        <asp:Label ID="id_prodLabel" runat="server" Text='<%# Eval("id_prod") %>' />
                        <br />
                        <asp:Label ID="nome_prodLabel" runat="server" Text='<%# Eval("nome_prod") %>' />
                        <br />
                        <asp:Label ID="nome_colecaoLabel" runat="server" 
                            Text='<%# Eval("nome_colecao") %>' />
                        <br />
                        <asp:Label ID="val_prodLabel" runat="server" 
                            Text='<%# Eval("val_prod", "{0:c2}") %>' />
                        <br />
                        <asp:Image ID="Image6" runat="server" Height="49px" 
                            ImageUrl='<%# Eval("img_prod", "{0}") %>' Width="47px" />
                        <br />
                        <asp:HyperLink ID="HyperLink10" runat="server" ImageUrl="~/REALIZE-IT/plus.png" 
                            NavigateUrl='<%# Eval("id_prod", "AlterarProd.aspx?idprod={0}") %>'>HyperLink</asp:HyperLink>
                        <br />
                        <br />
                        <br />
                    </div>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
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
