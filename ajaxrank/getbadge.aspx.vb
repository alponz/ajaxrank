Imports System.Xml
Imports System
Imports System.Text
Imports System.Net
Imports System.Drawing
Partial Class getbadge
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(Server.MapPath("button.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim urlid As String
        urlid = Request.QueryString("id")
        SqlDataSource1.SelectParameters("id").DefaultValue = urlid
        Dim xReader As System.Data.IDataReader = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
        Dim url As String = ""
        Dim xalexa As Integer = 0
        Dim xpr As Integer = 0
        If xReader.Read Then
            url = xReader.GetString(0)

            Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
            xpr = getpr.MyPR(url)

            'get alexa:
            Dim doc As XmlDocument
            Dim nodes As XmlNodeList
            ' Create a new XmlDocument  
            doc = New XmlDocument()
            ' Load data  
            doc.Load("http://data.alexa.com/data/?cli=10&dat=ns&url=" & url)
            ' Get forecast with XPath  
            nodes = doc.SelectNodes("/ALEXA/SD/POPULARITY")
            For Each node As XmlNode In nodes
                xalexa = node.Attributes("TEXT").InnerText
            Next

            Dim br1 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(1), xReader.GetInt32(2), xReader.GetInt32(3)))
            Dim br2 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(4), xReader.GetInt32(5), xReader.GetInt32(6)))
            With xgraphics
                .DrawString("This web has:", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 15)
                .DrawString("page rank", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 40)
                .DrawString(xpr, New Font("century gothic", 17, FontStyle.Bold), br1, 13, 60)
                .FillRectangle(br2, 17, 82, xpr * 9, 10)
                .DrawString("alexa rank", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 100)
                .DrawString(xalexa, New Font("century gothic", 17, FontStyle.Bold), br1, 13, 120)
                .DrawString("myrankbadge.com", New Font("century gothic", 11, FontStyle.Regular), br1, 12, 145)
                ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                .Dispose()
                ximage.Dispose()
            End With
        End If

        

    End Sub
End Class
