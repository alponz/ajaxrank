Imports System.Drawing
Partial Class Default2
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image = New Bitmap(150, 100)
    Dim xgraphics As Graphics = Graphics.FromImage(ximage)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        With xgraphics
            .Clear(Color.White)

            For i As Integer = 0 To 150 Step 10
                .DrawLine(Pens.DarkSalmon, i, 0, i, 100)
            Next
            For i As Integer = 0 To 100 Step 10
                .DrawLine(Pens.Gray, 0, i, 150, i)
            Next
            .DrawRectangle(Pens.DarkRed, 0, 0, 148, 98)
            Dim z As New System.Drawing.Drawing2D.Matrix
            z.Reset()
            Dim randomrotate As Integer = CInt(90 * Rnd() + 1)
            z.RotateAt(randomrotate, New Point(75, 50))
            .Transform = z
            .DrawString(Request.QueryString("teks"), New Font("courier new", 25, FontStyle.Bold), Brushes.DarkBlue, 25, 30)
            ximage.save(Context.Response.OutputStream, Imaging.ImageFormat.Jpeg)
            .dispose()
            ximage.dispose()
        End With
        
    End Sub
End Class
