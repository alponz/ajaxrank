Imports System.Drawing

Partial Class previewgoogle4
    Inherits System.Web.UI.Page
    

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim ximage As System.Drawing.Image = New Bitmap(140, 80)
        Dim ximage2 As System.Drawing.Image = New Bitmap(Server.MapPath("images/google4.png"))
        Dim xgraphics As Graphics = Graphics.FromImage(ximage)

        'Dim url As String = Request.QueryString("url")
        Dim fontcolor As String = Request.QueryString("font")
        Dim backgroundcolor As String = Request.QueryString("background")

        'Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
        'Dim xpr As Integer = getpr.MyPR(url)

        'Dim br1 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(1), xReader.GetInt32(2), xReader.GetInt32(3)))
        'Dim br2 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(xReader.GetInt32(4), xReader.GetInt32(5), xReader.GetInt32(6)))
        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & fontcolor))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & backgroundcolor))
        With xgraphics
            .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
            .FillRectangle(br2, 0, 0, 140, 80)
            .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias

            .DrawString("page", New Font("Microsoft Sans Serif", 18, FontStyle.Bold), br1, 9, 10)
            .DrawString("rank", New Font("Microsoft Sans Serif", 28, FontStyle.Bold), br1, 5, 30)
            .DrawString("5", New Font("impact", 48, FontStyle.Bold), br1, 85, 0)
            .DrawImage(ximage2, 0, 0)

            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub
End Class
