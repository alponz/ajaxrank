var googlepagerank = {  
    hexdec: function(hex_string) {  
        hex_string = (hex_string+'').replace(/[^a-f0-9]/gi, '');  
        return parseInt(hex_string, 16);  
    },  
    count: function( mixed_var, mode ) {  
        var key, cnt = 0;  
        if( mode == 'COUNT_RECURSIVE' ) mode = 1;  
        if( mode != 1 ) mode = 0;  
        for (key in mixed_var){  
            cnt++;  
            if( mode==1 && mixed_var[key] && (mixed_var[key].constructor === Array || mixed_var[key].constructor === Object) ){  
                cnt += count(mixed_var[key], 1);  
            }  
        }  
        return cnt;  
    },  
    sizeof: function( mixed_var, mode ) {  
        return googlepagerank.count( mixed_var, mode );  
    },  
    ord: function(string) {  
        return (string+'').charCodeAt(0);  
    },  
    strlen: function(string) {  
        var str = string+'';  
        var i = 0, chr = '', lgth = 0;  
        var getWholeChar = function (str, i) {  
            var code = str.charCodeAt(i);  
            var next = '', prev = '';  
            if (0xD800 <= code && code <= 0xDBFF) {  
                if (str.length <= (i+1))  {  
                    throw 'High surrogate without following low surrogate';  
                }  
                next = str.charCodeAt(i+1);  
                if (0xDC00 > next || next > 0xDFFF) {  
                    throw 'High surrogate without following low surrogate';  
                }  
                return str[i]+str[i+1];  
            } else if (0xDC00 <= code && code <= 0xDFFF) {  
                if (i === 0) {  
                    throw 'Low surrogate without preceding high surrogate';  
                }  
                prev = str.charCodeAt(i-1);  
                if (0xD800 > prev || prev > 0xDBFF) {  
                    throw 'Low surrogate without preceding high surrogate';  
                }  
                return false;  
            }  
            return str[i];  
        };  
        for (i=0, lgth=0; i < str.length; i++) {  
            if ((chr = getWholeChar(str, i)) === false) {  
                continue;  
            }  
            lgth++;  
        }  
        return lgth;  
    },  
    substr: function(f_string,f_start,f_length ) {  
            f_string += '';  
            if(f_start < 0) {  
                    f_start += f_string.length;  
            }  
            if(f_length == undefined) {  
                    f_length = f_string.length;  
            } else if(f_length < 0){  
                    f_length += f_string.length;  
            } else {  
                    f_length += f_start;  
            }  
            if(f_length < f_start) {  
                    f_length = f_start;  
            }  
            return f_string.substring(f_start, f_length);  
    },  
    zeroFill: function(a, b){  
        z = googlepagerank.hexdec(80000000);  
        if (z & a) {  
            a = (a >> 1);  
            a &= (~ z);  
            a |= 0x40000000;  
            a = (a >> (b - 1));  
        }  
        else {  
            a = (a >> b);  
        }  
        return a;  
    },  
    mix: function(a, b, c){  
        a -= b; a -= c; a ^= (this.zeroFill(c, 13));  
        b -= c; b -= a; b ^= (a << 8);  
        c -= a; c -= b; c ^= (this.zeroFill(b, 13));  
        a -= b; a -= c; a ^= (this.zeroFill(c, 12));  
        b -= c; b -= a; b ^= (a << 16);  
        c -= a; c -= b; c ^= (this.zeroFill(b, 5));  
        a -= b; a -= c; a ^= (this.zeroFill(c, 3));  
        b -= c; b -= a; b ^= (a << 10);  
        c -= a; c -= b; c ^= (this.zeroFill(b, 15));  
        return new Array(a, b, c);  
    },  
    ch: function(url){  
        length = googlepagerank.sizeof(url);  
        a = 0x9E3779B9;  
        b = 0x9E3779B9;  
        c = 0xE6359A60;  
        k = 0;  
        len = length;  
        while (len >= 12) {  
            a += (url[k + 0] + (url[k + 1] << <img src="http://abhinavsingh.com/blog/wp-includes/images/smilies/icon_cool.gif" alt="8)" class="wp-smiley"> + (url[k + 2] << 16) + (url[k + 3] << 24));  
            b += (url[k + 4] + (url[k + 5] << <img src="http://abhinavsingh.com/blog/wp-includes/images/smilies/icon_cool.gif" alt="8)" class="wp-smiley"> + (url[k + 6] << 16) + (url[k + 7] << 24));  
            c += (url[k + 8] + (url[k + 9] << <img src="http://abhinavsingh.com/blog/wp-includes/images/smilies/icon_cool.gif" alt="8)" class="wp-smiley"> + (url[k + 10] << 16) + (url[k + 11] << 24));  
            m = this.mix(a, b, c);  
            a = m[0]; b = m[1]; c = m[2];  
            k += 12;  
            len -= 12;  
        }  
        c += length;  
        switch (len) {  
            case 11: c += (url[k + 10] << 24);  
            case 10: c += (url[k + 9] << 16);  
            case 9:  c += (url[k + 8] << 8);  
            case 8:  b += (url[k + 7] << 24);  
            case 7:  b += (url[k + 6] << 16);  
            case 6:  b += (url[k + 5] << 8);  
            case 5:  b += (url[k + 4]);  
            case 4:  a += (url[k + 3] << 24);  
            case 3:  a += (url[k + 2] << 16);  
            case 2:  a += (url[k + 1] << 8);  
            case 1:  a += (url[k + 0]);  
        }  
        m = this.mix(a, b, c);  
        return m[2];  
    },  
    strord: function(string){  
        var result = new Array();  
        for (i = 0; i < googlepagerank.strlen(string); i++) {  
            result[i] = googlepagerank.ord(string[i]);  
        }  
        return result;  
    },  
    gethash: function(url) {  
        return this.ch(this.strord("info:" + url));  
    },  
    getpr: function(baseurl) {  
        var query = "";  
        query += "http://toolbarqueries.google.com/search";  
        query += "?client=navclient-auto";  
        query += "&hl=en";  
        query += "&ch=6"+googlepagerank.gethash(baseurl);  
        query += "&ie=UTF-8";  
        query += "&oe=UTF-8";  
        query += "&features=Rank";  
        query += "&q=info:"+baseurl;  
  
        var req = new XMLHttpRequest();  
        req.onreadystatechange = function(){  
            if (req.readyState == 4) {  
                var str = req.responseText;  
                var pagerank = googlepagerank.substr(str, 9, 2);  
                alert(pagerank);  
            }  
        }  
        req.open('GET', query, true);  
        req.send(null);  
    }  
}  