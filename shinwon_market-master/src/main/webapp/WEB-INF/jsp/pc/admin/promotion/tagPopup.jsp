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

				<h2 class="title"><span>태그설정</span></h2>

                    <!-- 탭부분 -->
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
    	                    		<th><label class="label"><span>태그그룹<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        <select class="select">
                                            <option value="">2020 S/S VIKI 상의</option>
                                        </select>
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>태그 그룹 설명</span></label></th>
    	                    		<td>
                                        태그 그룹을 선택해 주세요.
    	                    		</td>
    	                        </tr>
                                <tr>
                                   <th><span>등록태그<i class="require"><em>필수입력</em></i> <br />(0)</span></th>
                                   <td>
                                       태그 그룹을 선택해 주세요.
                                        <ul class="tag_list">
                                            <li>#오버핏<button type="button" class="btn_del">X</button></li>
                                            
                                        </ul>
                                   </td>
                               </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
                    </form>

                    <div class="section-button-popup text-center"><!-- section button -->
                        <a href="#none" id="closePopup" class="button button-b"><span>취소</span></a>
                    	<a href="#none" id="" class="button button-b primary"><span>선택</span></a>
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
