<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>회원검색</span></h3>
            </div><!-- // push-guide -->
            
            <form id="searchForm" name="searchForm">
                <input type="hidden" name="searchYn" value="Y" />                    
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="type" value="<c:out value="${commandMap.type }"/>"/>
                <input type="hidden" name="menuPath" value="<c:out value="${commandMap.menuPath }"/>"/>
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr><!-- row -->
		                    <th><span>아이디</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchId" name="searchId" value="<c:out value="${commandMap.searchId }"/>" maxlength="10"/>
		                    </td>
		                    <th><span>이름</span></th>
		                    <td>
		                        <input type="text" class="text" id="searchNm" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>" maxlength="6"/>
		                    </td>
		                </tr>
		                <tr>
		                	<th><span>휴대폰<br/>(뒷자리)</span></th>
		                    <td>
		                        <input type="text" class="text onlyNumber" id="searchTel" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>" maxlength="4"/>
		                    </td>
		                	<th><span>생년월일</span></th>
		                	<td>  
		                		<input type="text" class="text onlyNumber" id="searchBirth" name="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>" maxlength="8" placeholder="YYYYMMDD(8자리)"/>
		                	</td>
		                </tr>
		                <tr>
		                	<th><span>회원 등급</span></th>
		                	<td colspan=3>
		                		<select class="select" name="searchMemGrade" id="searchMemGrade">
                                    <option value="">전체</option>                                
                                    <c:if test="${not empty codes.COMMON_PRI_MEMBER_GRADE }">
                                        <c:forEach var="memberTypeRow" items="${codes.COMMON_PRI_MEMBER_GRADE }">                                        
                                            <option value="<c:out value="${memberTypeRow.CMN_COM_IDX }"/>" <c:if test="${memberTypeRow.CMN_COM_IDX eq commandMap.searchMemGrade}">selected="selected"</c:if>><c:out value="${memberTypeRow.CMN_COM_NM }"/></option>
                                        </c:forEach>
                                    </c:if>
                                </select>
		                	</td>
		                </tr>
		            </tbody>
		        </table><!-- // table -->
		    </form>
		    
		    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                <a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
                <a href="javascript:search();" class="button small primary"><span>검색</span></a>
            </div><!-- // 검색 하단 버튼 -->
            
            <form id="frm" name="frm">
            	<input type="hidden" name="menuPath" value="<c:out value="${commandMap.menuPath }"/>"/>
            	
	            <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
	                <div class="col-1-2 text-left">
	                    <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
	                    <span class="pages">
	                    	(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)
	                    </span>
	                </div>
	            </div><!-- // 목록 상단 버튼 -->
        	
	        	<table cellspacing="0" class="table-col table-b"><!-- table -->
	                <colgroup>
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                    <col style="width: auto;" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th><input type="checkbox" class="checkbox checkAll" id="allCheck" name="allCheck" /></th>
	                        <th>아이디</th>
	                        <th>회원이름</th>
	                        <th>성별</th>
	                        <th>회원등급</th>
	                    </tr>
	                </thead>
	                <tbody id="tbodyMemberList">
	                    <c:choose>
		                    <c:when test="${not empty list}">
		                        <c:set var="listNum" value="${paging.listNum}" />
		                        <c:forEach var="item" items="${list }" varStatus="status">
		                        <tr>
		                            <td>
		                                <input type="checkbox" class="checkbox checkRow" id="MEM_MST_MEM_ID_${item.MEM_MST_MEM_ID}" name="MEM_MST_MEM_IDs" value="${item.MEM_MST_ERP_ID}^${item.MEM_MST_MEM_NM}^${item.MEM_MST_MEM_ID}^${item.MEM_MST_MEM_NM_ADD}^${item.MEM_MST_MAIL}^${item.MEM_MST_HP1}^${item.MEM_MST_HP2}^${item.MEM_MST_HP3}" />
		                            </td>
		                            <td>
		                                <a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
		                                    <c:out value="${item.MEM_MST_MEM_ID }"/>
		                                </a>
		                            </td>
		                            <td>
		                                <a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${item.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
		                                    <c:out value="${item.MEM_MST_MEM_NM}"/>
		                                </a>
		                            </td>
		                            <td><c:out value="${item.MEM_IPN_SEX eq 'M' ? '남자' : item.MEM_IPN_SEX eq 'F' ? '여자' : '' }"/></td>
		                            <td>
		                                <c:choose>
		                                    <c:when test="${item.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE }">
		                                        없음
		                                    </c:when>
		                                    <c:otherwise>
		                                        <c:out value="${item.MEM_MST_MEM_GRD }"/>
		                                    </c:otherwise>
		                                </c:choose>
		                            </td>
		                        </tr>
		                        <c:set var="listNum" value="${listNum-1}" />
		                        </c:forEach>
		                    </c:when>
		                    <c:otherwise>
		                        <c:if test="${commandMap.searchYn eq 'Y'}">
		                        <tr>
		                            <td colspan="5">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
		                        </tr>
		                        </c:if>
		                        <c:if test="${commandMap.searchYn ne 'Y'}">
		                        <tr>
		                            <td colspan="5">${Code.COMMON_MESSAGE_DO_SEARCH_}</td>
		                        </tr>
		                        </c:if>
		                    </c:otherwise>
		                </c:choose>
	                </tbody>
	            </table><!-- // table -->
            
	             <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>  
		        <input type="hidden" name="searchYn" value="Y" />
		        <input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
		        <input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
		        <input type="hidden" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>"/>
		        <input type="hidden" name="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>"/>
		        <input type="hidden" name="searchMemberType" value="<c:out value="${commandMap.searchMemberType }"/>"/>
		        <input type="hidden" name="searchMemGrade" value="<c:out value="${commandMap.searchMemGrade }"/>"/>
		    </form>

            <div class="section-pagination"><!-- section pagination -->
                <h4 class="sr-only">목록 페이징</h4>
                <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
                    <ui:paging paging="${paging }" jsFunction="goPage" />
                </div>
            </div><!-- // section pagination -->
	        
			<div class="grid section-button-search"><!-- section button -->
				<a href="javascript:;" id="memberApply" class="button small primary"><span>선택</span></a>
				<a href="#none" id="closePopup" class="button small"><span>취소</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
	// 회원구분이 선택된 경우 - 해당 회원등급을 불러온다
    if("${commandMap.searchMemberType}" != ""){
        getSelectedMemGradeList("${commandMap.searchMemberType}", "searchMemGrade");    
    }
    
    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

    // 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
    
    /*
    // 회원구분(개인회원,기업회원) 선택에 따른 회원등급 목록
    $(document).on("change","#searchMemberType",function(){
        getMemGradeList($(this).val(), "searchMemGrade");           
    });
 	*/
 	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 
        var $searchRequired = $.trim($("#searchId").val()) + $.trim($("#searchNm").val()) + $.trim($("#searchTel").val()) + $.trim($("#searchBirth").val());
        
        if( $searchRequired == ""){
        	if ("<c:out value="${commandMap.menuPath }"/>" != "targetForm") {	// 팝업 부모창이 타겟관리 페이지인 경우 빈값이어도 search 진행
	            alert("[아이디,이름,휴대폰(뒷자리),생년월일] 중 한개 이상은 필수 입력해주세요.");
	            $("#searchId").focus();
	            return;
			}
        }
        
        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/searchMemberPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/searchMemberPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 선택 클릭 이벤트
    $(document).on("click", "#memberApply", function () 
    {
        var $checkObj = $.find("#tbodyMemberList input[name='MEM_MST_MEM_IDs']:checked");

        if( $checkObj.length == 0 ){
            alert("회원을 선택하여 주십시오.");
            return;
        }
        
        if($("input[name=type]").val() == "estim"){
            if($checkObj.length > 1){
                alert("견적등록시 회원은 한명만 선택하셔야 합니다.");
                return;
            }
        }
            
        var params = new Array();
        var obj;
        var myArray;
        $.each($checkObj, function(index,item){
            myArray = $(this).val().split('^');
            obj = new Object();
            obj.MEM_MST_MEM_NM      = myArray[1];   // 회원이름
            obj.MEM_MST_MEM_ID      = myArray[2];   // 회원ID
            obj.MEM_MST_MEM_ADD      = myArray[3];  // 회원풀 이름
            obj.MEM_MST_MAIL      = myArray[4]; // 회원풀 이메일
            obj.MEM_MST_HP1      = myArray[5];  // 회원풀 휴대폰1
            obj.MEM_MST_HP2      = myArray[6];  // 회원풀 휴대폰2
            obj.MEM_MST_HP3      = myArray[7];  // 회원풀 휴대폰3
            
            params.push(obj); //만들어진  object를 배열에 추가
        });
        
        if( window.opener.fnResultMember(params) )   
            self.close();
    });
    
    // 닫기 버튼 클릭
    $(document).on("click","#closePopup",function()
    {
        self.close();
    });    
        
});

//회원등급 가져오기
function getMemGradeList(memberType, targetSelectId){
    $.ajax({
        type:"post",
        url : "<c:out value="${serverDomain}" />/am/member/getMemGradeListAjax.do",
        data : {"MEM_MST_MEM_GBN": memberType},
        dataType : "json",
        async : false,
        success : function(data){
            var selectedIdx = "${commandMap.searchMemGrade}";
            $("#"+targetSelectId).html("<option value=\"\">전체</option>");   
            if(data.memGradeList.length > 0){
                $.each(data.memGradeList, function(idx, item){
                    var selected = item.CMN_COM_IDX == selectedIdx ? "selected" : ""; //기존 선택된 회원구분이 있는 경우 selected
                    $("#"+targetSelectId).append("<option value=\""+ item.CMN_COM_IDX +"\" "+ selected +">"+ item.CMN_COM_NM +"</option>");
                });
            }
        },
        error : function(err){
            alert("오류가 발생하였습니다.\n[" + err.status + "]");
        }
    });
};

//회원등급 가져오기(selected 기능 포함 ex)검색시 기존 회원등급 선택되도록)
function getSelectedMemGradeList(memberType, targetSelectId){
    $.ajax({
        type:"post",
        url : "<c:out value="${serverDomain}" />/am/member/getMemGradeListAjax.do",
        data : {"MEM_MST_MEM_GBN": memberType},
        dataType : "json",
        async : false,
        success : function(data){
            var selectedIdx = "${commandMap.searchMemGrade}";
            if(data.memGradeList.length > 0){
                $.each(data.memGradeList, function(idx, item){
                    var selected = item.CMN_COM_IDX == selectedIdx ? "selected" : ""; //기존 선택된 카테고리가 있는 경우 selected
                    $("#"+targetSelectId).append("<option value=\""+ item.CMN_COM_IDX +"\" "+ selected +">"+ item.CMN_COM_NM +"</option>");
                });
            }
        },
        error : function(err){
            alert("오류가 발생하였습니다.\n[" + err.status + "]");
        }
    }); 
};
</script>
</body>
</html>
