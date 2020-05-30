<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AlterarProd.aspx.cs" Inherits="AlterarProd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        
        #ContentPlaceHolder2_btnCont1, #ContentPlaceHolder2_btnCont2, #ContentPlaceHolder2_BtnEnviar, #ContentPlaceHolder2_btnAlterar: hover, #ContentPlaceHolder2_btnExcluir:hover
        {
            border: 1px solid #ccc;
            color: #e241d8;
            padding: 10px 90px;
            width: 300px;
            background-color: #fff;
            cursor: pointer;
        }
        #ContentPlaceHolder2_btnCont1:hover, #ContentPlaceHolder2_btnCont2:hover, #ContentPlaceHolder2_BtnEnviar:hover, #ContentPlaceHolder2_btnAlterar: hover, #ContentPlaceHolder2_btnExcluir:hover
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
        .auto-style2 {
            height: 94px;
        }
    </style>
    <script type="text/javascript" src="js/mascara.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div id="cabecalho" style="width: 2000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 1%;
            margin-left: 19%; margin-bottom: -3%;" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<div id="total" style=" margin-bottom:100px; margin-top:9%;">
           <asp:Image ID="img" runat="server" ImageUrl="~/REALIZE-IT/Produto.png" Width="13%" style="margin-top: -2%; margin-right: 2%; margin-left: 7%; margin-bottom:-10%;" /> <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmAlterar.png" Width="70%" style=" margin-top: -3%; margin-right: 5%; margin-left: 15%; margin-bottom:-10%; float:right" />
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
                    <td class="style4">
                        <asp:Label ID="prod" runat="server" Text="Nome do produto: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<div id="prodtxt" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 0px; height: 20px;
                            width: 190px; margin-top:-5%">
                            <asp:TextBox ID="txtProd" runat="server" Width="185px" BorderStyle="None" Font-Size="Small"></asp:TextBox></div>
                        <br />
                    </td>
                    <td class="style5">
                        <asp:Label ID="desc" runat="server" Text="Descrição do produto: " Style="font-size: small;
                            font-family: Gadugi;"></asp:Label><br />
                        <br />
                        &nbsp;<div id="Div1" style="background-image: url('REALIZE-IT/busca.png'); height: 20px;
                            width: 190px; margin-top:-3%">
                            <asp:TextBox ID="txtDesc" runat="server" Width="185px" BorderStyle="Solid" Font-Size="Small"
                                Height="38px" TextMode="MultiLine" BorderColor="#CCCCCC"></asp:TextBox></div>
                                <br />
                                <br /> 
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
                            font-family: Gadugi; margin-top:5%"></asp:Label><br />
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
             <div style="margin-left:30%; margin-right:30%;"><asp:Label ID="lblErro" runat="server" Text="" ForeColor="#E260D1"></asp:Label></div>
                <br />
                <br />
            <div>
             <asp:Button ID="btnExcluir" runat="server" ValidationGroup="adm" Style="float: left;
                    margin-top: 2%; font-family: gadugi; color: #e241d8; text-align: center; float:left;"
                    Text="Excluir" CssClass="btnFichaCadastro" OnClick="btnExcluir_Click" /> 
                 
                        <asp:Button ID="btnAlterar" runat="server" ValidationGroup="adm" style="margin-top:2%; font-family: gadugi; color: #e241d8; text-align: center; float:right;" Text="Salvar" CssClass="btnFichaCadastro" OnClick="btnAlterar_Click" /> 
                <asp:SqlDataSource ID="sqlFunc" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                    SelectCommand="SELECT id_func, tipo_func FROM funcionario WHERE (id_func = @CodFunc)">
                    <SelectParameters>
                        <asp:SessionParameter Name="CodFunc" SessionField="CodFunc" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
            <asp:SqlDataSource ID="sqlProd" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                
                SelectCommand="SELECT id_prod, nome_prod, desc_prod, val_prod, id_colecao, id_cor, id_tipo, id_tamanho, img_prod, img2_prod, estq_prod FROM produto WHERE (id_prod = @CodProd)" 
                DeleteCommand="DELETE FROM produto WHERE (id_prod = @CodProd)" 
                UpdateCommand="UPDATE produto SET nome_prod = @Nome, desc_prod = @Desc , val_prod = @Valor, id_colecao = @Colecao, id_cor = @Cor, id_tipo = @Tipo, id_tamanho = @Tamanho, img_prod = @Img, img2_prod = @Img2, estq_prod = @Estoque WHERE (id_prod = @CodProd)">
                <DeleteParameters>
                    <asp:QueryStringParameter Name="CodProd" QueryStringField="idprod" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="CodProd" QueryStringField="idprod" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="newparameter" />
                    <asp:QueryStringParameter Name="CodProd" QueryStringField="idprod" />
                    <asp:Parameter Name="Nome" />
                    <asp:Parameter Name="Desc" />
                    <asp:Parameter Name="Valor" />
                    <asp:ControlParameter ControlID="ddlColecao" Name="Colecao" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlCor" Name="Cor" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlTipo" Name="Tipo" 
                        PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="ddlTamanho" Name="Tamanho" 
                        PropertyName="SelectedValue" />
                    <asp:Parameter Name="Img" />
                    <asp:Parameter Name="Img2" />
                    <asp:Parameter Name="Estoque" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
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

