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

            <div class="container"><!-- container -->

                <h2 class="title"><span>리뷰어모집</span></h2>

                <h3 class="title"><span>등록</span></h3>

                <p>
                    <i class="require"><em>필수입력</em></i>표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchExpMstCd" value="<c:out value="${commandMap.searchExpMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>"/>
                    <input type="hidden" name="searchPrdMstErpCd" value="<c:out value="${commandMap.searchPrdMstErpCd }"/>"/>
                    <input type="hidden" name="searchExpMstNm" value="<c:out value="${commandMap.searchExpMstNm }"/>"/>
                    <input type="hidden" name="searchExpMstStDt" value="<c:out value="${commandMap.searchExpMstStDt }"/>"/>
                    <input type="hidden" name="searchExpMstEdDt" value="<c:out value="${commandMap.searchExpMstEdDt }"/>"/>
                    <input type="hidden" name="searchExpMstUseYn" value="<c:out value="${commandMap.searchExpMstUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>

                <form id="frm" name="frm" enctype="multipart/form-data">
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>전시여부 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" class="radio" name="EXP_MST_USE_YN" value="Y" checked>
                                    <label for="">노출</label>
                                    <input type="radio" class="radio" name="EXP_MST_USE_YN" value="N"> 
                                    <label for="">미노출</label>
                                </td>
                                <th><label for="">상단노출<i class="require"><em>필수입력</em></i></label></th>
                                <td >
                                    <input type="radio" class="radio" name="EXP_MST_TOP_DSP_YN" value="Y">
                                    <label for="">노출</label>
                                    <input type="radio" class="radio" name="EXP_MST_TOP_DSP_YN"	value="N" checked> 
                                    <label for="">미노출</label>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상품선택<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="text" name="PRD_MST_CD" id="PRD_MST_CD" class="text" readonly/>
                                    <a href="#none" class="button button-b small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집명<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="text" name="EXP_MST_NM" id="EXP_MST_NM" class="text" style="width:80%" placeholder="모집명 입력" /> (<span id="byte_2">0</span><span>/35 byte)</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집내용<i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <textarea class="textarea" name="EXP_MST_DESC" id="EXP_MST_DESC" style="height: 100px; width:80%;" placeholder="모집내용 입력(최대 200byte)" ></textarea> (<span id="byte_3">0</span><span>/200 byte)</span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집기간 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_RCT_ST_DT" id="EXP_MST_RCT_ST_DT" class="text" readonly="readonly" data-target-end="#EXP_MST_RCT_ED_DT"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_RCT_ED_DT" id="EXP_MST_RCT_ED_DT" class="text" readonly="readonly" data-target-start="#EXP_MST_RCT_ST_DT"/>
                                   	<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<!-- <a href="javascript:fnDateSet('EXP_MST_RCT_ST_DT', 'EXP_MST_RCT_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a> -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>활동기간 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_ATV_ST_DT" id="EXP_MST_ATV_ST_DT" class="text" readonly="readonly" data-target-end="#EXP_MST_ATV_ED_DT"/> ~
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_ATV_ED_DT" id="EXP_MST_ATV_ED_DT" class="text" readonly="readonly" data-target-start="#EXP_MST_ATV_ST_DT"/>
                                   	<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
									<a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
									<!-- <a href="javascript:fnDateSet('EXP_MST_ATV_ST_DT', 'EXP_MST_ATV_ED_DT', 0, 0, 0, 0, 2, 0,  '-');" class="button button-a xsmall"><span>두달</span></a> -->
                                </td>
                            </tr>
                            <tr>
                                <th><span>당첨자발표일 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" name="EXP_MST_WIN_DT" id="EXP_MST_WIN_DT" class="text" readonly="readonly" data-target-start="#EXP_MST_RCT_ED_DT"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>모집인원 <i class="require"><em>필수입력</em></i></span></th>
                                <td colspan="3">
                                    <input type="number" name="EXP_MST_WIN_CNT" id="EXP_MST_WIN_CNT" class="text number" placeholder="인원 입력" /> 명
                                </td>
                            </tr>
							<tr class="normal" id="imgDiv" style="display: none;">
                                <th><span>상단노출 이미지<i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <div id="multiFile1-list">
                                    </div>
                                    <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .gif, .png" />
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text"  name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    </p>
                                </td>
                            </tr>
                            <tr>
                            	<th><label class="label"><span>상세내용<i class="require"><em>필수입력</em></i></span></label></th>
                           	 	<td>
					            	<textarea class="textarea" name="EXP_MST_SCRIPT" id="EXP_MST_SCRIPT" style="width: 95%; height: 500px;"></textarea>
	                    		</td>
	                     	<tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                     <div class="wrap text-center">
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->

            </div><!-- // container -->

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
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<ui:editor objId="#EXP_MST_SCRIPT"/>
<script>
$(function(){

    $(document).on("keyup","#EXP_MST_NM",function(){
        getStrByte(this,'#byte_2', 35, 2);
    });
	
	$(document).on("keyup","#EXP_MST_DESC",function(){
        getStrByte(this,'#byte_3', 200, 2);
    });

	$(document).on("keyup","#CMN_FLE_ALT_TXT_P1",function(){
        getStrByte(this,'#byte_4', 20, 1);
    });

	$(document).on("change", "input:radio[name='EXP_MST_TOP_DSP_YN']", function () {
		var topDspCnt = <c:out value="${topDspCount}"/>

		if("Y" == $(this).val()){
			$("#imgDiv").show();
			if(topDspCnt > 0){
				var result = confirm("상단노출중인 이벤트가 있습니다. 해당 이벤트로 변경하시겠습니까?");
				if(!result){
					$('input:radio[name=EXP_MST_TOP_DSP_YN]:input[value="Y"]').prop("checked", false);
					$('input:radio[name=EXP_MST_TOP_DSP_YN]:input[value="N"]').prop("checked", true);
					$("#imgDiv").hide();
				}
			}
		} else{
			$("#imgDiv").hide();
		}
    });

    //초기 당첨자 URL 가림
    $(document).on("click", ".search-product-popup", function () {
        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");

        fnResultProduct = function(params){
            $.each(params, function(index,item){
                $("#PRD_MST_CD").val(item.PRD_MST_CD);
                $("#PRD_MST_ERP_CD").val(item.PRD_MST_ERP_CD);

            });

            return true;
        };
    });

    // 담청인원 0 이하 변경 제한 이벤트
    $(document).on("click", "#EXP_MST_WIN_CNT", function() {
    	if(this.value < 0){
    		this.value = 0;
    	}
    });

    //파일용량, 확장자 체크
    $('#multiFile1').bind('change', function() {
        //alert(this.files[0].size);
        var fileSise1 = this.files[0].size;
        var file1 = $("#multiFile1").val();

        var extensionF1 = file1; //파일을 추가한 input 박스의 값
        extensionF1 = extensionF1.slice(extensionF1.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

        if(fileSise1 > 1048576){
            alert('파일 용량(1MB)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
        }

        if(extensionF1 != "jpg" && extensionF1 != "png" &&  extensionF1 != "gif"){ //확장자를 확인합니다.
            alert('파일(jpg, png, gif)만 등록 가능합니다.');
            $("#multiFile1").val('');
            return;
        }
    });

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
        if($.trim($("#PRD_MST_CD").val()) == ""){
            alert("상품을 입력해 주십시오.");
            $("#PRD_MST_CD").focus();
            return;
        }
        if($.trim($("#EXP_MST_NM").val()) == ""){
            alert("모집명을 입력해 주십시오.");
            $("#EXP_MST_NM").focus();
            return;
        }

        if($.trim($("#EXP_MST_DESC").val()) == ""){
            alert("모집내용을 입력해 주십시오.");
            $("#EXP_MST_DESC").focus();
            return;
        }

        if($.trim($("#EXP_MST_RCT_ST_DT").val()) == ""){
            alert("모집기간 시작일을 입력해 주십시오.");
            $("#EXP_MST_RCT_ST_DT").focus();
            return;
        }
        if($.trim($("#EXP_MST_RCT_ED_DT").val()) == ""){
            alert("모집기간 종료일을 입력해 주십시오.");
            $("#EXP_MST_RCT_ED_DT").focus();
            return;
        }
        
        if($.trim($("#EXP_MST_ATV_ST_DT").val()) == ""){
            alert("활동기간 시작일을 입력해 주십시오.");
            $("#EXP_MST_ATV_ST_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_ATV_ED_DT").val()) == ""){
            alert("활동기간 종료일을 입력해 주십시오.");
            $("#EXP_MST_ATV_ED_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_WIN_DT").val()) == ""){
            alert("당첨자발표일을 입력해 주십시오.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        var EXP_MST_RCT_ST_DT = $.trim($("#EXP_MST_RCT_ST_DT").val());
        var EXP_MST_RCT_ED_DT = $.trim($("#EXP_MST_RCT_ED_DT").val());
        var EXP_MST_ATV_ST_DT = $.trim($("#EXP_MST_ATV_ST_DT").val());
        var EXP_MST_ATV_ED_DT = $.trim($("#EXP_MST_ATV_ED_DT").val());
        var EXP_MST_WIN_DT = $.trim($("#EXP_MST_WIN_DT").val());

        if(EXP_MST_RCT_ST_DT >= EXP_MST_RCT_ED_DT)
        {
            alert("모집종료일자가 모집시작일자이후 여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        } 
        
        if(EXP_MST_ATV_ST_DT >= EXP_MST_ATV_ED_DT)
        {
            alert("활동종료일자가 활동시작일자이후 여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        if(EXP_MST_RCT_ED_DT >= EXP_MST_WIN_DT)
        {
            alert("당첨자발표일은 모집기간 이후여야 합니다.");
            $("#EXP_MST_WIN_DT").focus();
            return;
        }

        if(EXP_MST_WIN_DT >= EXP_MST_ATV_ST_DT)
        {
            alert("활동기간은 당첨자발표 이후여야 합니다.");
            $("#EXP_MST_ATV_ST_DT").focus();
            return;
        }

        if($.trim($("#EXP_MST_WIN_CNT").val()) == ""){
            alert("당첨인원을 입력해 주십시오.");
            $("#EXP_MST_WIN_CNT").focus();
            return;
        }

        var winCnt = $.trim($("#EXP_MST_WIN_CNT").val());
        if(parseInt(winCnt) <= 0)
        {
            alert("당첨자인원은 0 이상이어야 합니다.");
            $("#EXP_MST_WIN_CNT").focus();
            return;
        }

        if("Y" == $("input:radio[name='EXP_MST_TOP_DSP_YN']:checked").val()){
	        if($.trim($("#multiFile1").val()) == ""){
		        alert("상단노출 이미지를 등록해 주십시오.");
		        $("#multiFile1").focus();
		        return;
		    }
	
	        if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
		        alert("상단노출 이미지 대체 텍스트를 입력해 주십시오.");
				$("#CMN_FLE_ALT_TXT_P1").focus();
				return;
			};
        };

        /*if($.trim($("#multiFile2").val()) == ""){
            alert("상품특징파일을 등록해 주십시오.");
            $("#multiFile2").focus();
            return;
        }*/

    	try { oEditors.getById["EXP_MST_SCRIPT"].exec("UPDATE_CONTENTS_FIELD", []);	 } catch(e){ } //editor 내용을 EXP_MST_SCRIPT TEXTAREA의 VALUE 값으로 만든다.
        var CONTENTS = stringUtil.getString($.trim($("#EXP_MST_SCRIPT").val()), "");
        if (CONTENTS == "" || CONTENTS == "<p>&nbsp;</p>" ){
        	 alert("[상세내용]반드시 입력해주십시오.");
            $("#EXP_MST_SCRIPT").focus();
            return;
        }
        
        if (confirm("저장 하시겠습니까?"))
        {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/kingerRegist.do", "target" : "_self", "method" : "post"}).submit();
        }

    });

});
</script>

</body>
</html>
