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

            <h2 class="title"><span>추가혜택 등록</span></h2>

            <h3 class="title"><span>기본정보</span></h3>
            <p>
               <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
            </p>
			<form name="searchForm" id="searchForm">
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>" />
                <input type="hidden" name="searchBenefitNm" value="${commandMap.searchBenefitNm }" />
                <input type="hidden" name="searchBenefitStDt" value="${commandMap.searchBenefitStDt }" />
                <input type="hidden" name="searchBenefitEdDt" value="${commandMap.searchBenefitEdDt }" />
                <input type="hidden" name="searchBenefitUseYn" value="${commandMap.searchBenefitUseYn }" />
			</form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" id="jsonData" name="jsonData" />
                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>추가혜택명<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                                <input type="text" class="text xlarge" name="BNF_MST_NM" value="" placeholder="추가혜택명 입력">
                            </td>
                        </tr>
                        <tr>
                            <th><span>전시기간<i class="require"><em>필수입력</em></i></span></th>
                            <td>
                            <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                            <input type="text" class="text" id="BNF_MST_ST_DT" name="BNF_MST_ST_DT" readonly="readonly" data-target-end="#BNF_MST_ED_DT">
                            <select id="BNF_MST_ST_HH" name="BNF_MST_ST_HH" class="select">
								<option value="">시</option>
								<c:forEach begin="0" end="23" step="1" varStatus="i">
	                                <c:set var="hh" value="${i.index}"/>
	                                <c:if test="${i.index < 10}">
	                                    <c:set var="hh" value="0${i.index}"/>
	                                </c:if>
	                                <option value="${hh}" <c:if test="${hh eq '00' }">selected</c:if>>${hh}</option>
								</c:forEach>
							</select>
                            <select id="BNF_MST_ST_MM" name="BNF_MST_ST_MM" class="select">
								<option value="">분</option>
	                                <c:forEach begin="0" end="59" step="1" varStatus="i">
	                                    <c:set var="mm" value="${i.index}"/>
	                                    <c:if test="${i.index < 10}">
	                                        <c:set var="mm" value="0${i.index}"/>
	                                    </c:if>
	                                    <option value="${mm}" <c:if test="${mm eq '00' }">selected</c:if>>${mm}</option>
	                                </c:forEach>
							</select>
							~
                            <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                            <input type="text" class="text" id="BNF_MST_ED_DT" name="BNF_MST_ED_DT" readonly="readonly" data-target-start="BNF_MST_ST_DT">
                            <select id="BNF_MST_ED_HH" name="BNF_MST_ED_HH" class="select">
								<option value="">시</option>
                                    <c:forEach begin="0" end="23" step="1" varStatus="i">
                                        <c:set var="hh" value="${i.index}"/>
                                        <c:if test="${i.index < 10}">
                                            <c:set var="hh" value="0${i.index}"/>
                                        </c:if>
                                        <option value="${hh}" <c:if test="${hh eq '23' }">selected</c:if> >${hh}</option>
                                    </c:forEach>
                            </select>
                            <select id="BNF_MST_ED_MM" name="BNF_MST_ED_MM" class="select">
								<option value="">분</option>
	                                <c:forEach begin="0" end="59" step="1" varStatus="i">
	                                    <c:set var="mm" value="${i.index}"/>
	                                    <c:if test="${i.index < 10}">
	                                        <c:set var="mm" value="0${i.index}"/>
	                                    </c:if>
	                                    <option value="${mm}" <c:if test="${mm eq '59' }">selected</c:if>>${mm}</option>
	                                </c:forEach>
                            </select>
                        </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상태</span></label></th>
                            <td>
                                <input type="radio" id="BRD_INQ_USE_YN_A" name="BNF_MST_USE_YN" class="radio"  value="Y" checked="checked"/>
                                <label for="BRD_INQ_USE_YN_A">사용</label>
                                <input type="radio" id="BRD_INQ_USE_YN_B" name="BNF_MST_USE_YN"class="radio"  value="N" />
                                <label for="BRD_INQ_USE_YN_B">미사용</label>
                            </td>
                        </tr>
                    </tbody>
                </table><!-- // table -->
            </div>

            <h3 class="title"><span>혜택정보</span></h3>
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <!-- <div class="col-1-2 text-left">
                        <select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                        <span class="pages">
                            (총 <strong class="em">1</strong>건, 1 of 1 page)
                        </span>
                    </div> -->

                    <div class="text-right fl_right">
                        <a href="#none" id="addBenefitTemp" class="button small"><span>추가</span></a>
                        <a href="#none" id="removeBenefitTemp" class="button small primary"><span>삭제</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->

                <table cellspacing="0" class="table-col table-b"><!-- table -->
                    <colgroup>
                        <col style="width: 8%;" />
                        <col style="width: auto;" />
                        <col style="width: auto;" />
                        <col style="width: 15%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>노출여부</th>
                        </tr>
                    </thead>
                    <tbody class="benefitList">
                        <tr>
                            <td><input type="checkbox" name="checkbox" class="checkbox" /></td>
                            <td><input type="text" name="BNF_DTL_NM" class="text xlarge" placeholder="한글 10자, 영문숫자 20자 입력" maxlength="20"></td>
                            <td><input type="text" name="BNF_DTL_DESC" class="text xlarge" placeholder="한글 10자, 영문숫자 20자 입력" maxlength="50"></td>
                            <td>
                                <select class="select" name="BNF_DTL_DPL_USE_YN">
                                    <option value="Y">Y</option>
                                    <option value="N">N</option>
                                </select>
                            </td>
                        </tr>
                </table>

            </form>
            <div class="section-button">
                <div class="wrap text-center">
                    <a href="javascript:;" id="goRegist" class="button primary"><span>저장</span></a>
                    <a href="javascript:;" id="goList" class="button"><span>목록</span></a>
                </div>
            </div>

        </div>

        </div><!-- // contents -->

    </div><!-- // wrapper -->

    <div id="quickmenu" class="aside right"><!-- quickmenu-->
        <%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
    </div><!-- // quickmenu -->

</div><!-- // container -->
<script id="benefitInfoTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" name="checkbox" class="checkbox" /></td>
    <td><input type="text" name="BNF_DTL_NM" class="text xlarge" placeholder="한글 10자, 영문숫자 20자 입력" maxlength="20"></td>
    <td><input type="text" name="BNF_DTL_DESC" class="text xlarge" placeholder="한글 10자, 영문숫자 20자 입력" maxlength="50"></td>
    <td>
    	<select class="select" name="BNF_DTL_DPL_USE_YN">
    		<option>Y</option>
    		<option>N</option>
    	</select>
	</td>
</tr>
</script>
<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script>
$(function(){
	$("#frm").validate({
        rules: 
        {
            BNF_MST_NM:{required:true}, // 제목
            BNF_MST_ST_DT:{required:true, date:true}, // 전시기간 시작일
            BNF_MST_ST_HH:{required:true, number:true}, // 전시기간 시작 시
            BNF_MST_ST_MM:{required:true, number:true}, // 전시기간 시작 분
            BNF_MST_ED_DT:{required:true, date:true}, // 전시기간 종료일
            BNF_MST_ED_HH:{required:true, number:true}, // 전시기간 종료 시
            BNF_MST_ED_MM:{required:true, number:true} // 전시기간 종료 분  
        },
        messages:
        {
        	BNF_MST_NM:{required:"추가혜탱명은 필수 입력사항입니다."},
            BNR_MST_ST_DT:{required:"시작일은 필수 선택사항입니다.", date:"시작일 날짜가 잘못 입력되었습니다."},
            BNR_MST_ST_HH:{required:"시작시는 필수 선택사항입니다.", number:"시작시는 숫자만 입력해 주십시오."},
            BNR_MST_ST_MM:{required:"시작분은 필수 선택사항입니다.", number:"시작분은 숫자만 입력해 주십시오."},
            BNR_MST_ED_DT:{required:"종료일은 필수 선택사항입니다.", date:"종료일 날짜가 잘못 입력되었습니다."},
            BNR_MST_ED_HH:{required:"종료시는 필수 선택사항입니다.", number:"종료시는 숫자만 입력해 주십시오."},
            BNR_MST_ED_MM:{required:"종료분은 필수 선택사항입니다.", number:"종료분은 숫자만 입력해 주십시오."}
        }
    });
	$(document).on("click",	"#addBenefitTemp",function() {
		var $benefitBox = $("#benefitList");
        var addLength = 1;

        var arrayObj = new Array();
        var object = new Object();
        arrayObj.push(object);
        
        $("#benefitInfoTemplate").tmpl(arrayObj).appendTo($(".benefitList"));
	});
	
	$(document).on("click",	"#goRegist",function() {
		var $frm = $("#frm");
        var url = "<c:out value="${serverDomain}"/>/am/site/benefitManagerRegist.do";
        if($frm.valid())
        {
        	var validation = false;
        	$('input[name=BNF_DTL_NM]').each(function(){
        		if($(this).val() == ""){
        			validation = true;
        			alert("혜택정보 제목을 입력해주세요");
        			return false;
        		}
        	})
        	if(validation) return;
        	$('input[name=BNF_DTL_DESC]').each(function(){
        		if($(this).val() == ""){
        			validation = true;
        			alert("혜택정보 내용을 입력해주세요");
        			return false;
        		}
        	})
        	if(validation) return;
        	var data =  new Array();
        	$('.benefitList tr').each(function() {
        		var obj = new Object();
        		obj["BNF_DTL_NM"] = $(this).find("input[name=BNF_DTL_NM]").val()
        		obj["BNF_DTL_DESC"] = $(this).find("input[name=BNF_DTL_DESC]").val()
        		obj["BNF_DTL_DPL_USE_YN"] = $(this).find("select :selected").val()
        		data.push(obj);
        	});
        	var jsonData = JSON.stringify(data);
        	$("#jsonData").val(jsonData);
        	$("#frm").attr({"action" : url, "target" : "_self", "method" : "post"}).submit();
        }
		
	});
	$(document).on("click",	"#removeBenefitTemp",function() {
		var selectedTagIdList = new Array();
    	var data =  new Array();
    	$('input[name=checkbox]:checked').each(function() {
    		$(this).parent().parent().remove();
    	});
	});
	
});
//-->
</script>

</body>
</html>
