<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

				<h2 class="title"><span>당첨자 수동선정</span></h2>

                    <!-- 탭부분 -->

					<h3 class="title"><span>정보입력</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
    						<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
    				</form>
                    <form name="frm" id="frm" enctype="multipart/form-data">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
                                <tr>
    	                    		<th><label class="label"><span>선택한 응모자</span></label></th>
    	                    		<td>
                                        751명
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>메모</span></label></th>
    	                    		<td>
                                        <input type="text" class="text large" name="" value="" maxlength="50" style="width:30%"> (0/50 byte)
    	                    		</td>
    	                        </tr>

    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
                    </form>

                    <div class="section-button-popup text-center"><!-- section button -->
                        <a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
                    	<a href="#none" id="goRegist" class="button button-b primary"><span>저장</span></a>
					</div>

			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
		$(function() {

		});
		//]]>
	</script>
</body>
</html>
