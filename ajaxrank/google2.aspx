<%@ Page Title="" Language="VB" MasterPageFile="~/Content.master" AutoEventWireup="false" CodeFile="google2.aspx.vb" Inherits="google2" ValidateRequest="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 20px;
        }
    </style>
    <script language="javascript">
        
        var badge;
        var fonttemp;
        var badgetemp;
        var t;
        window.onload = function start() {
            badge = document.getElementById('<%=TextBoxBadge.ClientID %>').value;
            ontextchange();
        }

        function ontextchange() {

            badgetemp = document.getElementById('<%=TextBoxBadge.ClientID %>').value;
            if (badgetemp != badge) {
                document.getElementById('imgprev').src = 'previewgoogle2.aspx?color=' + badgetemp;
                
                badge = document.getElementById('<%=TextBoxBadge.ClientID %>').value;

            }
            t = setTimeout("ontextchange()", 1000);
        }
        
       
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
    <asp:Panel ID="Panel1" runat="server">
    
    <table class="style1">
        <tr>
            <td align="center">
                <asp:Label ID="LabelPreview" runat="server" Font-Bold="True" Font-Size="Medium" 
                    Text="Preview"></asp:Label>
                <br />
                (the page rank value is not actual)<br />
                <br />
                <img src="previewgoogle2.aspx?color=66CC00" id="imgprev" 
                    alt="pagerank preview" />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                                
                <table class="style1">
                    <tr align="center">
                        <td>
                            <asp:Label ID="LabelBadgeColor" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Text="Badge Color"></asp:Label>
                            <br />
                            <asp:Panel ID="PanelBadge" runat="server" Height="100px" Width="100px" 
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                            <br />
                            <asp:ImageButton ID="ImageButtonBadge" runat="server" 
                                ImageUrl="~/images/cp_button.png" ToolTip="change color" Width="20px" />
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxBadge" runat="server" Text="66CC00" ></asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBoxBadge_ColorPickerExtender" runat="server" 
                                PopupButtonID="ImageButtonBadge" PopupPosition="BottomRight" 
                                SampleControlID="PanelBadge" 
                                TargetControlID="TextBoxBadge">
                            </asp:ColorPickerExtender>
                            
                        </td>
                    </tr>
                </table>
                    
            </td>
            
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="Button1" runat="server" Height="50px" Text="Get your rank badge!" 
                    Width="150px" ValidationGroup="submit" />
            </td>
        </tr>
        <tr>
            <td align="center">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center">
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    Copy this code to your website:<br />
                    <asp:TextBox ID="TextBox1" runat="server" Height="83px" TextMode="MultiLine" 
                        Width="290px"></asp:TextBox>
                </asp:Panel>
            </td>
        </tr>
    </table>
    
    </asp:Panel>
    
    </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

