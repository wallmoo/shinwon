<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! 
public String getCheckReqXSSTop(javax.servlet.http.HttpServletRequest req, String parameter, String default_value) {
    String req_value = (req.getParameter(parameter) == null ||  req.getParameter(parameter).equals("")) ? default_value : req.getParameter(parameter);
    req_value = req_value.replaceAll("</?[a-zA-Z][0-9a-zA-Zê°-\uD7A3ã±-ã=/\"\'%;:,._()\\-# ]+>","");
    req_value = req_value.replaceAll(">","");
    req_value = req_value.replaceAll(">","");
    return req_value;
}
%><%
String shop = getCheckReqXSSTop(request, "shop", "");	//검색어
String staff = getCheckReqXSSTop(request, "staff", "");	//검색어
%>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="title" content="마켓플랜트 ">
<title>방문지점/직원 검색 &lt; MarketPlant</title>
<link rel="stylesheet" type="text/css" href="<c:out value="${cdnDomain}" />/pc/css/style.css">
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/jquery-1.9.1.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="../nas/cdn/pc/js/html5.js"></script>
<![endif]-->
<!--[if lt IE 8]>
<script type="text/javascript" src="../nas/cdn/pc/js/IE8.js"></script>
<![endif]-->
<!--[if lt IE 7]>
<script type="text/javascript" src="../nas/cdn/pc/js/IE7.js"></script>
<![endif]-->
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/com.js"></script><!-- 공통 js -->

<%--<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/beta.fix.js"></script>--%>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/ark_place.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/js/ark_employee.js"></script>
<script type="text/javascript" src="<c:out value="${cdnDomain}" />/pc/js/search/js/search.js"></script>
<link rel="stylesheet" type="text/css" href="<c:out value="${cdnDomain}" />/pc/js/search/admin_ark/css/ark.css" media="screen" >
</head>
<body class="page-popup">
<div id="popContainer"><!-- popContainer -->
	<div class="cheer-search-hd">
    	<h1 class="title">방문지점/직원 검색</h1>
		
		
		<div class="search-form"><!-- staff-search -->
            <p>
                <label for="shop">방문지점</label>
                <input type="text" id="shop" name="shop" class="text" value="<%=shop%>" placeholder="지점명을 입력해주세요" />
            </p>
            <div id="shopSearchList" class="search-list-wrap">
            	<ul id="ark_content_list_shop">
            	</ul>
            </div>
            <p class="mt10">
                <label for="staff">직원명</label>
                <input type="text" id="staff" name="staff" class="text" value="<%=staff%>" placeholder="직원명을 입력해주세요" />
            </p>
            <div id="staffSearchList" class="search-list-wrap">
            	<ul id="ark_content_list_staff">
            	</ul>
            </div>
            <a href="javascript:goPage(1);" class="btn_st1 btn_rd large"><span>검색</span></a>
        </div><!-- // staff-search -->

        <ul class="list list-a mt20">
            <li>방문지점명 또는 직원명으로 검색해주세요.</li>
            <li>방문하신 매장에 찾으시는 직원이 없으시면,직원명으로 검색해 주세요</li>
        </ul>
	</div>
	<div id="popWrapper" class="cheer-search"><!-- popWrapper -->
        <h2 id="resultCount" class="title"></h2>

        <table class="table-a table-col"><!-- table-a -->
        <caption>번호, 주소, 우편번호로 구성된 우편번호 건물명 검색 결과 목록입니다.</caption>
        <colgroup>
            <col style="width: 25%;" span="4" />
        </colgroup>
        <tbody id="mainList">
             
        </tbody>
        </table><!-- // table-a -->
		<div class="section-pagination" id="pg_nav">
			<ui:frontpaging paging="${paging }" jsFunction="goPage" />
		</div>
      
        <p class="mt20">
            <span class="large14 primary">그래도 검색결과에 찾으시는 직원이 없으신가요?</span>
        </p>

        <p class="mt10">
            <label for="staffNo" class="js-radio">
                <input type="radio" name="staff" id="staffNo" value="noStaff^noStaff^noStaff^noStaff"/>
                네, 찾는 직원이 없습니다.
            </label>
        </p>

        <div class="section-button"><!-- section-button -->
            <a href="javascript:empApply();" class="btn_st1 btn_blk777 large"><span>선택</span></a>
        </div><!-- // section-button -->

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->
<form name="frm" id="frm">
	<input type="hidden" id="DRT_NTS_IDX" name="DRT_NTS_IDX" value=""/>
	<input type="hidden" id="searchDrtCmnComIdx" name="searchDrtCmnComIdx" value=""/>
</form>
<script>


 
goPage		= function(page){
//	alert("goReqPage");
	var BU_NAME =  $("#shop").val();
	var KS_NAME =  $("#staff").val();
	$.ajax({
		type		: "POST",
		url			: "/info/support/erpEmpListAjax.do",
		dataType	: "json",
		data		: {	"BU_NAME": BU_NAME
						,"KS_NAME": KS_NAME
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
			var innerHtml1	= '';
			var innerHtml2	= '';
			var innerHtml3	= '';
			var innerHtml4	= '';
			var cnt = 0;
			
			if(data.totalPageCount == 0){
				innerHtml = "";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				
				$("#resultCount").html("검색 결과 ("+totalCount+")");
				
				if(totalCount==0)
				{	
					innerHtml += '<tr><td colspan="4">';
					innerHtml += '<p class="message no-more">';
					innerHtml += '검색결과가 없습니다.';
					innerHtml += '</p></td></tr>';
					
					$("#mainList").html(innerHtml);
					$("#pg_nav").html("");
				}
				else{
					$.each(data.resultMap.list, function(i,item){
						cnt++;
						
						if(cnt < 5)
						{
							if(cnt==1)
							{
								innerHtml1 += '<tr>';
								innerHtml2 += '<tr>';
						
							}
							innerHtml1 += '<th scope="col">';
							innerHtml1 += item.BU_NAME;
							innerHtml1 += '</th>';
							innerHtml2 += '<td>';
							innerHtml2 += '<label for="staff'+cnt+'" class="js-radio"><input type="radio" name="staff" id="staff'+cnt+'" value="'+item.BU_CODE+'^'+item.BU_NAME +'^'+item.KS_SABUN+'^'+item.KS_NAME+'"/>'+item.KS_NAME+'</label></td>';
						}
						if(cnt > 4)
						{
							if(cnt==5)
							{
								innerHtml3 += '<tr>';
								innerHtml4 += '<tr>';
						
							}
							innerHtml3 += '<th scope="col">';
							innerHtml3 += item.BU_NAME;
							innerHtml3 += '</th>';
							innerHtml4 += '<td>';
							innerHtml4 += '<label for="staff'+cnt+'" class="js-radio"><input type="radio" name="staff" id="staff'+cnt+'" value="'+item.BU_CODE+'^'+item.BU_NAME +'^'+item.KS_SABUN+'^'+item.KS_NAME+'"/>'+item.KS_NAME+'</label></td>';
						}
					});
					innerHtml1 += '</tr>';
					innerHtml2 += '</tr>';
					innerHtml = innerHtml1 + innerHtml2;
					if(innerHtml3 != "")
					{
						innerHtml3 += '</tr>';
						innerHtml4 += '</tr>';
						innerHtml = innerHtml + innerHtml3 + innerHtml4;	
					}
					//console.log(innerHtml);
				 	$("#mainList").html(innerHtml);
				 	
				 	$('.js-radio').on('click', $.handlerRadio);
				 	
				 	var all_img=document.getElementsByTagName("IMG")
				 	if(all_img.length > 0)
				 	{
				 	 	for(var i=0;i<all_img.length;i++)
				 	 	{
				 	  		all_img[i].onerror=imgError;
				 	 	}
				 	}
					
					var firstPageNo 				= data.firstPageNo;
		            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
		            var totalPageCount 				= data.totalPageCount;
		            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
		            var cPage 						= data.cPage;
		            var lastPageNo 					= data.lastPageNo;
		            var pageSize 					= data.pageSize;
		            var pagingSize 					= data.pagingSize;
		            
		            innerHtml 	= "";
		            
		            if(totalPageCount > pagingSize){
		            	if(firstPageNoOnPageList > pagingSize){  
		            		innerHtml += '<a class="nav first" href="javascript:goPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:goPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
		            	}else{
		            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
		            	}
		            }else{
		            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
	            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
		            }
		            
		            
		            if (lastPageNoOnPageList > totalPageCount){
		                lastPageNoOnPageList = totalPageCount;
		            }
	            	
	            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
	            		
		                if(i==cPage){
		                	innerHtml +='<a href="javascript:void(0)" class="num active" style="margin-left:3px;">' + i + '</a>';
		                }else{
		                	innerHtml +='<a href="javascript:goPage(' + i + ')" class="num" style="margin-left:3px;">' + i + '</a>';
		                }
		            }
		            	
	            	if(totalPageCount > pagingSize){
		                if(lastPageNoOnPageList < totalPageCount){
		                	innerHtml +='<a class="nav next" href="javascript:goPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
		                	innerHtml +='<a class="nav last" href="javascript:goPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
		                }else {
		                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
		                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
		                }
		            } else {
		            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
	                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
		            }
		            	
		            $("#pg_nav").html(innerHtml);
		            
				}
			}
			//$("#reqCnt").text(data.totalRecordCount);
			
		}, error : function(err) {
			window.jquery
				|| console.log('오류가 발생하였습니다: ' + err.status);
		}
	});
}; // goPage end

function goView(DRT_NTS_IDX){
	var $frm = $("#frm");
	$("#DRT_NTS_IDX").val(DRT_NTS_IDX);
	$frm.attr({"action":"<c:out value="${brandDomain}" />/info/support/supportNoticeView.do", "target":"_self", "method":"post"}).submit();
	
};

function imgError()
{
	event.srcElement.src = "<c:out value="${cdnDomain}" />/pc/img/info/cheer_thumb_img.png";
}


//선택 클릭 이벤트
function empApply(){
	var $checkObj = $.find("input[name='staff']:checked");
	if( $checkObj.length == 0 ){
		alert("직원을 선택하여 주십시오.");
		return;
	}
	
	  	
	var params = new Array();
	var obj;
	var myArray;
	$.each($checkObj, function(index,item){
		myArray = $(this).val().split('^');
	 
		obj = new Object();
		obj.BU_CODE 				= myArray[0];	
		obj.BU_NAME 			= myArray[1];		
		obj.KS_SABUN 			= myArray[2];	
		obj.KS_NAME 				= myArray[3];
// 		alert("obj.BU_CODE :  "+obj.BU_CODE);
// 		alert("obj.BU_NAME :  "+obj.BU_NAME);
// 		alert("obj.KS_SABUN :  "+obj.KS_SABUN);
// 		alert("obj.KS_NAME :  "+obj.KS_NAME);
		params.push(obj); //만들어진  object를 배열에 추가
	});
	
	window.opener.fnResultEmp(params);
	self.close();
};


goPage(1);
</script>

</body>
</html>