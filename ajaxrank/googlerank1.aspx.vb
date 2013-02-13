Imports System.Drawing
Partial Class googlerank1
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(Server.MapPath("images/google1.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim url As String = Request.UrlReferrer.Host
        Dim color1 As String = Request.QueryString("color1")

        Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        Dim xpr As Integer = getpr.MyPR(url)

        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#6E6E6E"))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color1))
        With xgraphics
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
            .DrawString("This web has", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 19, 15)
            .DrawString("page rank:", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 29, 40)
            .DrawString(xpr, New Font("Microsoft Sans Serif", 17, FontStyle.Bold), br1, 57, 60)
            .DrawString("ajaxrank.com", New Font("Microsoft Sans Serif", 11, FontStyle.Regular), br1, 31, 100)
            .FillRectangle(br2, 21, 86, xpr * 9, 10)
            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub

End Class
