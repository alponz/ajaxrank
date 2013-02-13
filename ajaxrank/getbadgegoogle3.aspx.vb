Imports System.Drawing
Imports System.Data.SqlClient
Imports System.IO

Partial Class getbadgegoogle3
    Inherits System.Web.UI.Page
    Dim ximage As System.Drawing.Image
    Dim xgraphics As Graphics

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim urlid As String = Request.QueryString("id")

        Dim xReader As System.Data.IDataReader = SqlDataSource1.Select(DataSourceSelectArguments.Empty)

        If xReader.Read Then
            If DateAdd(DateInterval.Day, 1, xReader.Item("ModifiedDate")) < Now() Then
                Dim url As String = xReader.Item("URL")
                Dim fontcolor As String = xReader.Item("FontColor")
                Dim barcolor As String = xReader.Item("BarColor")
                Dim getpr As GooglePR.GetPR = New GooglePR.GetPR
                Dim xpr As Integer = getpr.MyPR(url)


                ximage = New Bitmap(82, 20)
                xgraphics = Graphics.FromImage(ximage)
                Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & fontcolor))
                Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & barcolor))
                With xgraphics
                    .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
                    .DrawString("PAGE RANK", New Font("Courier", 6, FontStyle.Regular), br1, 0, 0)
                    .DrawString(xpr, New Font("Courier", 11, FontStyle.Bold), br1, 61, 4)
                    .DrawRectangle(Pens.DarkGray, 1, 11, 60, 6)
                    .FillRectangle(br2, 2, 12, xpr * 6, 5)
                    ximage.Save(Server.MapPath("images/google3/" & urlid & ".png"), Imaging.ImageFormat.Png)
                    ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                    .Dispose()
                    ximage.Dispose()
                End With

                Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("mywebrankconnectionstring1").ConnectionString)
                Dim dr As New SqlCommand("update google3 set modifieddate='" & Now() & "' where id=" & urlid, conn)
                conn.Open()
                dr.ExecuteReader()
                conn.Close()

            Else
                ximage = New Bitmap(Server.MapPath("images/google3/" & urlid & ".png"))
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
