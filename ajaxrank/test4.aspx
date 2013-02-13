<%@ Page Language="VB" AutoEventWireup="false" CodeFile="test4.aspx.vb" Inherits="test4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:Label ID="URLLabel" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:Label ID="ModifiedDateLabel" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource2">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:Label ID="URLLabel" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:Label ID="ModifiedDateLabel" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:FormView ID="FormView3" runat="server" DataSourceID="SqlDataSource3">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:Label ID="URLLabel" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:Label ID="ModifiedDateLabel" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <br />
        <asp:FormView ID="FormView4" runat="server" DataSourceID="SqlDataSource4">
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                    CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                URL:
                <asp:TextBox ID="URLTextBox" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:TextBox ID="ModifiedDateTextBox" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                URL:
                <asp:Label ID="URLLabel" runat="server" Text='<%# Bind("URL") %>' />
                <br />
                ModifiedDate:
                <asp:Label ID="ModifiedDateLabel" runat="server" 
                    Text='<%# Bind("ModifiedDate") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            
            SelectCommand="SELECT TOP (1) ID, URL, ModifiedDate FROM google1 ORDER BY ID DESC"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            
            SelectCommand="SELECT TOP (1) ID, URL, ModifiedDate FROM google2 ORDER BY ID DESC"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            
            SelectCommand="SELECT TOP (1) ID, URL, ModifiedDate FROM google3 ORDER BY ID DESC"></asp:SqlDataSource>
    
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            
            SelectCommand="SELECT TOP (1) ID, URL, ModifiedDate FROM google4 ORDER BY ID DESC"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
