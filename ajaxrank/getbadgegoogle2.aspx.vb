Imports System.Drawing
Imports System.Data.SqlClient
Imports System.IO

Partial Class getbadgegoogle2
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
                Dim barcolor As String = xReader.Item("BadgeColor")
                Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
                Dim xpr As Integer = getpr.MyPR(url)

                ximage = New Bitmap(98, 120)
                ximage2 = New Bitmap(Server.MapPath("images/google2.png"))
                xgraphics = Graphics.FromImage(ximage)
                Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & barcolor))
                With xgraphics
                    .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
                    .DrawString("page rank", New Font("Arial", 12, FontStyle.Bold), br2, 9, 1)
                    .SmoothingMode = Drawing2D.SmoothingMode.AntiAlias
                    .FillEllipse(br2, 0, 21, 95, 95)
                    .DrawString(xpr, New Font("Arial", 40, FontStyle.Regular), Brushes.White, 25, 40)
                    .DrawImage(ximage2, 0, 0)

                    ximage.Save(Server.MapPath("images/google2/" & urlid & ".png"), Imaging.ImageFormat.Png)
                    ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                    .Dispose()
                    ximage.Dispose()
                End With

                Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("mywebrankconnectionstring1").ConnectionString)
                Dim dr As New SqlCommand("update google2 set modifieddate='" & Now() & "' where id=" & urlid, conn)
                conn.Open()
                dr.ExecuteReader()
                conn.Close()

            Else
                ximage = New Bitmap(Server.MapPath("images/google2/" & urlid & ".png"))
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
