﻿
Partial Class google3
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = "<a href=""http://www.ajaxrank.com""><img src=""http://www.ajaxrank.com/googlerank3.aspx?color1=" & TextBoxFont.Text & "&color2=" & TextBoxBar.Text & """ alt=""pagerank"" /></a>"
        Panel2.Visible = True
    End Sub

End Class
