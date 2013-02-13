Imports System.Drawing
Partial Class createsample
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(Server.MapPath("button.png"))
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim r1 As Integer = CInt("&H" & Request.QueryString("rgb1").Substring(0, 2))
        Dim g1 As Integer = CInt("&H" & Request.QueryString("rgb1").Substring(2, 2))
        Dim b1 As Integer = CInt("&H" & Request.QueryString("rgb1").Substring(4, 2))
        Dim r2 As Integer = CInt("&H" & Request.QueryString("rgb2").Substring(0, 2))
        Dim g2 As Integer = CInt("&H" & Request.QueryString("rgb2").Substring(2, 2))
        Dim b2 As Integer = CInt("&H" & Request.QueryString("rgb2").Substring(4, 2))
        Dim br1 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(r1, g1, b1))
        Dim br2 = New System.Drawing.SolidBrush(System.Drawing.Color.FromArgb(r2, g2, b2))
        With xgraphics
            .DrawString("This web has:", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 15)
            .DrawString("page rank", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 40)
            .DrawString("7", New Font("century gothic", 17, FontStyle.Bold), br1, 13, 60)
            .FillRectangle(br2, 17, 82, 63, 10)
            .DrawString("alexa rank", New Font("century gothic", 15, FontStyle.Regular), br1, 13, 100)
            .DrawString("1636", New Font("century gothic", 17, FontStyle.Bold), br1, 13, 120)
            .DrawString("thisweb.info", New Font("century gothic", 11, FontStyle.Regular), br1, 12, 145)
            ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
            .Dispose()
            ximage.Dispose()
        End With
    End Sub
End Class
