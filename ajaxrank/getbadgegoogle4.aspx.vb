Imports System.Drawing
Imports System.Data.SqlClient
Imports System.IO

Partial Class getbadgegoogle4
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image
    Dim ximage2 As System.Drawing.Image
    Dim xgraphics As Graphics

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim urlid As String = Request.QueryString("id")

        Dim xReader As System.Data.IDataReader = SqlDataSource1.Select(DataSourceSelectArguments.Empty)

        If xReader.Read Then
            If DateAdd(DateInterval.Day, 1, xReader.Item("ModifiedDate")) < Now() Then
                Dim url As String = xReader.Item("URL")
                Dim fontcolor As String = xReader.Item("FontColor")
                Dim backgroundcolor As String = xReader.Item("BackgroundColor")
                Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
                Dim xpr As Integer = getpr.MyPR(url)

                If xpr < 10 Then
                    ximage = New Bitmap(140, 80)
                Else
                    ximage = New Bitmap(170, 80)
                End If

                ximage2 = New Bitmap(Server.MapPath("images/google4.png"))
                xgraphics = Graphics.FromImage(ximage)
                Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & fontcolor))
                Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & backgroundcolor))
                With xgraphics
                    .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
                    If xpr < 10 Then
                        .FillRectangle(br2, 0, 0, 140, 80)
                    Else
                        .FillRectangle(br2, 0, 0, 170, 80)
                    End If

                    .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
                    .DrawString("page", New Font("Microsoft Sans Serif", 18, FontStyle.Bold), br1, 9, 10)
                    .DrawString("rank", New Font("Microsoft Sans Serif", 28, FontStyle.Bold), br1, 5, 30)
                    .DrawString(xpr, New Font("impact", 48, FontStyle.Bold), br1, 85, 0)
                    .DrawImage(ximage2, 0, 0)

                    ximage.Save(Server.MapPath("images/google4/" & urlid & ".png"), Imaging.ImageFormat.Png)
                    ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                    .Dispose()
                    ximage.Dispose()
                End With

                Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("mywebrankconnectionstring1").ConnectionString)
                Dim dr As New SqlCommand("update google4 set modifieddate='" & Now() & "' where id=" & urlid, conn)
                conn.Open()
                dr.ExecuteReader()
                conn.Close()

            Else
                ximage = New Bitmap(Server.MapPath("images/google4/" & urlid & ".png"))
                xgraphics = Graphics.FromImage(ximage)
                With xgraphics

                    ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                    .Dispose()
                    ximage.Dispose()
                End With
            End If

        End If
    End Sub
End Class
