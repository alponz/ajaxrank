Imports System.Drawing
Partial Class googlerank3
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(82, 20)
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim url As String = Request.UrlReferrer.Host
        Dim color1 As String = Request.QueryString("color1")
        Dim color2 As String = Request.QueryString("color2")

        Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        Dim xpr As Integer = getpr.MyPR(url)

        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color1))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color2))
        With xgraphics
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
            .DrawString("PAGE RANK", New Font("Courier", 6, FontStyle.Regular), br1, 0, 0)
            .DrawString(xpr, New Font("Courier", 11, FontStyle.Bold), br1, 61, 4)
            .DrawRectangle(Pens.DarkGray, 1, 11, 60, 6)
            .FillRectangle(br2, 2, 12, xpr * 6, 5)
            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub
End Class
