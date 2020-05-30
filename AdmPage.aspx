<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmPage.aspx.cs" Inherits="AdmPage" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <style type="text/css" >
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
                float:left;
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
            .style1
            {
                text-align: center;
            }
        </style>
    </asp:Content>
    <asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
        <div id="cabecalho" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 2%;
         margin-left:35%; margin-bottom: -2%;" runat="server" />
    </div>
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
        <div id="total" style=" margin-bottom:100px; margin-top:5%;">
            <asp:Image ID="imgAdm" runat="server" ImageUrl="~/REALIZE-IT/AdmPage.png" Width="70%" style=" margin-top: 5%; margin-right: 10%; margin-left: 10%; margin-bottom:-10%;"/>
        <div id="opcoes" style="margin-top: 14%; float:left;">
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
       
        <div id="conteudo" style="margin-left:40%; float: right; width:70%; margin-top:10%">
             <br />
            <br />
            <br />
            <div id="post" style=" width: 75%; float:right; margin-right:10%; ">
            <asp:Image ID="Image9" runat="server" Height="190px" 
                ImageUrl="~/REALIZE-IT/META.jpg" Width="135px" style=" margin-right:5%"/>
            <asp:Image ID="Image10" runat="server" Height="190px" 
                ImageUrl="~/REALIZE-IT/PRAZO.jpg" Width="135px" style=" margin-right:5%"/>
            <asp:Image ID="Image11" runat="server" Height="191px" 
                ImageUrl="~/REALIZE-IT/SUCESSO.jpg" Width="135px" style=" margin-right:5%"/>
            <br /><br />
            <asp:Image ID="Image12" runat="server" Height="191px" 
                ImageUrl="~/REALIZE-IT/DESAFIO.jpg" Width="135px" style=" margin-right:5%" />
            <asp:Image ID="Image13" runat="server" Height="191px" 
                ImageUrl="~/REALIZE-IT/EVOLUA.jpg" Width="135px" style=" margin-right:5%" />
            </div>
        </div>
     </div>
    </asp:Content>
   
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
        <div id="rodape-total">
               <div id="rodape" style="align-items:center">
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

