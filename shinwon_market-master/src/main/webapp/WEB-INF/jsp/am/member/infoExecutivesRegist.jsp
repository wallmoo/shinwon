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

                    <h2 class="title"><span>임직원관리</span></h2>

                    <h3 class="title"><span>임직원 등록</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>
                    
                    <form name="frm" id="frm" method="post" action="/am/member/infoExecutivesRegistRequest.do">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
    	                    	<tr>
    	                    		<th><label class="label"><span>회원선택<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
    	                    			<input type="text" class="text large" placeholder="회원 선택" readonly="" name="MEM_MST_MEM_ID" id="memberSelector">&nbsp;
    									<a href="javascript:window.open('/am/member/searchMemberPopup.do', '_blank', 'width=1000, height=600')" class="button button-c small"><span>회원 검색</span></a>
	                    	    	</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>사번인증<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
    	                    			SW&nbsp;<input type="text" class="text large" name="MEM_MST_SW_ID" placeholder="사번 6자리 입력" id="certMemberNo">&nbsp;
    									<button id="certEmployee" type="button" class="button button-c small"><span>임직원 확인</span></button>
	                    	    	</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>회원등급<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
    	                    			<select class="select" name="MEM_MST_SW_TYPE">
                                            <option value='' >선택</option>
                                             <c:forEach var="item" items="${codes.EMPOYEE_GRADE }" varStatus="i">
                                             	<option value="<c:out value="${item.CMN_COM_IDX }" />"><c:out value="${item.CMN_COM_NM }" /></option>
                                             </c:forEach>
                                        </select>
	                    	    	</td>
    	                        </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    	<!--<button>저장</button> -->
                    	<input type="hidden" name="MEM_MST_MEM_NM"   id="MEM_MST_MEM_NM" value="">
                    	<input type="hidden" name="memberSelectorNm" id="memberSelectorNm" value="">
                    	
						<div class="section-button"><!-- section-button -->
							<div class="wrap text-center">
								<button type="button" id="goSave" class="button small primary"><span>저장</span></button>
							</div>
						</div><!-- // section-button -->                    	
                    	
                    </div>
                    </form>
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
function fnResultMember(result){
	if(!result || result.length==0){
		alert('결과값이 없습니다.');
		return true;
	}
	else if(result.length>1){
		alert('2명 이상 선택 하실 수 없습니다.');
		return true;
	}
	test4 = result;
	$('#memberSelector').val(result[0].MEM_MST_MEM_ID);
	$('#memberSelectorNm').val(result[0].MEM_MST_MEM_ADD);
	return true;
}


$(function(){
	
	
	$('#certEmployee').on('click',function(){
		
		var id = $('#certMemberNo').val();
		
		if(!id){
			alert('사번을 입력해 주세요.');
			return;
		}
		
		$.ajax({
			type : "POST",
			url : '/am/member/infoExecutivesErp.do',
			data : { 'EMP_ID' :  id},			
			success : function(data){
				if(data.status == 200){

					if (  data.data[0].GetEmpNameResult == '' || data.data[0].GetEmpNameResult == undefined ) {
						alert('올바르지 않는 사번입니다');
					}else{
						
						if ( $('#memberSelectorNm').val() != data.data[0].GetEmpNameResult ){
							alert('조회한 ID와 사번의 이름이 서로 일치하지 않습니다!\n올바른 사번을 입력하세요');
							$('[name=MEM_MST_SW_ID]').val('');

						}else{
							$('[name=MEM_MST_MEM_NM]').val(data.data[0].GetEmpNameResult);
							alert(data.message);							
						}
					}
				}
			}
		});
	});
	  
	

	// 등록 이벤트
	$(document).on("click", "#goSave", function (){
		
		// 이름 체크 후 등록 처리
		if ( $('[name=MEM_MST_MEM_ID]').val() == '' || $('[name=MEM_MST_MEM_NM]').val() == undefined ) {
			alert('회원 검색 버튼을 클릭하여, 회원 선택을 하세요 ');
			return;			
		}		
		
		if ( $('[name=MEM_MST_MEM_NM]').val() == '' || $('[name=MEM_MST_MEM_NM]').val() == undefined ) {
			alert('임직원 버튼을 클릭하여, 사번인증을 확인하세요');
			return;			
		}
		
		
		if ( $('#memberSelectorNm').val() != $('#MEM_MST_MEM_NM').val()  ){
			alert('조회한 ID와 사번의 이름이 서로 일치하지 않습니다!');
			return;
		}
		
		
				
		
		if ( $('[name=MEM_MST_SW_TYPE]').val() == '' || $('[name=MEM_MST_SW_TYPE]').val() ==  undefined ){
			alert('회원등급을 선택하세요');
			return;
		}		
		
		if (confirm("저장 하시겠습니까?")) {
			$("#frm").submit();
		}        
        
        
        
	});
	
	
	
	
});
//-->
</script>

</body>
</html>
