<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="ExibirProd.aspx.cs" Inherits="ExibirProd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:sqldatasource runat="server" ID="sqlProd" ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" SelectCommand="SELECT produto.id_prod, produto.nome_prod, produto.desc_prod, produto.val_prod, produto.img_prod, produto.img2_prod, produto.estq_prod, colecao.nome_colecao, cor.det_cor, tipo.det_tipo, tamanho.tamanho FROM produto INNER JOIN colecao ON produto.id_colecao = colecao.id_colecao INNER JOIN cor ON produto.id_cor = cor.id_cor INNER JOIN tipo ON produto.id_tipo = tipo.id_tipo INNER JOIN tamanho ON produto.id_tamanho = tamanho.id_tamanho">
        <SelectParameters>
            <asp:QueryStringParameter Name="codProd" QueryStringField="idprod" />
        </SelectParameters>
    </asp:sqldatasource>
    <div id="Exibir">
       <div id="Foto" style="float: left; margin-top:10%; width: 30%;">
           <asp:image runat="server" ID="imgProd" Height="287px" Width="206px"></asp:image>

       </div>
        <div id="Informacoes" style="margin-left:40%; float: right; width:70%; margin-top:10%">
        

        </div>
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

