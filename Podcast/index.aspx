<%@ Page Language="VB" %>
<script runat=server>
   
    Protected Function GetXML() As String
        Dim count_id As Int16
        count_id = 0
        Dim url As String
        Const URLString As String = "http://www.band.uol.com.br/rss/colunista_266.xml"
        Dim reader As System.Xml.XmlTextReader = New System.Xml.XmlTextReader(URLString)
        reader.WhitespaceHandling = System.Xml.WhitespaceHandling.None
        reader.MoveToContent()

        While reader.Read() and count_id <= 10
            Select Case reader.NodeType
                Case System.Xml.XmlNodeType.Element 'Exibir o in?cio do elemento.

                    Response.Write(" " + reader.Value)
                    If reader.HasAttributes Then 'Se existirem atributos
                        url = reader.GetAttribute("url")
                        'Response.Write(url)
                                               
                    End If

                    If reader.Name = "pubDate" Then
                        reader.Read()
                        Response.Write(reader.Value)
                        Response.Write("<br>")
                    End If
                Case System.Xml.XmlNodeType.CDATA  'Create the button to play the podcast with url(mp3)
                    count_id = count_id + 1
                    Response.Write("<button type=""button"" onclick=""updatePlayDiv('" + url + "')"">play</button>")
                    Response.Write("<![CDATA[{0}]]>" + reader.Value)
                    Response.Write("<br>")
            End Select
           
        End While
                    Response.Write(count_id)

    End Function


</script>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">  
  
 <script type="text/javascript" src="load_podcast.js"> </script>
 <script type="text/javascript" async src="https://platform.twitter.com/widgets.js"></script>
 <script type="text/javascript" src = "//connect.facebook.net/ru_RU/sdk.js#xfbml=1&amp;version=v2.5"> </script>

</head>
    
<body>
 <div id="logo_site">
     <figure>
     <img src="rss-logo.png" alt="RSS Logo" height="62" width="62">
     </figure>
     </div>   
<div id="player" runat="server">
  <head> 
    <center>  
       Player New: 
     </center> 
  </head>
    
    <audio id="play-url" controls></audio>
</div>
<div id="info_top">
    
</div>
<div id="lista_podcast" runat="server">
   <head> 
     <center>  
      Lista Podcasts: 
     </center> 
  </head>
    
    <br>
        
   <% =GetXML()%>.        
     
    </div>
 
    <div id="twitter"data-width="100%">
 
        <a class="twitter-timeline"  href="https://twitter.com/radiobandnewsfm">Tweets by radiobandnewsfm</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
         <!-- 
            Information: https://dev.twitter.com/web/embedded-timelines
                         In  
         -->      
            
    </div>
   
            <!--
            <a class="twitter-timeline"
            data-widget-id="600720083413962752"
            href="https://twitter.com/TwitterDev"
            width="400"
            height="400">
            Tweets by @TwitterDev
            </a>  --> 

            <!-- <a href="https://twitter.com/intent/tweet?button_hashtag=boechat" class="twitter-hashtag-button" data-show-count="false">Tweet #boechat</a><script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
            <br>
            <br>
            -->
    <div id="facebook" class="fb-page" 
        data-tabs="timeline"
        data-href="https://www.facebook.com/ricardoboechatoficial"
        data-width="380">
    </div>   
        
</body>
<!--
<footer>
  <p>Our Address: <address> Aracaju-Sergipe teste2 </address>   </p>    
</footer> -->
</html>