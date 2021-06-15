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

 	<br>
 	${bindedTagList}
 	<br>
 	${pcListImage}
 	<br>
 	${mobileListImage}
 	<br>
 	${pcDetailImage}
 	<br>
 	${mobileDetailImage}
 	<br>
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
            <div class="section-form"><!-- section-form-a -->
                <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

                <table cellspacing="0" class="table-row table-a"><!-- table -->
                    <colgroup>
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>작성자</span></th>
                            <td>
                                ${sellerPickInfo.CNT_MST_REG_NM}
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>제목<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="text" class="text xlarge" value="${sellerPickInfo.CNT_MST_TITLE}">
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>설명<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <textarea cols="30" rows="10">${sellerPickInfo.CNT_MST_DESC}</textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span>
                                <a href="#none" id="openTagSelectPopup" class="button button-a small mt10">태그선택</a></label>
                            </th>
                            <td>
                                <ul class="tag_list tag_box" id="bindedTagList" style="width:100%;">
                                	<c:forEach items="${bindedTagList}" var="bindedTagOption" varStatus="i">
                                    	<li>${bindedTagOption.TAG_MST_TITLE}<button type="button" class="btn_del tagUnbind">X</button><input type="hidden" value="${bindedTagOption.TAG_MST_ID}"></li>
                                    </c:forEach>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <select class="select" id="majorTagList">
                                    <c:forEach items="${bindedTagList}" var="bindedTagOption" varStatus="i">
                                    	<option value="${bindedTagOption.TAG_MST_ID}">${bindedTagOption.TAG_MST_TITLE}</option>
                                    </c:forEach>
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
                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
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
                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
                                <p class="img-text">
                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                            <td>
                                <input type="radio" class="radio" id="planType3" name="PLN_MST_DETAIL_TYPE" checked="checked" onchange=changeDetailType(this.id) value="I"> <label for="planType3">이미지</label>
                                <input type="radio" class="radio" id="planType4" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="E"> <label for="planType4">에디터</label>
                                <input type="radio" class="radio" id="planType5" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="S"> <label for="planType5">스크립트</label>
                            </td>
                        </tr>

                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'P' && fileRow.CMM_FLE_SORT == '2'}">
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
	                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
	                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
	                                <p class="img-text">
	                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
	                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
	                                </p>
                                </td>
                            </tr>
                            <tr class="detailTypeImage" >
                                <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile1-list">
                                    <c:forEach items="${fileList}" var="fileRow" varStatus="i">
                                    <c:if test="${fileRow.CMM_FLE_TB_TYPE == 'M' && fileRow.CMM_FLE_SORT == '2'}">
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
	                                <input type="file" name="file1" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" data-accept="img" />
	                                <small class="desc">이미지 사이즈 : 000*000 / 업로드 가능 파일 : jpg, gif, png / 업로드 용량 : 1M</small>
	                                <p class="img-text">
	                                    <span>대체텍스트</span> <input type="text" value="${altTextP1}" name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
	                                    <input type="hidden" class="pcImgFile" name="CMN_FLE_ALT_TXT_P1_IDX" value="${altTextP1Idx}"/>
	                                </p>
                                </td>
                            </tr>


                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                     <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                                </td>
                            </tr>
                            <tr class="detailTypeEditor" style="display:none">
                                <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                     <textarea class="textarea xlarge" name="PLN_MST_MOBILE_BANNER" id="PLN_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                     <iframe frameborder="0" scrolling="no" style="width: 100%; height: 549px;" src="/smartEditor/SmartEditor2Skin.html"></iframe>
                                </td>
                            </tr>


                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="PLN_MST_PC_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr class="detailTypeScript" style="display:none">
                                <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <textarea name="PLN_MST_MOBILE_SCRIPT" rows="8" cols="80"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <th><span>전시여부</span></th>
                                <td>
                                    <input type="radio" name="ANA_ITM_DPL_YN" id="stateA" class="radio" value="Y" ${'Y' eq sellerPickInfo.CNT_MST_USE_YN ? 'checked' :''}/>
                                    <label for="stateA">전시</label>
                                    <input type="radio" name="ANA_ITM_DPL_YN" id="stateB" class="radio" value="N" ${'N' eq sellerPickInfo.CNT_MST_USE_YN ? 'checked' :''}/>
                                    <label for="stateB">미전시</label>
                                </td>
                            </tr>
                    </tbody>
                </table><!-- // table -->
            </div>
            </form>

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
                                        <a href="#none" id="goSpcCategoryDelete_P" class="button button-a small"><span>선택삭제</span></a>
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
                                        <c:choose>
							<c:when test="${not empty sellerPickProductInfo }">
								<c:forEach var="row" items="${sellerPickProductInfo}" varStatus="status">
									<tr>
                                        <td><a href="javascript:;"><c:out value="${row.CNT_PRD_MST_CD}"/></a></td>
                                        <td><img src="<c:out value="${cdnDomain}" /><c:out value="${row.PRD_MST_IMG_URL_PATH}" />" alt=""></td>
                                        <td><a href="javascript:;"><c:out value="${row.PRD_MST_NM }" /></a></td>
                                        <td><c:out value="${row.BND_MST_BRAND_NM }" /></td>
                                        <td><c:out value="${row.PRD_MST_PRC }" /></td>
                                        <jsp:useBean id="CodeToWordConverter" class="com.market.util.CodeToWordConverter"/>
                                        <td><c:out value="${CodeToWordConverter.productStatusToWord(row.PRD_MST_SEL_STATE)}" /></td>
                                        <td>
                                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                                        </td>
                                    </tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td class="td_no_result">${Code.COMMON_MESSAGE_SEARCH_RESULT_NONE_}</td>
								</tr>
							</c:otherwise>
						</c:choose>
                                            
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    </div><!-- //section-form addFormCon -->
                </div><!-- //id="product" -->
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
	$('#openTagSelectPopup').on('click',function(){
		window.open("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","openTagSelectPopup","width=900,height=700,scrollbars=yes,target=_blank");		
	});
	
	
	$('body').delegate('.tagUnbind','click',function() {
		$(this).parent().remove();
		var majorTagContainer = $('#majorTagList');
		var tagList = getAvailableMajorTagList();
		majorTagListRender(majorTagContainer,tagList);
	});
});

function fnResultTag(tagList){
	var majorTagContainer = $('#majorTagList');
	var container = $('#bindedTagList');
	tagListRender(container,tagList);
	majorTagListRender(majorTagContainer,tagList);
}
function majorTagListRender(container,tagList){
	container.empty();
	if(tagList<=0){return;}
	for(var tagIndex =0;tagIndex<tagList.length;tagIndex++){
		container.append('<option value="'+tagList[tagIndex].TAG_MST_ID+'">'+tagList[tagIndex].value+'</option>');
	}
}
function getAvailableMajorTagList(){
	var result = [];
	var listItems = $('#bindedTagList').children();
	if(listItems.length>0){
		for(var listIndex=0;listIndex<listItems.length;listIndex++){
			var obj = {};
			var item =  $(listItems[listIndex]);
			var text = item.text();
			obj.TAG_MST_ID = item.find('input').val();
			obj.value = text.substr(0,text.length-1);
			result.push(obj);
		}
	}
	return result;
}
function tagListRender(container,tagList){
	container.empty();
	for(var tagIndex =0;tagIndex<tagList.length;tagIndex++){
		container.append('<li>'+tagList[tagIndex].value+'<button type="button" class="btn_del tagUnbind">X</button><input type="hidden" value="'+tagList[tagIndex].TAG_MST_ID+'"/></li>');
	}
}

function changeDetailType(typeCode){
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

function hideDetailTypeInput(){
    $(".detailTypeImage").hide();
    $(".detailTypeEditor").hide();
    $(".detailTypeScript").hide();
};

//-->
</script>

</body>
</html>
