<%@ Page Title="" Language="VB" MasterPageFile="~/Content.master" AutoEventWireup="false" CodeFile="google4.aspx.vb" Inherits="google4" ValidateRequest="false" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
    <script language="javascript">
        var font;
        var background;
        var fonttemp;
        var backgroundtemp;
        var t;
        window.onload = function start() {
            font = document.getElementById('<%=TextBoxFont.ClientID %>').value;
            background = document.getElementById('<%=TextBoxBackground.ClientID %>').value;
            ontextchange();
        }

        function ontextchange() {
            
            fonttemp = document.getElementById('<%=TextBoxFont.ClientID %>').value;
            backgroundtemp = document.getElementById('<%=TextBoxBackground.ClientID %>').value;
            if (fonttemp != font || backgroundtemp != background) {
                document.getElementById('imgprev').src = 'previewgoogle4.aspx?font=' + fonttemp + '&background=' + backgroundtemp;
                font = document.getElementById('<%=TextBoxFont.ClientID %>').value;
                background = document.getElementById('<%=TextBoxBackground.ClientID %>').value;
                
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
                <img src="previewgoogle4.aspx?font=FFFFFF&amp;background=339933" id="imgprev" 
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
                            <asp:Label ID="LabelFontColor" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Text="Font Color"></asp:Label>
                            <br />
                            <asp:Panel ID="PanelFont" runat="server" Height="100px" Width="100px" 
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                            <br />
                            <asp:ImageButton ID="ImageButtonFont" runat="server" 
                                ImageUrl="~/images/cp_button.png" ToolTip="change color" Width="20px" />
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxFont" runat="server" Text="FFFFFF" ></asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBoxFont_ColorPickerExtender" runat="server" 
                                PopupButtonID="ImageButtonFont" PopupPosition="BottomRight" 
                                SampleControlID="PanelFont" 
                                TargetControlID="TextBoxFont">
                            </asp:ColorPickerExtender>
                            
                        </td>
                        <td>
                            <asp:Label ID="LabelBackgroundColor" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Text="Background Color"></asp:Label>
                            <br />
                            <asp:Panel ID="PanelBackground" runat="server" Height="100px" Width="100px" 
                                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                            <br />
                            <asp:ImageButton ID="ImageButtonBackground" runat="server" 
                                ImageUrl="~/images/cp_button.png" ToolTip="change color" Width="20px" />
                            <br />
                            <br />
                            <asp:TextBox ID="TextBoxBackground" runat="server" Text="339933" ></asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBoxBackground_ColorPickerExtender" runat="server" 
                                PopupButtonID="ImageButtonBackground" PopupPosition="BottomRight" 
                                SampleControlID="PanelBackground" 
                                TargetControlID="TextBoxbackground">
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

