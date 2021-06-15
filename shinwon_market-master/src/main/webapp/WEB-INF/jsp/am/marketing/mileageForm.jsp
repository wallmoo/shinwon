<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
</head>
<body class="basic">

	<div id="skipNavigation">
		<!-- skipNavigation -->
		<a href="#contents" class="sr-only">본문으로 바로가기</a>
	</div>
	<!-- // skipNavigation -->

	<header>
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</header>
	<!-- // header -->

	<div id="container" class="st-container">
		<!-- container -->
		<form id="frmMainLayout" name="frmMainLayout" method="post">
			<input type="hidden" id="selectMenuCode" name="selectMenuCode"
				value="<c:out value="${selectMenuCode }" />" />
		</form>

		<aside id="navigation">
			<!-- navigation -->
			<nav>
				<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
			</nav>
		</aside>
		<!-- // navigation -->

		<div id="body">
			<!-- body -->

			<section id="contents">
				<!-- contents -->

				<div id="breadcrumb">
					<!-- breadcrumb -->
					<a href="#none"><i class="icon-home em"></i> HOME</a> &gt; <a
						href="#none">마케팅관리</a> &gt; <span>포인트 적립/차감</span>
				</div>
				<!-- // breadcrumb -->

				<div class="contents-inner">
					<!-- contents-inner -->

					<h3 class="title">포인트 적립/차감</h3>

                    <div class="title-box">
	                    <h4 class="title">회원선택</h4>
	                </div>
	            	<div class="right">
                        <a href="#none" id="memberPopup" class="button button-b"><span>회원검색</span></a>
                        <a href="#none" id="filePopup"class="button"><span>파일선택</span></a>
                    </div>
                    <form id="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
	                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
	                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
	                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
	                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
	                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
	                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
	                    <input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
						<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
						<input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>"/>
						
					</form>
					
					<form id="frm" name="frm">
					<input type="hidden" name="rownum" id="rownum" value="0"/>
					<div class="table-a"><!-- col list -->
					<table class="core">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: auto;" />
                            <col style="width: 20%;" />
                            <col style="width: 20%;" />
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>ERP고객코드</th>
								<th>고객명</th>
                            	<th>아이디</th>
                                <th><input type="checkbox" class="checkbox checkAll" checked/></th>
							</tr>
						</thead>
						<tbody class="applyMemberList">
							<tr class="memberNodata"><!-- row -->
								<td colspan="5">회원을 검색해 주세요.</td>
							</tr>
						</tbody>
					</table>
					</div>
				 
					<div class="title-box">
	                    <h4 class="title">적립/차감(* 필수입력)</h4>
	                </div>
				   <div class="section-button">
						<!-- section button -->
						<a href="#none" id="goRegist" class="button button-b"><span>적용</span></a>
<!-- 						<a href="#none" id="goList" class="button button-a"><span>목록</span></a> -->
					</div>
				    
				    	<div class="section-form"><!-- section-form-a -->
				    	
				    	 	<div class="form-group">
		                        <label class="label"><span>포인트구분 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="radio" name="MIL_MST_GBN" id="stateA" class="radio" value="P"checked="checked"/>
		                            <label for="stateA">적립</label>
		                            <input type="radio" name="MIL_MST_GBN" id="stateB" class="radio" value="M"/>
		                            <label for="stateB">차감(적립취소)</label>
		                        </div>
		                    </div>
				    			
		                    <div class="form-group">
		                        <label class="label"><span>포인트내역 <em class="strong">*</em></span></label>
		                        <div class="field">
		                        	<select id="MIL_MST_BRK_DWN" name="MIL_MST_BRK_DWN" class="select" title="구분">
										<option value="">선택</option>
										<option value="04">특별행사(쇼핑몰)</option>
										<option value="34">크라운전환(쇼핑몰)</option>
					                </select>
		                        </div>
		                    </div>
		                    
		                    <div class="form-group">
		                        <label class="label"><span>관리자메모 </span></label>
		                        <div class="field">
		                            <input type="text" name="MIL_MST_MEMO" id="MIL_MST_MEMO" class="text" maxlength="100" />
		                            <span>(</span><span id="byte_p1">0</span><span>/14 byte)</span>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="label"><span>포인트 <em class="strong">*</em></span></label>
		                        <div class="field">
		                            <input type="text" name="MIL_MST_PRC" id="MIL_MST_PRC" class="number short" maxlength="10" /><span>(원)</span>
		                        </div>
		                    </div>
	                    	               
		                </div><!-- // section-form-a -->
					</form>
					
					
					<!-- // section button -->

				</div>
				<!-- // contents-inner -->

			</section>
			<!-- // contents -->

		</div>
		<!-- // body -->
		<footer>
			<!-- footer -->
			<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
		</footer>
		<!-- // footer -->
	</div>
	<!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>
<script id="memberTemplate" type="text/x-jquery-tmpl">
<tr>
	<td>\${RNUM}</td>
	<td>\${ERP_ID}<input type="hidden" name ="ERP_ID" class=ERP_ID" value="\${ERP_ID}"/></td>
	<td>\${NAME}</td>
	<td>\${ID}<input type="hidden" name ="ID" class="ID" value="\${ID}"/></td>
	<td><input type="checkbox" class="checkbox checkRow" name="ID_CHK" value="\${ID}" checked/> </td>
	
</tr>
</script>

<script type="text/javascript">
$(document).ready(function() {
	$.checkBoxSelect("checkAll", "checkRow");
	$("#frm").find(".checkAll").prop("checked", true);
	
	$(document).on("keyup","#MIL_MST_MEMO",function(){
		getStrByte(this,'#byte_p1', 14, 2);
	});
	 
	$(document).on("click", "#memberPopup", function () 
    {	
   		popup('<c:out value="${serverDomain}" />/am/member/searchMemberPopup.do',"900","900","no","_MemberPopup");

    });
	
	$(document).on("click", "#filePopup", function () 
	{	
		popup('<c:out value="${serverDomain}" />/am/marketing/mileageMemberUploadPopup.do',"400","300","no","_FilePopup");

	});
	
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/mileageList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
    	if($("#rownum").val() == "0")
    	{
    		alert("[회원] 반드시 선택해 주십시오.");
            $("#memberPopup").focus();
            return;	
    	}
     
    	if($("#MIL_MST_GBN").val() == "")
    	{
    		alert("[구분] 반드시 선택해 주십시오.");
            $("#MIL_MST_GBN").focus();
            return;	
    	}
    	
    	if($("#MIL_MST_BRK_DWN").val() == "")
    	{
    		alert("[포인트내역] 반드시 선택해 주십시오.");
            $("#MIL_MST_BRK_DWN").focus();
            return;	
    	}
    	
    	
    	
    	if($("#MIL_MST_PRC").val() == "")
    	{
    		alert("[포인트] 반드시 입력해 주십시오.");
            $("#MIL_MST_PRC").focus();
            return;	
    	}
    	
    	if (confirm("저장 하시겠습니까?")) 
      	{
        	$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/mileageRegist.do", "target" : "_self", "method" : "post"}).submit();
        }	

    });
    
    
});

 


//현재 행 삭제
function rowDelete(row)
{
	$(row).parent().parent().remove();	
	
}

fnDuplicationChk = function( selectObj ){
 
    var bReturn = true;
    var $memberBox = $(".table-a");
    var $obj = $memberBox.find(".applyMemberList .ID");
    $.each($obj, function(){
        if(selectObj == $(this).val()){
            bReturn = false;
            return false;
        }
    });
    return bReturn;
};
fnResultMember = function(params){
	var $memberBox = $(".table-a");
	var bCheck = true;
	var rnum = Number($("#rownum").val());

	//상품중복체크
	$.each( params, function( index, el ){
		if( !fnDuplicationChk( el.ID )){
			alert("["+el.ID+"] 이미 선택된회원입니다.");
			bCheck = false;
			return false;
		}
	});
	
	if( bCheck ){
	
    	//기본TR삭제
    	$memberBox.find(".memberNodata").remove();
    	//배열재정의
    
    	var arrayObj = new Array();
    
		var obj;
		
		$.each(params, function(index,item){
			rnum++;
			
    		obj = new Object();
    		obj.RNUM  = String(rnum);
    		obj.ID 			= item.MEM_MST_MEM_ID;
    		obj.ERP_ID 			= item.MEM_MST_ERP_ID;
    		obj.NAME 			= item.MEM_MST_MEM_NM;
    		
    		arrayObj.push(obj); //만들어진  object를 배열에 추가
    	});
		$("#rownum").val(rnum);
		$( "#memberTemplate" ).tmpl( arrayObj ).appendTo($memberBox.find(".applyMemberList"));
	 
	}
	 
	return true;
};


</script>
</body>
</html>