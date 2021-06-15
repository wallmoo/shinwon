<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

    <div id="aside" class="aside left"><!-- aside -->
        <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
    </div><!-- // aside -->

    <div id="wrapper"><!-- wrapper -->

        <div id="breadcrumb"></div><!-- breadcrumb -->

        <div id="contents"><!-- contents -->

            <div class="container">

                <h2 class="title"><span>고객체험단</span></h2>
               <div class="tab-list"><!-- tab -->
                    <ul class="tab">
                        <li><a href="javascript:;" id="goBiasicEdit">KINGER관리</a></li>
                        <li><a href="javascript:;" id="goEntryList">응모자확인&당첨자 선정</a></li>
                        <li class="active" ><a href="javascript:;" id="goWinnerList">당첨자 발표</a></li>
                        <li><a href="javascript:;" id="goReview">REVIEW관리</a></li>
                    </ul>
                </div><!-- // tab -->
	            
                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
             	<form name="tabForm" id="tabForm">
	               	<input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
	                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPageBasic }"/>"/>
	                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSizeBasic }"/>"/>
	                <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
	                <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
	                <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
	                <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
	                <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
	                <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                </form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: auto;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>KINGER CODE/상품코드</span></label></th>
	                    		<td>
	                    			<div class="field"><c:out value="${row.EXP_MST_CD }"/>/<c:out value="${row.PRD_MST_CD }"/></div>
									<input type="hidden" name="EXP_MST_CD" value="<c:out value="${commandMap.EXP_MST_CD }"/>" />
	                    		</td>
	                        
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>작성자</span></label></th>
	                    		<td>
	                    			<c:out value="${row.EXP_MST_REG_ID }"/>(<c:out value="${row.EXP_MST_REG_NM }"/>) <ui:formatDate value="${row.EXP_MST_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/>
	                    		</td>
	                        </tr>
	                   
	                        <tr><!-- row -->
	                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<input type="text" class="text EXP_WIN_NM" id="EXP_WIN_NM" name="EXP_WIN_NM" value="<c:out value="${rowWin.EXP_WIN_NM }"/>" style="width:80%;" maxlength="30"/>(<span id="byte_1">0</span><span>/30 byte)</span>
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>메인카피<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="EXP_WIN_MAN_CPY" id="EXP_WIN_MAN_CPY" style="width:80%;height: 100px;"><c:out value="${rowWin.EXP_WIN_MAN_CPY }"/></textarea>
									(<span id="byte_2">0</span><span>/1000 byte)</span>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>서브카피</span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="EXP_WIN_SUB_CPY" id="EXP_WIN_SUB_CPY" style="width:80%;height: 100px;"><c:out value="${rowWin.EXP_WIN_SUB_CPY }"/></textarea>
									(<span id="byte_3">0</span><span>/1000 byte)</span>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>주의사항 <i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<textarea class="textarea" name="EXP_WIN_ATN" id="EXP_WIN_ATN" style="width:80%;height: 100px;"><c:out value="${rowWin.EXP_WIN_ATN }"/></textarea>
									(<span id="byte_4">0</span><span>/1000 byte)</span>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>당첨자 명단</span></label></th>
	                    		<td>
                   			 		<div id="multiFile1-list">							
										<c:forEach items="${fileList}" var="fileRow" varStatus="i">	
											<c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
												<c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
												<c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>
														
												<i class="icon-file"></i>
								                <a href="/nas/upload<c:out value="${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }" />" target="_blank" title="새 창 으로 열립니다." >
								                	<c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
								                </a>
												<input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
			                        			<label for="CMM_FLE_IDX">삭제</label> 
											</c:if>
										</c:forEach>	
									</div>
				        
				           			<input type="file" name="file" id="file" class="file" style="width:70%;"/>&nbsp;&nbsp;<i class="icon-file"></i>&nbsp;<a href="javascript:;" class="sampleDownload" data-file_name="kingerWinnerSample.xls">샘플파일 다운로드</a>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상태<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="radio" id="EXP_WIN_USE_YN1" class="radio" name="EXP_WIN_USE_YN" value="Y" <ui:select v="${rowWin.EXP_WIN_USE_YN }" t="Y" g="checked"/> />
									<label for="EXP_WIN_USE_YN1">사용</label>
									<input type="radio" id="EXP_WIN_USE_YN2" class="radio" name="EXP_WIN_USE_YN" value="N" <ui:select v="${rowWin.EXP_WIN_USE_YN }" t="N" g="checked"/> />
									<label for="EXP_WIN_USE_YN2">미사용</label>
	                    		</td>
	                        </tr>
	                    </tbody>
                	</table><!-- // table -->
                </form>
               	<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
						<a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button --> 
                
                
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                    	<tr>
                    		<th><label class="label"><span>LMS발송</span></label></th>
                    		<td>
                    			<div class="col-1-2 text-right">
                    			<a href="#none" id="" class="small button-b"><span>당첨자에게 LMS발송하기</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
								<textarea class="textarea" name="LMS" id="LMS" style="width:80%; height: 50px;"></textarea>
                    		</td>
                        </tr>
                     </tbody>
				</table>
				<div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="#none" id="goMail" class="button large primary"><span>EM발송</span></a>
                    </div>
                </div><!-- // section-button --> 

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->
<form name="fileForm" id="fileForm">
	<input type="hidden" name="fileName" value="" />
</form>
<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	$(document).on("keyup","#EXP_WIN_NM",function(){
		getStrByte(this,'#byte_1', 30, 2);
	});
	$(document).on("keyup","#EXP_WIN_MAN_CPY",function(){
		getStrByte(this,'#byte_2', 1000, 2);
	});
	$(document).on("keyup","#EXP_WIN_SUB_CPY",function(){
		getStrByte(this,'#byte_3', 1000, 2);
	});
	$(document).on("keyup","#EXP_WIN_ATN",function(){
		getStrByte(this,'#byte_4', 1000, 2);
	});
	// 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goBasicEdit", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goEntryList", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerEntryList.do", "target" : "_self", "method" : "get"}).submit();
    });
    
 // 당첨자 탭 클릭 이벤트
    $(document).on("click", "#goReview", function () {
        $("#tabForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerReviewList.do", "target" : "_self", "method" : "get"}).submit();
    });
 
 // 기본정보 탭 클릭 이벤트
    $(document).on("click", "#goWinnerList", function () {
        $("#tabForm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target":"_self", "method":"post"}).submit();
    });
		
    // 폼체크
    $("#frm").validate({
        rules: {
        	EXP_WIN_NM : { required:true },
        	EXP_WIN_MAN_CPY : { required:true },
        	EXP_WIN_ATN : { required:true }
        }
    });

    // 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
    
//         	var file = $("input[name='file']").val();
//         	if(file == ""){
//         		alert("당첨자명단을 등록해 주십시오.");
//         		return;
       // 	}
        	if (confirm( "저장 하시겠습니까?")) {              	 
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
        
    // 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
        var $frm = $("#tabForm"); 
        $frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/kingerWinList.do", "target":"_self", "method":"post"}).submit();
    });
 // 파일 다운로드
    $(document).on("click", ".sampleDownload", function () {
        var $fileForm = $("#fileForm");
        var $this = $(this);
        $fileForm.find("input[name='fileName']").val($this.data("file_name"));
        $fileForm.attr({"action":"<c:out value="${serverDomain}"/>/am/common/sampleFileDownload.do", "target":"_self", "method":"post"}).submit();
    });
});
//-->
</script>

</body>
</html>
