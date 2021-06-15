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

            <h2 class="title"><span>셀러픽관리</span></h2>

            <h3 class="title"><span>등록</span></h3>

            <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                    <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
            </form>
            <form name="frm" id="frm" enctype="multipart/form-data">
            <input type="hidden" name="tagList" id="selectedTagList">
            <input type="hidden" name="VDR_MST_IDX" id="VDR_MST_IDX">
            
            
            <div class="section-form"><!-- section-form-a -->

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>작성자</span></th>
                            <td>
                                <input type="text" name="CNT_MST_REG_ID" id="CNT_MST_REG_ID" value="" disabled>
                                <a href="#none" id="goVendorPopUp" class="button button-b small" title="새 창 으로 열립니다."><span>입점사 선택</span></a>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" name="CNT_MST_TITLE" id="CNT_MST_TITLE" class="text xlarge">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>설명<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea cols="30" rows="10" name="CNT_MST_DESC" id="CNT_MST_DESC"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span>
                                <a href="#none" id="goTagPopUp" class="button button-a small mt10">태그선택</a></label>
                            </th>
                            <td>
                                <ul class="tag_list tag_box" style="width:100%;">
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select id="representTag" class="select">
                                    <option value="">선택</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '1'}">
                                        <c:set var="altTextP1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
                                        <c:set var="altTextP1Idx" value="${fileRow.CMM_FLE_IDX}"/>

                                        <i class="icon-file"></i>
                                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
                                            <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                        </a>
                                        <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
                                        <label for="CMM_FLE_IDX_1">삭제</label>
                                    </c:if>
                                    </c:forEach>
                                </div>
                                <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>MOBIE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <div id="multiFile1-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '1'}">
                                        <c:set var="altTextM1" value="${fileRow.CMN_FLE_ALT_TXT }"/>
                                        <c:set var="altTextM1Idx" value="${fileRow.CMM_FLE_IDX}"/>

                                        <i class="icon-file"></i>
                                        <a href="<c:out value="${cdnDomain}${fileRow.CMM_FLE_ATT_PATH}${fileRow.CMM_FLE_SYS_NM }"/>" target="_blank" title="새 창 으로 열립니다.">
                                            <c:out value="${fileRow.CMM_FLE_ORG_NM }"/>
                                        </a>
                                        <input type="checkbox" class="checkbox cmmFleIdx" id="CMM_FLE_IDX_1" name="CMM_FLE_IDX" data-file_name="file1" value="<c:out value="${fileRow.CMM_FLE_IDX }"/>" />
                                        <label for="CMM_FLE_IDX_1">삭제</label>
                                    </c:if>
                                    </c:forEach>
                                </div>
                                <input type="file" name="file2" id="multiFile4" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextM1}" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    <!-- <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextM1Idx}"/>  -->
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" class="radio" id="planType3" name="CNT_MST_DETAIL_TYPE" checked="checked" onchange=changeDetailType(this.id) value="I"> <label for="planType3">이미지</label>
                                <input type="radio" class="radio" id="planType4" name="CNT_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="E"> <label for="planType4">에디터</label>
                                <input type="radio" class="radio" id="planType5" name="CNT_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="S"> <label for="planType5">스크립트</label>
                            </td>
                        </tr>

                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    </p>
                                </td>
                            </tr>
                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file2" id="multiFile5" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                    <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1MB / 이미지 최대 10개 등록</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text xlarge mobileImgFile" placeholder="20자 이내로 입력하세요."/>
                                    </p>
                                </td>
                            </tr>


                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="CNT_MST_PC_BANNER" id="CNT_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="CNT_MST_MOBILE_BANNER" id="CNT_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                </td>
                            </tr>


                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea id="CNT_MST_PC_SCRIPT" name="CNT_MST_PC_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea id="CNT_MST_MOBILE_SCRIPT" name="CNT_MST_MOBILE_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>전시여부</span></th>
                                <td>
                                    <input type="radio" name="CNT_MST_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
                                    <label for="stateA">전시</label>
                                    <input type="radio" name="CNT_MST_USE_YN" id="stateB" class="radio" value="N"/>
                                    <label for="stateB">미전시</label>
                                </td>
                            </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            

            <div class="grid section-button-list">
            <h3 class="title"><span>상품구성</span></h3>
            </div>
            <div id="productBox">
                <div class="section-form addFormCon productSelectform" data-type="basic">
                    <input type="hidden" name="groupNum" class="groupNum" value="0"/>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 20%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>관련 상품</span></label></th>
                                <td>
                                    <div class="grid section-button-search left"><!-- section button -->
                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small goProductDelete"><span>선택삭제</span></a>
                                        <a href="#none" class="button small search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                    </div><!-- // section button -->
                                    <table class="table-row table-a">
                                        <colgroup>
                                            <col style="width: 10%;" />
                                            <col style="width: 8%;" />
                                            <col style="width: auto;" />
                                            <col style="width: 10%;" />
                                            <col style="width: 15%;" />
                                            <col style="width: 10%;" />
                                            <col style="width: 8%;" />
                                        </colgroup>
                                        <thead>
                                            <tr>
                                                <th><input type="checkbox" class="checkbox checkAll" /></th>
                                                <th>상품코드</th>
                                                <th>이미지</th>
                                                <th>상품명</th>
                                                <th>브랜드</th>
                                                <th>판매가</th>
                                                <th>판매상태</th>
                                                <th>전시순서</th>
                                            </tr>
                                        </thead>
                                        <tbody class="applyProductList">
                                            <tr class="productNodata">
                                            <!-- 
                                                <td><a href="javascript:;">PYFAI4229</a></td>
                                                <td><img src="" alt=""></td>
                                                <td><a href="javascript:;">[SIEG◆1212][30%쿠폰]브라운 스트레이트]</a></td>
                                                <td>SIEG</td>
                                                <td>4,999,999</td>
                                                <td>판매중</td>
                                                <td>
                                                    <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                                    <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                                </td>
                                                -->
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div><!-- //section-form addFormCon -->
                </div><!-- //id="product" -->
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
<ui:editor objId="#CNT_MST_PC_BANNER" num="1"/>
<ui:editor objId="#CNT_MST_MOBILE_BANNER" num="2"/>

<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="CNT_PRD_MST_CD" name="CNT_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/></td>
	<td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
    <td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td>브랜드명</td>
    <td>\${PRD_MST_PRC}</td>
    <td>\${PRD_MST_SEL_STATE}</td>
    <td>
		<c:if test="${row.CNT_DTL_ORDER ne 1 }">
        <a href="#none" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.CNT_DTL_ORDER ne fn:length(list) }">
 		<a href="#none" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="CNT_DTL_ORDER_\${NUM}_\${PRD_MST_CD}" value="\${CNT_DTL_ORDER}"></input>
    </td>
</tr>
</script>

<script>
var tagList = new Array();
detailType = "planType3"
$(function(){
	// 등록 이벤트
	$(document).on("click", ".goProductDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRow:checked").length == 0)
        {
            alert("삭제할 상품을 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyProductList").children("tr").each(function() {

            if($(this).find(".checkRow").is(":checked"))
            {
                $(this).remove();
            }
        });
        
        //사용상품 삭제시 순서 재배치
        var index = 1;
        $topParent.find(".applyProductList").children("tr").each(function() {
        	$(this).children()[9].children[2].value = index++;
        });

        if($topParent.find(".applyProductList").children("tr").length == 0)
        {
            $topParent.find(".applyProductList").append('<tr class="productNodata"><td colspan="8">상품을 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAll").prop("checked", false);

    });
	
    $(document).on("click", "#goRegist", function() {
    	$("#selectedTagList").val(fnGetSelectedTagList());
        if($.trim($("#CNT_MST_TITLE").val()) == ""){
            alert("제목을 입력해 주십시오.");
            $("#CNT_MST_TITLE").focus();
            return;
        }
        if($.trim($("#CNT_MST_DESC").val()) == ""){
            alert("설명을 입력해 주십시오.");
            $("#CNT_MST_DESC").focus();
            return;
        }
        if($(".tag_list").children().length<=0){
        	alert("태그를 추가해 주십시오.")
        	$("#goTagPopUp").focus();
        	return;
        }
        
        //이미지 첨부 체크
        var file1 = $("#multiFile1").val();//PC목록이미지
        var file2 = $("#multiFile2").val();//PC상세이미지

        var file4 = $("#multiFile4").val();//Mobile 목록 이미지
        var file5 = $("#multiFile5").val();//Mobile 상세 이미지

        if(file1 == ""){
        	alert("PC 목록 이미지를 입력해 주십시오.");
        	$("#multiFile1").focus();
        	return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_P1").val()) == ""){//대체텍스트 체크
            alert("PC 목록 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_P1").focus();
            return;
        }
        
        if(file4 == ""){
        	alert("MOBILE 목록 이미지를 입력해 주십시오.");
        	$("#multiFile4").focus();
            return;
        }
        if($.trim($("#CMN_FLE_ALT_TXT_M1").val()) == ""){//대체텍스트 체크
            alert("MOBILE 목록 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_M1").focus();
            return;
        }

        if(detailType=="planType3"){
			if(file2 == ""){
				alert("PC 상세 이미지를 입력해 주십시오.");
		        	$("#multiFile2").focus();
		        	return;
			}
    		if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
                alert("PC 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_P2").focus();
                return;
    		}
				
				
				if(file5 == ""){
					alert("MOBILE 상세 이미지를 입력해 주십시오.");
		        	$("#multiFile5").focus();
		        	return;
				}
				if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
                alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M2").focus();
                return;
            }  
			}else if(detailType=="planType4"){
				if($('#CNT_MST_PC_BANNER').val() == ""){
 					alert('PC 스크립트를 입력해 주십시오.')
 					$('textarea#CNT_MST_PC_BANNER').focus()
 					return;
 				}
 				if($('#CNT_MST_MOBILE_BANNER').val() ==""){
 					alert('PC 스크립트를 입력해 주십시오.')
 					$('textarea#CNT_MST_MOBILE_BANNER').focus()
 					return;
 				}
			}else if(detailType=="planType5"){
				if($('textarea#CNT_MST_PC_SCRIPT').val()== ""){
					alert('PC 스크립트를 입력해 주십시오.')
					$('textarea#CNT_MST_PC_SCRIPT').focus()
					return;
				}
				if($('textarea#CNT_MST_MOBILE_SCRIPT').val() == ""){
					alert('MOBILE 스크립트를 입력해 주십시오.')
					$('textarea#CNT_MST_MOBILE_SCRIPT').focus()
					return;
				}
			} 
        
        var $groupTitle = $(".CNT_GRP_TITLE");
        var groupCheck = true;
        $(".applyProductList").each(function(){
            if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
            {
                alert("[사용상품]상품을 추가해 주십시오.");
                /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                $(this).find(".search-product-popup").focus();
                groupCheck = false;
                return false;
            }
        }) 
         if(groupCheck)
         {
             try { oEditors1.getById["CNT_MST_PC_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 CNT_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
             try { oEditors2.getById["CNT_MST_MOBILE_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 CNT_MST_MOBILE_BANNER TEXTAREA의 VALUE 값으로 만든다.

             if (confirm("저장 하시겠습니까?"))
             {
                 $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/vendor/vendorSellerPickRegist.do", "target" : "_self", "method" : "post"}).submit();
             }
         }
    });
	
 // 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform");

        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .CNT_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };
	
	//상품팝업 상품선택시 호출되는 메소드
    fnResultProduct = function(params){
        var bCheck = true;
        //상품중복체크
        $.each( params, function( index, el ){
            if( !fnDuplicationChk( el.PRD_MST_CD )){
                alert("["+el.PRD_MST_CD+"] 이미 선택된 상품입니다.");
                bCheck = false;
                return false;
            }
        });

        //기본TR삭제
        $productBox.find(".productNodata").remove();
        //배열재정의
        var arrayObj = new Array();
        var len = $productBox.find(".applyProductList .CNT_PRD_MST_CD").length;

        var obj;
        if( bCheck ){

            $.each(params, function(index,item){
                len++;
                obj = new Object();
                obj.PRD_MST_CD              = item.PRD_MST_CD;
                obj.PRD_MST_NM          = item.PRD_MST_NM;
                obj.PRD_MST_PRC         = setComma(item.PRD_MST_PRC);
                obj.PRD_MST_DLV_FEE     = setComma(item.PRD_MST_DLV_FEE);
                obj.PRD_MST_SEL_STATE       = item.PRD_MST_SEL_STATE;
                obj.VDR_MST_NM            = item.VDR_MST_NM;
                obj.CNT_DTL_ORDER            = len;
                obj.NUM = $productBox.find(".groupNum").val();
                if ( item.PRD_MST_SEL_STATE_CODE == '<c:out value="${Code.PRODUCT_SELL_STATE_ING}" />' )
                {
                    obj.PRD_MST_SEL_STATE_CLASS = "b";
                }
                else
                {
                    obj.PRD_MST_SEL_STATE_CLASS = "a";
                }

                if ( item.PRD_MST_CNL_PC_YN == 'Y' && item.PRD_MST_CNL_MB_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "전체";
                }
                else if ( item.PRD_MST_CNL_PC_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "PC";
                }
                else if ( item.PRD_MST_CNL_MB_YN == 'Y' )
                {
                    obj.PRD_MST_CHANNEL_TYPE = "MOBILE";
                }

                obj.FRONT_URL = '<c:out value="${frontDomain}" />';

                obj.serverDomain            = '<c:out value="${serverDomain}" />';


                arrayObj.push(obj); //만들어진  object를 배열에 추가
            });
            $( "#productTemplate" ).tmpl( arrayObj ).appendTo($productBox.find(".applyProductList"));
        }
        return true;
    };
    
	// 상품 그룹 삭제 버튼 클릭 이벤트
    $(document).on("click", "#productBox .product-group-delete", function () {
        removeProductGroup(0, $(this)); // 상품 그룹 삭제
    });

     // 상품 그룹 삭제
    removeProductGroup = function (maxLength, $obj)
    {
        if($obj != undefined)
        {
            // 상품 그룹 삭제
            var $thisSectionForm = $obj.parents(".addFormCon");
            var $productBox = $thisSectionForm.parent();
            $thisSectionForm.remove();

            // 상품 그룹 순서 정렬
            var $sectionForm = $productBox.find(".addFormCon");
            $sectionForm.each(function (index) {
                var $this = $(this);
                $this.find(".groupNum").val(index);
                $this.find(".CNT_GRP_TITLE").prop("name", "CNT_GRP_TITLE" + index);
                $this.find(".CNT_GRP_COL").prop("name", "CNT_GRP_COL" + index);
                $this.find(".CNT_GRP_SORT").prop("name", "CNT_GRP_SORT" + index);
                $this.find(".CNT_PRD_MST_CD").prop("name", "CNT_PRD_MST_CD" + index);
            });
        }
        else
        {
            var $sectionForm = $("#productBox").find(".section-form");
            $sectionForm.each(function (index) {
                if(index + 1 > maxLength)
                {
                    $(this).remove();
                }
            });
        }
    };
	
});
hideDetailTypeInput = function(){
    $(".detailTypeImage").hide();
    $(".detailTypeEditor").hide();
    $(".detailTypeScript").hide();
};

changeDetailType = function(typeCode){
    hideDetailTypeInput();
    
    if(typeCode=="planType3"){
        $(".detailTypeImage").show();
    }
    else if (typeCode=="planType4"){
        $(".detailTypeEditor").show();
        showSmartEditor("CNT_MST_PC_BANNER", 300, 1);
        showSmartEditor("CNT_MST_MOBILE_BANNER", 300, 2);
    }
    else if (typeCode=="planType5"){
        $(".detailTypeScript").show();
    }
    detailType = typeCode;
};
fnResultTag = function(params){
	
	tagList = new Array();
	$(".tag_list").children().remove()
	$("#representTag").find("option").remove();
	for(var i=0;i<params.length;i++){
		$(".tag_list").append('<li class="sel_tag_list" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">'+ params[i].value +'<button type="button" class="btn_del">X</button></li>')
		$("#representTag").append('<option name="' + params[i].TAG_MST_ID + '">' + params[i].value + '</option>')
		tagList.push(params[i]);
	}
}
//태그 선택 버튼 클릭 이벤트
$(document).on("click", "#goTagPopUp", function () {
        popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do", "900", "500", "yes");
});
$(document).on("click", "#goVendorPopUp", function () {
    popup("<c:out value="${serverDomain}" />//am/site/searchBrandVendorPopup.do", "900", "500", "yes");
});

function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = --index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var index = $(el).parent().children()[2].value
	$tr.next().children()[7].children[2].value =index;
	$(el).parent().children()[2].value = ++index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}
$(document).on("click", ".btn_del", function() {
 	for(var i=0;i<tagList.length;i++){
 		if(tagList[i] + "X" == $(this).parent().text()){
 			tagList.splice(i,1);
 		 	$("#representTag option:eq(" + i + ")").remove()
 			break;
 		}
 	}
 	$(this).parent().remove();
 });
fnResultErpVendor = function(vdrNm,vdrIdx){
	$("#CNT_MST_REG_ID").val(vdrNm);
	$("#VDR_MST_IDX").val(vdrIdx);
	
};
fnGetSelectedTagList = function(){
	var selectedTagList = [];
	$(".sel_tag_list").each(function(){
		selectedTagList.push($(this).attr("value"));
	});    	
	return selectedTagList;
}
//-->
</script>

</body>
</html>
