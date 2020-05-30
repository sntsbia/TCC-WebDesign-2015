<%@ Page Title="" Language="C#" MasterPageFile="~/MasterCli.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <div id="conteudo">  
        <div id="banner" style="margin-left: 12%">
            <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
            <script type="text/javascript" src="../js/jssor.js"></script>
    <script type="text/javascript" src="../js/jssor.slider.js"></script>
    <script>
        jssor_slider1_starter = function (containerId) {
            jQuery.noConflict();

            var options = {
                jQueryAutoPlay: true,
                jQueryPlayOrientation: 2,
                jQueryDragOrientation: 2,

                jQueryArrowNavigatorOptions: {
                    jQueryClass: jQueryJssorArrowNavigatorjQuery,
                    jQueryChanceToShow: 2,
                    jQueryAutoCenter: 1,
                    jQuerySteps: 1
                }
            };

            var jssor_slider1 = new jQueryJssorSliderjQuery(containerId, options);
        };
    </script>
            <div id="slider1_container" style="position: relative; top: 0px; left: 0px; width: 500px;
        height: 300px; margin-top: -15px; margin-left: -70px;">

        
        <div u="loading" style="position: absolute; top: 0px; left: 0px;">
            <div style="filter: alpha(opacity=70); opacity:0.7; position: absolute; display: block;
                background-color: #000000; top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
            <div style="position: absolute; display: block; background: url(../img/loading.gif) no-repeat center center;
                top: 0px; left: 0px;width: 100%;height:100%;">
            </div>
        </div>

       
        <div u="slides" style="cursor: move; margin-left: -31px; position: absolute; left: 0px; top: 0px; width: 1280px; height: 293px; margin-top: 30px; overflow: hidden;">
            <div><img u="image" src="../REALIZE-IT/BannerPicNic.png" /></div>
            <div><img u="image" src="../REALIZE-IT/BannerPrimavera.png" /></div>
          
        </div>
        
        
        
        <style>
            /* jssor slider arrow navigator skin 08 css */
            /*
            .jssora08l                  (normal)
            .jssora08r                  (normal)
            .jssora08l:hover            (normal mouseover)
            .jssora08r:hover            (normal mouseover)
            .jssora08l.jssora08ldn      (mousedown)
            .jssora08r.jssora08rdn      (mousedown)
            */
            .jssora08l, .jssora08r {
                display: block;
                position: absolute;
                /* size of arrow element */
                width: 50px;
                height: 50px;
                cursor: pointer;
                background: #d2d1d1;
                overflow: hidden;
                opacity: .4;
                filter: alpha(opacity=40);
            }
            .jssora08l { background-position: -5px -35px; }
            .jssora08r { background-position: -65px -35px; }
            .jssora08l:hover { background-position: -5px -35px; opacity: .8; filter:alpha(opacity=80); }
            .jssora08r:hover { background-position: -65px -35px; opacity: .8; filter:alpha(opacity=80); }
            .jssora08l.jssora08ldn { background-position: -5px -35px; opacity: .3; filter:alpha(opacity=30); }
            .jssora08r.jssora08rdn { background-position: -65px -35px; opacity: .3; filter:alpha(opacity=30); }
        </style>
        
        
        <a style="display: none" href="http://www.jssor.com">Bootstrap Slider</a>
        
        <script>
            jssor_slider1_starter('slider1_container');
        </script>
    </div>
        </div>

    <div id="banners-home" style="margin-left: 23%;">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/REALIZE-IT/BannerQueima.png" Width="450px" style="margin-left: -100px;" />
        <asp:Image ID="Image3" runat="server" ImageUrl="~/REALIZE-IT/BannerSunrise.png" Width="450px" style="margin-left: 30px;" />
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
