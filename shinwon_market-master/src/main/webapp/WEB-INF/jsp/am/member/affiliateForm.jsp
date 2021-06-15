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

            <h2 class="title"><span>제휴사관리</span></h2>

            <h3 class="title"><span>등록</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
            <form name="frm" id="frm" action="/am/member/affiliateRegistSubmit.do" method="post">
            <div class="section-form"><!-- section-form-a -->
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><label class="label">제휴사명<i class="require"><em>필수입력</em></i></label></th>
                            <td>
                                <input type="text" class="text large" id="COC_NM" name=COC_NM style="width:20%" placeholder="제휴사명 입력">&nbsp;
                                <a href="#none" id="nameDupCheck" class="button button-c small"><span>중복확인</span></a>
                                <small style="margin-left:10px;">띄어쓰기를 삼가해주세요.</small>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label">스페셜코드<i class="require"><em>필수입력</em></i></label></th>
                            <td>
                            	<c:if test="${info.COC_SPC_CD eq null or empty info.COC_SPC_CD}">
                            		<span>"스페셜코드는 자동 생성됩니다."</span>
                            		<small style="margin-left:10px;">2자리 영문 + 5자리 숫자</small>
                            	</c:if>
                            	<c:if test="${info.COC_SPC_CD ne null and !empty info.COC_SPC_CD }">
                                	<c:out value="${info.COC_SPC_CD}"/>
                                </c:if>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label">제휴사설명</label></th>
                            <td>
                                <input type="text " class="text xlarge" name="COC_DES" value="<c:out value="${info.COC_DES}"/>" placeholder="제휴사 설명 입력"/>
                            </td>
                        </tr>
                        <tr>
                            <th><span>사용여부<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="radio"	id="stateB" name="COC_USE_YN" class="radio" checked <c:if test="${info.COC_USE_YN eq 'Y'}">checked</c:if>  value="Y" />
                                <label for="stateB">사용</label>
                                <input type="radio" id="stateC" name="COC_USE_YN" class="radio" <c:if test="${info.COC_USE_YN eq 'N'}">checked</c:if> value="N" />
                                <label for="stateC">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            <div class="section-button">
                <div class="wrap text-center">
                    <a href="javascript:;" id="submitButton" class="button primary"><span>저장</span></a>
                </div>
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
var nameDupCheckFlag = false;
var lastName = null;
$(function(){
	$('#nameDupCheck').click(function(){
		var name = $('#COC_NM').val();
		if(!name){
			alert('입력된 데이터가 없습니다');
			return;
		}
        $.ajax({
        	method:'POST',
        	data: {COC_NM:name},
        	contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            url:'/am/member/affiliateNameDupCheckAjax.do',
            success:function(response){
            	if(response.count<=0){
            		alert('중복되는 제휴사가 없습니다.');
            		lastName = name;
            		nameDupCheckFlag = true;
            	}
            	else{
            		alert('중복되는 제휴사가 있습니다.');
            	}
            }
        });
		
	});
	$('#submitButton').click(function(){
		var radio = $('[name=COC_USE_YN]:checked');
		var frm = $('#frm');
		if(!nameDupCheckFlag){alert('중복체크를 진행하십시오.'); return;}
		if(radio.length<=0){alert('사용여부를 선택하십시오.'); return;}
		frm.submit();
		
	});
	$('#COC_NM').focusout(function() {
		var name = $(this).val();
		if(lastName!=name){nameDupCheckFlag = false;}
	});
});
//-->
</script>

</body>
</html>
