<%@ Page Title="" Language="VB" MasterPageFile="~/Content.master" AutoEventWireup="false" CodeFile="google.aspx.vb" Inherits="google1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
    <script type="text/javascript">
        
         // now you can access API via 'myPicker' variable
        function alertdamn() {
            alert("damn");
        }
        function draw() {
            var gpr = getPageRank(document.getElementById('inputURL').value);
            var ctx = document.getElementById('<%=canvas.ClientID%>').getContext('2d');
            var img = new Image();
            img.src = 'images/google1.png';
            img.onload = function() {
                ctx.drawImage(img, 0, 0);
                ctx.fillStyle = document.getElementById('input2').value;
                ctx.fillRect(21, 86, 9 * gpr, 10);
                ctx.fillStyle = document.getElementById('input1').value;
                ctx.font = "12pt Century Gothic";
                ctx.fillText("This web has", 17, 29);
                ctx.fillText("page rank:", 23, 50);
                ctx.font = "15pt Century Gothic bold";
                ctx.fillText(gpr, 60, 77);
                ctx.font = "9pt Century Gothic";
                ctx.fillText("www.ajaxrank.com", 10, 113);
            }
        }

        /**
        * Developed Pau Sanchez for http://www.codigomanso.com
        * Adapted from PHP code found in http://www.tufuncion.com/pagerank-php
        *
        * As long as you keep above notice you can do whatever you want with this code
        */

        /** string to number */
        function StrToNum(str, check, magic) {
            int32Unit = 4294967296; // 2^32

            for (i = 0; i < str.length; i++) {
                check *= magic;
                if (check >= int32Unit) {
                    check = (check - int32Unit * parseInt(check / int32Unit));
                    check = (check < -2147483648) ? (check + int32Unit) : check;
                }
                check += str.charCodeAt(i);
            }

            return check;
        }

        /** 
        * You should be wondering why am I using this function instead of '|' operator...  so do I,
        * but otherwise this won't work on some webpages
        */
        function bitwise_or(op1, op2) {
            op1 = op1.toString(16);
            op2 = op2.toString(16);

            res = '';
            for (i1 = op1.length - 1, i2 = op2.length - 1; i1 >= 0 || i2 >= 0; i1--, i2--) {
                var o1 = 0, o2 = 0;
                if (i1 >= 0) o1 = op1.charAt(i1);
                if (i2 >= 0) o2 = op2.charAt(i2);
                res = (parseInt(o1, 16) | parseInt(o2, 16)).toString(16) + res;
            }

            return parseInt(res, 16);
        }

        /** Generate a hash for a url */
        function HashURL(str) {
            check1 = StrToNum(str, 0x1505, 0x21);
            check2 = StrToNum(str, 0, 0x1003F);

            check1 >>= 2;
            check1 = ((check1 >> 4) & 0x3FFFFC0) | (check1 & 0x3F);
            check1 = ((check1 >> 4) & 0x3FFC00) | (check1 & 0x3FF);
            check1 = ((check1 >> 4) & 0x3C000) | (check1 & 0x3FFF);

            // if javascript were perfect, and unsigned numbers were returned on bitwise-like operations then this would be the code
            //  t1 = ((((check1 & 0x3C0) << 4) | (check1 & 0x3C)) <<2 ) | (check2 & 0xF0F );
            //  t2 = ((((check1 & 0xFFFFC000) << 4) | (check1 & 0x3C00)) << 0xA) | (check2 & 0xF0F0000);

            // Nothing personal, but I trust 'bitwise_or' more than '|' for unsigned operations
            t1 = bitwise_or(bitwise_or((check1 & 0x3C0) << 4, (check1 & 0x3C)) << 2, check2 & 0xF0F);

            // due to some issues with javascript sign handling
            t2_1 = parseInt((((((check1 & 0xFFFFC000) << 4) | (check1 & 0x3C00))) * 4).toString(16) + '00', 16);
            t2_2 = (check2 & 0xF0F0000);
            t2 = bitwise_or(t2_1, t2_2);
            // This also works:  t2 = parseInt (((t2_1 >>> 16) | (t2_2 >>> 16)).toString(16) + '0000', 16);

            return bitwise_or(t1, t2);
        }

        /* generate a checksum for the hash string */
        function CheckHash(hashnum) {
            checkByte = 0;
            flag = 0;

            hashstr = "" + hashnum; // tostring

            for (i = hashstr.length - 1; i >= 0; i--) {
                re = parseInt(hashstr.charAt(i));
                if (1 === (flag % 2)) {
                    re += re;
                    re = parseInt(re / 10) + (re % 10);
                }
                checkByte += re;
                flag++;
            }

            checkByte %= 10;
            if (0 != checkByte) {
                checkByte = 10 - checkByte;
                if (1 === (flag % 2)) {
                    if (1 === (checkByte % 2)) {
                        checkByte += 9;
                    }
                    checkByte >>= 1;
                }
            }

            return '7' + checkByte + hashstr;
        }

        function getPageRank(url) {

            var query = "";
            query += "http://toolbarqueries.google.com/search";
            query += "?client=navclient-auto";
            query += "&features=Rank&ch=" + CheckHash(HashURL(url));
            query += "&q=info%3A" + url;
            query += "&num=100&filter=0";


            xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET", query, false);
            xmlhttp.send();
            xmlDoc = xmlhttp.responseXML;
            alert(xmlDoc.toString);
        }
         
    </script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <br />
        
       
        <table class="style1">
            <tr>
                <td align="center">
                    Insert your Web Site URL here</td>
            </tr>
            <tr>
                <td align="center" bgcolor="#FFCC00">
                    <br />
                    <input id="inputURL" value="www.example.com" />    
                    <br />
                    <br />
                </td>
                
            </tr>
            <tr>   
                <td align="center">
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Font Color" Font-Bold="True" 
                        Font-Size="Medium"></asp:Label>
                    &nbsp;
                    <input id="input1" class="color {pickerPosition:'right'}" value="6E6E6E" />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Bar Color" Font-Bold="True" 
                        Font-Size="Medium"></asp:Label>
                    &nbsp;
                    <input id="input2" class="color {pickerPosition:'right'}" value="339933" />
                    <br />
                    <br />
                </td>
            </tr>
        </table>

            <div align="center">
                <asp:Button ID="Button1" runat="server" Text="Preview" Height="30px" 
                    Width="150px" />
                <button type="button" onclick="draw()">Display</button>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server"></asp:Label>
                <br />
                <br />
                <br />
            </div>
    
    <div align="center">
        
        <canvas id="canvas" width="140" height="300" runat="server">
          Sorry, your browser doesn't support the &lt;canvas&gt; element.
        </canvas>
    </div>

</asp:Content>

