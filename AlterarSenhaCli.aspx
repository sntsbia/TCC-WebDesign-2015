<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AlterarSenhaCli.aspx.cs" Inherits="AlterarSenhaCli" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div id="cabecalho" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 7%;
            margin-left: 37%; margin-bottom: -2%;" runat="server" />
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div id="alterar" style="font-family:Gadugi; margin-left:43%; height:70%; margin-bottom:150px; margin-top:10%;">
    &nbsp;&nbsp;
        <asp:Label ID="lblSenha" runat="server" Text="Senha" Font-Size="14px" style="margin-bottom: -40px; margin-left:-1%;"></asp:Label>
         <asp:Label ID="lblErroSenha" runat="server"></asp:Label>
        <br />
    <div id="senhacli" style=" margin-top:1%;">
        <asp:TextBox ID="txtsenhacli" runat="server" BorderStyle="None" 
            style="font-size: small;" Width="170px" TextMode="Password" 
            ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, Números e Símbolos Especiais ($%). Sua senha deverá ter no mínimo 6 caracteres "></asp:TextBox>
        <asp:Button ID="btnInfo" runat="server" BackColor="White" BorderStyle="None" 
            Font-Bold="True" Height="16px" Text="?" 
            ToolTip="Dica Realize: Prefira senhas que envolvam letras maiúsculas e minúsculas, Números e Símbolos Especiais ($%).   Sua senha deverá ter no mínimo 6 caracteres " 
            Width="16px" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="•" ControlToValidate="txtsenhacli" ValidationGroup="alterar" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
        &nbsp;
         <br />
        <br />
    <asp:Label ID="lblConfSenha" runat="server" Text="Confirmar Senha" Font-Size="14px"></asp:Label>
         <br />
    <div id="senhaconfcli" style="margin-top: 1%">
        <asp:TextBox ID="txtsenhaconfcli" runat="server" BorderStyle="None" 
            style="font-size: small" Width="170px" TextMode="Password"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="•" ControlToValidate="txtsenhaconfcli" ValidationGroup="alterar" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

     <br />
     <br />

    <asp:Label ID="lblCaptcha" runat="server" Text="Você é humano?" Font-Size="14px"></asp:Label>
    <asp:Label ID="lblErroCaptcha" runat="server" Text="" style="margin-left: 20px; color: #FF0000;"></asp:Label>
    <div id="captcha" style="height: 100px; margin-top: -1%">
         <br />
        <br />
        <div id="captchatext">
        <asp:TextBox ID="txtCaptcha" runat="server" BorderStyle="None" style="font-size: small;" Width="170px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ErrorMessage="•" ControlToValidate="txtCaptcha" ValidationGroup="alterar" ForeColor="Red"></asp:RequiredFieldValidator>
         
        </div>
         
        <br />
        
         
        <br />
         <%--<asp:TextBox ID="txtimgcode" runat="server"></asp:TextBox>--%>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" style="margin-top: -30px; " Height="43px" Width="200px"/>
    <br />
    </div>

       <asp:Button ID="btnAlterarSenha" runat="server" Style="float: left;
                    margin-right: 700px; margin-top: 5%; font-family: gadugi; color: #e241d8; text-align: center;"
                    Text="Alterar" OnClick="btnAlteraSenha_Click" CssClass="btnFichaCadastro" ValidationGroup="alterar" />
        <asp:SqlDataSource ID="sqlAlterarCli" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT id_func, senha_func FROM funcionario WHERE (id_func = @idFunc)">
            <SelectParameters>
                <asp:SessionParameter Name="idFunc" SessionField="idFunc" />
            </SelectParameters>
        </asp:SqlDataSource>

        <br />
        <br />
        <asp:Label ID="lblErro" runat="server" ForeColor="Red"></asp:Label>
        <br />

        <asp:SqlDataSource ID="sqlAlterarAdm" runat="server" 
            ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM funcionario" 
            UpdateCommand="UPDATE funcionario SET data_cad = @Data, senha_func = @Senha WHERE (id_func = @CodFunc)">
            <UpdateParameters>
                <asp:SessionParameter Name="CodFunc" SessionField="IdFunc" />
                <asp:Parameter Name="Senha" />
                <asp:Parameter Name="Data" />
            </UpdateParameters>
        </asp:SqlDataSource>

     </div>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
         <div id="rodape-total">
               <div id="rodape" style="align-items:center">
               <div id="rodape-fixo">
                   <asp:Image ID="Image2" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px"  />
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

