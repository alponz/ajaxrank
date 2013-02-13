<%@ Page Language="VB" AutoEventWireup="false" CodeFile="getbadge.aspx.vb" Inherits="getbadge" %>

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
            ProviderName="<%$ ConnectionStrings:mywebrankConnectionString1.ProviderName %>" 
            SelectCommand="SELECT url, r1, g1, b1, r2, g2, b2 FROM URL WHERE (id = @id)">
            <SelectParameters>
                <asp:Parameter Name="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
