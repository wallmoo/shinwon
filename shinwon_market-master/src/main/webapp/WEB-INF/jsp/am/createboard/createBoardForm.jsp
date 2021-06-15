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

                <h2 class="title"><span>게시판 생성</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="searchForm" name="searchForm">
					<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>	                    
                    <input type="hidden" name="searchBrdMstNm" value="<c:out value="${commandMap.searchBrdMstNm }"/>"/>	                    
                    <input type="hidden" name="searchBrdMstUseYn" value="<c:out value="${commandMap.searchBrdMstUseYn }"/>"/>
                    <input type="hidden" name="searchBrdMstType" value="<c:out value="${commandMap.searchBrdMstType }"/>"/>
				</form>
                
                <form id="frm" name="frm" enctype="multipart/form-data"> 
			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
	                    <colgroup>
	                        <col style="width: 15%;" />
	                        <col style="width: auto;" />
	                    </colgroup>
	                    <tbody>
	                    	<tr>
	                    		<th><label class="label"><span>게시판 분류</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_MST_TYPE" id="stateA" value="<c:out value="${Code.BOARD_TYPE_NORMAL}"/>" class="radio" checked="checked"/>
		                            <label for="stateA">일반게시판</label>
		                            <input type="radio" name="BRD_MST_TYPE" id="stateB" value="<c:out value="${Code.BOARD_TYPE_IMAGE}"/>" class="radio" />
		                            <label for="stateB">이미지게시판</label>
	                    		</td>
	                        </tr>
	                        <tr>
	                    		<th><label class="label"><span>게시판명<i class="require"><em>필수입력</em></i></span></label></th>
	                    		<td>
	                    			<input type="text" name="BRD_MST_NM" id="BRD_MST_NM" class="text large" />
	                    		</td>
	                        </tr>
	                   
	                        <tr><!-- row -->
	                            <th><label class="label"><span>게시판소개<i class="require"><em>필수입력</em></i></span></label></th>
	                            <td>
	                            	<input type="text" name="BRD_MST_INTRO" id="BRD_MST_INTRO" class="text large" />
	                            </td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>상단공지여부</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_MST_TOP_YN" id="topA" value="Y" class="radio" />
		                            <label for="topA">사용</label>
		                            <input type="radio" name="BRD_MST_TOP_YN" id="topB" value="N" class="radio" checked="checked"/>
		                            <label for="topB">미사용</label>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>덧글여부</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_MST_REPLY_YN" id="replyA" value="Y" class="radio" />
		                            <label for="replyA">사용</label>
		                            <input type="radio" name="BRD_MST_REPLY_YN" id="replyB" value="N" class="radio" checked="checked"/>
		                            <label for="replyB">미사용</label>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>사용여부</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_MST_USE_YN" id="useA" value="Y" class="radio" checked="checked"/>
		                            <label for="useA">사용</label>
		                            <input type="radio" name="BRD_MST_USE_YN" id="useB" value="N" class="radio" />
		                            <label for="useB">미사용</label>
	                    		</td>
	                        </tr>
	                        
	                        <tr>
	                    		<th><label class="label"><span>첨부파일여부</span></label></th>
	                    		<td>
	                    			<input type="radio" name="BRD_MST_FLE_YN" id="fileA" value="Y" class="radio" />
		                            <label for="fileA">사용</label>
		                            <input type="radio" name="BRD_MST_FLE_YN" id="fileB" value="N" class="radio" checked="checked"/>
		                            <label for="fileB">미사용</label>
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

            </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->  

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script>
$(function(){
	// 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        
    		if($.trim($("#BRD_MST_NM").val()) == "")
            {
                alert("[게시판명]반드시 입력해 주십시오.");
                $("#BRD_MST_NM").focus();
                return;
            }
        	
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/createboard/createBoardRegist.do", "target":"_self", "method":"post"}).submit();
            }
        //}
    });
});
//-->
</script>

</body>
</html>
