Imports System.Drawing
Partial Class googlerank4
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image
    Dim ximage2 As System.Drawing.Image
    Dim xgraphics As Graphics
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim url As String = Request.UrlReferrer.Host
        Dim color1 As String = Request.QueryString("color1")
        Dim color2 As String = Request.QueryString("color2")

        Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        Dim xpr As Integer = getpr.MyPR(url)

        If xpr < 10 Then
            ximage = New Bitmap(140, 80)
        Else
            ximage = New Bitmap(170, 80)
        End If
        ximage2 = New Bitmap(Server.MapPath("images/google4.png"))
        xgraphics = Graphics.FromImage(ximage)

        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color1))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color2))
        With xgraphics
            .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
            .FillRectangle(br2, 0, 0, 140, 80)
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias

            .DrawString("page", New Font("Microsoft Sans Serif", 18, FontStyle.Bold), br1, 9, 10)
            .DrawString("rank", New Font("Microsoft Sans Serif", 28, FontStyle.Bold), br1, 5, 30)
            .DrawString(xpr, New Font("impact", 48, FontStyle.Bold), br1, 85, 0)
            .DrawImage(ximage2, 0, 0)

            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With
    End Sub
End Class
