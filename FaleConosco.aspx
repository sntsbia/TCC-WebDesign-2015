<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="FaleConosco.aspx.cs" Inherits="FaleConosco" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-family: gadugi;
            font-size: medium;
        }
        .botao {
            border:1px solid #ccc; color:#e241d8; padding:10px 90px; width:306px; background-color:#fff; cursor:pointer;
        }
        .botao:hover{
            background-color:#eee;
        }

        *{font-family: 'Roboto Light', sans-serif;}
        
        #btnEnviar{border:1px solid #ccc; color:#e241d8; padding:10px 90px; width:306px; background-color:#fff; cursor:pointer}
        #btnEnviar:hover{background-color:#eee;}
        #login_container{margin-left:0px;}
        
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="conteudo">
        <div id="titulo" style="text-align:center; color:#e241d8;">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/REALIZE-IT/FaleConosco.png" Width="800px" style="margin-top:0px; margin-bottom: 5%; margin-left: 0%" />
    </div>
        <div id="faleconosco">
    <p class="auto-style1">
<asp:Label ID="lblNome" runat="server" Text="Nome:" Font-Size="13pt"></asp:Label>
    <div id="txtNome" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtNomee" runat="server" BorderStyle="None" style="font-size: small" Width="180px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNomee" ErrorMessage="•" ForeColor="Red" ValidationGroup="contato"></asp:RequiredFieldValidator>
        </div>
     </p>

    <p class="auto-style1">
<asp:Label ID="lblEmail" runat="server" Text="E-mail:" Font-Size="13pt"></asp:Label>
    <div id="txtEmail" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtEmaill" runat="server" BorderStyle="None" style="font-size: small" Width="180px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmaill" ErrorMessage="•" ForeColor="Red" ValidationGroup="contato"></asp:RequiredFieldValidator>
        </div>
     </p>

    <p class="auto-style1">
<asp:Label ID="lblAssunto" runat="server" Text="Assunto:" Font-Size="13pt"></asp:Label>
    <div id="txtAssunto" style="background-image: url('REALIZE-IT/busca.png')">
        <asp:TextBox ID="txtAssuntoo" runat="server" BorderStyle="None" style="font-size: small" Width="180px"></asp:TextBox>
        </div>
     </p>
    <p class="auto-style1">
<asp:Label ID="lblResp" runat="server" Font-Size="14pt" ForeColor="#E241D8"></asp:Label>
    </p>


    <div id="mensagem">
    <p class="auto-style1">
<asp:Label ID="lblMensagem" runat="server" Text="Mensagem:" Font-Size="13pt"></asp:Label>
    &nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMensagemm" ErrorMessage="•" ForeColor="Red" ValidationGroup="contato"></asp:RequiredFieldValidator>
    <div id="txtMensagem">
        <asp:TextBox ID="txtMensagemm" runat="server" BorderStyle="Solid" style="font-size: small" Width="300px" Height="150px" TextMode="MultiLine" BorderColor="Silver" BorderWidth="1px"></asp:TextBox>
        </div>
     </p>
        <div id="login_container" >
<%--            <input type="button" runat="server" value="ENVIAR" id="btnEnviar" onclick="btnEnviar_Click">--%>
            <asp:Button ID="btnEnviar" runat="server" Text="ENVIAR" CssClass="botao" OnClick="btnEnviar_Click" Font-Size="13pt" ValidationGroup="contato" />
        </div>
        </div>
        </div>
        </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
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
