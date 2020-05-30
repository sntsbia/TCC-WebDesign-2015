<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="PesqAdm.aspx.cs" Inherits="PesqAdm" %>

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
        .auto-style1 {
            font-family: Gadugi;
            font-size: medium;
        }
        .auto-style2 {
            text-align: center;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="cabecalho" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 2%;
         margin-left:35%; margin-bottom: -2%;" runat="server" />
    </div>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div id="total" style=" margin-bottom:100px; margin-top:5%;">
           <asp:Image ID="img" runat="server" ImageUrl="~/REALIZE-IT/Funcionario.png" Width="10%" style="margin-top: -2%; margin-right: 2%; margin-left: 8%; margin-bottom:-10%;" /> <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmPesquisar.jpg" Width="70%" style=" margin-top: -3%; margin-right: 5%; margin-left: 15%; margin-bottom:-10%; float:right" />
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
       
        <div id="conteudo" style="margin-right:10%; margin-left: 60%; float: right; width:50%; margin-top:10%">
             <br />
            <br />
            <br />
            <p class="auto-style1">
            <asp:Label ID="Label1" runat="server" Text="Digite o nome do funcionário: " style=" margin-bottom:-5%;"></asp:Label>
            <div id="nomeAdm" style="background-image: url('REALIZE-IT/busca.png'); width:210px; height: 20px; margin-left:0%; margin-top: -2%;">
        <asp:TextBox ID="txtNomePesq" runat="server" BorderStyle="None" 
                style="font-size: small" Width="184px"></asp:TextBox>
                <asp:ImageButton ID="btnPesq" runat="server" ImageUrl="~/REALIZE-IT/busca1.png" 
               Width="20px" style="float: right; margin-left: 3%; margin-top: -20px;" 
                    Height="20px" onclick="btnPesq_Click"/>
        </div>
                <asp:Label ID="lblErro" runat="server" Text="" style=" color: #e241d8; font-size:small;"></asp:Label>
             
             <asp:DataList ID="dlPesq" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyField="id_func" ForeColor="Black" GridLines="Both" RepeatColumns="5" Font-Names="Gadugi">
                 <FooterStyle BackColor="#CCCCCC" />
                 <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                 <ItemStyle BackColor="White" />
                 <ItemTemplate>
                     <div class="auto-style2">
                         <asp:Label ID="nome_funcLabel" runat="server" Text='<%# Eval("nome_func") %>' />
                         <br />
                         <asp:Label ID="cpf_funcLabel" runat="server" Text='<%# Eval("cpf_func") %>' />
                         <br />
                         <asp:Label ID="tipo_funcLabel" runat="server" Text='<%# Eval("tipo_func") %>' />
                         <br />
                         <asp:Label ID="email_funcLabel" runat="server" Text='<%# Eval("email_func") %>' />
                         <br />
                         <br />
                         <asp:HyperLink ID="HyperLink10" runat="server" ImageUrl="~/REALIZE-IT/plus.png" 
                             NavigateUrl='<%# Eval("id_func", "AlterarFunc.aspx?id={0}") %>'>HyperLink</asp:HyperLink>
                         <br />
                         <br />
                     </div>
                 </ItemTemplate>
                 <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             </asp:DataList>
             <asp:SqlDataSource ID="sqlPesqAdm" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                 ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                 
                 SelectCommand="SELECT * FROM funcionario">
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


