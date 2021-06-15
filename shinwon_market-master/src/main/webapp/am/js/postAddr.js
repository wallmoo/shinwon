
function jusoPopUp(){   
    var obj = $("#searchPostBtn").offset(); //검색버튼 위치
    //레이어 팝업
    $(".pop-address-search-layer3").css({
           "position" : "absolute",
           "top" : (obj.top+320)+"px",
           "left" : (obj.left+290) + "px"
        });
    $("#popAddrSearch").css("display", "block");
}

function getAddrLoc(){ 
    $.ajax({
         url :"/am/common/getPostAddrApi.do"  //controller url
        ,type:"post"
        ,data:$("#formAPIDiv").serialize()
        ,dataType:"xml"
        ,success:function(xmlStr){
            $("#listDiv").html("");
            var errCode = $(xmlStr).find("errorCode").text();
            var errDesc = $(xmlStr).find("errorMessage").text();
            document.formAPIDiv.countPageTot.value = $(xmlStr).find("totalCount").text();
            if(errCode != "0"){
                alert(errCode+"="+errDesc);
            }else{
                if(xmlStr != null){
                    makeListDiv(xmlStr); 
                    pageDivMake(xmlStr); 
                }
            }
        }
        ,error: function(xhr,status, error){
            alert("에러발생");
        }
    });
}

//페이지 이동
function goPageDiv(pageNum){
    document.formAPIDiv.currentPage.value=pageNum;
    getAddrLoc();
}

 // 페이징 처리
function pageDivMake(xmlStr){
    var total = $(xmlStr).find("totalCount").text();
    $('#totalCntDiv').text("(총 "+total+"건)");    // 총건수 셋팅
    var pageNum = document.formAPIDiv.currentPage.value;
    var paggingStr = "";
    if(total < 1){
    }else{
        var PAGEBLOCK=5;
        var pageSize=document.formAPIDiv.countPerPage.value;;
        var totalPages = Math.floor((total-1)/pageSize) + 1;
        var firstPage = Math.floor((pageNum-1)/PAGEBLOCK) * PAGEBLOCK + 1;
        
        if( firstPage <= 0 ) firstPage = 1;
        
        var lastPage = firstPage-1 + PAGEBLOCK;
        if( lastPage > totalPages ) lastPage = totalPages;
        
        var nextPage = lastPage+1 ;
        var prePage = firstPage-5 ;
        if( firstPage > PAGEBLOCK ){
            paggingStr +=  "<a href='javascript:goPageDiv("+prePage+");'>◁</a>&nbsp;&nbsp;" ;
        }
        
        for(var i=firstPage; i<=lastPage; i++ ){
            if( pageNum == i )
                paggingStr += "<a style='font-weight:bold;color:black;font-size:15px;' href='javascript:goPageDiv("+i+");'>" + i + "</a>&nbsp;&nbsp;";
            else
                paggingStr += "<a href='javascript:goPageDiv("+i+");'>" + i + "</a>&nbsp;&nbsp;";
        }
        
        if( lastPage < totalPages ){
            paggingStr +=  "<a href='javascript:goPageDiv("+nextPage+");'>▷</a>";
        }
        
        $("#pageApiDiv").html(paggingStr);
    }   
}

function makeListDiv(xmlStr){   
    var htmlStr = "";
    if($(xmlStr).find("juso").length > 0) {
        $(xmlStr).find("juso").each(function(){
            var roadAddr = $(this).find('roadAddr').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            var roadAddrPart1 = $(this).find('roadAddrPart1').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            var roadAddrPart2 = $(this).find('roadAddrPart2').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            var engAddr = $(this).find('engAddr').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            var jibunAddr = $(this).find('jibunAddr').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            var zipNo = $(this).find('zipNo').text().replace(/ /gi,"&nbsp;");
            var admCd = $(this).find('admCd').text().replace(/ /gi,"&nbsp;");
            var rnMgtSn = $(this).find('rnMgtSn').text().replace(/ /gi,"&nbsp;");
            var bdMgtSn = $(this).find('bdMgtSn').text().replace(/ /gi,"&nbsp;");
            var detBdNmList = $(this).find('detBdNmList').text().replace(/ /gi,"&nbsp;").replace('&nbsp;&nbsp;', '&nbsp;');
            
            htmlStr += "<tr style='cursor:pointer;' onclick =openApiDivCallBack('"+roadAddr+"','"+roadAddrPart1+"','"+roadAddrPart2+"','"
                                                    +engAddr+"','"+jibunAddr+"','"+zipNo+"','"+admCd+"','"+rnMgtSn+"','"+bdMgtSn+"','"+detBdNmList+"');>";
            htmlStr += "<td class='subj' style='text-align:center;'>"+zipNo     +"</td>";
            htmlStr += "<td class='subj' style='text-align:center;'> "+roadAddr     +" </td>";
            htmlStr += "</tr>";

        });         
    }else {
        htmlStr += "<tr>";
        htmlStr += "<td align='center' colspan='2'>검색결과가 없습니다.</td>";
        htmlStr += "</tr>";         
    }       
    $("#listDiv").html(htmlStr);    
}

//도로명 검색 버튼 클릭
function searchDivButton() {         
    document.formAPIDiv.currentPage.value='1';
    if(!checkKeyWord(document.formAPIDiv.keyword,"검색어")) return ;
    getAddrLoc();
}   

//도로명 검색 엔터키 검색 
function enterSearchDiv() {
    var evt_code = (window.netscape) ? ev.which : event.keyCode;
    if (evt_code == 13) {    
        if(!checkKeyWord(document.formAPIDiv.keyword,"검색어")) return ;
        document.formAPIDiv.currentPage.value='1';
        getAddrLoc(); 
    } 
}

//검색어 빈 값 체크
function checkKeyWord(form_nm,ele_nm) { 
  if (form_nm.value.trim()=="") {
      alert(ele_nm+'을(를) 입력해주세요!     ');
      form_nm.value="";           
      form_nm.focus();
      return false;
  }
  return true ;
}
//검색어 특수문자제거
function validateJuso(value){
  value =value.toUpperCase().replace(/OR/gi, ""); // OR
  value =value.toUpperCase().replace(/AND/gi, ""); // AND
  value =value.replace(/--/gi, "");
  value =value.replace(/(^\s*)|(\s*$)/g, ""); //앞뒤 공백 제거
  return value.split(/[~!$%^&*+=|:;?'><]/).join("");  //특수문자제거 # @ 제외
}

