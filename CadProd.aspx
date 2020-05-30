<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="CadProd.aspx.cs" Inherits="CadProd" %>

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
        .style2
        {
            width: 98%;
            height: 336px;
        }
        .style3
        {
            width: 242px;
        }
        .style4
        {
            width: 242px;
            height: 74px;
        }
        .style5
        {
            height: 74px;
        }
        .style6
        {
            width: 242px;
            height: 64px;
        }
        .style7
        {
            height: 64px;
        }
        .style8
        {
            width: 242px;
            height: 37px;
        }
        .style9
        {
            height: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cabecalho" style="width: 2000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 1%;
            margin-left: 20%; margin-bottom: -3%;" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="total" style=" margin-bottom:100px; margin-top:9%;">
           <asp:Image ID="img" runat="server" ImageUrl="~/REALIZE-IT/Produto.png" Width="13%" style="margin-top: -2%; margin-right: 2%; margin-left: 7%; margin-bottom:-10%;" /> <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmCadastrar.jpg" Width="70%" style=" margin-top: -3%; margin-right: 5%; margin-left: 15%; margin-bottom:-10%; float:right" />
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

        <div id="conteudo" style="margin-left: 45%; float: right; width: 70%; margin-top: 12%">
            <table align="center" class="style2">
                <tr>
                    <td class="style4">
                        <asp:Label ID="prod" runat="server" Text="Nome do produto: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<div id="prodtxt" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 0px; height: 20px;
                            width: 190px; margin-top:-5%">
                            <asp:TextBox ID="txtProd" runat="server" Width="185px" BorderStyle="None" Font-Size="Small"></asp:TextBox></div>
                    </td>
                    <td class="style5">
                        <asp:Label ID="desc" runat="server" Text="Descrição do produto: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        <br />
                        &nbsp;<div id="Div1" style="background-image: url('REALIZE-IT/busca.png'); height: 20px;
                            width: 190px; margin-top:-5%">
                            <asp:TextBox ID="txtDesc" runat="server" Width="185px" BorderStyle="Solid" Font-Size="Small"
                                Height="38px" TextMode="MultiLine" BorderColor="#CCCCCC"></asp:TextBox></div>
                    </td>
                </tr>
                <tr>
                    <td class="style6">
                        <asp:Label ID="Valor" runat="server" Text="Valor do produto: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<div id="Div2" style="background-image: url('REALIZE-IT/busca.png'); height: 20px;
                            width: 190px; margin-top:-5%">
                            <div><asp:Label ID="lbl" runat="server" Text="" style="margin-right:2%;"></asp:Label><asp:TextBox ID="txtValor" runat="server" Width="160px" BorderStyle="None" Font-Size="Small"></asp:TextBox></div></div>
                    </td>
                    <td class="style7">
                        <asp:Label ID="colecao" runat="server" Text="Coleção: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<asp:DropDownList ID="ddlColecao" runat="server">
                        </asp:DropDownList>
            <asp:SqlDataSource ID="sqlColecao" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM colecao"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style8">
                       <asp:Label ID="Label1" runat="server" Text="Cor: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<asp:DropDownList ID="ddlCor" runat="server">
                        </asp:DropDownList>
            <asp:SqlDataSource ID="sqlCor" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM cor"></asp:SqlDataSource>
                    </td>
                    <td class="style9">
                        <asp:Label ID="Label2" runat="server" Text="Tipo: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<asp:DropDownList ID="ddlTipo" runat="server">
                        </asp:DropDownList>
            <asp:SqlDataSource ID="sqlTipo" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM tipo"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label3" runat="server" Text="Tamanho: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<asp:DropDownList ID="ddlTamanho" runat="server">
                        </asp:DropDownList>
            <asp:SqlDataSource ID="sqlTamanho" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM tamanho"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Estoque: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        <div id="Div3" style="background-image: url('REALIZE-IT/busca.png'); height: 20px;
                            width: 190px; margin-top:0%">
                            <asp:TextBox ID="txtEstoq" runat="server" Width="185px" BorderStyle="None" Font-Size="Small"></asp:TextBox></div>
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        <asp:Label ID="Label5" runat="server" Text="Imagem 01: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        <asp:FileUpload ID="fupl01" runat="server" style=" font-family:Gadugi;" />
                    </td>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Imagem 02: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label> <br />
                        <br />
                        <asp:FileUpload ID="fupl02" runat="server" style=" font-family:Gadugi;"/>
                    </td>
                </tr>
            </table>
            <asp:Button ID="BtnEnviar" runat="server" Style="margin-left:17%; margin-top: 10px; font-family: gadugi; color: #e241d8; text-align: center;"
                    Text="CONCLUIR"  CssClass="btnFichaCadastro" 
                onclick="BtnEnviar_Click" /> 
                <asp:Label ID="lblErro" runat="server" Text="" style="color:#E260D1; margin-left:18%;"></asp:Label>
            <asp:SqlDataSource ID="sqlProduto" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                InsertCommand="INSERT INTO produto(nome_prod, desc_prod, val_prod, id_colecao, id_cor, id_tipo, id_tamanho, img_prod, img2_prod, estq_prod) VALUES (@Prod, @Desc , @Valor, @CodColecao, @CodCor, @CodTipo, @CodTamanho, @Img1, @Img2, @Estq)" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                SelectCommand="SELECT * FROM produto">
                <InsertParameters>
                    <asp:Parameter Name="Prod" />
                    <asp:Parameter Name="Desc" />
                    <asp:Parameter Name="Valor" />
                    <asp:ControlParameter ControlID="ddlColecao" Name="CodColecao" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlCor" Name="CodCor" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlTipo" Name="CodTipo" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlTamanho" Name="CodTamanho" 
                        PropertyName="SelectedValue" />
                    <asp:Parameter Name="Img1" />
                    <asp:Parameter Name="Img2" />
                    <asp:Parameter Name="Estq" />
                </InsertParameters>
            </asp:SqlDataSource>
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

