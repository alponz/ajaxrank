<%@ Page Title="" Language="VB" MasterPageFile="~/Content.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            font-size: large;
        }
        .style3
        {
            font-size: xx-large;
            font-family: Impact;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div align="center">
        <p>
            &nbsp;</p>
        <h1>
            <span class="style3">Design your own PageRank badge!</span>
        </h1>
        </div>
        <br>
        <div align="center">
            <asp:HyperLink ID="HyperLinkgoogle3" runat="server" 
                ImageUrl="~/images/previewgoogle3.jpg" NavigateUrl="~/google3.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLink4" runat="server" 
                ImageUrl="~/images/previewgoogle4.jpg" NavigateUrl="~/google4.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLinkgoogle1" runat="server" 
                ImageUrl="~/images/previewgoogle1.jpg" NavigateUrl="~/google1.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLinkgoogle2" runat="server" 
                ImageUrl="~/images/previewgoogle2.jpg" NavigateUrl="~/google2.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
        </div>
        <p>
            Ajaxrank.com checks your website&#39;s PageRank and give a PageRank badge for your 
            website faster! With ajax technology you can get your PageRank in instant 
            without having to wait your browser reload the whole page!
        </p>
        <p>
            &nbsp;</p>
        <p>
            <span class="style2">FREE BADGE</span></p>
        <p>
            We provide google PageRank BADGE that can be embedded to your website, to keep 
            you informed, and show everyone your website rank, with cool and professional 
            design for FREE!</p>
        <p>
            &nbsp;</p>
        <p class="style2">
            UNIQUE BADGE</p>
        <p>
            Your rank badge design will not be the boring one and like everyone-have-it-too 
            kind of widget, you can design your own badge, the color, and even the shape!
        </p>
        <p>
            &nbsp;</p>
        <p class="style2">
            MATCH and BLEND BADGE</p>
        <p>
            Your rank badge design will be unique, and doesn&#39;t looks like regular button 
            that will ruin the look of your website, instead we give you freedom to design 
            your badge, you can choose the shape and color which match and blend with your 
            website design view.
        </p>
        <p>
            &nbsp;</p>
        <p>
            How to put this badge into your website? Very easy, you only need this 4 simple 
            steps:
        </p>
        <p>
            1. Choose the badge
        </p>
        <p>
            2. Design the color</p>
        <p>
            3. Copy the code
        </p>
        <p>
            4. Paste into your website
        </p>
        <p>
            &nbsp;</p>
        <p class="style2">
            NOW CHOOSE THE BADGE</p>
        <p class="style2">
            &nbsp;</p>
        <div align="center">
            <asp:HyperLink ID="HyperLink1" runat="server" 
                ImageUrl="~/images/previewgoogle3.jpg" NavigateUrl="~/google3.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLink5" runat="server" 
                ImageUrl="~/images/previewgoogle4.jpg" NavigateUrl="~/google4.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLink2" runat="server" 
                ImageUrl="~/images/previewgoogle1.jpg" NavigateUrl="~/google1.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
            <asp:HyperLink ID="HyperLink3" runat="server" 
                ImageUrl="~/images/previewgoogle2.jpg" NavigateUrl="~/google2.aspx" 
                ToolTip="Click to choose this PageRank badge design">PageRank badge</asp:HyperLink>
        </div>
        <p class="style2">
            &nbsp;</p>
        <p>
            <span class="style2">PS</span>: Google PageRank is kind of stuff on which Google 
            thinks whether your webpage is relevant and important enough. Therefore, the 
            higher PageRank you got, the more Google will consider putting your webpage in 
            the very first part of it search results page. Google PageRank values come from 
            0 (zero) to 10 (ten), yes, the bigger is the better :D</p>

        <br>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

