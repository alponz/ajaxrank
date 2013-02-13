Imports System.Drawing

Partial Class previewgoogle1
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(Server.MapPath("images/google1.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        
        'Dim url As String = Request.QueryString("url")
        Dim fontcolor As String = Request.QueryString("font")
        Dim barcolor As String = Request.QueryString("bar")

        'Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        'Dim xpr As Integer = getpr.MyPR(url)

        'Dim br1 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(1), xReader.GetInt32(2), xReader.GetInt32(3)))
        'Dim br2 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(4), xReader.GetInt32(5), xReader.GetInt32(6)))
        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & fontcolor))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & barcolor))
        With xgraphics
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
            .DrawString("This web has", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 19, 15)
            .DrawString("page rank:", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 29, 40)
            .DrawString("5", New Font("Microsoft Sans Serif", 17, FontStyle.Bold), br1, 57, 60)
            .DrawString("ajaxrank.com", New Font("Microsoft Sans Serif", 11, FontStyle.Regular), br1, 31, 100)
            .FillRectangle(br2, 21, 86, 5 * 9, 10)
            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub
End Class
