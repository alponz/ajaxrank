Imports System.Xml
Imports System
Imports System.Text
Imports System.Net
Imports System.Drawing
Partial Class google1
    Inherits System.Web.UI.Page
    Public xpr As Integer

 

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Button1.Attributes("onclick") = "draw()"



    End Sub

End Class
