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

    if ($('#PRForm').length == 0) {
        var frameName = 'jpost_iframe_' + (new Date()).getTime();
        $('#PageRank').html('<iframe name="' + frameName + '"></iframe>');
        $('<form id="PRForm" action="http://toolbarqueries.google.com/search" method="GET" target="' + frameName + '"></form>').appendTo('body');
        $('<input type="hidden" name="client" value="navclient-auto"/>').appendTo('#PRForm');
        $('<input type="hidden" name="features" value="Rank"/>').appendTo('#PRForm');
        $('<input type="hidden" name="ch" value="' + CheckHash(HashURL(url)) + '"/>').appendTo('#PRForm');
        $('<input type="hidden" name="q" value="info:' + url + '"/>').appendTo('#PRForm');
        $('<input type="hidden" name="num" value="100"/>').appendTo('#PRForm');
        $('<input type="hidden" name="filter" value="0"/>').appendTo('#PRForm');
    }
    else {
        $('#PRForm input[name=ch]').val(CheckHash(HashURL(url)));
        $('#PRForm input[name=q]').val("info:" + url);
    }
    $('#PRForm').submit();
}