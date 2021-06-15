/**
 * Debug Log
 */
if (!window.console) {
    var Console = function() {
        return {
            log : function(message) {},
            info : function(message) {},
            warn : function(message) {},
            error : function(message) {}
        };
    };
console = Console();
}

$(document).ready(function (){
    //number 클래스는 숫자만 입력하도록..
    $('.number').numeric();

    $.ajaxSetup ({
        // Disable caching of AJAX responses */
        cache: false
    });
    // Submit시 메뉴코드 세팅
    $("form").on("submit", function(){
        setSubmit($(this));
    });
});
/*
document.onkeydown = function(){
    if(event.srcElement.type != "text" && event.srcElement.type != "textarea"){
        if(event.keyCode == 116){
            event.keyCode = 2;
            return false;
        } else if(event.ctrlKey && (event.keyCode == 78 || event.keyCode == 82)){
            return false;
        } else if(event.keyCode == 8){
            return false;
        }
    }
}

*/
//로그아웃
function logout(){
    location.replace("/secure/logout.asp");
}

//수동 폼체크
function checkForm(type, objv, objv2){
    if(type=="text"){
        if($.trim($('[name='+objv+']').val())==''){
            alert(''+objv2+' 입력해주세요');
            $('[name='+objv+']').focus();
            return true;
        }
    }else if(type=="radio"){
        if($(':radio[name='+objv+']:checked').length<1){
            alert(''+objv2+' 선택해주세요');
            $('radio[name='+objv+']:eq(0)').focus();
            return true;
        }
    }else if(type=="select"){
        if($('select[name='+objv+']').val()==''){
            alert(''+objv2+' 선택해주세요');
            $('select[name='+objv+']:eq(0)').focus();
            return true;
        }
    }
    return false;
}

//팝업호출함수
var Popup = {
base: function (url, name, pars) {
    var win = window.open(url, name, pars);
    if (win == null)
        window.alert("차단된 팝업창을 허용해 주세요.");
    else
        if (parseInt(navigator.appVersion) >= 4) win.window.focus();
},
//일반 형식 팝업
open: function (url, name, width, height, scroll, top, left, resize) {
    var top = (top) ? top : 0;
    var left = (left) ? left : 0;
    var resize = (resize) ? resize : 0;
    scroll = (scroll == undefined) ? 0 : scroll;
    var pars = "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left + ",scrollbars=" + scroll + ", resizable=" + resize + ", status=no, menubar=no, titlebar=no, toolbar=no, directories=no";
    var win = window.open(url, name, pars);
    win.focus();
},
//가운데 팝업
center: function (url, name, width, height, scroll, resize, status) {
    var ww = (screen.width - width) / 2;
    var wh = (screen.height - height) / 2;
    var screenWidth;
    var screenHeight;

    screenHeight = screen.height;
    screenWidth = screen.width;
    height = ((screenHeight <= parseInt(height) + 70) ? screenHeight - 70 : height);

    scroll = (scroll == undefined) ? 0 : scroll;
    resize = (resize == undefined) ? 0 : resize;
    status = (status == undefined) ? 0 : status;

    var pars = "width=" + width + ",height=" + height + ",top=" + wh + ",left=" + ww + ",scrollbars=" + scroll + ", resizable=" + resize + ", menubar=no, titlebar=no, toolbar=no, status=" + status + ", directories=no";
    var win = window.open(url, name, pars);
    win.focus();
},
//풀 팝업
full: function (url, name, scroll) {
    scroll = (scroll == undefined) ? 0 : scroll;
    var pars = "fullscreen, scrollbars=" + scroll;
    window.open(url, name, pars);
},
//최대창 팝업
max: function (url, name, scroll) {
    var ww = (screen.width) - 10;
    var wh = (screen.height) - 50;
    scroll = (scroll == undefined) ? 0 : scroll;
    var pars = "width=" + ww + ",height=" + wh + ",left=0,top=0,screenX=0,screenY=0,scrollbars=" + scroll + ", resizable=0, menubar=no, titlebar=no, toolbar=no, status=no, directories=no";
    window.open(url, name, pars);
},
resize: function () {
    var thisX = parseInt(document.body.scrollWidth);
    var thisY = parseInt(document.body.scrollHeight);
    var maxThisX = screen.width - 50;
    var maxThisY = screen.height - 50;
    var marginY = 0;

    //alert("임시 브라우저 확인 : " + navigator.userAgent);
    // 브라우저별 높이 조절. (표준 창 하에서 조절해 주십시오.)
    if (navigator.userAgent.indexOf("MSIE 6") > 0) marginY = 45;          // IE 6.x
    else if (navigator.userAgent.indexOf("MSIE 7") > 0) marginY = 75;    // IE 7.x
    else if (navigator.userAgent.indexOf("Firefox") > 0) marginY = 50;     // FF
    else if (navigator.userAgent.indexOf("Opera") > 0) marginY = 30;     // Opera
    else if (navigator.userAgent.indexOf("Netscape") > 0) marginY = -2;  // Netscape

    if (thisX > maxThisX) {
        window.document.body.scroll = "yes";
        thisX = maxThisX;
    }
    if (thisY > maxThisY - marginY) {
        window.document.body.scroll = "yes";
        thisX += 19;
        thisY = maxThisY - marginY;
    }
    window.resizeTo(thisX + 10, thisY + marginY);
}
};

//blockUI
function blockUI(){
    try {
        $.blockUI({ css: {
            border: 'none',
            padding: '15px',
            backgroundColor: '#000',
            '-webkit-border-radius': '10px',
            '-moz-border-radius': '10px',
            opacity: .5,
            color: '#fff'
        } });
    } catch (e){

    }

}

(function ($) {
    // 영문과 숫자만
    $.fn.alphanumeric = function (p) {

        p = $.extend({
            ichars: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.- ",
            nchars: "",
            allow: ""
        }, p);

        return this.each
            (
                function () {

                    if (p.nocaps) p.nchars += "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                    if (p.allcaps) p.nchars += "abcdefghijklmnopqrstuvwxyz";

                    s = p.allow.split('');
                    for (var i = 0; i < s.length; i++) if (p.ichars.indexOf(s[i]) != -1) s[i] = "\\" + s[i];
                    p.allow = s.join('|');

                    var reg = new RegExp(p.allow, 'gi');
                    var ch = p.ichars + p.nchars;
                    ch = ch.replace(reg, '');

                    $(this).keypress
                        (
                            function (e) {

                                if (!e.charCode) k = String.fromCharCode(e.which);
                                else k = String.fromCharCode(e.charCode);

                                if (ch.indexOf(k) != -1) e.preventDefault();
                                if (e.ctrlKey && k == 'v') e.preventDefault();

                            }

                        );

                    $(this).bind('contextmenu', function () { return false; });

                }
            );

    };

    // 점수입력 시 사용 숫자, 소수점만 허용 //
    $.fn.inputScore = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        p = $.extend({ nchars: nm, allow: "." }, p);
        this.attr('maxlength', '6');

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 시간입력 시 사용 숫자, ':' 만 허용 //
    $.fn.inputTime = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        p = $.extend({ nchars: nm, allow: ":" }, p);
        this.attr('maxlength', '5');

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 숫자만 허용 //
    $.fn.inputNumeric = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        p = $.extend({ nchars: nm, allow: "" }, p);

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 이름입력상자에 사용하면 좋음 : 국문, 영문, 숫자만, 대괄호, 중괄호, 언더바(_)만 허용 : 공백 사용불가, Maxlength:30 //
    $.fn.inputName = function (p) {
        var nm = "!@#$%^&*+=\\\';,/|\":<>?~`.-";
        p = $.extend({ nchars: nm, allow: "()[]{}_" }, p);
        this.attr('maxlength', '30');

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 영문이름입력상자에 사용하면 좋음 : 영문, 숫자, 공백 사용가능 //
    $.fn.inputEngName = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "!@#$%^&*+=\\\';,/|\":<>?~`.-";
        p = $.extend({ nchars: nm, allow: " " }, p);

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 아이디입력상자에 사용하면 좋음 : 영문, 숫자만 허용 : 특수문자, 공백 사용불가 //
    $.fn.inputUserId = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "_";
        p = $.extend({ nchars: nm }, p);
        this.attr('maxlength', '30');

        return this.each(function () { $(this).alphanumeric(p); });
    };

    // 비밀번호입력상자에 사용하면 좋음 : 영문, 숫자, 특수문자 허용 : 공백 사용불가 //
    $.fn.inputPassword = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "";
        p = $.extend({ nchars: nm, allow: "!@#$%^&*()+=[]\\\';,/{}|\":<>?~`.-" }, p);
        this.attr('maxlength', '20');

        return this.each(function () { $(this).alphanumeric(p); });
    };

    //숫자만
    $.fn.numeric = function (p) {
        this.css("ime-mode", "disabled");
        var az = "abcdefghijklmnopqrstuvwxyz";
        az += az.toUpperCase();

        p = $.extend({
            nchars: az
        }, p);

        return this.each(function () {
            $(this).alphanumeric(p);
        });

    };

    //영문만
    $.fn.alpha = function (p) {
        this.css("ime-mode", "disabled");
        var nm = "1234567890";

        p = $.extend({
            nchars: nm
        }, p);

        return this.each(function () {
            $(this).alphanumeric(p);
        });
    };
})(jQuery);



/*
 * 날짜 자동 입력
 * */
function setSearchDate(startDate, endDate, addDay) {
    var obj1 = jQuery("#"+startDate);
    var obj2 = jQuery("#"+endDate);

    if (addDay == 0){
        obj1.val("");
        obj2.val("");
    } else if (addDay == 1){
        var startDate = new Date();
        var endDate = new Date();

        obj1.val(formatDate(startDate));
        obj2.val(formatDate(endDate));
    } else {
        var startDate = new Date();
        var endDate = new Date();

        startDate.setDate(startDate.getDate() + addDay);
        endDate.setDate(endDate.getDate());

        obj1.val(formatDate(startDate));
        obj2.val(formatDate(endDate));
    }
}
/*
 * 날짜 자동 입력
 * */
function setSearchDate2(startDate, endDate, addDay) {
    var obj1 = jQuery("#"+startDate);
    var obj2 = jQuery("#"+endDate);

    if (addDay == "clear"){
        obj1.val("");
        obj2.val("");
    } else {
        var startDate = new Date();
        var endDate = new Date();

        startDate.setDate(startDate.getDate() + addDay);
        endDate.setDate(endDate.getDate());

        obj1.val(formatDate(startDate));
        obj2.val(formatDate(endDate));
    }
}
/*
 * 날짜 포맷
 * */
function formatDate(date) {
    var mymonth = date.getMonth() + 1;
    var myweekday = date.getDate();
    return (date.getFullYear() + "-" + ((mymonth < 10) ? "0" : "") + mymonth + "-" + ((myweekday < 10) ? "0" : "") + myweekday);
}

/*
 * 날짜 유효성 검사
 * */
function isDate(dateStr) {
    try {
        dateStr = dateStr.replace(/-/g, "").replace(/\./g, "");

        var year = Number(dateStr.substring(0,4));
        var month = Number(dateStr.substring(4,6));
        var day = Number(dateStr.substring(6,8));

        //console.log("year : " + year);
        //console.log("month : " + dateStr.substring(4,6));
        //console.log("day : " + dateStr.substring(6,8));
        if (month < 1 || month > 12) { // check month range
            //alert("Month must be between 1 and 12.       ");
            return false;
        }
        if (day < 1 || day > 31) {
            //alert("Day must be between 1 and 31.       ");
            return false;
        }
        if ((month==4 || month==6 || month==9 || month==11) && day==31) {
            alert("Month "+month+" doesn't have 31 days!       ");
            return false;
        }
        if (month == 2) { // check for february 29th
            var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
            if (day>29 || (day==29 && !isleap)) {
                //alert("February " + year + " doesn't have " + day + " days!       ");
                return false;
            }
        }
        return true;
    } catch (e) {
        return false;
    }
}


/*
* ClassName : stringUtil
* Description : 문자열 관련 Class
*/
var stringUtil = {
    /* 문자열확인 후 문자열 또는 기본값 리턴
    str:체크 문자열 def:기본값 */
    getString: function(str, def){
        if (str != undefined && str && str != "" && str != "null"){
            return $.trim(str);
        } else {
            return $.trim(def);
        }
    },
    /* 정수형 확인 후 정수형 또는 기본값 리턴
    num:체크 정수형 / def:기본값 */
    getInt: function(num, def){
        var val = parseInt(num, 10);

        if (isNaN(val)){
            return def;
        } else {
            return val;
        }
    },
    /* 공백제거
    str: 공백 제거 할 문자열*/
    trim: function(str){
        return $.trim(str);
    },
    /* Date
    */
    getDateView: function(regdt){

        var yyyy = regdt.substring(0, 4);
        var MM = regdt.substring(4, 6)-1;
        var dd = regdt.substring(6, 8);
        var hh = regdt.substring(8, 10);
        var mm = regdt.substring(10, 12);
        var ss = regdt.substring(12, 14);

        var nowDate = new Date();
        var regDate = new Date(yyyy, MM, dd, hh, mm, ss);

        var ss = Math.floor(nowDate.getTime() - regDate.getTime() ) / 1000;
        var mm = Math.floor(ss / 60);
        var hh = Math.floor(mm / 60);
        var day = Math.floor(hh / 24);

        var diff_hour = Math.floor(hh % 24);
        var diff_minute = Math.floor(mm % 60);
        var diff_second = Math.floor(ss % 60);

        //console.log( regdt + ' 계산 시간   : ' + day +  '일 ' + diff_hour  + ' 시간 ' + diff_minute + ' 분 ' + diff_second  + ' 초 ');
        var returnDate = "";
        if (day > 1 || diff_hour > 1){
            returnDate = regDate.format("yyyy.MM.dd HH:mm");
        } else {
            returnDate = diff_minute + "분 전";
        }

        return returnDate;
    },
    /* Format Date
    */
    formatDate: function(regdt, f){

        var yyyy = regdt.substring(0, 4);
        var yy = regdt.substring(2, 4);
        var MM = regdt.substring(4, 6);
        var dd = regdt.substring(6, 8);
        var hh = regdt.substring(8, 10);
        var mm = regdt.substring(10, 12);
        var ss = regdt.substring(12, 14);

        return f.replace(/(yyyy|yy|MM|dd|hh|mm|ss)/gi, function($1) {
            switch ($1) {
                case "yyyy": return yyyy;
                case "yy": return yy.zf(2);
                case "MM": return MM.zf(2);
                case "dd": return dd.zf(2);
                case "hh": return hh.zf(2);
                case "mm": return mm.zf(2);
                case "ss": return ss.zf(2);
                default: return $1;
            }
        });
    },
    /* set Comma */
    setComma: function(num){
        var pattern = /(^[+-]?\d+)(\d{3})/;
        num += '';
        while (pattern.test(num)){
            num = num.replace(pattern, '$1' + ',' + '$2');
        }
        return num;
    },
    /* remove Comma */
    removeComma: function(num){
        return num.replace(/,/gi,"");
    }

};



/*
 * 메뉴 Link
 * */
function goMenuLink(menuCd, link){

    //var links = link.split('?');
    //var link = links[0];

    $("#selMenuCd").val(menuCd);
    $("#frmMainLayout").attr("action", stringUtil.getString(link, "#none")).submit();
}

/*
 * 현재 메뉴 코드 조회
 * */
function getSelectMenuCode(){
    return $("#selMenuCd").val();
}

/*
 * 전송시 공통 처리
 * */
function setSubmit(obj){
    var selectMenuCode = getSelectMenuCode();
    if (selectMenuCode == undefined || selectMenuCode == "undefined"){
        selectMenuCode = "001000000";
    }

    obj.find("input[name='selMenuCd']").remove();
    obj.append("<input type='hidden' id='selMenuCd' name='selMenuCd' value='"+selectMenuCode+"' />");
    return false;
}

/*
 * 체크박수 체크 갯수 조회
 * */

function getCheckedCnt(objName){
    var resultCnt = 0;
    $("input[name='"+objName+"']:checked").each(function(){
        resultCnt++;
    });
    return resultCnt;
}

/*
    첨부파일 다운로드
*/
function goDownload(ATTACH_FILE_CD){
    var obj = $("body");
    $("#ifrmDownload").remove();
    $("#DOWNLOAD_CD").val(ATTACH_FILE_CD);
    obj.append("<iframe id='ifrmDownload' name='ifrmDownload' src='about:blank' border='0' style='width: 0px; height: 0px;'></ifrmae> ");
    $("#frmDownload").attr({"target" : "ifrmDownload", "action": "/download/download.do"}).submit();
}

/**
 * 저장 처리
 * @param String id
 * @param String msg
 * @param String link
 * @param Function handle
 */
function commonProc(id, msg, link, target, handle) {
	target = target || '_self';
	handle =  handle || function() {return true;};
	if(!handle.call(this)) {
		return;
	}
	if (stringUtil.getString($("#procFlag").val()) == "Y"){
        $("#procFlag").val("N");
        if(confirm(msg)){
            blockUI();
            $('#'+id).attr({'action': link, 'method':'post', 'target': target}).submit();
        }else {
        	$("#procFlag").val("Y");
        }
    } else {
        alert("처리중입니다.");
        return;
    }
}

/*
 * byte 체크
 */
function getByte(str) {
    var resultSize = 0;
    if (str == null) {
        return 0;
    }

    for (var i = 0; i < str.length; i++) {
        var c = escape(str.charAt(i));
        if (c.length == 1) {
            resultSize++;
        }
        else if (c.indexOf("%u") != -1) {
            resultSize += 2;
        }
        else {
            resultSize++;
        }
    }

    return resultSize;
}


/*
 * textarea 글자 제한
 */
function txtareaByte(obj, tgt, size) {
     var str = obj.value;
     var str_len = str.length;
     var str_max = size;
     var str_byte = 0;
     var len_num = 0;
     var str2 = "";
     for(i=0; i< str_len; i++) {
          str_byte++;
          if (str_byte <= str_max) len_num = i + 1;
     }
     if(str_byte > str_max) {
          alert(size + "Byte 초과 입력할수 없습니다.\n초과된 내용은 자동으로 삭제 됩니다.");
          str2 = str.substr(0, len_num);
          obj.value = str2;
     }
     obj.focus();
}

/*
 * 콤마 만들기
 * */
function setComma(x){
     x = x.toString();
        var pattern = /(^[+-]?\d+)(\d{3})/;
        x += '';
        while (pattern.test(x)){
            x = x.replace(pattern, '$1' + ',' + '$2');
        }
        return x;
}

/*
 * 콤마 제거
 * */
function removeComma(val) {
    //console.log("val " + val)
    if (val == "" || val == undefined){
        val ="";
    }

    self.focus();
    return val.split(",").join("");

    //return val.replace(/,/gi,"");
}

/*
 * 공백체크
 * */
function isNullChk(obj, msg){
    var returnFlag = true;
    var val = jQuery.trim(jQuery("#"+obj).val());
    if (val == ""){
        alert(msg);
        jQuery("#"+obj).focus();
        returnFlag = false;
    }
    return returnFlag;
}
/*
 * 공백체크(non msg)
 * */
function isNullChkNonMsg(obj){
    var returnFlag = true;
    var val = jQuery.trim(jQuery("#"+obj).val());
    if (val == ""){
        jQuery("#"+obj).focus();
        returnFlag = false;
    }
    return returnFlag;
}
/*
 * 숫자체크
 * */
function isNumber(nVal){
    var regex = /^[0-9]+$/;
    return regex.test(nVal);
}


/*
 * Email 정규식 체크
 * */
function chkRegEmail(str){
      var Seiki1=/[!#-9A-~]+@+[a-z0-9]+.+[^.]$/i;
      var Seiki2=/^\w+(-?\w+)*@\w+(-?\w+)*(\.\w{2}){1}(\.\w{2}){1}$/;

    if(str!=""){
        if(str.match(Seiki1) || str.match(Seiki2)){
            return true;
        }else{
            return false;
        }
    }
}
function div_OnOff(v, id){
    // 라디오 버튼 value 값 조건 비교
    if(v == "Y"){
        document.getElementById(id).style.display = ""; // 보여줌
    }else{
        document.getElementById(id).style.display = "none"; // 숨김
    }
}


/*
 * Lnb Css On
 * */
function setNavActive(hObj, lObj, subLObj){
    $("#"+hObj + "").addClass("active");
    $("#"+lObj + "").addClass("active");
    if (subLObj != ""){
        $("#"+subLObj).addClass("active");
    }

}


/*
 * 파일 업로드 팝업
 * */
function popFileUpload(frmObj, fileIdx){

    jQuery("#fileIdx").val(fileIdx);
    openBW("about:blank", "fileUpload", 400, 300, "N", "N");
    jQuery("#"+frmObj).attr({target:"fileUpload", action:"/common/pop_upload_form.asp"}).submit();
}
/*
 * 파일 업로드 제거
 * */
function removeFile(fileIdx){
    jQuery("#fileInfo"+fileIdx).html("").hide();
}


/*
 * 파일 업로드 다운로드
 * */
function downloadFile(CMN_ATT_IDX){
    jQuery("#downloadFrm").remove();
    jQuery("body").append("<iframe id=\"downloadFrm\"  name=\"downloadFrm\" scr=\"about:blank\" width=\"0\" height=\"0\"></iframe>");
    document.downloadFrm.location.href="/download.asp?CMN_ATT_IDX="+CMN_ATT_IDX
}


var win= null;
function openBW(theURL,winName,w,h,x,y,scroll,resize){

    if (x == ""){
        var winl = (screen.width-w)/2;
    } else {
        var winl = x;
    }

    if (y == ""){
        var wint = (screen.height-h)/2;
    } else {
        var wint =y;
    }


  var setting  ='height='+h+',';
      setting +='width='+w+',';
      setting +='top='+wint+',';
      setting +='left='+winl+',';
      setting +='scrollbars='+scroll+',';
      setting +='resizable='+resize+'';
  win=window.open(theURL,winName,setting);
  if(parseInt(navigator.appVersion) >= 4){win.window.focus();}
}