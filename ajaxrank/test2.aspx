<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test2.aspx.vb" Inherits="test2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" 
            ImageUrl="googlerank4.aspx?color1=FF0000&amp;color2=666666" />
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" 
            Text="&lt;a href=&quot;http://www.ajaxrank.com&quot;&gt;&lt;img src=&quot;http://www.ajaxrank.com/googlerank1.aspx?color1=339933&quot; alt=&quot;pagerank&quot; /&gt;&lt;/a&gt;"></asp:Label>
        <br />
        <asp:Label ID="Label2" runat="server" 
            Text="&lt;a href=&quot;http://www.ajaxrank.com&quot;&gt;&lt;img src=&quot;http://www.ajaxrank.com/googlerank2.aspx?color1=66CC00&quot; alt=&quot;pagerank&quot; /&gt;&lt;/a&gt;"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" 
            Text="&lt;a href=&quot;http://www.ajaxrank.com&quot;&gt;&lt;img src=&quot;http://www.ajaxrank.com/googlerank4.aspx?color1=FFFFFF&amp;color2=339933&quot; alt=&quot;pagerank&quot; /&gt;&lt;/a&gt;"></asp:Label>
        <br />
        <asp:Label ID="Label4" runat="server" 
            Text="&lt;a href=&quot;http://www.ajaxrank.com&quot;&gt;&lt;img src=&quot;http://www.ajaxrank.com/googlerank3.aspx?color1=6E6E6E&amp;color2=339933&quot; alt=&quot;pagerank&quot; /&gt;&lt;/a&gt;"></asp:Label>
    </div>
    </form>
</body>
</html>
