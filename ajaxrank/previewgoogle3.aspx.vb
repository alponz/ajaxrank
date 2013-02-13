Imports System.Drawing

Partial Class previewgoogle3
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(82, 20)
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
            .DrawString("PAGE RANK", New Font("Courier", 6, FontStyle.Regular), br1, 0, 0)
            .DrawString("5", New Font("Courier", 11, FontStyle.Bold), br1, 61, 4)
            .DrawRectangle(Pens.DarkGray, 1, 11, 60, 6)
            .FillRectangle(br2, 2, 12, 5 * 6, 5)
            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With

    End Sub
End Class
