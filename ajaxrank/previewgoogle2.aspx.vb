Imports System.Drawing

Partial Class previewgoogle2
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(98, 120)
    Dim ximage2 As System.Drawing.Image = New Bitmap(Server.MapPath("images/google2.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim badgecolor As String = Request.QueryString("color")

        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & badgecolor))
        With xgraphics
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
            .DrawString("page rank", New Font("Arial", 12, FontStyle.Bold), br2, 9, 1)
            .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
            .FillEllipse(br2, 0, 21, 95, 95)
            .DrawString("5", New Font("Arial", 40, FontStyle.Regular), Brushes.White, 26, 40)
            .DrawImage(ximage2, 0, 0)

            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub
End Class
