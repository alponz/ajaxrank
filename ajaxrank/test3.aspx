<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test3.aspx.vb" Inherits="test3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            DataSourceMode="DataReader" 
            SelectCommand="SELECT ID, URL, FontColor, BarColor, ModifiedDate FROM google1 WHERE (ID = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
