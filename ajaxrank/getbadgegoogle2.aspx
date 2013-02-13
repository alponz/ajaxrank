<%@ Page Language="VB" AutoEventWireup="false" CodeFile="getbadgegoogle2.aspx.vb" Inherits="getbadgegoogle2" %>

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
            SelectCommand="SELECT ID, URL, BadgeColor, ModifiedDate FROM google2 WHERE (ID = @id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
