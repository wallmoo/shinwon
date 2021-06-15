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

                <h2 class="title"><span>기획전관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                <p>
                   <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                </p>
                <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
                        <input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
                </form>
                <form name="searchForm" id="searchForm">
                        <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                        <input type="hidden" name="searchPlnMstShopType" value="<c:out value="${commandMap.searchPlnMstShopType }"/>"/>
                        <input type="hidden" name="searchPlnMstTitle" value="<c:out value="${commandMap.searchPlnMstTitle }"/>"/>
                        <input type="hidden" name="searchPlnMstStDt" value="<c:out value="${commandMap.searchPlnMstStDt }"/>"/>
                        <input type="hidden" name="searchPlnMstEdDt" value="<c:out value="${commandMap.searchPlnMstEdDt }"/>"/>
                        <input type="hidden" name="searchPlnMstStatus" value="<c:out value="${commandMap.searchPlnMstStatus }"/>"/>
                        <input type="hidden" name="searchPlnMstUseYn" value="<c:out value="${commandMap.searchPlnMstUseYn }"/>"/>
                        <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                        <input type="hidden" name="rownum" value="0"/>
                </form>

                <form name="frm" id="frm" enctype="multipart/form-data">
                       <input type="hidden" name="PLN_MST_CHANNEL_PC_YN"     value="Y"/>
                       <input type="hidden" name="PLN_MST_CHANNEL_MOBILE_YN" value="Y"/>
                
                <div class="section-form"><!-- section-form-a -->
                    <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><label class="label"><span>작성자</span></label></th>
                                <td>
                                    <c:out value="${sessionAdmin.ADM_MST_ID }"/>(<c:out value="${sessionAdmin.ADM_MST_NM }"/>)
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>기획전형태<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="radio" class="radio" id="planType1" name="PLN_MST_TYPE" value = "A" checked onchange=changeType(this.id)> <label for="planType1">일반</label>
                                    <input type="radio" class="radio" id="planType2" name="PLN_MST_TYPE" value = "M" onchange=changeType(this.id)> <label for="planType2">매거진</label>
                                </td>
                            </tr>
                            <tr>
                                <th><label class="label"><span>기간<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="PLN_MST_ST_DT" name="PLN_MST_ST_DT" readonly="readonly" data-target-end="#PLN_MST_ED_DT"/>
                                   <select id="PLN_MST_ST_HH" name="PLN_MST_ST_HH" class="PLN_MST_ST_HH">
                                    <option value="">시</option>
                                    <c:forEach begin="0" end="23" step="1" varStatus="i">
                                        <c:set var="hh" value="${i.index}"/>
                                        <c:if test="${i.index < 10}">
                                            <c:set var="hh" value="0${i.index}"/>
                                        </c:if>
                                        <option value="${hh}" <c:if test="${hh eq '00' }">selected</c:if>>${hh}</option>
                                    </c:forEach>
                                    </select>

                                    <select id="PLN_MST_ST_MI" name="PLN_MST_ST_MI" class="PLN_MST_ST_MI">
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
                                    <input type="text" class="text" id="PLN_MST_ED_DT" name="PLN_MST_ED_DT"  readonly="readonly" data-target-start="#PLN_MST_ST_DT"/>
                                    <select id="PLN_MST_ED_HH" name="PLN_MST_ED_HH" class="PLN_MST_ED_HH">
                                    <option value="">시</option>
                                    <c:forEach begin="0" end="23" step="1" varStatus="i">
                                        <c:set var="hh" value="${i.index}"/>
                                        <c:if test="${i.index < 10}">
                                            <c:set var="hh" value="0${i.index}"/>
                                        </c:if>
                                        <option value="${hh}" <c:if test="${hh eq '23' }">selected</c:if> >${hh}</option>
                                    </c:forEach>
                                    </select>

                                    <select id="PLN_MST_ED_MI" name="PLN_MST_ED_MI" class="PLN_MST_ED_MI">
                                        <option value="">분</option>
                                        <c:forEach begin="0" end="59" step="1" varStatus="i">
                                            <c:set var="mm" value="${i.index}"/>
                                            <c:if test="${i.index < 10}">
                                                <c:set var="mm" value="0${i.index}"/>
                                            </c:if>
                                            <option value="${mm}" <c:if test="${mm eq '59' }">selected</c:if>>${mm}</option>
                                        </c:forEach>
                                     </select>
                                    <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 1,  '-');" class="button button-a xsmall"><span>내일</span></a>
                                    <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
                                    <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 0, 15,  '-');" class="button button-a xsmall"><span>15일</span></a>
                                    <a href="javascript:fnDateSet('PLN_MST_ST_DT', 'PLN_MST_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                </td>
                            </tr>

                            <tr>
                                <th><label class="label"><span>전시여부<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="radio" name="PLN_MST_USE_YN" id="stateA" class="radio" value="Y" checked="checked"/>
                                    <label for="stateA">전시</label>
                                    <input type="radio" name="PLN_MST_USE_YN" id="stateB" class="radio" value="N" />
                                    <label for="stateB">미전시</label>
                                </td>
                            </tr>

                            <tr>
                                <th><label class="label"><span>기획전명<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                      <input type="text" name="PLN_MST_TITLE" id="PLN_MST_TITLE" class="text xlarge"/>
                                </td>
                            </tr>

                            <tr class="normal">
                                <th><label class="label"><span>PC 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile1-list">
                                    </div>
                                    <input type="file" name="file" id="multiFile1" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                    <small class="desc">PC 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text"  name="CMN_FLE_ALT_TXT_P1" id="CMN_FLE_ALT_TXT_P1" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                    </p>
                                </td>
                            </tr>
                            <tr class="normal">
                                <th><label class="label"><span>MOBILE 목록 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <div id="multiFile3-list">
                                    </div>
                                    <input type="file" name="file2" id="multiFile4" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                    <small class="desc">MOBILE 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
                                    <p class="img-text">
                                        <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M1" id="CMN_FLE_ALT_TXT_M1" class="text xlarge" placeholder="20자 이내로 입력하세요."/>
                                    </p>
                                </td>
                            </tr>
                            <tr class="normal">
                                <th><label class="label"><span>상세타입<i class="require"><em>필수입력</em></i></span></label></th>
                                <td>
                                    <input type="radio" class="radio" id="planType3" name="PLN_MST_DETAIL_TYPE" checked="checked" onchange=changeDetailType(this.id) value="I"> <label for="planType3">이미지</label>
                                    <input type="radio" class="radio" id="planType4" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="E"> <label for="planType4">에디터</label>
                                    <input type="radio" class="radio" id="planType5" name="PLN_MST_DETAIL_TYPE" onchange=changeDetailType(this.id) value="S"> <label for="planType5">스크립트</label>
                                </td>
                            </tr>

                                <tr class="detailTypeImage normal" >
                                    <th><label class="label"><span>PC 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <div id="multiFile3-list">
                                        </div>
                                        <input type="file" name="file" id="multiFile2" class="file pcImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                        <small class="desc">PC 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
                                        <p class="img-text">
                                            <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_P2" id="CMN_FLE_ALT_TXT_P2" class="text xlarge pcImgFile" placeholder="20자 이내로 입력하세요." data-caption="대체텍스트"/>
                                        </p>
                                    </td>
                                </tr>
                                <tr class="detailTypeImage normal" >
                                    <th><label class="label"><span>MOBILE 상세 이미지<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <div id="multiFile3-list">
                                        </div>
                                        <input type="file" name="file2" id="multiFile5" class="file mobileImgFile" data-attach_cnt="1" accept=".jpg, .png" />
                                        <small class="desc">MOBILE 목록이미지 사이즈는 123 * 123 최적화 되어 있습니다.</small>
                                        <p class="img-text">
                                            <span>대체텍스트</span> <input type="text" name="CMN_FLE_ALT_TXT_M2" id="CMN_FLE_ALT_TXT_M2" class="text xlarge mobileImgFile" placeholder="20자 이내로 입력하세요."/>

                                        </p>
                                    </td>
                                </tr>


                                <tr class="detailTypeEditor normal" style="display:none" >
                                    <th><label class="label"><span>PC 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                         <textarea class="textarea xlarge" name="PLN_MST_PC_BANNER" id="PLN_MST_PC_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>                                         
                                    </td>
                                </tr>
                                <tr class="detailTypeEditor normal" style="display:none" >
                                    <th><label class="label"><span>MOBILE 에디터<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                         <textarea class="textarea xlarge" name="PLN_MST_MOBILE_BANNER" id="PLN_MST_MOBILE_BANNER" style="width: 95%; height: 500px; display: none;"></textarea>
                                    </td>
                                </tr>


                                <tr class="detailTypeScript normal" style="display:none">
                                    <th><label class="label"><span>PC 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <textarea id="PLN_MST_PC_SCRIPT" name="PLN_MST_PC_SCRIPT" rows="8" cols="80"></textarea>
                                    </td>
                                </tr>
                                <tr class="detailTypeScript normal" style="display:none">
                                    <th><label class="label"><span>MOBILE 스크립트<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <textarea id="PLN_MST_MOBILE_SCRIPT" name="PLN_MST_MOBILE_SCRIPT" rows="8" cols="80"></textarea>
                                    </td>
                                </tr>
                        </tbody>
                    </table><!-- // table -->


                    <div class="grid section-button-list">
                    <h3 class="title"><span>상품구성</span></h3>
                    <div class="text-right">
                        <a href="#none" id="addProductGroup" class="button small primary addProductGroup"><span>상품그룹추가</span></a>
                    </div>
                    </div>
                    <div id="productBox">
                        <div class="section-form addFormCon productSelectform normal" data-type="basic">
                            <input type="hidden" name="groupNum" class="groupNum" value="0"/>
                            <table cellspacing="0" class="table-row table-a"><!-- table -->
                                <colgroup>
                                    <col style="width: 15%;" />
                                    <col style="width: auto;" />
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th><label class="label"><span>그룹명<i class="require"><em>필수입력</em></i></span></label></th>
                                        <td>
                                            <input type="text" name="PLN_GRP_TITLE0" class="text long PLN_GRP_TITLE" maxlength="66"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label class="label"><span>진열개수<i class="require"><em>필수입력</em></i></span></label></th>
                                        <td>
                                            <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL0" id="stateGrpB" class="radio" value="4" checked="checked"/>
                                            <label for="stateGrpB">4열</label>
                                            <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL0" id="stateGrpC" class="radio" value="3" />
                                            <label for="stateGrpC">3열</label>
                                            <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL0" id="stateGrpD" class="radio" value="2" />
                                            <label for="stateGrpD">2열</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><label class="label"><span>전시순서<i class="require"><em>필수입력</em></i></span></label></th>
                                        <td>
                                            <input type="text" name="PLN_GRP_SORT0" class="text short PLN_GRP_SORT" value="1" maxlength="10" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <th><label class="label"><span>사용상품<i class="require"><em>필수입력</em></i></span></label></th>
                                        <td>
                                            <div class="text-right"">
                                                <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                                                <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                                            </div>
                                            <table class="core" style="width:100%;">
                                                <colgroup>
                                                    <col style="width: 5%;" />
                                                    <col style="width: 8%;" />
                                                    <col style="width: 15%;" />
                                                    <col style="width: auto;" />
                                                    <col style="width: 10%;" />
                                                    <col style="width: 10%;" />
                                                    <col style="width: 10%;" />
                                                    <col style="width: 8%;" />
                                                    <col style="width: 8%;" />
                                                    <col style="width: 12%;" />
                                                </colgroup>
                                                <thead>
                                                    <tr>
                                                        <th><input type="checkbox" class="checkbox checkAll" /></th>
                                                        <th>상품코드</th>
                                                        <th>이미지</th>
                                                        <th>상품명</th>
                                                        <th>입점업체</th>
                                                        <th>일반가</th>
                                                        <th>판매가</th>
                                                        <th>배송비</th>
                                                        <th>판매상태</th>
                                                        <th>전시순서</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="applyProductList">
                                                    <tr class="productNodata"><!-- row -->
                                                        <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <!-- 매거진 -->
                                    
                                    
                                    
                                    <!-- // 매거진 -->
                                    
                                </tbody>
                            </table>
                            </div><!-- //section-form addFormCon -->
                            
                           
                        </div><!-- //id="product" -->
                      
                    </div>
                

                <h3 class="title"><span>태그설정</span></h3>

                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" value="" />

                        <table cellspacing="0" class="table-row table-a"><!-- table -->
                            <colgroup>
                                <col style="width: 15%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><label class="label"><span>일반 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
										<p class="txt_warnning">태그 설정을 위해 '선택' 버튼을 클릭해 주세요.</p>
										<div class="tag_cloud_wrap_side">
											<div class="tag_cloud_wrap">
												<ul class="tag_cloud_list">
												</ul>
											</div>
											<button type="button" class="btn_tag_select">선택</button>
										</div>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label class="label"><span>대표 TAG<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <select id="representTag" name="TAG_BND_REP_ID" class="select">
                                            <option value="">선택</option>
                                        </select>
                                    </td>
                                </tr>
                            </tbody>
                        </table><!-- // table -->
                    </div>
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
<ui:editor objId="#PLN_MST_PC_BANNER" num="1"/>
<ui:editor objId="#PLN_MST_MOBILE_BANNER" num="2"/>
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>

<script id="categoryPcTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRowCatPc" name="CATGs" value="\${MGZ_MST_IDX}"/></td>
    <td class="left">\${CATEGORYNM}
        <input type="hidden" class="CATEGORYPCGB" name="CATEGORYPCGB" value="\${CATEGORYPCGB}"/>
        <input type="hidden" class="CATEGORYPC1" name="CATEGORYPC1" value="\${CATEGORYPC1}"/>
    </td>

</tr>
</script>
<script id="categoryMbTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRowCatMb" name="CATGs" value="\${MGZ_MST_IDX}"/></td>
    <td class="left">\${CATEGORYNM}
        <input type="hidden" class="CATEGORYMBGB" name="CATEGORYMBGB" value="\${CATEGORYMBGB}"/>
        <input type="hidden" class="CATEGORYMB1" name="CATEGORYMB1" value="\${CATEGORYMB1}"/>

    </td>

</tr>
</script>
<script id="productTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MST_CDs" value="\${PRD_MST_CD}"/></td>
    <td><a href="\${serverDomain}/am/product/basicProductEdit.do?PRD_MST_CD=\${PRD_MST_CD}" target="_blank" title="새 창 으로 열립니다.">\${PRD_MST_CD}</a><input type="hidden" class="PLN_PRD_MST_CD" name="PLN_PRD_MST_CD\${NUM}" value="\${PRD_MST_CD}"/></td>
	<td><img src="\${PRD_IMAGE}" alt="\${PRD_IMAGE_ALT}"></td>
    <td class="left"> <a href="\${FRONT_URL}/pc/product/product.do?prdMstCd=\${PRD_MST_CD}&ADMIN=Y" target="_blank">\${PRD_MST_NM}</a></td>
    <td>\${PRD_MST_VDR_NM}</td>
    <td>\${PRD_MST_PRC}</td>
    <td>\${PRD_NOW_DST_PRICE}</td>
    <td><span>\${PRD_MST_DLV_FEE}</span></td>
    <td>\${PRD_MST_SEL_STATE}</td>
  	<td>
    	<c:if test="${row.PLN_DTL_ORDER ne 1 }">
        <a href="javascript:;" class="row-sort" data-sort_type="up" onclick="moveUp(this)">△ </a>
        </c:if><c:if test="${row.PLN_DTL_ORDER ne fn:length(list) }">
        <a href="javascript:;" class="row-sort" data-sort_type="down" onclick="moveDown(this)"> ▽</a>
        </c:if>
		<input type="hidden" name="PLN_DTL_ORDER_\${NUM}_\${PRD_MST_CD}" value="\${PLN_DTL_ORDER}"></input>
    </td>
</tr>
</script>
<script id="productGroupTemplate" type="text/x-jquery-tmpl">
<div class="section-form addFormCon productSelectform normal" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<table cellspacing="0" class="table-row table-a"><!-- table -->
    <colgroup>
        <col style="width: 15%;" />
        <col style="width: auto;" />
    </colgroup>
    <tbody>
        <tr>
            <th><label class="label"><span>그룹명<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <input type="text" name="PLN_GRP_TITLE\${NUM}" class="text long PLN_GRP_TITLE" maxlength="66"/>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>진열개수</span></label></th>
            <td>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpB" class="radio" value="4" checked="checked"/>
                <label for="stateGrpB">4열</label>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpC" class="radio" value="3" />
                <label for="stateGrpC">3열</label>
                <input type="radio" class="select PLN_GRP_COL" name="PLN_GRP_COL\${NUM}" id="stateGrpD" class="radio" value="2" />
                <label for="stateGrpD">2열</label>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>전시순서</span></label></th>
            <td>
                <input type="text" name="PLN_GRP_SORT\${NUM}" class="text short PLN_GRP_SORT" value="1" maxlength="10" />
            </td>
        </tr>

        <tr>
            <th><label class="label"><span>사용상품<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <div class="text-right"">
                    <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                    <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                </div>
                <table class="core" style="width:100%;">
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>입점업체</th>
                            <th>일반가</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>판매상태</th>
                            <th>전시순서</th>
                        </tr>
                    </thead>
                    <tbody class="applyProductList">
                        <tr class="productNodata"><!-- row -->
                            <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>

    </tbody>
</table>
</div>
</script>
<script id="productGroupMagazineTemplate" type="text/x-jquery-tmpl">
<!--매거진 -->
<div class="section-form addFormCon productSelectform magazine" data-type="basic">
<input type="hidden" name="groupNum" class="groupNum" value="\${NUM}"/>
<table cellspacing="0" class="table-row table-a"><!-- table -->
    <colgroup>
        <col style="width: 15%;" />
        <col style="width: auto;" />
    </colgroup>
    <tbody>
        <tr>
            <th><label class="label"><span>전시순서</span></label></th>
            <td>
                <input type="text" name="PLN_GRP_SORT\${NUM}" class="text short PLN_GRP_SORT" value="1" maxlength="10" />
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>상품그룹설명<i class="require"><em>필수입력</em></i></span></label></th>
            <td>

                <input type="text" name="PLN_GRP_DESC\${NUM}" class="text large PLN_GRP_DESC" />
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>대표이미지<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <input type="radio" class="radio" name="img" checked="checked" >
				<label for="">이미지</label>
				<input type="radio" class="radio video" name="img" >
				<label for="">영상</label><br/>
				<input type="file" name="fileGroup\${NUM}" id="multiFileGroup\${NUM}" class="mfile pcImgFile" />
				<input type="text" style="display:none" name="PLN_GRP_URL\${NUM}" id="multiFileGroup\${NUM}" class="mfile pcVideoFile" data-attach_cnt="1"/>
            </td>
        </tr>
        <tr>
            <th><label class="label"><span>연관상품<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <div class="text-right"">
                    <a href="#none" class="button small goProductDelete"><span>선택삭제</span></a>
                    <a href="#none" class="button small primary search-product-popup" title="새 창 으로 열립니다."><span>상품검색</span></a>
                </div>
                <table class="core" style="width:100%;">
                    <colgroup>
                        <col style="width: 5%;" />
                        <col style="width: 8%;" />
                        <col style="width: 15%;" />
                        <col style="width: auto;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 10%;" />
                        <col style="width: 8%;" />
                        <col style="width: 8%;" />
                        <col style="width: 12%;" />
                    </colgroup>
                    <thead>
                        <tr>
                            <th><input type="checkbox" class="checkbox checkAll" /></th>
                            <th>상품코드</th>
                            <th>이미지</th>
                            <th>상품명</th>
                            <th>입점업체</th>
                            <th>일반가</th>
                            <th>판매가</th>
                            <th>배송비</th>
                            <th>판매상태</th>
                            <th>전시순서</th>
                        </tr>
                    </thead>
                    <tbody class="applyProductList">
                        <tr class="productNodata"><!-- row -->
                            <td colspan="10" class="text-center">상품을 선택해 주세요.</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
	</tboby>
	</table>
</div>
</script>
<script id="ttest" type="text/x-jquery-tmpl">
<tr>
            <th><label class="label"><span>태그설정<i class="require"><em>필수입력</em></i></span></label></th>
            <td>
                <ul class="tag_list tag_box">
                    <li>#오버핏<button type="button" class="btn_del">X</button></li>
                    <li>#신상품<button type="button" class="btn_del">X</button></li>
                    <li>#빈티지<button type="button" class="btn_del">X</button></li>
                    <li>#거울셀카<button type="button" class="btn_del">X</button></li>
                    <li>#streetstyle<button type="button" class="btn_del">X</button></li>
                    <li>#루즈핏<button type="button" class="btn_del">X</button></li>
                    <li>#고상한<button type="button" class="btn_del">X</button></li>
                    <li>#신상품1<button type="button" class="btn_del">X</button></li>
                    <li>#가을신상<button type="button" class="btn_del">X</button></li>
                    <li>#데일리룩<button type="button" class="btn_del">X</button></li>
                    <li>#ootd<button type="button" class="btn_del">X</button></li>
                    <li>#비오는날<button type="button" class="btn_del">X</button></li>
                    <li>#상큼한<button type="button" class="btn_del">X</button></li>
                    <li>#가을여행<button type="button" class="btn_del">X</button></li>
                    <li>#오버핏1<button type="button" class="btn_del">X</button></li>
                    <li>#신상품2<button type="button" class="btn_del">X</button></li>
                    <li>#빈티지1<button type="button" class="btn_del">X</button></li>
                    <li>#거울셀카1<button type="button" class="btn_del">X</button></li>
                    <li>#streetstyle1<button type="button" class="btn_del">X</button></li>
                    <li>#루즈핏1<button type="button" class="btn_del">X</button></li>
                    <li>#고상한1<button type="button" class="btn_del">X</button></li>
                    <li>#신상품3<button type="button" class="btn_del">X</button></li>
                    <li>#가을신상<button type="button" class="btn_del">X</button></li>
                    <li>#데일리룩1<button type="button" class="btn_del">X</button></li>
                    <li>#ootd<button type="button" class="btn_del">X</button></li>
                    <li>#비오는날1<button type="button" class="btn_del">X</button></li>
                    <li>#상큼한<button type="button" class="btn_del">X</button></li>
                    <li>#가을여행<button type="button" class="btn_del">X</button></li>
                </ul>
                <div class="section-button btn_Regist"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>선택</span></a>
                </div><!-- // section button -->
            </td>
        </tr>

    </tbody>
</table>
</div>
<!--//매거진 -->
</script>
<script>
detailType = "planType3"

$(function(){
	
    $("#PLN_MST_SECRET").hide();
    $("#secretLabel").hide();
	$(".magazine").hide();

    $("#searchPrdCtgPcEnv").hide();
    //$("#searchPrdCtgPcDepth3").hide();
    $("#searchPrdCtgPcDepth4").hide();

    $("#searchPrdCtgMbEnv").hide();
    //$("#searchPrdCtgMbDepth3").hide();
    $("#searchPrdCtgMbDepth4").hide();


     // 카테고리 설정
    if( $("#frm").find("input[name='searchPrdCtgPcEnv']").val() != ""){
        getCategoryList("searchPrdCtgPcDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgPcEnv}" />");
    }


     // 카테고리 설정
    if( $("#frm").find("input[name='searchPrdCtgMbEnv']").val() != ""){
        getCategoryList("searchPrdCtgMbDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${serverDomain}"/>", "<c:out value="${commandMap.searchPrdCtgMbEnv}" />");
    }


    // 카테고리 변경 이벤트

    getCategoryList("searchPrdCtgPcDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgPcEnv option:selected").val());
    getCategoryList("searchPrdCtgPcDepth2", "<c:out value="${commandMap.searchPrdCtgPcDepth1}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
    getCategoryList("searchPrdCtgPcDepth3", "<c:out value="${commandMap.searchPrdCtgPcDepth2}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
    getCategoryList("searchPrdCtgPcDepth4", "<c:out value="${commandMap.searchPrdCtgPcDepth3}" />", "<c:out value="${commandMap.searchPrdCtgPcDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());

    getCategoryList("searchPrdCtgMbDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${serverDomain}"/>" , $("#searchPrdCtgMbEnv option:selected").val());
    getCategoryList("searchPrdCtgMbDepth2", "<c:out value="${commandMap.searchPrdCtgMbDepth1}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth2}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
    getCategoryList("searchPrdCtgMbDepth3", "<c:out value="${commandMap.searchPrdCtgMbDepth2}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth3}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
    getCategoryList("searchPrdCtgMbDepth4", "<c:out value="${commandMap.searchPrdCtgMbDepth3}" />", "<c:out value="${commandMap.searchPrdCtgMbDepth4}" />", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());

	

    $(document).on("change", "#searchPrdCtgPcDepth1", function ()
    {
        getCategoryList("searchPrdCtgPcDepth2", $("#searchPrdCtgPcDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
        getCategoryList("searchPrdCtgPcDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
        getCategoryList("searchPrdCtgPcDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgPcDepth2", function ()
    {
        getCategoryList("searchPrdCtgPcDepth3", $("#searchPrdCtgPcDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
        getCategoryList("searchPrdCtgPcDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgPcDepth3", function ()
    {
        getCategoryList("searchPrdCtgPcDepth4", $("#searchPrdCtgPcDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgPcEnv option:selected").val());
    });

    $(document).on("click", ".goCategoryAdd", function () {
        var $topParent = $(this).parents(".section-form");

        var arrayObj = new Array();

        if($("#searchPrdCtgPcEnv").val() == ""){
            alert("PC/MOBILE 구분을 선택해 주십시오.");
            $("#searchPrdCtgPcEnv").focus();
            return;
        }
        if($("#searchPrdCtgPcDepth1").val() == ""){
            alert("카테고리1을 선택해 주십시오.");
            $("#searchPrdCtgPcDepth1").focus();
            return;
        }
   

        var obj = new Object();

        var CATEGORYPCGB = $("#searchPrdCtgPcEnv option:selected").val();
        var CATEGORYPC1 = $("#searchPrdCtgPcDepth1 option:selected").val();
        var CATEGORYPC2 = $("#searchPrdCtgPcDepth2 option:selected").val();
        var CATEGORYPC3 = $("#searchPrdCtgPcDepth3 option:selected").val();
        var CATEGORYPC4 = $("#searchPrdCtgPcDepth4 option:selected").val();
        var CATEGORYPCGBNM = $("#searchPrdCtgPcEnv option:selected").text();
        var CATEGORYPC1NM = $("#searchPrdCtgPcDepth1 option:selected").text();
        var CATEGORYPC2NM = $("#searchPrdCtgPcDepth2 option:selected").text();
        var CATEGORYPC3NM = $("#searchPrdCtgPcDepth3 option:selected").text();
        var CATEGORYPC4NM = $("#searchPrdCtgPcDepth4 option:selected").text();



        var CATEGORYNM = CATEGORYPC1NM;
        var CATEGORYPC = CATEGORYPC1;

        if(CATEGORYPC2 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC2NM;
        if(CATEGORYPC3 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC3NM;
        if(CATEGORYPC4 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYPC4NM;

        if(CATEGORYPC2 != "") CATEGORYPC = CATEGORYPC2;
        if(CATEGORYPC3 != "") CATEGORYPC = CATEGORYPC3;
        if(CATEGORYPC4 != "") CATEGORYPC = CATEGORYPC4;

        if(!fnCategoryPcDupChk(CATEGORYPC))
        {
            alert("이미 등록된 카테고리입니다.");
            $("#searchPrdCtgPcDepth1").focus();
            return;
        }

        obj.CATEGORYNM = CATEGORYNM;
        obj.CATEGORYPCGB = CATEGORYPCGB;
        obj.CATEGORYPC1 = CATEGORYPC;

        arrayObj.push(obj);

        $topParent.find(".categoryNodata").remove();

        $( "#categoryPcTemplate" ).tmpl( arrayObj ).appendTo($topParent.find(".applyCategoryPcList"));

    });

    $(document).on("change", "#searchPrdCtgMbDepth1", function ()
    {
        getCategoryList("searchPrdCtgMbDepth2", $("#searchPrdCtgMbDepth1 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
        getCategoryList("searchPrdCtgMbDepth3", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
        getCategoryList("searchPrdCtgMbDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgMbDepth2", function ()
    {
        getCategoryList("searchPrdCtgMbDepth3", $("#searchPrdCtgMbDepth2 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
        getCategoryList("searchPrdCtgMbDepth4", "", "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
    });
    $(document).on("change", "#searchPrdCtgMbDepth3", function ()
    {
        getCategoryList("searchPrdCtgMbDepth4", $("#searchPrdCtgMbDepth3 option:selected").val(), "", "<c:out value="${serverDomain}"/>", $("#searchPrdCtgMbEnv option:selected").val());
    });

    $(document).on("click", ".goCategoryMbAdd", function () {
        var $topParent = $(this).parents(".section-form");

        var arrayObj = new Array();

        if($("#searchPrdCtgMbEnv").val() == ""){
            alert("Mb/MOBILE 구분을 선택해 주십시오.");
            $("#searchPrdCtgMbEnv").focus();
            return;
        }
        if($("#searchPrdCtgMbDepth1").val() == ""){
            alert("카테고리1을 선택해 주십시오.");
            $("#searchPrdCtgMbDepth1").focus();
            return;
        }

        var obj = new Object();

        var CATEGORYMBGB = $("#searchPrdCtgMbEnv option:selected").val();
        var CATEGORYMB1 = $("#searchPrdCtgMbDepth1 option:selected").val();
        var CATEGORYMB2 = $("#searchPrdCtgMbDepth2 option:selected").val();
        var CATEGORYMB3 = $("#searchPrdCtgMbDepth3 option:selected").val();
        var CATEGORYMB4 = $("#searchPrdCtgMbDepth4 option:selected").val();
        var CATEGORYMBGBNM = $("#searchPrdCtgMbEnv option:selected").text();
        var CATEGORYMB1NM = $("#searchPrdCtgMbDepth1 option:selected").text();
        var CATEGORYMB2NM = $("#searchPrdCtgMbDepth2 option:selected").text();
        var CATEGORYMB3NM = $("#searchPrdCtgMbDepth3 option:selected").text();
        var CATEGORYMB4NM = $("#searchPrdCtgMbDepth4 option:selected").text();

        if(!fnCategoryMbDupChk(CATEGORYMB1,CATEGORYMB2,CATEGORYMB3,CATEGORYMB4))
        {
            alert("이미 등록된 카테고리입니다.");
            $("#searchPrdCtgMbDepth1").focus();
            return;
        }

        var CATEGORYNM = CATEGORYMB1NM;
        var CATEGORYMB = CATEGORYMB1;

        if(CATEGORYMB2 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB2NM;
        if(CATEGORYMB3 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB3NM;
        if(CATEGORYMB4 != "") CATEGORYNM = CATEGORYNM + " > "+CATEGORYMB4NM;

        if(CATEGORYMB2 != "") CATEGORYMB = CATEGORYMB2;
        if(CATEGORYMB3 != "") CATEGORYMB = CATEGORYMB3;
        if(CATEGORYMB4 != "") CATEGORYMB = CATEGORYMB4;


        obj.CATEGORYNM = CATEGORYNM;
        obj.CATEGORYMBGB = CATEGORYMBGB;
        obj.CATEGORYMB1 = CATEGORYMB;

        arrayObj.push(obj);

        $topParent.find(".categoryMbNodata").remove();

        $( "#categoryMbTemplate" ).tmpl( arrayObj ).appendTo($topParent.find(".applyCategoryMbList"));

    });

    $(document).on("click", "#PLN_MST_TYPE", function ()
    {
        var type = $(this).val();

        if(type!="S")
        {
            $("#PLN_MST_SECRET").hide();
            $("#secretLabel").hide();

        }
        else
        {
            $("#PLN_MST_SECRET").show();
            $("#secretLabel").show();
        }

    });
    //기획전 채널 선택
    $(document).on("click", "#PLN_MST_CHANNEL_PC_YN", function ()
    {
        if($(this).is(":checked") == true)
        {
            $(".pcImgDiv").show();
        }
        else
        {
            $(".pcImgDiv").hide();
        }
    });
    $(document).on("click", "#PLN_MST_CHANNEL_MOBILE_YN", function ()
    {
        if($(this).is(":checked") == true)
        {
            $(".mobileImgDiv").show();
        }
        else
        {
            $(".mobileImgDiv").hide();
        }
    });
    fnCategoryPcDupChk = function(selectObj1 ){

        var bReturn = true;

        var $categoryBox = $("#categoryTable");


        var $obj = $categoryBox.find(".applyCategoryPcList .CATEGORYPC1");

        $.each($obj, function(){
            if(selectObj1 == $(this).val()){

                bReturn = false;
            }
        });

        return bReturn;
    };

    fnCategoryMbDupChk = function(selectObj1){

        var bReturn = true;

        var $categoryBox = $("#categoryMbTable");


        var $obj = $categoryBox.find(".applyCategoryMbList .CATEGORYMB1");

        $.each($obj, function(){
            if(selectObj1 == $(this).val()){

                bReturn = false;
            }
        });

        return bReturn;
    };


    // 상품 검색 버튼 클릭 이벤트
    var $productBox = null;
    $(document).on("click", "#productBox .search-product-popup", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform");

        popup("<c:out value="${serverDomain}" />/am/product/searchProductPopup.do", "900", "500", "yes", "searchProduct");
    });
    
    //대표이미지 검색
    var $productBox = null;
    $(document).on("click", "#productBox .radio*", function () {
        // 해당 그룹의 최 상위 부모 Node
        $productBox = $(this).parents(".productSelectform*");
  
        if(this.classList.contains("video")){
        	$productBox.find(".pcImgFile").hide();
        	$productBox.find(".pcVideoFile").show();
        }else{
        	$productBox.find(".pcVideoFile").hide();
        	$productBox.find(".pcImgFile").show();
        }
    });

    //상품 중복체크
    fnDuplicationChk = function( selectObj ){
        var bReturn = true;
        var $obj = $productBox.find(".applyProductList .PLN_PRD_MST_CD");
        $.each($obj, function(){
            if(selectObj == $(this).val()){
                bReturn = false;
                return false;
            }
        });
        return bReturn;
    };

    // 상품구성 체크박스 클릭 이벤트
    $(document).on("change", "#productBox .form-group .checkAll", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyProductList");
        var $checkbox = $tbody.find(".checkRow");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);
            }
        }
    });

 // 카테고리구성 체크박스 클릭 이벤트
    $(document).on("change", ".checkAllCatPc", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyCategoryPcList");
        var $checkbox = $tbody.find(".checkRowCatPc");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);
            }
        }
    });

    $(document).on("change", ".checkAllCatMb", function () {
        var $this = $(this);
        var $tbody = $this.parents(".table-a").find(".applyCategoryMbList");
        var $checkbox = $tbody.find(".checkRowCatMb");
        if($checkbox.length == 0)
        {
            $this.prop("checked", false);
        }
        else
        {
            if($this.is(":checked"))
            {
                $checkbox.prop("checked", true);
            }
            else
            {
                $checkbox.prop("checked", false);
            }
        }
    });

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goCategoryPcDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRowCatPc:checked").length == 0)
        {
            alert("삭제할 카테고리를 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyCategoryPcList").children("tr").each(function() {

            if($(this).find(".checkRowCatPc").is(":checked"))
            {
                $(this).remove();
            }
        });

        if($topParent.find(".applyCategoryPcList").children("tr").length == 0)
        {
            $topParent.find(".applyCategoryPcList").append('<tr class="categoryNodata"><td colspan="2">등록된 카테고리가 없습니다.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAllCatPc").prop("checked", false);

    });

    // 사용상품 상품 선택삭제 이벤트
    $(document).on("click", ".goCategoryMbDelete", function () {

        var $topParent = $(this).parents(".section-form");
        if($topParent.find(".checkRowCatMb:checked").length == 0)
        {
            alert("삭제할 카테고리를 선택하여 주십시오.");
            return;
        }

        $topParent.find(".applyCategoryMbList").children("tr").each(function() {

            if($(this).find(".checkRowCatMb").is(":checked"))
            {
                $(this).remove();
            }
        });

        if($topParent.find(".applyCategoryMbList").children("tr").length == 0)
        {
            $topParent.find(".applyCategoryMbList").append('<tr class="categoryMbNodata"><td colspan="2">등록된 카테고리가 없습니다.</td></tr>');
        }
        //체크박스 전체 선택
        $topParent.find(".checkAllCatMb").prop("checked", false);

    });

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
        var len = $productBox.find(".applyProductList .PLN_PRD_MST_CD").length;

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
                obj.PRD_MST_VDR_NM            = item.PRD_MST_VDR_NM;
                obj.PLN_DTL_ORDER            = len;
				obj.PRD_NOW_DST_PRICE	=	setComma(item.PRD_NOW_DST_PRICE);
				obj.PRD_IMAGE = item.PRD_IMAGE;
				obj.PRD_IMAGE_ALT = item.PRD_IMAGE_ALT;
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

     // 사용상품 상품 선택삭제 이벤트
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

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/planList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
//      if($("#PLN_MST_GUBUN").val() == ""){
//          alert("구분을 선택해 주십시오.");
//          $("#PLN_MST_GUBUN").focus();
//          return;
//      }
		
 		oEditors1.getById["PLN_MST_PC_BANNER"].exec("FOCUS");
 		
       	var vaidationCheck = true
       	
        if($.trim($("#PLN_MST_TYPE").val()) == "S"&&$.trim($("#PLN_MST_SECRET").val()) == ""){
            alert("입장권번호를 입력해 주십시오.");
            $("#PLN_MST_SECRET").focus();
            return;
        }
        /*
        if(($("input:checkbox[id=PLN_MST_CHANNEL_PC_YN]").is(":checked") == false) && ($("input:checkbox[id=PLN_MST_CHANNEL_MOBILE_YN]").is(":checked") == false))
        {
            alert("[채널] 반드시 선택해 주십시오.");
            return;
        }
        */
        if($.trim($("#PLN_MST_ST_DT").val()) == ""){
            alert("기획전 시작일을 입력해 주십시오.");
            $("#PLN_MST_ST_DT").focus();
            return;
        }
        if($.trim($("#PLN_MST_ST_HH").val()) == ""){
            alert("기획전 시작 시간을 입력해 주십시오.");
            $("#PLN_MST_ST_HH").focus();
            return;
        }
        if($.trim($("#PLN_MST_ST_MI").val()) == ""){
            alert("기획전 시작 분을 입력해 주십시오.");
            $("#PLN_MST_ST_MI").focus();
            return;
        }


        if($.trim($("#PLN_MST_ED_DT").val()) == ""){
            alert("기획전 종료일을 입력해 주십시오.");
            $("#PLN_MST_ED_DT").focus();
            return;
        }
        if($.trim($("#PLN_MST_ED_HH").val()) == ""){
            alert("기획전 종료시간을 입력해 주십시오.");
            $("#PLN_MST_ED_HH").focus();
            return;
        }
        if($.trim($("#PLN_MST_ED_MI").val()) == ""){
            alert("기획전 종료 분을 입력해 주십시오.");
            $("#PLN_MST_ED_MI").focus();
            return;
        }
        if($.trim($("#PLN_MST_TITLE").val()) == ""){
            alert("기획전명을 입력해 주십시오.");
            $("#PLN_MST_TITLE").focus();
            return;
        }
		
        var today = getToday();
        var endDay = $.trim($("#PLN_MST_ED_DT").val()).replace(/\-/gi, "");

        if(endDay < today){
            alert("기획전 종료일은 현재 일자 이후여야 합니다.");
            $("#PLN_MST_ED_DT").focus();
            return;
        }
		
        //이미지 첨부 체크
        //PC
        //var fileLen = $("#multiFile1-list .MultiFile-title").length;
        //var fileLen2 = $("#multiFile2-list .MultiFile-title").length;

        //var file = $("input[name='file']").val();
        var file1 = $("#multiFile1").val();//PC목록이미지
        var file2 = $("#multiFile2").val();//PC상세이미지
        //var file3 = $("#multiFile3").val();
        var file4 = $("#multiFile4").val();//Mobile 목록 이미지
        var file5 = $("#multiFile5").val();//Mobile 상세 이미지

        //일반 validaation
        if($("#multiFile1").is(":visible")){
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
        	var type = $(":input:radio[name=PLN_MST_DETAIL_TYPE]:checked").val()
        	if(type=="I"){
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
 			}else if(type=="E"){
 				try { oEditors1.getById["PLN_MST_PC_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_PC_BANNER TEXTAREA의 VALUE 값으로 만든다.
	            try { oEditors2.getById["PLN_MST_MOBILE_BANNER"].exec("UPDATE_CONTENTS_FIELD", []);     } catch(e){ } //editor 내용을 PLN_MST_MOBILE_BANNER TEXTAREA의 VALUE 값으로 만든다.
 				if($('#PLN_MST_PC_BANNER').val() == "<p>&nbsp;</p>" ||$('#PLN_MST_PC_BANNER').val() == "&nbsp;"||$('#PLN_MST_PC_BANNER').val() == "" ){
 					alert('PC 에디터를 입력해 주십시오.')
 					return;
 				}
 				if($('#PLN_MST_MOBILE_BANNER').val() =="<p>&nbsp;</p>"||$('#PLN_MST_MOBILE_BANNER').val() == "&nbsp;"||$('#PLN_MST_MOBILE_BANNER').val() == ""){
 					alert("MOBILE 에디터를 입력해 주십시오.");
 					return;
 				}
 			}else if(type=="S"){
 				if($('textarea#PLN_MST_PC_SCRIPT').val()== ""){
 					alert('PC 스크립트를 입력해 주십시오.')
 					$('textarea#PLN_MST_PC_SCRIPT').focus()
 					return;
 				}
 				if($('textarea#PLN_MST_MOBILE_SCRIPT').val() == ""){
 					alert('MOBILE 스크립트를 입력해 주십시오.')
 					$('textarea#PLN_MST_MOBILE_SCRIPT').focus()
 					return;
 				}
 			} 
        	$(".PLN_GRP_TITLE").each(function(index,item){
            	if($(item).val() == "" ){
                	$(item).focus();
             		alert('그룹명을 입력해 주십시오.')
             		vaidationCheck = false
             		return false;
             	}
            })
			if(!vaidationCheck){ return; }
 			
             $(".applyProductList").each(function(){
                 if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
                 {
                     alert("[사용상품]상품을 추가해 주십시오.");
                     /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                     $(this).find(".search-product-popup").focus();
              		 vaidationCheck = false;
                     groupCheck = false;
                     return false;
                 }
             });
             if(!vaidationCheck){ return; }
        }else{
        	//매거진 validation
        	$(".PLN_GRP_DESC").each(function(){
                if($(this).val() == "")
                {
                	alert("상품그룹설명을 추가해 주십시오.")
                	$(this).focus();
                	vaidationCheck = false;
                	return false;
                }
            })
            if(!vaidationCheck){ return; }
            $(".mfile").each(function(){
            	 var urlPattern = /([a-z0-9\w]+\.*)+[a-z0-9]{2,4}/gi
           		if($(this).attr("type")=="text" && !urlPattern.test($(this).val()) && $(this).is(":visible")){
           			alert("영상 url형식을 맞춰주십시오.")
               		$(this).focus();
           			vaidationCheck = false;
   					return false;
           		}else if($(this).attr("type")=="file" && $(this).val() == "" && $(this).is(":visible")){
           			alert("대표이미지를 추가해 주십시오.")
            		$(this).focus();
                	vaidationCheck = false;
					return false;
           		}
            })
            if(!vaidationCheck){ return; }
        	$(".applyProductList").each(function(){
                if($(this).find(".checkRow").length <= 0 && $(this).is(":visible"))
                {
                    alert("[사용상품]상품을 추가해 주십시오.");
                    /* $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus(); */
                    $(this).find(".search-product-popup").focus();
                    vaidationCheck = false
                    groupCheck = false;
                    return false;
                }
            })
            if(!vaidationCheck){ return; }
        }

    	if($("#representTag").val() == ""){
        	alert("태그를 추가해 주십시오.")
        	return;
        }

        /* if(file2 != "" ){
            if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
                alert("PC 상세 이미지  대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_P2").focus();
                return;
            }
        } */

    /*  if(fileLen2 < 1){
            alert("PC 상세 이미지를 등록해 주십시오.");
            return;
        }else if($.trim($("#CMN_FLE_ALT_TXT_P2").val()) == ""){//대체텍스트 체크
            alert("PC 상세 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_P2").focus();
            return;
        } */


        //var fileLen = $("#multiFile3-list .MultiFile-title").length;
        //var fileLen2 = $("#multiFile4-list .MultiFile-title").length;
		
        /* if(file5 != ""){
            if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
                alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
                $("#CMN_FLE_ALT_TXT_M2").focus();
                return;
            }
        } */

        /* if(fileLen2 < 1){
            alert("MOBILE 상세 이미지를 등록해 주십시오.");
            return;
        }else if($.trim($("#CMN_FLE_ALT_TXT_M2").val()) == ""){//대체텍스트 체크
            alert("MOBILE 상세 이미지 대체 텍스트를 입력해 주십시오.");
            $("#CMN_FLE_ALT_TXT_M2").focus();
            return;
        } */
        
        var $groupTitle = $(".PLN_GRP_TITLE");
        var groupCheck = true;

       

//          $groupTitle.each(function () {
//              var $this = $(this);
//              if($this.val() == "")
//              {
//                  alert("[상품구성 제목]반드시 입력해 주십시오.");
//                  $this.focus();
//                  groupCheck = false;
//                  return false;
//              }
//              else
//              {
//                  var $formGroup = $this.parents(".form-group").next().next();
//                  var $table = $formGroup.find(".table-a");
//                  if($table.find(".checkRow").length <= 0)
//                  {
//                      alert("[사용상품]상품을 추가해 주십시오.");
//                      $formGroup.children().eq(1).children().eq(0).find(".search-product-popup").focus();
//                      groupCheck = false;
//                      return false;
//                  }
//              }
//          });
         if(groupCheck)
         {
             

             if (confirm("저장 하시겠습니까?"))
             {
                 $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/planRegist.do", "target" : "_self", "method" : "post"}).submit();
             }
         }
    });




    // 상품 그룹 추가 버튼 클릭 이벤트
    $(document).on("click", ".addProductGroup", function () {
       addProductGroup(); // 상품 그룹 추가
    });

     // 상품 그룹 추가
    function addProductGroup()
    {
        var $productBox = $("#productBox");
        var addLength = 1;

        var arrayObj = new Array();
        for(var i = 0 ; i < addLength ; i++)
        {
            var obj = new Object();
            obj.NUM = productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
            arrayObj.push(obj);
        }
        if($(":input:radio[name=PLN_MST_TYPE]:checked").val() == "M"){
            $("#productGroupMagazineTemplate").tmpl(arrayObj).appendTo($productBox);
        }else{
            $("#productGroupTemplate").tmpl(arrayObj).appendTo($productBox);
        }
    }

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
                $this.find(".PLN_GRP_TITLE").prop("name", "PLN_GRP_TITLE" + index);
                $this.find(".PLN_GRP_COL").prop("name", "PLN_GRP_COL" + index);
                $this.find(".PLN_GRP_SORT").prop("name", "PLN_GRP_SORT" + index);
                $this.find(".PLN_PRD_MST_CD").prop("name", "PLN_PRD_MST_CD" + index);
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

    // 상품 구성영역 체크
    productGroupCheck = function (checkLength, type, equal)
    {
        var $productBox = $("#productBox");
        var $sectionForm = $productBox.find(".section-form");
        var groupLength = $sectionForm.length;
        if(type == "max")
        {
            if(equal == "Y")
            {
                if(groupLength >= checkLength) return true;
                else return false;
            }
            else
            {
                if(groupLength > checkLength) return true;
                else return false;
            }
        }
        else
        {
            if(equal == "Y")
            {
                if(groupLength <= checkLength) return true;
                else return false;
            }
            else
            {
                if(groupLength < checkLength) return true;
                else return false;
            }
        }
    };
});

goPopupProductPlan = function (prdMstCd)
{

    popup('',"2000","700","yes","_productPlanPopup");

    $("#searchPrdMstCd").val( prdMstCd );

    $("#frmProductPlanPopup").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/searchProductPlanPopup.do", "target":"popup_productPlanPopup", "method":"post"}).submit();

};
//파일 삭제 check box 변경 이벤트
$(document).on("change", ".PLN_GRP_TYPE", function () {
    var $this = $(this);
    var fileName = $(this).data("file_name");

        var type = $(this).val();

    if(type=="I")
    {
        $("input[name='"+ fileName +"']").prop("disabled", false);
    }
    else
    {
        $("input[name='"+ fileName +"']").val("");
        $("input[name='"+ fileName +"']").prop("disabled", true);
    }
});

getToday = function ()
{
    var dateObj = new Date();
    var year = dateObj.getFullYear();
    var month = dateObj.getMonth()+1;
    if(month < 10)month = "0"+month;
    var day = dateObj.getDate();
    if(day < 10)day = "0"+day;
    var today = year + month + day;
    return today;
};


dplClick= function(va){
    if(va == 'Y'){
        $("#prdTypeDiv").show();
    }else{
        $("#prdTypeDiv").hide();
    }
    return false;
};

//태그 선택 버튼 클릭 이벤트
$(document).on("click", ".btn_tag_select",function() {
	popup("<c:out value="${serverDomain}" />/am/tag/searchTagGroupPopup.do","900", "500", "yes");
});

fnResultTag = function(params) {
	$(".tag_cloud_list").children().remove()
	$("#representTag").find("option").remove();
	for (var i = 0; i < params.length; i++) {
		$(".tag_cloud_list").append('<li class="sel_tag_list txt" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'">' + params[i].value + '<button type="button" class="btn_del">X</button><input type="hidden" name="TAG_MST_ID" value="' + params[i].TAG_MST_ID +'"/></li>').parents('.tag_cloud_wrap_side').siblings('.txt_warnning').hide();
		$("#representTag").append('<option value="' + params[i].TAG_MST_ID + '"name="'+ params[i].TAG_MST_ID +'">'+ params[i].value + '</option>');
	}
}
$(document).on("click", ".btn_del", function() {
	var tagLangth = $('.tag_cloud_list > li').length;
	if (tagLangth <= 1) {
		$('.tag_cloud_wrap_side').siblings('.txt_warnning').show();
		$("#representTag").append('<option value="선택" selected>선택</option>');
	}
	var origin = $(this).parent();
	$('.tag_cloud_list li').each(function(index, item) {
		if ($(this).attr('value') == origin.attr('value')) {
			$(this).remove();
			$("#representTag option:eq(" + index + ")").remove();
			return false;
		}
	})
});

 
function moveUp(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소

	var index = $(el).parent().children()[2].value
	$tr.prev().children()[9].children[2].value =index;
	$(el).parent().children()[2].value = --index;
	
	$tr.prev().before($tr); // 현재 tr 의 이전 tr 앞에 선택한 tr 넣기
}

function moveDown(el){
	var $tr = $(el).parent().parent(); // 클릭한 버튼이 속한 tr 요소
	var index = $(el).parent().children()[2].value
	$tr.next().children()[9].children[2].value =index;
	$(el).parent().children()[2].value = ++index;
	$tr.next().after($tr); // 현재 tr 의 다음 tr 뒤에 선택한 tr 넣기
}
hideTypeInput = function(){
    $(".normal").hide();
    $(".magazine").hide();
};
changeType = function(typeCode){
    
    var $productBox = $("#productBox");
    var addLength = 1;

    var arrayObj = new Array();
    $productBox.empty();
    for(var i = 0 ; i < addLength ; i++)
    {
        var obj = new Object();
        obj.NUM = productGroupCheck(0, "min", "Y") ? i : $productBox.find(".section-form").length;
        arrayObj.push(obj);
    }
    if($(":input:radio[name=PLN_MST_TYPE]:checked").val() == "M"){
        $("#productGroupMagazineTemplate").tmpl(arrayObj).appendTo($productBox);
        $(".normal").hide();
    }else{
        $("#productGroupTemplate").tmpl(arrayObj).appendTo($productBox);
        $(".normal").show();
        changeDetailType("planType3")
    }
};

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
        showSmartEditor("PLN_MST_PC_BANNER", 300, 1);
        showSmartEditor("PLN_MST_MOBILE_BANNER", 300, 2);
        
    }
    else if (typeCode=="planType5"){
        $(".detailTypeScript").show();
    }
    detailType = typeCode;
};
changeMediaType = function(typeCode){
	if($(":input:file[class=pcVideoFile]:checked").val() == "on"){
        $(".pcVideoFile").hide();
    }else{
    	$(".pcImgFile").hide();
    }
};
</script>

</body>
</html>
