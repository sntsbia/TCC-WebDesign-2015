<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdm.master" AutoEventWireup="true" CodeFile="AdmLogin.aspx.cs" Inherits="AdmLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
            *
            {
                font-family: 'Roboto Light' , sans-serif;
            }
            #login_box{padding:20px; width:400px; font-size:14pt;margin-top:-5%;}
            h1{font-size:20pt; font-weight:100;}
            #fields{text-align:left;margin-top:-20px;}
            #ContentPlaceHolder2_btnEntrar
            {
            border: 1px solid #ccc;
            color: #e241d8;
            padding: 10px 90px;
            width: 300px;
            background-color: #fff;
            cursor: pointer;
            }
            #ContentPlaceHolder2_btnEntrar:hover
            {
            background-color: #eee;
            }
        </style>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div id="cabecalho">
       <div id="Div1" style="width: 1000px;">
        <asp:ImageButton ID="ImageButton2" ImageUrl="~/REALIZE-IT/logo2.png" Style="margin-top: 2%;
         margin-left:54%; margin-bottom: -2%;" runat="server" />
    </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <center><asp:Image ID="Image3" runat="server" ImageUrl="~/REALIZE-IT/AdmLogin.png" Width="65%" style="margin-top:100px; margin-bottom: 5%; margin-left: 18%; margin-right: 10%;" />
    
        <div id="login_box" style="margin-bottom:100px; margin-left:40%">
            <h1>Adm Login</h1><br />

            <div id="fields" style="font-family:Gadugi;">
                <asp:Label ID="Label1" runat="server" Text="Login:"></asp:Label><br /> <br />
                <div style="font-size: small; margin-top:-200px; background-image: url('REALIZE-IT/busca.png'); margin-top: -10px; height: 30px; width: 200px;" >
                <asp:TextBox type="text" ID="txtLoginAdm" runat="server" BorderStyle="None" Width="180px"></asp:TextBox><br /> <br />
                </div>
                <asp:Label ID="Label2" runat="server" Text="Senha:"></asp:Label> <br /> <br />
                <div style="font-size: small; margin-top:-200px; background-image: url('REALIZE-IT/busca.png'); margin-top: -10px; height: 30px; width: 200px;" >
                <asp:TextBox type="text" ID="txtSenhaAdm" runat="server" BorderStyle="None" 
                        Width="180px" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <asp:Label ID="lblCaptcha" runat="server" Text="Você é humano?" style="font-family:Gadugi;"></asp:Label><asp:Label ID="lblErroCaptcha" runat="server" Text="" style="margin-left: 20px; color: #FF0000;"></asp:Label>
            <br />
            <br />
            <div id="captcha1" style=" margin-left:-15%">
    <div id="captcha" runat="server" style="height: 100px">
        <div id="captchatext" style="margin-left:13%;">
        <asp:TextBox ID="txtCaptcha" runat="server" BorderStyle="None" 
                style="font-size: small;" Width="180px" Height="16px"></asp:TextBox>
        </div>
        <br />
        <%--<asp:TextBox ID="txtimgcode" runat="server"></asp:TextBox>--%>
    <br />
    <asp:Image ID="Image1" runat="server" ImageUrl="~/CImage.aspx" style="margin-top: -20px; margin-left:8%"/>
    <br />
    </div>
     </div>
            <asp:Button  ID="btnEntrar" runat="server"  Text="ENTRAR" 
                style=" color:#e241d8; width:280px; height: 40px; background-color:#fff; margin-left: -7%; margin-top:5%;" Font-Size="13pt" 
                BorderColor="Silver" BorderWidth="1px" CssClass="btnFichaCadastro" onclick="btnEntrar_Click" ValidationGroup="login"></asp:Button>
            <br />
             <asp:Button ID="btnRecuperar" runat="server" onclick="recuperarsenha" 
                style="color:#e241d8; background-color:#fff; margin-left:15%; margin-top:2%;" Text = "Recuperar Senha" 
                BorderStyle="None"></asp:Button>

            <asp:SqlDataSource ID="sqlAdm" runat="server" 
                ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" 
                
                
                
                
                SelectCommand="SELECT id_func, login_func, senha_func, tipo_func FROM funcionario WHERE (login_func = @Login) AND (senha_func = @Senha)">
                <SelectParameters>
                    <asp:Parameter Name="Login" />
                    <asp:Parameter Name="Senha" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:SqlDataSource ID="sqlDataFunc" runat="server" ConnectionString="<%$ ConnectionStrings:realizeConnectionString %>" ProviderName="<%$ ConnectionStrings:realizeConnectionString.ProviderName %>" SelectCommand="SELECT id_func, data_cad, senha_func FROM funcionario WHERE (id_func = @idFunc)">
                <SelectParameters>
                    <asp:SessionParameter Name="idFunc" SessionField="idFunc" />
                </SelectParameters>
            </asp:SqlDataSource>

            &nbsp;<asp:Label ID="lblErro" runat="server"></asp:Label>
        </div>
    </center>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
      <div id="rodape-total">
            <div id="rodape" style="align-items:center">
               <div id="rodape-fixo">
                   <asp:Image ID="Image5" runat="server" ImageUrl="~/REALIZE-IT/rodape-fixo.png" Width="147px"  />
               </div>
            </div>
       </div>
</asp:Content>
