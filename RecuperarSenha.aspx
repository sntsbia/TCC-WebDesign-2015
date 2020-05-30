<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="RecuperarSenha.aspx.cs" Inherits="RecuperarSenha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        * {
            font-family: 'Roboto Light', sans-serif;
        }

        .auto-style1 {
            font-family: Gadugi;
            font-size: medium;
        }
    </style>
    <script type="text/javascript" src="js/mascara.js"></script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <br />
    <div id="corpo" class="auto-style1">
        <div id="conteudo" style="margin-bottom: 200px;">

            <div id="titulo" style="text-align: center; color: #e241d8;">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/REALIZE-IT/RecuperarSenha.png" Width="60%" Style="margin-top: -1%; margin-bottom: 5%; margin-left: 0%" />
                <%-- <asp:Label ID="recsenha" runat="server" Text="Recuperar Senha" Font-Bold="False" Font-Size="17pt" style="margin-left: -84%"></asp:Label>--%>
            </div>
            <br />
            <br />
            <div style="margin-left: 43%;">
                <asp:Label ID="lblcpf" runat="server" Text="Digite o CPF cadastrado:"
                    CssClass="auto-style1"></asp:Label>
                <div id="cpf" style="background-image: url('REALIZE-IT/busca.png'); margin-top: 8px; height: 30px; width: 200px;">
                    <asp:TextBox ID="txtCpf" runat="server" BorderStyle="None" Width="200px" MaxLength="14" onkeyup="formataCPF(this,event)"></asp:TextBox>
                </div>
                <asp:Button ID="btnPesqCpf" runat="server"
                    Style="float: left; margin-right: 700px; margin-top: 10px; font-family: gadugi; color: #e241d8; text-align: center;"
                    Text="Pesquisar" CssClass="btnFichaCadastro" OnClick="btnPesqCpf_Click" />
                <asp:Label ID="lblErro" runat="server" Style="color: #e241d8;"></asp:Label>
                <asp:SqlDataSource ID="sqlPesqCpfCli" runat="server"
                    ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>"
                    ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>"
                    
                    SelectCommand="SELECT id_cli, nome_cli, cpf_cli, login_cli, senha_cli, email_cli FROM cliente WHERE (cpf_cli = @Cpf)">
                    <SelectParameters>
                        <asp:Parameter Name="Cpf" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sqlPesqCpfAdm" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                    ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                    SelectCommand="SELECT id_func, nome_func, cpf_func, email_func, login_func, senha_func FROM funcionario WHERE (cpf_func = @Cpf)">
                    <SelectParameters>
                        <asp:Parameter Name="Cpf" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>

    </div>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="Server">

    <div id="rodape-total">
        <div id="rodape" style="align-items: center">
            <div id="rodape-fixo">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px" />
            </div>
        </div>
        <div id="rodape-cinza" style="margin-left: -8px; height: 300px; width: 100%; background-color: #9f9e9e;">
            <br />
            <div id="rodape-final">
                <asp:Image ID="Image8" runat="server" ImageUrl="~/REALIZE-IT/Rodape23.png" Width="900px" Height="269px" Style="margin-top: 0%;" usemap="#Map3" />
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

