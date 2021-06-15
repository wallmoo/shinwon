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

				<h2 class="title"><span>보류 사유등록</span></h2>

                    <!-- 탭부분 -->
					<input type="hidden" name="productCodeList" value="<c:out value="${commandMap.productCodeList }"/>"/>
					<input type="hidden" name="VDR_HLD_APV_STATE" value="N"/>
					
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr><!-- row -->
                                <th><span>보류사유</span></th>
                                <td>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_PRC_YN" name="VDR_HLD_PRC_YN" value="Y">
                                    <label for="check1">판매가</label>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_NM_YN" name="VDR_HLD_NM_YN"  value="Y">
                                    <label for="check2">상품명</label>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_CTG_YN" name="VDR_HLD_CTG_YN"  value="Y">
                                    <label for="check3">카테고리</label>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_CNT_YN" name="VDR_HLD_CNT_YN"  value="Y">
                                    <label for="check4">영상/이미지</label>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_NFI_YN" name="VDR_HLD_NFI_YN"  value="Y">
                                    <label for="check5">고시정보</label>
                                    <input type="checkbox" class="checkbox" id="VDR_HLD_ETC_YN" name="VDR_HLD_ETC_YN"  value="Y">
                                    <label for="check6">기타</label>
                                </td>
                            </tr>
                            <tr><!-- row -->
                                <th><span>상세사유</span></th>
                                <td>
                                    <textarea cols="30" rows="10" id="VDR_HLD_DESC" name="VDR_HLD_DESC" ></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                

                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                            <a href="#none" id="goList" class="button large"><span>닫기</span></a>
                        </div>
                    </div><!-- // section-button -->

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
			
			// 목록 버튼 클릭 이벤트 
		    $(document).on("click", "#goList", function () {
		       self.close();
		    	//$("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorApprovalList.do", "target":"_self", "method":"post"}).submit(); 
		    });
			
			// 상세사유 1500byte 제한
			$(document).on("keyup","#VDR_HLD_DESC",function(){
		        getStrByte(this, null, 1500, 2);
		    });

		    function getByteLength(s,b,i,c){
		        for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		        return b;
		    }
		    //저장
		    $(document).on("click", "#goRegist", function () {
		    	var paramData = {}
		    	$('.modal-inner :input:hidden').each(function(){
		    		paramData[this.name] = $(this).val();
		    	});
		    	
		    	var isChecked = false;
		    	$('.modal-inner :input:checkbox').each(function(){
		    		var curCheckedStatus = $(this).is(":checked");
		    		paramData[this.name] = curCheckedStatus ? 'Y' : 'N';
		    		
		    		if(isChecked == false && curCheckedStatus) isChecked = true;
		    	});
		    	
		    	paramData['VDR_HLD_DESC'] = $('#VDR_HLD_DESC').val();
		    	
		    	
		    	stringByteLength = (function(s,b,i,c){
		    	    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		    	    return b
		    	})(paramData['VDR_HLD_DESC']);
		    	
		    	console.log(paramData);
		    	console.log(stringByteLength);
		    	if(isChecked == false) {
		    		alert("보류사유를 선택해 주세요.");
		    		return false;
		    	} else if(stringByteLength == 0){
		    		alert("상세사유를 입력해주세요.");
		    		return false;	
		    	} else if (stringByteLength > 1500) {
		    		alert("1500Byte 이하로 입력해주세요.");
		    		return false;    		
		    	}
		    	
				$.ajax({
					async : false,
					type : "POST",
					data : paramData,
					url : "<c:out value="${serverDomain}" />/am/product/vendorApprovalProductHoldModify.do",
					success : function(data) {
						window.opener.fnResultHoldPopup();   	
						self.close();
					},
					error : function(err) {
						alert("오류가 발생하였습니다.\n["
								+ err.status + "]");
					}
				});
				
		    	/*
		        if (confirm( "저장 하시겠습니까?")) {
		            $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/product/vendorApprovalProductHoldModify.do", "target":"_self", "method":"post"}).submit();
		        }*/
		    });
		    
		});
		//]]>
	</script>
</body>
</html>
