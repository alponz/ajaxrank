Imports System.Drawing
Imports System.Data.SqlClient
Imports System.IO

Partial Class getbadgegoogle1
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


                ximage = New Bitmap(Server.MapPath("images/google1.png"))
                xgraphics = Graphics.FromImage(ximage)
                Dim br1 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & fontcolor))
                Dim br2 = New System.Drawing.SolidBrush(System.Drawing.ColorTranslator.FromHtml("#" & barcolor))
                With xgraphics
                    .TextRenderingHint = Drawing.Text.TextRenderingHint.AntiAlias
                    .DrawString("This web has", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 19, 15)
                    .DrawString("page rank:", New Font("Microsoft Sans Serif", 15, FontStyle.Regular), br1, 29, 40)
                    .DrawString(xpr, New Font("Microsoft Sans Serif", 17, FontStyle.Bold), br1, 57, 60)
                    .DrawString("ajaxrank.com", New Font("Microsoft Sans Serif", 11, FontStyle.Regular), br1, 31, 100)
                    .FillRectangle(br2, 21, 86, xpr * 9, 10)
                    ximage.Save(Server.MapPath("images/google1/" & urlid & ".png"), Imaging.ImageFormat.Png)
                    ximage.Save(Context.Response.OutputStream, Imaging.ImageFormat.Png)
                    .Dispose()
                    ximage.Dispose()
                End With

                Dim conn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("mywebrankconnectionstring1").ConnectionString)
                Dim dr As New SqlCommand("update google1 set modifieddate='" & Now() & "' where id=" & urlid, conn)
                conn.Open()
                dr.ExecuteReader()
                conn.Close()

            Else
                ximage = New Bitmap(Server.MapPath("images/google1/" & urlid & ".png"))
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
