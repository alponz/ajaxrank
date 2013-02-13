
Partial Class home
    Inherits System.Web.UI.Page

    Protected Sub ButtonGetBadge_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ButtonGetBadge.Click
        Dim r1 As Integer = CInt("&H" & TextBox2.Text.Substring(0, 2))
        Dim g1 As Integer = CInt("&H" & TextBox2.Text.Substring(2, 2))
        Dim b1 As Integer = CInt("&H" & TextBox2.Text.Substring(4, 2))
        Dim r2 As Integer = CInt("&H" & TextBox3.Text.Substring(0, 2))
        Dim g2 As Integer = CInt("&H" & TextBox3.Text.Substring(2, 2))
        Dim b2 As Integer = CInt("&H" & TextBox3.Text.Substring(4, 2))
        With SqlDataSource1
            .SelectCommand = "addurl"
            .SelectCommandType = SqlDataSourceCommandType.StoredProcedure
            .SelectParameters("r1").DefaultValue = r1
            .SelectParameters("g1").DefaultValue = g1
            .SelectParameters("b1").DefaultValue = b1
            .SelectParameters("r2").DefaultValue = r2
            .SelectParameters("g2").DefaultValue = g2
            .SelectParameters("b2").DefaultValue = b2
        End With
        FormView1.Visible = True
        'CType(FormView1.FindControl("Textbox6"), TextBox).Attributes.Add("onclick", "select();")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim captcha As Integer = CInt(10000 * Rnd() + 1)
        'If Not IsPostBack Then
        Image1.ImageUrl = "Default2.aspx?teks=" & captcha
        TextBox5.Text = captcha
        'End If

    End Sub


End Class
