<%@ Page Language="VB" %>
<script runat=server>
   
    Protected Function GetXML() As String
        Dim count_id As Int16
        count_id = 0
        Dim url,descricao,data As String
        Dim start As Boolean = False
        Const URLString As String = "http://www.band.uol.com.br/rss/colunista_266.xml"
        Dim reader As System.Xml.XmlTextReader = New System.Xml.XmlTextReader(URLString)
        reader.WhitespaceHandling = System.Xml.WhitespaceHandling.None
        reader.MoveToContent()

        While reader.Read() and count_id <= 5
     
           if reader.Name = "item" Then
               start = True
              ' Response.Write("Entrou")
           End if
         if start = True then
           
            Select Case reader.NodeType
                
                Case System.Xml.XmlNodeType.CDATA  'Create the button to play the podcast with url(mp3)
                    descricao =  reader.Value                   
                    'Response.Write("<![CDATA[{0}]]>" + reader.Value)
                    'Response.Write("<br>")
                    
                Case System.Xml.XmlNodeType.Element 'Exibir o in?cio do elemento.

                    
                    IF reader.Name = "enclosure" Then
                      
                        If reader.HasAttributes Then 'Se existirem atributos
                            count_id = count_id + 1
                            url = reader.GetAttribute("url")
                            Response.Write("<button type=""button"" onclick=""updatePlayDiv('" + url + "')"">play</button>")
                            Response.Write("Boechat -") 
                            Response.Write(data)
                            Response.Write("<br>")
                            Response.Write(descricao)
                            Response.Write("<br>")
                            
                         End If
                    End IF
                    If reader.Name = "pubDate" Then
                        reader.Read()
                       'Response.Write(reader.Value)
                        data = reader.Value
                        Response.Write("<br>")
                    End If
                
            End Select
         End if  
        End While
                  

    End Function


</script>

<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">  
  
 <script type="text/javascript" src="load_podcast.js"> </script>
 <script type="text/javascript" async src="https://platform.twitter.com/widgets.js"></script>
 <script type="text/javascript" src = "//connect.facebook.net/en/sdk.js#xfbml=1&amp;version=v2.5"> </script>
 
</head>
    
<body>
    <div id="Top_Page">
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
        
            
    </div>
             
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