Imports System.Drawing
Partial Class googlerank2
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(98, 120)
    Dim ximage2 As System.Drawing.Image = New Bitmap(Server.MapPath("images/google2.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim url As String = Request.UrlReferrer.Host
        Dim color1 As String = Request.QueryString("color1")

        Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        Dim xpr As Integer = getpr.MyPR(url)

        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & color1))
        With xgraphics
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
            .DrawString("page rank", New Font("Arial", 12, FontStyle.Bold), br2, 9, 1)
            .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
            .FillEllipse(br2, 0, 21, 95, 95)
            If xpr < 10 Then
                .DrawString(xpr, New Font("Arial", 40, FontStyle.Regular), Brushes.White, 26, 40)
            Else
                .DrawString(xpr, New Font("Arial", 40, FontStyle.Regular), Brushes.White, 8, 40)
            End If

            .DrawImage(ximage2, 0, 0)

            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With
    End Sub
End Class
