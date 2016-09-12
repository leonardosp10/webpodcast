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