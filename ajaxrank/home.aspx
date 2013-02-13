<%@ Page Title="" Language="VB" MasterPageFile="~/Welcome.master" AutoEventWireup="false" CodeFile="home.aspx.vb" Inherits="home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <script type="text/javascript">
        function alertdamn() {
            alert("damn");
        }
    
    </script>
    
        <table class="style1">
            <tr>
                <td align="center"><img alt="" src="sample.png" /><br />
                    <br />
                </td>
            </tr>
        </table>
    <asp:UpdatePanel runat="server">
    <ContentTemplate>

    <table class="style1">

        <tr>
            <td align="center">
                <asp:Label ID="Label1" runat="server" Text="Insert your URL here" 
                    Font-Bold="True" Font-Size="Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#FFCC00">
                <br />
        <asp:TextBox ID="TextBoxURL" runat="server" Height="20px" Width="600px" 
                    Font-Size="Large"></asp:TextBox>
                <br />
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBoxURL" Display="Dynamic" 
                    ErrorMessage="You must fill this!" ValidationGroup="submit"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton ID="LinkButton1" runat="server">Advanced</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Panel ID="Panel3" runat="server">
                <table class="style1">
                    <tr>
                        <td align="center">
                            <asp:Label ID="Label3" runat="server" Text="Font Color" Font-Bold="True" 
                                Font-Size="Medium"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox2" runat="server" Text="6E6E6E" Width="104px"></asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBox2_ColorPickerExtender" runat="server" 
                                PopupButtonID="ImageButton1" PopupPosition="BottomRight" 
                                SampleControlID="Panel1" TargetControlID="TextBox2">
                            </asp:ColorPickerExtender>
                            <asp:ImageButton ID="ImageButton1" runat="server" 
                                ImageUrl="~/images/cp_button.png" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="TextBox2" Display="Dynamic"
                                ErrorMessage="the value is not valid!"></asp:RequiredFieldValidator>
                            
                            <asp:Panel ID="Panel1" runat="server" Height="20px" Width="20px" />
                            <br />
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" 
                                Text="Bar Color"></asp:Label>
                            <br />
                            <asp:TextBox ID="TextBox3" runat="server">339933</asp:TextBox>
                            <asp:ColorPickerExtender ID="TextBox3_ColorPickerExtender" runat="server" 
                                PopupButtonID="ImageButton2" PopupPosition="BottomRight" 
                                SampleControlID="Panel2" TargetControlID="TextBox3">
                            </asp:ColorPickerExtender>
                            <asp:ImageButton ID="ImageButton2" runat="server" 
                                ImageUrl="~/images/cp_button.png" />
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="TextBox3" Display="Dynamic" 
                                ErrorMessage="the value is not valid!"></asp:RequiredFieldValidator>
                            <asp:Panel ID="Panel2" runat="server" Height="20px" Width="20px" />
                        </td>
                    </tr>
                </table>
                </asp:Panel>
                <asp:CollapsiblePanelExtender ID="Panel3_CollapsiblePanelExtender" 
                    runat="server" Enabled="True" TargetControlID="Panel3"
                    CollapsedSize="0"
                    ExpandedSize="200"
                    Collapsed="True"
                    ExpandControlID="LinkButton1"
                    CollapseControlID="LinkButton1"
                    AutoCollapse="False"
                    AutoExpand="False"
                    ScrollContents="False">
                </asp:CollapsiblePanelExtender>
            </td>
        </tr>
        <tr>
            <td align="center">
                <br />
                <asp:Image ID="Image1" runat="server" />
                <br />
                <asp:Label ID="Label5" runat="server" Text="Insert text above" Font-Bold="True" 
                    Font-Size="Medium"></asp:Label>
                <br />
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="TextBox4" ControlToValidate="TextBox5" Display="Dynamic" 
                    ErrorMessage="Not match!" ValidationGroup="submit"></asp:CompareValidator>
                <br />
                <asp:TextBox ID="TextBox5" runat="server" Visible="False" Width="62px" 
                    Height="18px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
        <asp:Button ID="ButtonGetBadge" runat="server" Text="Get my rank badge!" 
                    ValidationGroup="submit" /></td>
        </tr>
    </table>     
    
    <br />
        <br />
        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" 
            Visible="False" Width="100%">
            <ItemTemplate>
                <table class="style1">
                    <tr>
                        <td align="center">
                            Here&#39;s your badge (might take some time):<br />
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                Text='<%# "<img src=""getbadge.aspx?id=" & eval("xidentity") &""" />" %>'></asp:HyperLink>
                            <br />
                            <br />
                            and here&#39;s the code, just copy this in to your web:<br />
                            <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" Width="40%" 
                                Text='<%# "<a href=""http://www.thisweb.info""><img src=""getbadge.aspx?id=" & eval("xidentity") & """ /></a>" %>' 
                                OnClick="select();" Height="100px"></asp:TextBox>
                            <br />
                            
                        </td>
                    </tr>
                </table>
                <br />
            </ItemTemplate>
        </asp:FormView>
        
        <br />
        </p><asp:SqlDataSource 
            ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:mywebrankConnectionString1 %>" 
            SelectCommand="select from url">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBoxURL" Name="url" PropertyName="Text" 
                    Type="String" />
                <asp:Parameter Name="r1" Type="String" />
                <asp:Parameter Name="g1" Type="String" />
                <asp:Parameter Name="b1" Type="String" />
                <asp:Parameter Name="r2" Type="String" />
                <asp:Parameter Name="g2" Type="String" />
                <asp:Parameter Name="b2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
     </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

