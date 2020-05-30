<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="Produtos.aspx.cs" Inherits="Produtos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: Gadugi;
            font-size: 12pt;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="produtos" style="margin-top:10%; margin-bottom:100px; margin-left:10%">
        <asp:datalist runat="server" ID="dlProdutos" DataKeyField="id_prod" RepeatColumns="4" RepeatDirection="Horizontal">
            <FooterTemplate>
                <div class="auto-style2">
                    <asp:HyperLink ID="HyperLink4" runat="server" ImageUrl="~/REALIZE-IT/Anterior.png">HyperLink</asp:HyperLink>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink5" runat="server" ImageUrl="~/REALIZE-IT/Proximo.png">HyperLink</asp:HyperLink>
                </div>
            </FooterTemplate>
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" Height="30px" ImageUrl='<%# Eval("img_prod", "{0}") %>' NavigateUrl='<%# Eval("id_prod", "ExibirProd.aspx?idprod={0}") %>' Width="30px">HyperLink</asp:HyperLink>
                <br />
                <asp:Label ID="nome_prodLabel" runat="server" Font-Names="Gadugi" Font-Size="12pt" Text='<%# Eval("nome_prod") %>' />
                <br />
                <span class="auto-style1">R$</span>
                <asp:Label ID="val_prodLabel" runat="server" Font-Names="Gadugi" Font-Size="12pt" Text='<%# Eval("val_prod") %>' />
                <br />
                <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="False" Font-Names="Gadugi" Font-Size="12pt" ForeColor="#E241D8" NavigateUrl='<%# Eval("id_prod", "ExibirProd.aspx?idprod={0}") %>'>Exibir Mais</asp:HyperLink>
                <br />
                <br />
            </ItemTemplate>
        </asp:datalist>
        <asp:SqlDataSource ID="sqlProdutos" runat="server" ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_prod, produto.nome_prod, produto.desc_prod, produto.val_prod, produto.img_prod, produto.img2_prod, produto.estq_prod, colecao.nome_colecao, tamanho.tamanho, tipo.det_tipo, cor.det_cor FROM produto INNER JOIN colecao ON produto.id_colecao = colecao.id_colecao INNER JOIN cor ON produto.id_cor = cor.id_cor INNER JOIN tamanho ON produto.id_tamanho = tamanho.id_tamanho INNER JOIN tipo ON produto.id_tipo = tipo.id_tipo"></asp:SqlDataSource>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    <div id="rodape-total">
               <div id="rodape" style="align-items:center">
               <div id="rodape-fixo">
                   <asp:Image ID="Image1" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px"  />
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

