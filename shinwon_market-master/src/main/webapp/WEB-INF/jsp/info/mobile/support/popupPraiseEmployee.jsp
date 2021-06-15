<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/info/mobile/include/head.jsp" %>
</head>
<body class="page-info">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
 <!-- #wrap S -->
	<!-- #header S -->
<%-- <%@ include file="/WEB-INF/jsp/info/mobile/include/top.jsp" %> --%>
 
		<!-- #container S -->
	<article id="container" class="container" data-role="content">
		
		<!-- .section-title S -->
		<div class="section-title _hd_fix">
            <h2>방문지점/직원검색</h2>
        </div>
		<!--// .section-title E -->

        <div class="staff-search"><!-- staff-search -->
            <div class="module">
                <p>
                    <label for="BU_NAME">방문지점</label>
                    <input type="text" id="BU_NAME"  class="text" />
                </p>
                <p class="mt10">
                    <label for="KS_NAME">직원명</label>
                    <input type="text" id="KS_NAME" class="text" />
                    <a href="javascript:goPage(1);" class="button primary small"><span>검색</span></a>
                </p>
            </div>
        </div><!-- // staff-search -->

        <div class="padder">
            <ul class="list list-a mt10 info">
                <li>방문지점명 또는 직원명으로 검색해주세요.</li>
                <li>방문하신 매장에 찾으시는 직원이 없으시면,직원명으로 검색해 주세요</li>
            </ul>
        </div>

        <div class="staff-result"><!-- staff-result -->
            <h3 id="resultCount" class="padder"></h3>
			<div id="noData">
	            
			</div>
            <div class="list">
                <ul id="mainList" class="ui-grid-a _scroll_list_ck">
                </ul>
            </div>

            <div class="padder">
                <p class="mt30">
                    <strong>그래도 검색결과에 찾으시는 직원이 없으신가요?</strong>
                </p>

                <p>
                    <input type="radio" name="staff" id="staffNo" class="radio" value="noStaff^noStaff^noStaff^noStaff">
                    <label for="staffNo">네, 찾는 직원이 없습니다.</label>
                </p>
            </div>
        </div><!-- // staff-result -->

        <div class="section-button"><!-- section-button -->
            <a href="javascript:empApply();" class="button warning"><span>선택</span></a>
            <a href="javascript:goClose();" class="button warning"><span>닫기</span></a>
        </div><!-- // section-button -->
        <input type="hidden" name="totalCount" id="totalCount" value="<c:out value="${totalCount}" />"/>
	</article>

<%@ include file="/WEB-INF/jsp/info/mobile/include/footer.jsp" %>
<form name="frm" id="frm">

	<input type="hidden" id="EMP_THK_CST_NM" name="EMP_THK_CST_NM" value="<c:out value="${commandMap.EMP_THK_CST_NM}" />"/>
	<input type="hidden" id="EMP_THK_HP1" name="EMP_THK_HP1" value="<c:out value="${commandMap.EMP_THK_HP1}" />"/>
	<input type="hidden" id="EMP_THK_HP2" name="EMP_THK_HP2" value="<c:out value="${commandMap.EMP_THK_HP2}" />"/>
	<input type="hidden" id="EMP_THK_HP3" name="EMP_THK_HP3" value="<c:out value="${commandMap.EMP_THK_HP3}" />"/>
	<input type="hidden" id="EMP_THK_TEL1" name="EMP_THK_TEL1" value="<c:out value="${commandMap.EMP_THK_TEL1}" />"/>
	<input type="hidden" id="EMP_THK_TEL2" name="EMP_THK_TEL2" value="<c:out value="${commandMap.EMP_THK_TEL2}" />"/>
	<input type="hidden" id="EMP_THK_TEL3" name="EMP_THK_TEL3" value="<c:out value="${commandMap.EMP_THK_TEL3}" />"/>
	<input type="hidden" id="MAIL1" name="MAIL1" value="<c:out value="${commandMap.MAIL1}" />"/>
	<input type="hidden" id="MAIL2" name="MAIL2" value="<c:out value="${commandMap.MAIL2}" />"/>
	<input type="hidden" id="MAIL_SEL" name="MAIL_SEL" value="<c:out value="${commandMap.MAIL_SEL}" />"/>
	<input type="hidden" id="BU_CODE_S" name="BU_CODE_S" value=""/>
	<input type="hidden" id="BU_NAME_S" name="BU_NAME_S" value=""/>
	<input type="hidden" id="KS_SABUN_S" name="KS_SABUN_S" value=""/>
	<input type="hidden" id="KS_NAME_S" name="KS_NAME_S" value=""/>
	<input type="hidden" id="EMP_THK_VST_DT_YY" name="EMP_THK_VST_DT_YY" value="<c:out value="${commandMap.EMP_THK_VST_DT_YY}" />"/>
	<input type="hidden" id="EMP_THK_VST_DT_MM" name="EMP_THK_VST_DT_MM" value="<c:out value="${commandMap.EMP_THK_VST_DT_MM}" />"/>
	<input type="hidden" id="EMP_THK_VST_DT_DD" name="EMP_THK_VST_DT_DD" value="<c:out value="${commandMap.EMP_THK_VST_DT_DD}" />"/>
	
	<input type="hidden" id="EMP_THK_CTR_NM" name="EMP_THK_CTR_NM" value="<c:out value="${commandMap.EMP_THK_CTR_NM}" />"/>
	<input type="hidden" id="EMP_THK_DRV_NM" name="EMP_THK_DRV_NM" value="<c:out value="${commandMap.EMP_THK_DRV_NM}" />"/>
	<input type="hidden" id="EMP_THK_CTR_CD" name="EMP_THK_CTR_CD" value="<c:out value="${commandMap.EMP_THK_CTR_CD}" />"/>
	<input type="hidden" id="EMP_THK_DRV_SBN" name="EMP_THK_DRV_SBN" value="<c:out value="${commandMap.EMP_THK_DRV_SBN}" />"/>
	<input type="hidden" id="EMP_THK_TITLE" name="EMP_THK_TITLE" value="<c:out value="${commandMap.EMP_THK_TITLE}" />"/>
	<input type="hidden" id="EMP_THK_CONTENTS" name="EMP_THK_CONTENTS" value="<c:out value="${commandMap.EMP_THK_CONTENTS}" />"/>
	<input type="hidden" id="areement" name="areement" value="<c:out value="${commandMap.areement}" />"/>
	
</form>
<script>

$.com.win_scrollList = true;//스크롤 할거야~
function _return_scrollList(_idx, _reNum){
	
	/*
		_idx = 리스트감싸고있는 객체
		_reNum = 리턴 몇번째넘어왔는지
		*/
	//console.log("_reNum : "+_reNum);
	var page = _reNum + 2;
	var totalCount = $("#totalCount").val();
	
	//console.log("_reNum "+_reNum );

	var BU_NAME =  $("#BU_NAME").val();
	var KS_NAME =  $("#KS_NAME").val();
	
	if(parseInt(totalCount) >= (parseInt(page)-1) * 10)
	{	
		$.ajax({
			type		: "POST",
			url			: "/info/mobile/support/erpEmpListAjax.do",
			dataType	: "json",
			data		: {	"BU_NAME": BU_NAME
							,"KS_NAME": KS_NAME
							,"cPage": page
							},
			success : function(data) {
				var innerHtml	= '';
				 
				var cnt = 0;
				
				if(data.totalPageCount == 0){
					innerHtml = "";
				}else{
					
					var listNum		= data.listNum;
					var totalCount  = data.totalCount;
				 	 
					$.each(data.resultMap.list, function(i,item){
						cnt++;
	 
						innerHtml += '<li class="ui-block-';
						if(cnt % 2 == 1)innerHtml += 'a';
						else innerHtml += 'b';
						innerHtml += '"><span class="shop">'+item.BU_NAME+'</span>';
						innerHtml += '<label for="staff'+cnt+'" class="js-radio">';
						innerHtml += '<input type="radio" name="staff" id="staff'+cnt+'" class="radio" value="'+item.BU_CODE+'^'+item.BU_NAME +'^'+item.KS_SABUN+'^'+item.KS_NAME+'"/>'+item.KS_NAME;
						innerHtml += '</label></li>';
						
	 
					});
					   	
					_idx.append(innerHtml);
					 	
					//$('.js-radio').on('click', $.handlerRadio);
					 	
					var all_img=document.getElementsByTagName("IMG")
					if(all_img.length > 0)
					{
					 	for(var i=0;i<all_img.length;i++)
					 	{
					  		all_img[i].onerror=imgError;
					 	}
					}
					  
				}
				//$("#reqCnt").text(data.totalRecordCount);
				
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}else
	{
		$.com.win_scrollList = false;//스크롤 할거야~
	}
	
		
}

 
goPage		= function(page){
//	alert("goReqPage");
	var BU_NAME =  $("#BU_NAME").val();
	var KS_NAME =  $("#KS_NAME").val();
	
	if(BU_NAME ==""&&KS_NAME =="") 
	{
		alert("방문지점 또는 직원명을 입력해 주십시오.");
		$("#BU_NAME").focus();
		return;
	}
	
	$.ajax({
		type		: "POST",
		url			: "/info/mobile/support/erpEmpListAjax.do",
		dataType	: "json",
		data		: {	"BU_NAME": BU_NAME
						,"KS_NAME": KS_NAME
						,"cPage": page
						},
		success : function(data) {
			var innerHtml	= '';
		 
			var cnt = 0;
			$("#totalCount").val(data.totalCount);
			
			if(data.totalPageCount == 0){
				innerHtml = "";
			}else{
				
				var listNum		= data.listNum;
				var totalCount  = data.totalCount;
				
				$("#resultCount").html("검색 결과 ("+totalCount+")");
				
				if(totalCount==0)
				{	
					 
					innerHtml += '<p class="text-center no-more">';
					innerHtml += '검색결과가 없습니다.</p>';
					
					$("#noData").html(innerHtml);
					$("#mainList").html("")
					//$("#pg_nav").html("");
				}
				else{
					$.each(data.resultMap.list, function(i,item){
						cnt++;
 
						innerHtml += '<li class="ui-block-';
						if(cnt % 2 == 1)innerHtml += 'a';
						else innerHtml += 'b';
						innerHtml += '"><span class="shop">'+item.BU_NAME+'</span>';
						innerHtml += '<label for="staff'+cnt+'" class="js-radio">';
						innerHtml += '<input type="radio" name="staff" id="staff'+cnt+'" class="radio" value="'+item.BU_CODE+'^'+item.BU_NAME +'^'+item.KS_SABUN+'^'+item.KS_NAME+'"/>'+item.KS_NAME;
						innerHtml += '</label></li>';
						
 
					});
				   	
				  	$("#mainList").html(innerHtml).data('returnNum',0);
				 	$.com.win_scrollList = true;
				 	
				 	//$('.js-radio').on('click', $.handlerRadio);
				 	
				 	var all_img=document.getElementsByTagName("IMG")
				 	if(all_img.length > 0)
				 	{
				 	 	for(var i=0;i<all_img.length;i++)
				 	 	{
				 	  		all_img[i].onerror=imgError;
				 	 	}
				 	}
					
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
	$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/support/supportNoticeView.do", "target":"_self", "method":"post"}).submit();
	
};

function imgError()
{
	event.srcElement.src = "<c:out value="${cdnDomain}" />/mobile/img/custom/cheer_staff.png";
}


//선택 클릭 이벤트
function empApply2(){
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
		
		var $frm = $("#frm");
		var BU_CODE 				= myArray[0];	
		var BU_NAME 			= myArray[1];		
		var KS_SABUN 			= myArray[2];	
		var KS_NAME 				= myArray[3];
		
		$("#BU_CODE_S").val(BU_CODE);
		$("#BU_NAME_S").val(BU_NAME);
		$("#KS_SABUN_S").val(KS_SABUN);
		$("#KS_NAME_S").val(KS_NAME);
		
		$frm.attr({"action":"<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportPraise.do", "target":"_self", "method":"post"}).submit();

	});
};

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
function goClose(){
	self.close();
}

//goPage(1);
</script>

</body>
</html>