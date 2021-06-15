a<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
<link
	href="<c:out value="${serverDomain}" />/am/js/plugins/fine-uploader/fine-uploader-gallery.css"
	rel="stylesheet">
<style type="text/css">

</style>
</head>
<body>
	<!-- body class, 중요 -->

	<div id="header">
		<!-- header -->
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</div>
	<!-- // header -->

	<div id="container">
		<!-- container -->

		<div id="aside" class="aside left">
			<!-- aside -->
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
		</div>
		<!-- // aside -->

		<div id="wrapper">
			<!-- wrapper -->

			<div id="breadcrumb"></div>
			<!-- breadcrumb -->

			<div id="contents">
				<!-- contents -->

				<div class="container">

					<h2 class="title">
						<span>상품등록</span>
					</h2>

					<form id="searchForm" name="searchForm">
						<input type="hidden" name="searchPrdMstCd"
							value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> <input
							type="hidden" name="searchPrdMstNm"
							value="<c:out value="${commandMap.searchPrdMstNm }"/>" /> <input
							type="hidden" name="searchPrdCtgIdx"
							value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" /> <input
							type="hidden" name="searchPrdCtgEnv"
							value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth1"
							value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth2"
							value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth3"
							value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth4"
							value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" /> <input
							type="hidden" name="searchPrdMstSellState"
							value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
						<input type="hidden" name="searchPrdMstDplState"
							value="<c:out value="${commandMap.searchPrdMstDplState }"/>" /> <input
							type="hidden" name="searchPrdMstApvState"
							value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
						<input type="hidden" name="searchPrdMstMdId"
							value="<c:out value="${commandMap.searchPrdMstMdId }"/>" /> <input
							type="hidden" name="cPage"
							value="<c:out value="${commandMap.cPage }"/>" /> <input
							type="hidden" name="searchDetailY"
							value="<c:out value="${commandMap.searchDetailY }"/>" /> <input
							type="hidden" name="searchYn"
							value="<c:out value="${commandMap.searchYn }"/>" /> <input
							type="hidden" name="pageSize"
							value="<c:out value="${commandMap.pageSize }"/>" /> <input
							type="hidden" id="PRD_CTG_ENV" name="PRD_CTG_ENV"
							value="${commandMap.PRD_CTG_ENV}" /> <input type="hidden"
							id="PRD_SPC_ENV" name="PRD_SPC_ENV"
							value="${commandMap.PRD_SPC_ENV}" /> <input type="hidden"
							id="PRD_SPC_TYPE" name="PRD_SPC_TYPE" /> <input type="hidden"
							id="PRD_CTG_BRAND" name="PRD_CTG_BRAND" value="" />
					</form>

					<div class="push-guide instant">
						<!-- push-guide -->
						<i class="icon">
							<!-- icon -->
						</i>
						<h3 class="title">
							<span>기본정보 (<i class="require"><em>필수입력</em></i> 필수항목)
							</span>
						</h3>
					</div>
					<!-- // push-guide -->

					<form id="frm" name="frm" enctype="multipart/form-data">
						<input type="hidden" name="searchPrdMstCd"
							value="<c:out value="${commandMap.searchPrdMstCd }"/>" /> <input
							type="hidden" name="searchPrdMstNm"
							value="<c:out value="${commandMap.searchPrdMstNm }"/>" /> <input
							type="hidden" name="searchPrdCtgIdx"
							value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" /> <input
							type="hidden" name="searchPrdCtgEnv"
							value="<c:out value="${commandMap.searchPrdCtgEnv }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth1"
							value="<c:out value="${commandMap.searchPrdCtgDepth1 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth2"
							value="<c:out value="${commandMap.searchPrdCtgDepth2 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth3"
							value="<c:out value="${commandMap.searchPrdCtgDepth3 }"/>" /> <input
							type="hidden" name="searchPrdCtgDepth4"
							value="<c:out value="${commandMap.searchPrdCtgDepth4 }"/>" /> <input
							type="hidden" name="searchPrdMstSellState"
							value="<c:out value="${commandMap.searchPrdMstSellState }"/>" />
						<input type="hidden" name="searchPrdMstDplState"
							value="<c:out value="${commandMap.searchPrdMstDplState }"/>" /> <input
							type="hidden" name="searchPrdMstApvState"
							value="<c:out value="${commandMap.searchPrdMstApvState }"/>" />
						<input type="hidden" name="searchPrdMstMdId"
							value="<c:out value="${commandMap.searchPrdMstMdId }"/>" /> <input
							type="hidden" name="searchDetailY"
							value="<c:out value="${commandMap.searchDetailY }"/>" /> <input
							type="hidden" name="searchYn"
							value="<c:out value="${commandMap.searchYn }"/>" /> <input
							type="hidden" name="cPage"
							value="<c:out value="${commandMap.cPage }"/>" /> <input
							type="hidden" name="pageSize"
							value="<c:out value="${commandMap.pageSize }"/>" /> <input
							type="hidden" id="PRD_MST_CD" name="PRD_MST_CD" value="" /> <input
							type="hidden" id="OLD_PRD_MST_CD" name="OLD_PRD_MST_CD"
							value="<c:out value="${productInfo.PRD_MST_CD }"/>" /> <input
							type="hidden" id="product_image_env" name="product_image_env"
							value="" />
						<!-- 상품 이미지 순번 정보 - 팝업 등록에서 사용함 -->
						<input type="hidden" name="PRD_FILE_NAME"
							value="<c:out value="${commandMap.PRD_FILE_NAME }"/>" />
						<!-- 상품 이미지 파일명 - 팝업 등록에서 사용함 -->
						<input type="hidden" id="pathType" name="pathType" value="product" />
						<input type="hidden" id="CTG_PATH" name="CTG_PATH" value="" /> <input
							type="hidden" name="PRD_MST_DLV_BND" value="0" />
						<!-- 묵음배송여부 0 : no -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
                                <tr>
									<th><span>상품유형<i class="require"><em>필수입력</em></i></span></th>
									<td colspan="3"><select name="PRD_MST_TYPE" id="PRD_MST_TYPE"
										class="select">
											<option value="G"
												<ui:select v="${productInfo.PRD_MST_TYPE}" t="G" g="selected"/>>일반</option>
											<option value="P"
												<ui:select v="${productInfo.PRD_MST_TYPE}" t="P" g="selected"/>>패키지</option>
									</select><br /> <em class="strong">(상품 등록 후에 수정이 불가능한 항목입니다.)</em>
                                    <br />
                                        <ul class="productList tag_list tag_box">
                                            <li>
                                                폭스 퍼 히든 버튼 덕다운<button class="btn_del">X</button>
                                            </li>
                                            <li>
                                                폭스 퍼 히든 버튼 덕다운<button class="btn_del">X</button>
                                            </li>
                                        </ul>
                                        <div class="section-button btn_Regist">
                                        <!-- section button -->
                                            <a
                                            href="#none" class="button small search-product-popup"
                                            title="새 창 으로 열립니다."><span>상품찾기</span></a>
                                            <a
                                            href="#none" class="button goCategoryPcDelete"><span>상품지우기</span></a>
                                        </div>
                                    </td>
                                </tr>
								<tr>
									<th><span>온라인상품코드 </span></th>
									<td><em class="strong">시스템 자동생성</em></td>
									<th><span>상품명<i class="require"><em>필수입력</em></i></span></th>
									<td><input type="text" id="PRD_MST_NM" name="PRD_MST_NM"
										class="text" style="width: 70%"
										value="<c:out value="${productInfo.PRD_MST_NM }" />"
										maxlength="150" /> <br />
									<em class="strong">(공백포함 최대 100자이내로 입력해주세요.)</em></td>
								</tr>
                                <tr>
									<th><span>판매가능수량 <i class="require"><em>필수입력</em></i></span></th>
									<td>
                                        <div>
                                            <span style="display:inline-block;width:80px">묶음상품 1</span> <input type="text" id="PRD_MST_SEL_CNT"
    										name="PRD_MST_SEL_CNT" class="number text short"
    										value="<fmt:formatNumber value="${productInfo.PRD_MST_SEL_CNT }" groupingUsed="true" />"
    										maxlength="9" /> 개
                                        </div>
                                        <div class="mt10">
                                            <span style="display:inline-block;width:80px">묶음상품 2</span> <input type="text" id="PRD_MST_SEL_CNT" name="PRD_MST_SEL_CNT" class="number text short" value="<fmt:formatNumber value="${productInfo.PRD_MST_SEL_CNT }" groupingUsed="true" />" maxlength="9" /> 개
                                        </div>
                                    </td>
									<th><span>쿠폰적용여부</span></th>
									<td colspan="3"><select name="PRD_MST_CPN_YN" id="PRD_MST_CPN_YN"
										class="select">
											<option value="N"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="N" g="selected"/>>NO</option>
											<option value="Y"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="Y" g="selected"/>>YES</option>
									</select></td>
								</tr>
								<tr>
                                    <th><span>O2O 여부<i class="require"><em>필수입력</em></i></span></th>
									<td colspan="3"><select name="PRD_MST_CPN_YN" id="PRD_MST_CPN_YN"
										class="select">
											<option value="N"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="N" g="selected"/>>NO</option>
											<option value="Y"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="Y" g="selected"/>>YES</option>
									</select></td>
                                </tr>
                                <tr>
									<th><span>네이버 쇼핑<i class="require"><em>필수입력</em></i></span></th>
									<td><select class="select">
											<option>연동함</option>
											<option>연동안함</option>
									</select></td>
									<th><span>다음 쇼핑하우<i class="require"><em>필수입력</em></i></span></th>
									<td><select class="select">
											<option>연동함</option>
											<option>연동안함</option>
									</select></td>
								</tr>
								<tr>
									<th><span>임직원 할인<i class="require"><em>필수입력</em></i></span></th>
									<td><select name="PRD_MST_CPN_YN" id="PRD_MST_CPN_YN"
										class="select">
											<option value="N"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="N" g="selected"/>>NO</option>
											<option value="Y"
												<ui:select v="${productInfo.PRD_MST_CPN_YN}" t="Y" g="selected"/>>YES</option>
									</select></td>
									<th><span>제휴사 할인<i class="require"><em>필수입력</em></i></span></th>
									<td><select name="PRD_MST_O2O_YN" id="PRD_MST_O2O_YN"
										class="select">
											<option value="N"
												<ui:select v="${productInfo.PRD_MST_O2O_YN}" t="N" g="selected"/>>NO</option>
											<option value="Y"
												<ui:select v="${productInfo.PRD_MST_O2O_YN}" t="Y" g="selected"/>>YES</option>
									</select></td>
								</tr>
								<tr>
									<th><span>시즌정보<i class="require"><em>필수입력</em></i>
									</span></th>
									<td><span style="padding-right: 40px;">연도</span> <select
										class="select">
											<option>선택</option>
											<option>2020</option>
											<option>2019</option>
									</select><br /> <span style="padding-right: 40px;">시즌</span> <select
										class="select" style="margin-top: 2px;">
											<option>전체</option>
											<option>F/W</option>
											<option>S/S</option>
									</select></td>
									<th><span>성별</span></th>
									<td><select class="select">
											<option>선택</option>
											<option>남</option>
											<option>여</option>
									</select></td>
								</tr>
								<tr>
									<th><span>포장<i class="require"><em>필수입력</em></i>
									</span></th>
									<td colspan="3"><select class="select">
											<option>NO</option>
											<option>YES</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->

						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>상품가격 (<i class="require"><em>필수입력</em></i> 필수항목)
								</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>일반가(Tag가) <i class="require"><em>필수입력</em></i></span></th>
									<td><input type="text" id="PRD_MST_PRC" name="PRD_MST_PRC"
										class="number text large"
										value="<fmt:formatNumber value="${productInfo.PRD_MST_PRC }" groupingUsed="true" />"
										maxlength="9" /></td>
									<th><span>할인율 <i class="require"><em>필수입력</em></i></span></th>
									<td><input type="text" id="PRD_MST_CPR_PRC1"
										name="PRD_MST_CPR_PRC1" class="number text large"
										value="<fmt:formatNumber value="${productInfo.PRD_MST_CPR_PRC1 }" groupingUsed="true" />"
										maxlength="9" /></td>
								</tr>
								<tr>
									<th><span>판매가</span></th>
									<td colspan="3"><input type="text" id="" name=""
										class="number text large"
										value="<fmt:formatNumber value="${productInfo.PRD_MST_PKG_PRC }" groupingUsed="true" />"
										disabled /></td>
								</tr>
								<tr>
									<th><span>수수료</span></th>
									<td><select>
											<option>브랜드 기본마진</option>
											<option>직접설정</option>
									</select> <input type="text" id="PRD_MST_SCH_PRC" name="PRD_MST_SCH_PRC"
										class="number text large"
										value="<fmt:formatNumber value="${productInfo.PRD_MST_SCH_PRC }" groupingUsed="true" />"
										maxlength="9" /> %</td>
									<th><span>수수료 기간</span></th>
									<td><a href="javascript:;" class="js-datepickr"><span
											class="icon datepickr"><em>날짜선택</em></span></a> <input
										type="text" class="text date"
										id="PRD_MST_ICN_ST_DT_${iconCnt}"
										name="PRD_MST_ICN_ST_DT${iconCnt}"
										value="<c:out value="${PRD_MST_ICN_ST_DT[iconCnt -1] }" />"
										readonly="readonly"
										data-target-end="#PRD_MST_ICN_ED_DT${iconCnt}" /> ~ <a
										href="javascript:;" class="js-datepickr"><span
											class="icon datepickr"><em>날짜선택</em></span></a> <input
										type="text" class="text date"
										id="PRD_MST_ICN_ED_DT_${iconCnt}"
										name="PRD_MST_ICN_ED_DT${iconCnt}"
										value="<c:out value="${PRD_MST_ICN_ED_DT[iconCnt -1] }" />"
										readonly="readonly"
										data-target-start="#PRD_MST_ICN_ST_DT_${iconCnt}" /></td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->

						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>태그설정 (<i class="require"><em>필수입력</em></i> 필수항목)
								</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><label class="label"><span>일반 TAG<i
												class="require"><em>필수입력</em></i></span></label></th>
									<td>
										<ul class="tag_list tag_box">
											<li>#오버핏
												<button class="btn_del">X</button>
											</li>
											<li>#신상품
												<button class="btn_del">X</button>
											</li>
											<li>#빈티지
												<button class="btn_del">X</button>
											</li>
											<li>#거울셀카
												<button class="btn_del">X</button>
											</li>
											<li>#streetstyle
												<button class="btn_del">X</button>
											</li>
											<li>#루즈핏
												<button class="btn_del">X</button>
											</li>
											<li>#고상한
												<button class="btn_del">X</button>
											</li>
											<li>#신상품1
												<button class="btn_del">X</button>
											</li>
											<li>#가을신상
												<button class="btn_del">X</button>
											</li>
											<li>#데일리룩
												<button class="btn_del">X</button>
											</li>
											<li>#ootd
												<button class="btn_del">X</button>
											</li>
											<li>#비오는날
												<button class="btn_del">X</button>
											</li>
											<li>#상큼한
												<button class="btn_del">X</button>
											</li>
											<li>#가을여행
												<button class="btn_del">X</button>
											</li>
											<li>#오버핏1
												<button class="btn_del">X</button>
											</li>
											<li>#신상품2
												<button class="btn_del">X</button>
											</li>
											<li>#빈티지1
												<button class="btn_del">X</button>
											</li>
											<li>#거울셀카1
												<button class="btn_del">X</button>
											</li>
											<li>#streetstyle1
												<button class="btn_del">X</button>
											</li>
											<li>#루즈핏1
												<button class="btn_del">X</button>
											</li>
											<li>#고상한1
												<button class="btn_del">X</button>
											</li>
											<li>#신상품3
												<button class="btn_del">X</button>
											</li>
											<li>#가을신상
												<button class="btn_del">X</button>
											</li>
											<li>#데일리룩1
												<button class="btn_del">X</button>
											</li>
											<li>#ootd
												<button class="btn_del">X</button>
											</li>
											<li>#비오는날1
												<button class="btn_del">X</button>
											</li>
											<li>#상큼한
												<button class="btn_del">X</button>
											</li>
											<li>#가을여행
												<button class="btn_del">X</button>
											</li>
										</ul>
										<div class="section-button btn_Regist">
											<!-- section button -->
											<a href="#none" id="goRegist" class="button button-b"><span>선택</span></a>
										</div>
										<!-- // section button -->
									</td>
								</tr>
								<tr>
									<th><label class="label"><span>대표 TAG<i
												class="require"><em>필수입력</em></i></span></label></th>
									<td><select class="select">
											<option value="">선택</option>
									</select></td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->

						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>전시정보 (<i class="require"><em>필수입력</em></i> 필수항목)
								</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>쇼핑채널 <i class="require"><em>필수입력</em></i></span></th>
									<td><input type="checkbox" class="checkbox"
										name="PRD_MST_CNL_PC_YN" id="PRD_MST_CNL_PC_YN" value="Y"
										<ui:select v="${productInfo.PRD_MST_CNL_PC_YN }" t="Y" g="checked"/> /><label
										for="PRD_MST_CNL_PC_YN"> PC</label> <input type="checkbox"
										class="checkbox" name="PRD_MST_CNL_MB_YN"
										id="PRD_MST_CNL_MB_YN" value="Y"
										<ui:select v="${productInfo.PRD_MST_CNL_MB_YN }" t="Y" g="checked"/> /><label
										for="PRD_MST_CNL_MB_YN"> MOBILE</label></td>
									<th><span>판매상태 </span></th>
									<td><select class="select" id="PRD_MST_SEL_STATE"
										name="PRD_MST_SEL_STATE">
											<option
												value="<c:out value="${Code.PRODUCT_SELL_STATE_ING }" />"
												<ui:select v="${productInfo.PRD_MST_SEL_STATE }" t="${Code.PRODUCT_SELL_STATE_ING }" g="selected"/>>판매중</option>
											<option
												value="<c:out value="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" />"
												<ui:select v="${productInfo.PRD_MST_SEL_STATE }" t="${Code.PRODUCT_SELL_STATE_OP_TEMPOUT }" g="selected"/>>일시품절</option>
											<option
												value="<c:out value="${Code.PRODUCT_SELL_STATE_TEMPOUT }" />"
												<ui:select v="${productInfo.PRD_MST_SEL_STATE }" t="${Code.PRODUCT_SELL_STATE_TEMPOUT }" g="selected"/>>품절상품</option>
											<option
												value="<c:out value="${Code.PRODUCT_SELL_STATE_STOP }" />"
												<ui:select v="${productInfo.PRD_MST_SEL_STATE }" t="${Code.PRODUCT_SELL_STATE_STOP }" g="selected"/>>미판매</option>
									</select></td>
								</tr>
								<tr>
									<th><span>진열상태</span></th>
									<td><select class="select" id="PRD_MST_DPL_STATE"
										name="PRD_MST_DPL_STATE">
											<option value="Y"
												<ui:select v="${productInfo.PRD_MST_DPL_STATE }" t="Y" g="selected"/>>YES</option>
											<option value="N"
												<ui:select v="${productInfo.PRD_MST_DPL_STATE }" t="N" g="selected"/>>NO</option>
									</select></td>
									<th><span>승인상태</span></th>
									<td><select class="select" id="PRD_MST_APV_STATE"
										name="PRD_MST_APV_STATE">
											<option value="A"
												<ui:select v="${productInfo.PRD_MST_APV_STATE }" t="A" g="selected"/>>승인</option>
											<option value="D"
												<ui:select v="${productInfo.PRD_MST_APV_STATE }" t="D" g="selected"/>>대기</option>
											<option value="C"
												<ui:select v="${productInfo.PRD_MST_APV_STATE }" t="C" g="selected"/>>거절</option>
									</select></td>
								</tr>
								<tr id="pc_category">
									<th><span>PC카테고리 <i class="require"><em>필수입력</em></i></span></th>
									<td colspan="3">
										<div id="divCategory">
											<!-- 카테고리 -->
											<div class="text-right">
												<!-- section button -->
												<a href="#none"
													id="goCategoryDelete_${Code.CATEGORY_TYPE_PC}"
													class="button button-a small"><span>선택삭제</span></a> <a
													id="goCategoryPopup"
													href="javascript:registPopup('${Code.CATEGORY_TYPE_PC}');"
													class="button button-b small" title="새 창 으로 열립니다."><span>카테고리
														추가</span></a>
											</div>
											<!-- // section button -->
											<br />
											<table class="table-row table-a" id="tableCategory">
												<colgroup>
													<col style="width: auto;" />
													<col style="width: auto;" />
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox"
															class="checkbox checkAll_${Code.CATEGORY_TYPE_PC}" /></th>
														<th>카테고리 경로</th>
													</tr>
												</thead>
												<tbody id="applyCategoryList_${Code.CATEGORY_TYPE_PC}">
													<c:choose>
														<c:when test="${not empty categoryListP}">
															<c:forEach var="item" items="${categoryListP }"
																varStatus="status">
																<tr>
																	<td class="center"><input type="checkbox"
																		class="checkbox checkRow_${Code.CATEGORY_TYPE_PC}"
																		id="PRD_CTG_IDX_${item.DSP_CTG_IDX}"
																		name="PRD_CTG_IDXs_${Code.CATEGORY_TYPE_PC}"
																		value="${item.DSP_PRD_CTG_IDX}" /> <input
																		type="hidden" name="PRD_CTG_IDXs"
																		value="${item.DSP_PRD_CTG_IDX}" /></td>
																	<td class="left"><label
																		for="PRD_CTG_IDX_${item.DSP_CTG_IDX}"><c:out
																				value="${item.PRD_CTG_PATH }" /></label></td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr id="categoryNodata_${Code.CATEGORY_TYPE_PC}">
																<!-- row -->
																<td colspan="3">카테고리를 추가해 주세요.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
										<!-- // 카테고리 -->
									</td>
								</tr>
								<tr id="mobile_category">
									<th><span>모바일카테고리 <i class="require"><em>필수입력</em></i></span></th>
									<td colspan="3">
										<div id="divCategory">
											<!-- 카테고리 -->
											<div class="text-right">
												<!-- section button -->
												<a href="#none"
													id="goCategoryDelete_${Code.CATEGORY_TYPE_MOBILE}"
													class="button button-a small"><span>선택삭제</span></a> <a
													id="goCategoryPopup"
													href="javascript:registPopup('${Code.CATEGORY_TYPE_MOBILE}');"
													class="button button-b small" title="새 창 으로 열립니다."><span>카테고리
														추가</span></a>
											</div>
											<!-- // section button -->
											<br />
											<table class="table-row table-a" id="tableCategory">
												<colgroup>
													<col style="width: auto;" />
													<col style="width: auto;" />
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox"
															class="checkbox checkAll_${Code.CATEGORY_TYPE_MOBILE}" /></th>
														<th>카테고리 경로</th>
													</tr>
												</thead>
												<tbody id="applyCategoryList_${Code.CATEGORY_TYPE_MOBILE}">
													<c:choose>
														<c:when test="${not empty categoryListM}">
															<c:forEach var="item" items="${categoryListM }"
																varStatus="status">
																<tr>
																	<td class="center"><input type="checkbox"
																		class="checkbox checkRow_${Code.CATEGORY_TYPE_MOBILE}"
																		id="PRD_CTG_IDX_${item.DSP_CTG_IDX}"
																		name="PRD_CTG_IDXs_${Code.CATEGORY_TYPE_MOBILE}"
																		value="${item.DSP_PRD_CTG_IDX}" /> <input
																		type="hidden" name="PRD_CTG_IDXs"
																		value="${item.DSP_PRD_CTG_IDX}" /></td>
																	<td class="left"><label
																		for="PRD_CTG_IDX_${item.DSP_CTG_IDX}"><c:out
																				value="${item.PRD_CTG_PATH }" /></label></td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr id="categoryNodata_${Code.CATEGORY_TYPE_MOBILE}">
																<!-- row -->
																<td colspan="3">카테고리를 추가해 주세요.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
										<!-- // 카테고리 -->
									</td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->

						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>색상정보</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th><span>색상 <i class="require"><em>필수입력</em></i></span></th>
									<td>
                                        <ul class="color_list_box tag_box">
                                            <li><a href="#none" class="colorChip" style="background:#fff;border:1px solid #ccc;"><em>흰색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#000;"><em>검정</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#333F50;"><em>남색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#C55A11;"><em>갈색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#00B0F0;"><em>하늘색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#FFC000;"><em>노란색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#BF9000;"><em>탁한노란색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#A9D18E;"><em>연두색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#FF5050;"><em>핑크색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#0070C0;"><em>파란색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#002060;"><em>더진한남색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#7030A0;"><em>보라색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#FBE5D6;"><em>살색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#FFF2CC;"><em>연노랑</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#A9D18E;"><em>진한연두색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#F4B183;"><em>살구색</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#1F4E79;"><em>남색2</em></a></li>
                                            <li><a href="#none" class="colorChip" style="background:#000000;"><em>검정색</em></a></li>

                                        </ul>
                                        <div class="section-button btn_Regist"><!-- section button -->
                                            <a href="#none" id="goRegist" class="button button-b"><span>선택</span></a>
                                        </div><!-- // section button -->
    	                    		</td>
								</tr>
								<tr>
									<th><span>사이즈 <i class="require"><em>필수입력</em></i></span></th>
									<td>
										<table class="table-row table-a" id="tableCategory">
											<colgroup>
												<col style="width: 10%;" />
												<col style="width: 15%;" />
												<col style="width: 15%;" />
												<col style="width: 15%;" />
												<col style="width: auto;" />
											</colgroup>
											<thead>
												<tr>
													<th>색상</th>
													<th>옵션값</th>
													<th>재고</th>
													<th>사용</th>
													<th>키/몸무게</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td class="colorSize"><button type="button" class="btnDel">-</button> <span class="colorChip" style="background:#0070C0"><em>파란</em></span></td>
													<td><input type="text" class="text" style="width:80%;"> <button type="button"  class="btnAdd">+</button></td>
													<td><input type="text" class="text xlarge"></td>
													<td>
														<select class="select">
															<option value="">사용</option>
															<option value="">미사용</option>
														</select>
													</td>
													<td><input type="text" class="text xlarge"></td>
												</tr>
												<tr>
													<td rowspan="2" class="colorSize"><button type="button" class="btnDel">-</button> <span class="colorChip" style="background:#FFC000"><em>파란</em></span></td>
													<td><input type="text" class="text" style="width:80%;"> <button type="button"  class="btnAdd">+</button></td>
													<td><input type="text" class="text xlarge"></td>
													<td>
														<select class="select">
															<option value="">사용</option>
															<option value="">미사용</option>
														</select>
													</td>
													<td><input type="text" class="text xlarge"></td>
												</tr>
												<tr>
													<td><input type="text" class="text" style="width:80%;"> <button type="button"  class="btnDel">-</button></td>
													<td><input type="text" class="text xlarge"></td>
													<td>
														<select class="select">
															<option value="">사용</option>
															<option value="">미사용</option>
														</select>
													</td>
													<td><input type="text" class="text xlarge"></td>
												</tr>
											</tbody>
										</table>
									</td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->


						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>추가옵션</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;" />
								<col style="width: auto;" />
							</colgroup>
							<tbody>
								<tr>
									<th>추가옵션</th>
									<td class="left">
										<div id="divCategory">
											<!-- 스펙 -->
											<div class="grid section-button-search">
												<!-- section button -->
												<a href="#none"
													id="goSpcCategoryDelete_${Code.SPEC_TYPE_PC}"
													class="button button-a small"><span>선택삭제</span></a> <a
													id="goCategoryPopup"
													href="javascript:specRegistPopup('${Code.SPEC_TYPE_PC}');"
													class="button button-b small" title="새 창 으로 열립니다."><span>옵션추가</span></a>
											</div>
											<!-- // section button -->

											<table class="table-row table-a" id="tableCategory">
												<colgroup>
													<col style="width: 10%;" />
													<col style="width: auto;" />
													<col style="width: 20%;" />
												</colgroup>
												<thead>
													<tr>
														<th><input type="checkbox"
															class="checkbox checkAllSpec_${Code.SPEC_TYPE_PC}" /></th>
														<th>옵션명</th>
														<th>사용</th>
													</tr>
												</thead>
												<tbody id="applySpecCategoryList_${Code.SPEC_TYPE_PC}">
													<c:choose>
														<c:when test="${not empty specListP}">
															<c:forEach var="item" items="${specListP }"
																varStatus="status">
																<tr>
																	<td class="center"><input type="checkbox"
																		class="checkbox checkSpecRow_${Code.SPEC_TYPE_PC}"
																		id="PRD_SPC_IDXs_${item.PRD_SPC_IDX}"
																		name="PRD_SPC_IDXs_${Code.SPEC_TYPE_PC}"
																		value="${item.SPC_MST_IDX}" /> <input type="hidden"
																		name="PRD_SPC_IDXs" value="${item.SPC_MST_IDX}" /></td>
																	<td class="left"><label
																		for="PRD_SPC_IDXs_${item.PRD_SPC_IDX}"><c:out
																				value="${item.SPC_MST_PATH }" /></label></td>
																	<td><select class="select">
																			<option>선택</option>
																			<option>선택</option>
																	</select></td>
																</tr>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<tr id="specCategoryNodata_${Code.SPEC_TYPE_PC}">
																<!-- row -->
																<td colspan="3">옵션을 추가해주세요.</td>
															</tr>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>
										<!-- // 스펙 -->
									</td>
								</tr>
							</tbody>
						</table>
						<!-- // table -->

						<!--
	                <table class="table-row table-a is-fixed">
	                	<colgroup>
	                		<col style="width: auto;" />
	                		<col style="width: auto;" />
	                	</colgroup>
		                <tbody>
		                	<tr>
		                		<th><span>Title</span></th>
		                		<td>
		                			table in table
		                			<table class="table-row table-a">
		                				<tbody>
						                	<tr>
						                		<th><span>Title</span></th>
						                		<td>table in table in table
						                			<table class="table-row table-a">
						                				<tbody>
										                	<tr>
										                		<th><span>Title</span></th>
										                		<td>table-row</td>
									                		</tr>
								                		</tbody>
						                			</table>
						                		</td>
					                		</tr>
				                		</tbody>
		                			</table>
		                		</td>
		                	</tr>
		                </tbody>
	                </table>
	                -->

						<!--
	                <table class="table-col table-a is-fixed">
	                	<colgroup>
	                		<col style="width: auto;" />
	                	</colgroup>
	                	<thead>
		                	<tr>
		                		<th scope="col"><span>Title</span></th>
	                		</tr>
	                	</thead>
		                <tbody>
		                	<tr>
		                		<td>
		                			table in table
		                			<table class="table-col table-a">
		                				<thead>
						                	<tr>
						                		<th scope="col"><span>Title</span></th>
						                		<th scope="col"><span>Title</span></th>
					                		</tr>
					                	</thead>
		                				<tbody>
						                	<tr>
						                		<td>table in table in table
						                			<table class="table-row table-a">
						                				<thead>
										                	<tr>
										                		<th scope="col"><span>Title</span></th>
										                		<th scope="col"><span>Title</span></th>
										                		<th scope="col"><span>Title</span></th>
									                		</tr>
									                	</thead>
						                				<tbody>
										                	<tr>
										                		<td>table-col</td>
										                		<td>table-col</td>
										                		<td>table-col</td>
									                		</tr>
								                		</tbody>
						                			</table>
						                		</td>
						                		<td>&nbsp;</td>
					                		</tr>
				                		</tbody>
		                			</table><
		                		</td>
		                	</tr>
		                </tbody>
	                </table>
	                -->
						<div class="push-guide instant">
							<!-- push-guide -->
							<i class="icon">
								<!-- icon -->
							</i>
							<h3 class="title">
								<span>함께 매치하기 좋은 상품</span>
							</h3>
						</div>
						<!-- // push-guide -->

						<table cellspacing="0" class="table-row table-a">
							<!-- table -->
							<colgroup>
								<col style="width: 15%; min-width: 180px;">
								<col style="width: auto;">
							</colgroup>
							<tbody>
								<tr>
									<th>함께 매치하기 좋은 상품</th>
									<td class="left">
										<div>
											<input type="text" class="text" id="PRD_MST_NM"
												name="PRD_MST_NM" style="width: 50%" readonly=""> <a
												href="#none" class="button small search-product-popup"
												title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none"
												class="button primary goCategoryMbAdd"><span>+</span></a> <a
												href="#none" class="button goCategoryPcDelete"><span>상품지우기</span></a>
										</div>
										<div class="mt10">
											<input type="text" class="text" id="PRD_MST_NM"
												name="PRD_MST_NM" style="width: 50%" readonly=""> <a
												href="#none" class="button small search-product-popup"
												title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none"
												class="button goCategoryPcDelete"><span>-</span></a>
										</div>
										<div class="mt10">
											<input type="text" class="text" id="PRD_MST_NM"
												name="PRD_MST_NM" style="width: 50%" readonly=""> <a
												href="#none" class="button small search-product-popup"
												title="새 창 으로 열립니다."><span>상품찾기</span></a> <a href="#none"
												class="button goCategoryPcDelete"><span>-</span></a>
										</div>
									</td>
								</tr>
							</tbody>
						</table>



						<div class="tab-list" id="menuViewTab">
							<!-- tab-list -->
							<ul>
								<li class="in"><a href="#none" data-tab_no="tab1">상품이미지
								</a></li>
								<li><a href="#none" data-tab_no="tab6">상품영상</a></li>
								<li><a href="#none" data-tab_no="tab2" id="descTab">상품상세설명
								</a></li>
								<li><a href="#none" data-tab_no="tab4">상품고시정보</a></li>
							</ul>
						</div>
						<!-- // tab-list -->

						<div id="tab1">
							<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 시작 -->
							<h4 class="title">
								<span>대표 이미지 노출방식</span>
							</h4>
							<div>
								<input type="radio" class="radio" id="radio1" name="radio">
								<label for="radio1">2:3비율 노출</label>&nbsp; <input type="radio"
									class="radio" id="radio2" name="radio"> <label
									for="radio2">정비율 노출</label>
							</div>
							<br/>
							<br/>
							<h4 class="title">
								<span>상품이미지</span>
							</h4>
							<div class="section-form">
								<!-- section-form-a -->

								<div class="edit-product-image">
									<!--  edit-product-image  -->

									<div>
										<input type="checkbox" id="check1"> <label
											for="check1">상품이미지 첨부 방식을 URL로 입력합니다.
											(http://www.abc.com/images/abcd.gif)</label>

										<table cellspacing="0" class="table-row table-a productImgUrl">
											<!-- table -->
											<colgroup>
												<col style="width: 15%; min-width: 180px;">
												<col style="width: auto;">
											</colgroup>
											<tbody>
												<tr>
													<th><span>대표 이미지<i class="require"><em>필수입력</em></i></span></th>
													<td><input type="text" class="text" id="PRD_MST_NM"
														name="PRD_MST_NM" style="width: 50%" readonly=""></td>
												</tr>
												<tr>
													<th><span>상품상세 이미지<i class="require"><em>필수입력</em></i></span></th>
													<td class="left">
														<div>
															<input type="text" class="text" id="PRD_MST_NM"
																name="PRD_MST_NM" style="width: 50%" readonly="">
															<a href="#none" class="button primary goCategoryMbAdd"><span>+</span></a>
														</div>
														<div class="mt10">
															<input type="text" class="text" id="PRD_MST_NM"
																name="PRD_MST_NM" style="width: 50%" readonly="">
															<a href="#none" class="button goCategoryPcDelete"><span>-</span></a>
														</div>
													</td>
												</tr>
											</tbody>
										</table>

									</div>

									<div class="default">
										<!--  default  -->

										<h5 class="title">
											<span>대표 이미지 ( 650px * 650px )</span>
										</h5>

										<div class="grid main-img">
											<div class="col thumb">
												<a href="javascript:;"> <a href="javascript:;"> <img
														src="<c:if test="${ not empty imageList[0].PRD_IMG_URL_PATH }">${cdnDomain}${imageList[0].PRD_IMG_ATT_PATH}${imageList[0].PRD_IMG_SYS_NM}</c:if><c:if test="${ empty imageList[0].PRD_IMG_URL_PATH }"><c:out value="${serverDomain}" />/am/img/blank.png</c:if>"
														alt="${imageList[0].PRD_IMG_ALT_TEXT}" class="pic"
														id="product_pic_0" />
												</a>
												</a>
											</div>
											<div class="col">
												<ul class="list list-a">
													<li>대표이미지 등록 시 PC와 MOBILE 에 상세, 목록, 축소 이미지에 자동 리사이징 되어
														들어갑니다.</li>
													<li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
													<li>등록이미지 : 1M 이하 / gif, png, jpg(jpeg)</li>
													<li>새로운 이미지를 등록 할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
												</ul>
											</div>
										</div>
										<div class="section-button">
											<a href="javascript:registProductImage('0');"
												class="button button-a small"><span>이미지 등록</span></a>
										</div>

									</div>
									<!--  // default  -->

									<div class="optional">
										<!--  optional -->

										<h5 class="title">
											<span>추가 이미지 ( 650px * 650px )</span>
										</h5>

										<ul class="list list-a">
											<li>등록된 추가 이미지는 상품 상세 페이지에 대표이미지와 함께 나타나는 이미지 입니다.</li>
											<li>비율이 맞지 않는 이미지를 올리면 이미지가 일부 잘릴 수 있습니다.</li>
											<li>등록이미지 : 1M 이하 / gif, png, jpg(jpeg)</li>
											<li>새로운 이미지를 등록 할 경우 기존 등록된 이미지는 자동 삭제 됩니다.</li>
											<li>최대 10개까지 업로드 하실 수 있습니다.</li>
										</ul>

										<%-- <div class="grid img-list">
                                        <c:set var="img_idx" value="0" />
                                        <c:forEach begin="1" end="10" var="env">
                                        <c:if test="${ env > imageList[img_idx].PRD_IMG_IDX }"><c:set var="img_idx" value="${img_idx+1}" /></c:if>
                                        <div class="col">
                                            <div class="module">
                                                <div class="thumb">
                                                    <!-- 슈퍼관리자만 수정 가능 -->
                                                    <c:if test="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX eq Code.SUPER_ADMINISTRATOR_IDX}">
                                                        <a href="javascript:removeOptionalImage('<c:out value="${env}"/>');" class="delete"><img src="<c:out value="${domain}" />/am/img/ico_close.png" alt="" /></a>
                                                    </c:if>
                                                    <a href="javascript:;"><img src="<c:if test="${ env eq imageList[img_idx].PRD_IMG_IDX }">${cdnDomain}${imageList[img_idx].PRD_IMG_ATT_PATH}${imageList[img_idx].PRD_IMG_SYS_NM}</c:if><c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }"><c:out value="${serverDomain}" />/am/img/blank.png</c:if>"
                                                    alt="<c:if test="${ empty imageList[img_idx].PRD_IMG_URL_PATH }">${imageList[img_idx].PRD_IMG_ALT_TEXT}</c:if>" class="pic" id="product_pic_<c:out value="${env}"/>" /></a>
                                                </div>
                                                <p class="action">
                                                    <a href="javascript:registProductImage('<c:out value="${env}"/>');" class="button button-a small"><span>이미지 등록</span></a>
                                                </p>
                                            </div>
                                        </div>
                                        </c:forEach>
                                    </div>   --%>

										<!-- 다중 상품이미지 업로드 영역 -->
										<div id="fine-uploader-gallery"></div>

										<div id="product_image_hidden_inform">
											<c:choose>
												<c:when test="${not empty imageList}">
													<c:forEach var="imgrow" items="${imageList }"
														varStatus="status">
														<input type="hidden" name="_product_image"
															value="${imgrow.PRD_IMG_IDX}|${imgrow.PRD_IMG_SORT}|${imgrow.PRD_IMG_ATT_PATH}|${imgrow.PRD_IMG_URL_PATH}|${imgrow.PRD_IMG_SYS_NM}|${imgrow.PRD_IMG_ATT_SIZE}|${imgrow.PRD_IMG_ORG_NM}|${imgrow.PRD_IMG_ALT_TEXT}"
															style="width: 100%;"
															class="product_image_hidden_inform_${imgrow.PRD_IMG_IDX}"
															id="product_image_hidden_inform_${imgrow.PRD_IMG_IDX}-${imgrow.PRD_IMG_SORT}" />
													</c:forEach>
												</c:when>
											</c:choose>
										</div>

									</div>
									<!--  // optional -->

								</div>
								<!--  // edit-product-image  -->

							</div>
							<!-- // section-form-a -->

						</div>

						<script type="text/javascript">
							var v_env = '';

							// 상품이미지 등록 팝업
							function registProductImage(env) {
								v_env = env;
								$('#product_image_env').val(env);
								popup('', "600", "350", "no",
										"_RegistProductImagePopup");
								$("#frm")
										.attr(
												{
													"action" : "<c:out value="${serverDomain}" />/am/product/basicProductImageForm.do",
													"target" : "popup_RegistProductImagePopup",
													"method" : "post"
												}).submit();
							}

							// 이미지 등록결과 반영 - 이미지등록 팝업에서 호출
							function resultExec(result) {

								var img_layer_html = '';
								var product_image_val = '';

								var cdnDomain = "${cdnDomain}";

								$
										.each(
												result.data.imgList,
												function(i, item) {

													product_image_val = v_env;
													product_image_val += "|"
															+ i;
													// [2] 서버디렉토리
													product_image_val += "|"
															+ item.webpath;
													// [3] HTTP경로
													product_image_val += "|"
															+ cdnDomain
															+ item.webpath
															+ item.filename;
													// [4] 이미지파일명
													product_image_val += "|"
															+ item.filename;
													// [5] 이미지사이즈
													product_image_val += "|"
															+ item.size;
													// [6] 원본파일명
													product_image_val += "|"
															+ item.fileOrgName;
													// [7] 파일 설명
													product_image_val += "|"
															+ item.altText;

													img_layer_html += '<input type="hidden" name="_product_image" value="'
															+ product_image_val
															+ '" style="width:100%;" class="product_image_hidden_inform_'
															+ v_env
															+ '" id="product_image_hidden_inform_'
															+ v_env
															+ '-'
															+ i
															+ '"/>';

													//-- 대표이미지만 노출합니다.
													if (i == 0) {
														$(
																'#product_pic_'
																		+ v_env)
																.attr(
																		'src',
																		cdnDomain
																				+ item.webpath
																				+ item.filename);
													}
												});

								// 기존 파일정보 제거
								$('.product_image_hidden_inform_' + v_env)
										.remove();

								// 첨부파일 부가정보(hidden form) 등록
								$('#product_image_hidden_inform').html(
										$('#product_image_hidden_inform')
												.html()
												+ img_layer_html);
							}

							// 추가 이미지 삭제
							var no_image_src = '<c:out value="${serverDomain}" />/am/img/blank.png';
							function removeOptionalImage(env) {

								// 서버상의 이미지 삭제, AJAX로 호출합니다
								$('.product_image_hidden_inform_' + env)
										.each(

												function(index) {
													$
															.ajax({
																async : false,
																type : "POST",
																data : {
																	"image_info" : $(
																			this)
																			.val()
																},
																url : "<c:out value="${serverDomain}" />/am/product/upload/basicProductImageRemoveJson.do",
																success : function(
																		data) {
																	if (data.resultYn == "N") {
																		// TODO nothing
																	}
																},
																error : function(
																		err) {
																	alert("오류가 발생하였습니다.\n["
																			+ err.status
																			+ "]");
																}
															});
												});

								// 화면에서 상품이미지 삭제
								$('.product_image_hidden_inform_' + env)
										.remove();
								// 첨부파일 부가정보(hidden form) 제거
								$('#product_pic_' + env).attr('src',
										no_image_src);
							}
						</script>


						<!--// 상품 이미지 등록 관련 코드 추가, 이상준, 끝 -->

						<div id="tab2" style="display: none">
							<h4 class="title">
								<span>상품 상세설명</span>
							</h4>

							<div class="section-form">
								<!-- section-form-a -->

								<div class="form-group">
									<h5 class="title">
										<span>PC</span>
									</h5>
									<div class="field">
										<input type="checkbox" class="checkbox" id="detailChk"
											onclick="detailDesc();" checked="checked" />모바일에서 PC와 동일한
										내용으로 사용<br />
										<textarea class="textarea" id="PRD_MST_DETAIL_DESC"
											name="PRD_MST_DETAIL_DESC">${productInfo.PRD_MST_PC_DTL_DSC}</textarea>
									</div>
								</div>

								<div class="form-group">
									<h5 class="title">
										<span>MOBILE</span>
									</h5>
									<div class="field">
										<textarea class="textarea" id="PRD_MST_DETAIL_DESC2"
											name="PRD_MST_DETAIL_DESC2">${productInfo.PRD_MST_MB_DTL_DSC}</textarea>
									</div>
								</div>
							</div>
							<!-- // section-form-a -->
						</div>

						<div id="tab4" style="display: none">

							<h4 class="title">
								<span>상품고시정보</span>
							</h4>

							<div class="table-a">
								<!-- col list -->
								<table class="table-row table-a">
									<colgroup>
										<col style="width: 25%;" />
										<col style="width: 25%;" />
										<col style="width: 25%;" />
										<col style="width: 25%;" />
									</colgroup>
									<tbody>
										<tr>
											<th><span>품목 <i class="require"><em>필수입력</em></i></span></th>
											<td colspan="3" class="left"><select class="select"
												name="PRD_MST_NFI_IDX" id="PRD_MST_NFI_IDX">
													<option value="">==선택==</option>
													<c:choose>
														<c:when test="${not empty productNfiList}">
															<c:forEach var="productNfiList"
																items="${productNfiList }" varStatus="status">
																<option
																	value="<c:out value="${productNfiList.PRD_NFI_IDX }" />"
																	<ui:select v="${productInfo.PRD_MST_NFI_IDX }" t="${productNfiList.PRD_NFI_IDX }" g="selected"/>><c:out
																		value="${productNfiList.PRD_NFI_NM }" /></option>
															</c:forEach>
														</c:when>
													</c:choose>
											</select></td>
										</tr>
										<tr>
											<th><span>브랜드 <i class="require"><em>필수입력</em></i></span></th>
											<td class="left"><input type="hidden" class="text"
												name="PRD_MST_BRD_IDX" id="PRD_MST_BRD_IDX"
												value="<c:out value="${productInfo.PRD_MST_BRD_IDX }" />" />
												<input type="hidden" class="text" name="PRD_MST_BRD_SERV"
												id="PRD_MST_BRD_SERV"
												value="<c:out value="${productInfo.PRD_MST_BRD_SERV }" />" />
												<input type="text" class="text" name="PRD_MST_BRD_NM"
												id="PRD_MST_BRD_NM" disabled="disabled"
												value="<c:out value="${productInfo.PRD_MST_BRAND_NM }" />" />
												<a href="#none" id="goBrandPopup"
												class="button button-a small"><span>검색</span></a></td>
											<th><span>제조사 <i class="require"><em>필수입력</em></i></span></th>
											<td class="left"><input type="hidden" class="text"
												name="PRD_MST_MRK_IDX" id="PRD_MST_MRK_IDX"
												value="<c:out value="${productInfo.PRD_MST_MRK_IDX }" />" />
												<input type="text" class="text" name="PRD_MST_MRK_NM"
												id="PRD_MST_MRK_NM" disabled="disabled"
												value="<c:out value="${productInfo.PRD_MST_MRK_NM }" />" />
												<a href="#none" id="goMrkPopup"
												class="button button-a small"><span>검색</span></a></td>
										</tr>
										<tr>
											<td colspan="4" class="left">
												<table class="table-row table-a">
													<colgroup>
														<col style="width: 25%;" />
														<col style="width: auto%;" />
													</colgroup>
													<tbody id="createproductNotificationInfoTable">

													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- // col list -->
							<div class="mt10" style="width:100%; height:500px;border:1px solid #ccc;">
		                        선택한 품목에 맞춰 고시정보 입력 테이블 출력 영역
		                    </div>
						</div>

						<div id="tab6" style="display: none">
							<h4 class="title">
								<span>상품영상</span>
							</h4>

							<div class="table-a">
								<!-- col list -->
								<table class="table-row table-a">
									<colgroup>
										<col style="width: 15%;" />
										<col style="width: auto;" />
									</colgroup>
									<tbody>
										<tr>
											<th>상품 영상</th>
											<td><input type="text" id="PRD_MST_MTA_TAG1"
												name="PRD_MST_MTA_TAG1" class="text" style="width: 60%"
												maxlength=100 /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- // col list -->

							<h4 class="title">
								<span>라이브ON 연동</span>
							</h4>

							<div class="table-a">
								<!-- col list -->
								<input type="radio" class="radio3" name="liveRadio"> <label
									for="radio3">연동</label> <input type="radio" class="radio4"
									name="liveRadio"> <label for="radio4">연동안함</label>
							</div>
							<!-- // col list -->
						</div>

					</form>

					<div class="section-button">
						<!-- section-button -->
						<div class="wrap text-center">
							<a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
							<a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
						</div>
					</div>
					<!-- // section-button -->
				</div>
			</div>
			<!-- // contents -->
		</div>
		<!-- // wrapper -->

		<div id="quickmenu" class="aside right">
			<!-- quickmenu-->
			<%@ include file="/WEB-INF/jsp/am/include/quick.jsp"%>
		</div>
		<!-- // quickmenu -->

	</div>
	<!-- // container -->

	<div id="footer">
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
	</div>

	<%@ include file="/WEB-INF/jsp/am/include/script.jsp"%>
	<script
		src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/plugins/fine-uploader/jquery.fine-uploader.js"></script>

	<!-- template -->
	<script id="productOptionTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="button" name="goProductOptionDel" id="goProductOptionDel" value="-" /></td>
    <td>
        <input type="text" class="text" name="PRD_OPT_NM" id="PRD_OPT_NM" style="width:80px;" maxlength=200 />
        <input type="hidden" class="text" name="PRD_OPT_SUB_CNT" id="PRD_OPT_SUB_CNT" value ="\${OPT_CNT}" />
    </td>
    <td colspan=5>
        <table class="table-col table-c" id="optDetail_\${OPT_IDX}">
            <colgroup>
                <col style="width: 20%;" />
                <col style="width: 12%;" />
                <col style="width: 12%;" />
                <col style="width: auto;" />
                <col style="width: 10%;" />
            </colgroup>
            <tbody>
                <tr style="margin:0px; padding:0px;">
                    <td>
                        <input type="text" class="text" name="OPT_DTL_NM" id="OPT_DTL_NM" style="width:80px;" />
                        &nbsp;<input type="button" name="goProductOptionAdd" id="goProductOptionAdd" value="+" />
                    </td>
                    <td>
                        <input type="text" class="numbernr text" name="OPT_DTL_ADD_PRC" id="OPT_DTL_ADD_PRC" maxlength="9" style="width:80px;" />
                    </td>
                    <td>
                        <input type="text" class="number text" name="OPT_DTL_STK_CNT" id="OPT_DTL_STK_CNT" maxlength="9" style="width:80px;" />
                    </td>
                    <td>
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                        <input type="text" class="text date small" id="OPT_DTL_ST_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}" name="OPT_DTL_ST_DT" value="" readonly="readonly" data-target-end="#OPT_DTL_ED_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}"/>
                        &nbsp;~&nbsp;
						<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                        <input type="text" class="text date small" id="OPT_DTL_ED_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}" name="OPT_DTL_ED_DT" value="" readonly="readonly" data-target-start="#OPT_DTL_ST_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}"/>
                    </td>
                    <td>
                        <select class="select xlarge" name="OPT_DTL_USE_YN" id="OPT_DTL_USE_YN">
                            <option value="Y">사용</option>
                            <option value="N">미사용</option>
                        </select>
                    </td>
                </tr>
            </tbody>
        </table>
    </td>
    <td>
        필수여부&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="PRD_OPT_EST_YN" id="PRD_OPT_EST_YN" class="select">
            <option value="Y">사용</option>
            <option value="N">미사용</option>
        </select>
        <br />수량선택여부
        <select name="PRD_OPT_CNT_YN" id="PRD_OPT_CNT_YN" class="select">
            <option value="Y">사용</option>
            <option value="N">미사용</option>
        </select>
    </td>
</tr>
</script>

	<script id="productOptionDetailTemplate" type="text/x-jquery-tmpl">
<tr>
    <td>
        <input type="text" class="text" name="OPT_DTL_NM" id="OPT_DTL_NM" style="width:80px;" />
        &nbsp;&nbsp;<input type="button" name="goProductOptionDetaildel" id="goProductOptionDetaildel" value="-" />
    </td>
    <td>
        <input type="text" class="numbernr text" name="OPT_DTL_ADD_PRC" id="OPT_DTL_ADD_PRC" style="width:80px;" />
    </td>
    <td>
        <input type="text" class="number text" name="OPT_DTL_STK_CNT" id="OPT_DTL_STK_CNT" style="width:80px;" />
    </td>
    <td>
		<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
        <input type="text" class="text date small" id="OPT_DTL_ST_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}" name="OPT_DTL_ST_DT" value="" readonly="readonly" data-target-end="#OPT_DTL_ED_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}"/>
        &nbsp;~&nbsp;
		<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
        <input type="text" class="text date small" id="OPT_DTL_ED_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}" name="OPT_DTL_ED_DT" value="" readonly="readonly" data-target-start="#OPT_DTL_ST_DT_\${OPT_IDX}_\${OPT_DETAIL_IDX}"/>
    </td>
    <td>
        <select class="select small" name="OPT_DTL_USE_YN" id="OPT_DTL_USE_YN">
            <option value="Y">사용</option>
            <option value="N">미사용</option>
        </select>
    </td>
</tr>
</script>

	<script id="categoryTemplate" type="text/x-jquery-tmpl">
<tr>
    <th style="background-color:#fff;"><input type="checkbox" class="checkbox checkRow_\${PRD_CTG_ENV}" name="PRD_CTG_IDXs_\${PRD_CTG_ENV}" value="\${CTG_IDX}"/></th>
    <td class="left">\${CTG_PATH}<input type="hidden" name="PRD_CTG_IDXs" value="\${CTG_IDX}"/></td>
</tr>
</script>

	<script id="spceCategoryTemplate" type="text/x-jquery-tmpl">
<tr>
    <th style="background-color:#fff;"><input type="checkbox" class="checkbox checkSpecRow_\${PRD_SPC_ENV}" name="PRD_SPC_IDXs_\${PRD_SPC_ENV}" value="\${SPC_IDX}"/></th>
    <td class="left">\${SPC_PATH}<input type="hidden" name="PRD_SPC_IDXs" value="\${SPC_IDX}"/></td>
</tr>
</script>

	<script id="productNotificationInfoTemplate" type="text/x-jquery-tmpl">
<tr>
    <th><span>\${PRD_NFI_INFO}</span></th>
    <td class="left">
        <select name="PRD_NFI_INFO_YN_\${PRD_NFI_IDX}" id="PRD_NFI_INFO_YN" class="select">
            {{if PRD_NFI_INFO_YN =='Y' }}
            <option value"\${PRD_NFI_INFO_CODE}">자동입력</option>
            {{/if}}
            <option value="S">직접입력</option>
            <option value="N">정보없음</option>
            <option value="D">상세설명참조</option>
        </select>
        <input type="text" class="text" style="width:60%;" name="PRD_MST_NFI_INF\${PRD_NFI_IDX}" id="PRD_MST_NFI_INF\${PRD_NFI_IDX}" value="\${PRD_MST_NFI_INF}"
        {{if PRD_NFI_INFO_YN =='Y'}}
            value="[자동입력]"
            disabled=true
        {{/if}}
        />
        <input type="hidden" name="B_PRD_NFI_INFO_CODE_\${PRD_NFI_INFO_CODE}" id="B_PRD_NFI_INFO_CODE_\${PRD_NFI_INFO_CODE}" value="" />
        <input type="hidden" name="A_PRD_NFI_INFO_CODE_\${PRD_NFI_IDX}" id="A_PRD_NFI_INFO_CODE_\${PRD_NFI_IDX}" value="" />
    </td>
</tr>
</script>

	<script id="channelTemplate" type="text/x-jquery-tmpl">
<tr>
    <td style="padding-left:20px;border-top:0px;">
        <input type="hidden" class="text" name="PRD_CHN_DPT2_I" id="PRD_CHN_DPT2_I" value="\${PRD_CHN_DPT2}" />
        <input type="hidden" class="text" name="CHN_DTL_CD" id="CHN_DTL_CD" value="\${CHN_DTL_CD}" />
        - \${PRD_CHN_DPT3_NM}&nbsp;<input type="text" class="text" name="PRD_CHN_PRC" id="PRD_CHN_PRC" />
        &nbsp;<a href="#none" id="goChannelDelete" class="button button-a small"><span>삭제</span></a>
    </td>
</tr>
</script>

	<script type="text/template" id="qq-template-gallery">
	<div class="qq-uploader-selector qq-uploader qq-gallery" qq-drop-area-text="첨부할 파일을 드래그 하여 주십시오. ">
        <div class="qq-total-progress-bar-container-selector qq-total-progress-bar-container">
            <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-total-progress-bar-selector qq-progress-bar qq-total-progress-bar"></div>
        </div>

        <div class="qq-upload-drop-area-selector qq-upload-drop-area" qq-hide-dropzone>
            <span class="qq-upload-drop-area-text-selector"></span>
        </div>

        <div class="qq-upload-button-selector qq-upload-button">
            <div>파일찾기</div>
        </div>
        <div class="qq-upload-button-selector qq-upload-button" style="margin-left: 10px;">
            <div id="trigger-upload">서버 업로드</div>
        </div>

		<ul class="qq-upload-list-selector qq-upload-list" role="region" aria-live="polite" aria-relevant="additions removals"><li class="qq-file-id-0" qq-file-id="0">
            <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
            <div class="qq-progress-bar-container-selector qq-progress-bar-container qq-hide">
                <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
            </div>
            <span class="qq-upload-spinner-selector qq-upload-spinner qq-hide"></span>
            <div class="qq-thumbnail-wrapper">
                <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale="" src="">
            </div>
            <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
            <button type="button" class="qq-upload-retry-selector qq-upload-retry qq-hide">
                <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>재시도
            </button>

            <div class="qq-file-info">
                <div class="qq-file-name">
                    <span class="qq-upload-file-selector qq-upload-file" title="3708452.jpg">3708452.jpg</span>
                    <!--<span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>-->
                </div>
                <!--<input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">-->
                <span class="qq-upload-size-selector qq-upload-size qq-hide"></span>
                <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete qq-hide">
                    <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
                </button>
                <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause qq-hide">
                    <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
                </button>
                <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue qq-hide">
                    <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
                </button>
            </div>
            </li><li class="qq-file-id-1" qq-file-id="1">
                <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                <div class="qq-progress-bar-container-selector qq-progress-bar-container qq-hide">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>
                <span class="qq-upload-spinner-selector qq-upload-spinner qq-hide"></span>
                <div class="qq-thumbnail-wrapper">
                    <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale="" src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wBDAAYEBQYFBAYGBQYHBwYIChAKCgkJChQODwwQFxQYGBcUFhYaHSUfGhsjHBYWICwgIyYnKSopGR8tMC0oMCUoKSj/2wBDAQcHBwoIChMKChMoGhYaKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCj/wAARCAB4AHgDASIAAhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD6pooqO4YpBIy/eCkigCTNFcP4g8R6boeqPaTaSJiFDmRVXJJ57jr+NVD8RdEjX/kH6gn/AFzjQf8As4rpjhK00nGOjOSePw8G4ylZo9DzRXmw+I/h8t+8XVof98n+jmrKfEbwwBzqU6H/AGo5T/Q03gq6+w/uJWZYR/8ALxfej0CiuCHxG8OPwmtsv1gf+qVYg8aaNK3y+Ibfb/tuifzUVDw1Zbwf3M0jjMPL4aifzR2tFcqfFuk4+TX9LJ/2rmI/yIqeHX0uP+PfUdOlz/dIb+T1DpTW6NVVhLZo6Oisdb+5IzvgYeyH/wCKp51G4A/1UTH/AHiP6GosaGrRWONUus/8esH/AH/P/wARSwax/psFtdQGI3BKxOjb0LAZ2ngEEgEjjHB5zgFWA16KKKACo7gZgkHqp/lUlNl5jb6GgDznx1YifWmkxnMaiuOudOx/DXquvWwmud2M/KK5q6sBzxXs4bEcsEjwMZhVOcmeeXGm5z8tYd3pbBiUHHpXpVxYdeKybyw9q9OlirHh4nL1JHnUtm6ZypHvVc25rtbnTSxPFUv7LdHBAyAc49a7o14tHkTw1WD0RyptyOoxTlg5ya6hdCnuZScJGp/GtrRfBsLzB7+SR0HOxV2g/UmieKpwV2y6WDxFZ2jE4aKPJARSzHoAKvf2ZfLCZ5JWt0H+0Qf0r0mfSYYY/L063tYz03scn9Kx5vC89yxa9vyU/uxIcf0Fc/12E/JHZ/ZdSlt7z8tF+JwMutarb5Sz1XUlA7rcuo/nXtPw6nubrwz4amvp5bi4a5k3SSuXY4MoGSeTwBXn+o6DZ2seIopnf1kOB+gr0XwDGY9A8NphRi5k4Xp/y1rgzadOdBOC6/oz18iVaGIlCo7+73v1R6TRRRXzh9YFNk+4fpTqR/umgClPEJOcVl3NmDnityEbo/xqKWLOeK1jOxjOmpanLXFlnPFZF3Ynniu1kgB6iqVxaKw7V1QrWOKph0zhJbMZ6UxbQf3a6ybT8npUB04joK6liDhlhLPYwo7RRg4q5bxxxndsUn1PWtH7CR2qN7YqOlJ1eYpUXHoM8+NedgJ9TUFxdZU4FOePHUVA6AjpTikEnJGFqf7zOefrXX+EkC6foAGOLh//AEGWucvIQQeK6zw3HttdCA7Tuf8AyHLUY2V6SXmaZdC1dyfb9UdpRRRXknthSN0paD0oAz1uBEQp780yW+VepxXNa/qgtdUih3YJgD4/Fh/SqM+rjZncDXRGk3qctSuo3R1j3QkX5JEB/wBtM/4VmXUlzG+5dPt7lB/zzuCjn6Bhj9a5ZtaCt8rYI6gnFSDxEM7d4Df3W/pW6w8lscksXF7ssXuv2luS+qWPiGwQf884hMPzj3fzqrD4o8OXkgW18U28D/8APK5J8z8iw/lTx4kjJ2vtJ+vNVL+XRNVjK6hZ206n/npErVqqdt0/69TnlWv8Mk/68jamhuLiJW07WrSYt93dIEB/Rqik0vxDFAXLxXD9kilVv/QkQfrXAX3gLwxPmTTWudNk67rK4aMZ+maoL4Y8V6dL5mheMbiRgPlju1D4H1PNaKkuj+9EOv3X3P8A4c717fxYOfsPlr/tQwuf/HZc/pVGS91+NmU2dwzD/qFTKv8A30ARXJL4r+J2hqwu7a11FP8AnoM5/nV+y+Nd/BtTVdEmiPRnPP5AYqvZ1FqopmbrUnpzyT+8nuvE1/HIY7j+yo2HVZLh42/LZXpXhaVp7HQZX8vc7sx8tiy/6uToT1rkrP4v6NeDbIksHqZAR+QANdzpl3DfPo11bHMMzNIhxjIMb1y4pvkScbfM7sBFKo2p82nax09FFFeeesFFFFAHjvxD0jxDe+I7S80WwNzZrZJG7iVFwwdyRgkE8EdBXLFtct4it5pGoqij5n+zvtH/AALGK9/ubATBvLmlgY87o9p/RgRUEmnXAVFgu14+800W5j/3yVA/Kuyni+RKLitDzq2XqpJyU2rnzPea82GUEiROPm7ismXXpCCN+V/uk8j6V9T3lhcyqIjb2dxEfvea5H/ju0/zrBvvBmg3btDP4Wtdh5M0UMUeT9VIf9K7qeZ047wPLq5FUm7qp+Fv8z5wPiFyNsrllPGSaU6zIVzFctjsC39a9hvPh94CuzLCkNzYSISHfzJkAPfmTK1zB+EGj3+F0XV75G3BWfzYLpB7naUOK64ZnhnvdfI5ZZDXWz/E89l8R3qHBmY/j/Wrlj4zvImAMrY9G5zXW3/wL1eJQNP1yzuT3FxE0I/8d31h33we8W2r4ht7S8HrBcKB/wCP7a3WKws/tL8vzM5ZXiKfR/Jm5pvjtXAE0foNyH+lbsWsaRqgAuEt3Zv+eiYI/HrXmU3gjxXp0oWbQ9QY/wDTCIzD80zSwx3trL5V5BLBIP4ZUKsPzo9jQnrB/czmqSxVLSSuvNHo9x4V0O8+aGKSFj08ptw/I816d4etks4PDttG25IoyoOMZxGe1eH6VdTR4xI2K9y0Mlh4cY9Wtyx/79j/ABry8yg4RV3c9jJJ885e7y6fL/I62iiivHPpAoopruqLljgUAOoqjNfY/wBWvGeSfT1x+nP8qRb85w8RBAyQDk0WAv0jMqjLEAepqncXga3kEDBJsYUuOM/hms9ri9RE2wQ3EzdWEmxV9stlv0oAdLp8crySAYDMThh71RutBhnUiSCKQHsQDWiNQZZBFNaXAIXc8oXES/8AAmxn8qWDUbG4L+VOCE+8xBCj/gR4/WqEYB8PRwRmO2+0WqelvK0X/oJFI1lqEcYS31S6jC/3gkh/NgTXUwvHMoaCVZFPdWyKju5YLePfcvGi/wC13+nrQBz1nc6qNQt7See28uQHEzwEnIx8pw4GTkngdjW9Nb3oKrFHbyKfvFpCn6bW/nWDq/mavBt0aJjMm5orgDASTaVBDdB94+/tXZL0FJsDnZ9Gs5rpvP0OCQkczGKI/kc7v0q1a2W29szFEY7a1iZVyMckABQPQAHn6decbNFNzbVmxKEU7pBRRRUlDZFLRsoYqSMBhjI9+azXsrzzSwuYpFxwrxkHPrnOPwxWpRQBgi1vokYSQ+cS5IKyA4B78hRxnHTp69SPIEYo6zRY5BaM4x35HHr3/wAa3qMU7gc+ksTrvSSMoRg4cYx/nP6VIFJAwTk5x2P6cgda1Z7O3nBE0Eb5/vKDVeXSoH37Glj3DB2uSPyORRcRSiLKQUyOw2nGQOM/59qSf96hjuEWQdllQOD+dTHTbqMfubtWGckSJgn8iAPyNU5Ib63zusfNUnj7PIrYHvu2/pntTASe3spEEktsvlovCozIo/AED9Kh03SNFs5I40smkmPGZnafHOcncT69f16VoWdpPcAPMj265+6xBc8+xIGf69qbf6lpmksba8eO33L8vncCbjsT94+o6+2CMoDWaeOMcnj2pkF7BNIUSQbvT1rznxB4w0OzxbRanZQKT8yo4yPwHStPQpFv0RrC1uJoyAwmMRjjbJ6hmAz+GaLAd5RTIAwhQSY3gDdg55+tPpDCiiigAooooAKKKKACiiigAooooAKbIiyIUkUMp6gjINFFAFW20uwtZDJa2VtDIerRxKpP4gVcoooAKKKKACiiigD/2Q==">
                </div>
                <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
                <button type="button" class="qq-upload-retry-selector qq-upload-retry qq-hide">
                    <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>재시도
                </button>

                <div class="qq-file-info">
                    <div class="qq-file-name">
                        <span class="qq-upload-file-selector qq-upload-file" title="510851764.jpg">510851764.jpg</span>
                        <!--<span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>-->
                    </div>
                    <!--<input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">-->
                    <span class="qq-upload-size-selector qq-upload-size qq-hide"></span>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete qq-hide">
                        <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause qq-hide">
                        <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue qq-hide">
                        <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
                    </button>
                </div>
            </li><li class="qq-file-id-2" qq-file-id="2">
                <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                <div class="qq-progress-bar-container-selector qq-progress-bar-container qq-hide">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>
                <span class="qq-upload-spinner-selector qq-upload-spinner qq-hide"></span>
                <div class="qq-thumbnail-wrapper">
                    <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale="" src="data:image/jpeg;base64,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">
                </div>
                <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
                <button type="button" class="qq-upload-retry-selector qq-upload-retry qq-hide">
                    <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>재시도
                </button>

                <div class="qq-file-info">
                    <div class="qq-file-name">
                        <span class="qq-upload-file-selector qq-upload-file" title="de75bf073.jpg">de75bf073.jpg</span>
                        <!--<span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>-->
                    </div>
                    <!--<input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">-->
                    <span class="qq-upload-size-selector qq-upload-size qq-hide"></span>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete qq-hide">
                        <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause qq-hide">
                        <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue qq-hide">
                        <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
                    </button>
                </div>
            </li><li class="qq-file-id-3" qq-file-id="3">
                <span role="status" class="qq-upload-status-text-selector qq-upload-status-text"></span>
                <div class="qq-progress-bar-container-selector qq-progress-bar-container qq-hide">
                    <div role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" class="qq-progress-bar-selector qq-progress-bar"></div>
                </div>
                <span class="qq-upload-spinner-selector qq-upload-spinner qq-hide"></span>
                <div class="qq-thumbnail-wrapper">
                    <img class="qq-thumbnail-selector" qq-max-size="120" qq-server-scale="" src="data:image/jpeg;base64,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">
                </div>
                <button type="button" class="qq-upload-cancel-selector qq-upload-cancel">X</button>
                <button type="button" class="qq-upload-retry-selector qq-upload-retry qq-hide">
                    <span class="qq-btn qq-retry-icon" aria-label="Retry"></span>재시도
                </button>

                <div class="qq-file-info">
                    <div class="qq-file-name">
                        <span class="qq-upload-file-selector qq-upload-file" title="다운로드.jpg">다운로드.jpg</span>
                        <!--<span class="qq-edit-filename-icon-selector qq-edit-filename-icon" aria-label="Edit filename"></span>-->
                    </div>
                    <!--<input class="qq-edit-filename-selector qq-edit-filename" tabindex="0" type="text">-->
                    <span class="qq-upload-size-selector qq-upload-size qq-hide"></span>
                    <button type="button" class="qq-btn qq-upload-delete-selector qq-upload-delete qq-hide">
                        <span class="qq-btn qq-delete-icon" aria-label="Delete"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-pause-selector qq-upload-pause qq-hide">
                        <span class="qq-btn qq-pause-icon" aria-label="Pause"></span>
                    </button>
                    <button type="button" class="qq-btn qq-upload-continue-selector qq-upload-continue qq-hide">
                        <span class="qq-btn qq-continue-icon" aria-label="Continue"></span>
                    </button>
                </div>
            </li>
		</ul>

        <span class="qq-drop-processing-selector qq-drop-processing">
            <span>파일을 불러오는 중입니다.</span>
            <span class="qq-drop-processing-spinner-selector qq-drop-processing-spinner"></span>
        </span>

        <dialog class="qq-alert-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">닫기</button>
            </div>
        </dialog>

        <dialog class="qq-confirm-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">취소</button>
                <button type="button" class="qq-ok-button-selector">확인</button>
            </div>
        </dialog>

        <dialog class="qq-prompt-dialog-selector">
            <div class="qq-dialog-message-selector"></div>
            <input type="text">
            <div class="qq-dialog-buttons">
                <button type="button" class="qq-cancel-button-selector">취소</button>
                <button type="button" class="qq-ok-button-selector">확인</button>
            </div>
        </dialog>
    </div>
</script>

	<script
		src="<c:out value="${serverDomain}" />/am/js/plugins/fine-uploader/jquery.fine-uploader.js"></script>

	<ui:editor objId="#PRD_MST_DETAIL_DESC" num="1" />
	<ui:editor objId="#PRD_MST_DETAIL_DESC2" num="2" />
	<script>
		$(function() {
			//입점회원 확인 키
			var autMstIdx = "<c:out value="${__MALL_ADMIN_SESSION_INFO__.AUT_MST_IDX}"/>";

			//최초 페이지 로딩시 FILE 있는 경우 FILE DISABLEE 처리
			$(".cmmFleIdx").each(function() {
				var fileName = $(this).data("file_name");
				$("input[id='" + fileName + "']").prop("disabled", true);
			});

			// 파일 삭제 check box 변경 이벤트
			$(document).on("change", ".cmmFleIdx", function() {
				var $this = $(this);
				var fileName = $(this).data("file_name");

				if ($this.is(":checked")) {
					$("input[id='" + fileName + "']").prop("disabled", false);
				} else {
					$("input[id='" + fileName + "']").val("");
					$("input[id='" + fileName + "']").prop("disabled", true);
				}
			});

			//체크박스 전체 선택
			$.checkBoxSelect("checkAll_${Code.CATEGORY_TYPE_PC}",
					"checkRow_${Code.CATEGORY_TYPE_PC}");
			$.checkBoxSelect("checkAll_${Code.CATEGORY_TYPE_MOBILE}",
					"checkRow_${Code.CATEGORY_TYPE_MOBILE}");
			$.checkBoxSelect("checkAllSpec_${Code.SPEC_TYPE_PC}",
					"checkSpecRow_${Code.SPEC_TYPE_PC}");
			$.checkBoxSelect("checkAllEmgz", "checkEmgzRow");

			//카테고리 선택 영역 설정
			setViewCategory = function() {

				$("#pc_category").show();
				$("#mobile_category").show();
				if ($("input:checkbox[id=PRD_MST_CNL_PC_YN]").is(":checked") == false) {
					$("#pc_category").hide();
				}
				if ($("input:checkbox[id=PRD_MST_CNL_MB_YN]").is(":checked") == false) {
					$("#mobile_category").hide();
				}
			};

			// 쇼핑채널 변경시
			$(document).on("click", "#PRD_MST_CNL_PC_YN", function() {
				setViewCategory();
			});

			$(document).on("click", "#PRD_MST_CNL_MB_YN", function() {
				setViewCategory();
			});

			// 카테고리팝업호출
			registPopup = function(env) {
				var brandCd = $("#PRD_MST_BRAND_CD").val();

				popup('', "1000", "300", "no", "_CategoryPopup");
				$("#PRD_CTG_ENV").val(env);
				$("#PRD_CTG_BRAND").val(brandCd);
				$("#searchForm")
						.attr(
								{
									"action" : "<c:out value="${serverDomain}" />/am/product/searchCategoryPopup.do",
									"target" : "popup_CategoryPopup",
									"method" : "post"
								}).submit();
			};

			//카테고리 검색 결과
			fnResultCategory = function(params) {
				var bCheck = true;
				var $obj = $("#applyCategoryList_" + params.PRD_CTG_ENV
						+ " input[name='PRD_CTG_IDXs_" + params.PRD_CTG_ENV
						+ "']");
				$.each($obj, function() {
					if (params.CTG_IDX == $(this).val()) {
						alert("[" + params.CTG_PATH + "] 이미 선택된 카테고리입니다.");
						bCheck = false;
						return false;
					}
				});

				if (bCheck) {
					//기본TR삭제
					$("#categoryNodata_" + params.PRD_CTG_ENV).remove();

					var idx = $("#applyCategoryList_" + params.PRD_CTG_ENV)
							.find("tr").length;
					params.IDX = ++idx;

					if (params.PRD_CTG_ENV == "P") {
						$("#CTG_PATH").val(params.CTG_PATH);
					}

					$("#categoryTemplate").tmpl(params).appendTo(
							"#applyCategoryList_" + params.PRD_CTG_ENV);
				}
				return true;
			};

			// 스펙팝업호출
			specRegistPopup = function(env) {

				popup('', "1000", "300", "no", "_SpecCategoryPopup");
				$("#PRD_SPC_ENV").val(env);
				$("#PRD_SPC_TYPE").val("P");
				$("#searchForm")
						.attr(
								{
									"action" : "<c:out value="${serverDomain}" />/am/product/searchSpecCategoryPopup.do",
									"target" : "popup_SpecCategoryPopup",
									"method" : "post"
								}).submit();
			};

			//스펙 검색 결과
			fnResultSpecCategory = function(params) {
				var bCheck = true;
				var $obj = $("#applySpecCategoryList_" + params.PRD_SPC_ENV
						+ " input[name='PRD_SPC_IDXs_" + params.PRD_SPC_ENV
						+ "']");
				$.each($obj, function() {
					if (params.SPC_IDX == $(this).val()) {
						alert("[" + params.SPC_PATH + "] 이미 선택된 스펙입니다.");
						bCheck = false;
						return false;
					}
				});

				if (bCheck) {
					//기본TR삭제
					$("#specCategoryNodata_" + params.PRD_SPC_ENV).remove();

					var idx = $("#applySpecCategoryList_" + params.PRD_SPC_ENV)
							.find("tr").length;
					params.IDX = ++idx;

					$("#spceCategoryTemplate").tmpl(params).appendTo(
							"#applySpecCategoryList_" + params.PRD_SPC_ENV);
				}
				return true;
			};

			// 사용상품 카테고리 선택삭제 이벤트
			$(document)
					.on(
							"click",
							"a[id^=goCategoryDelete]",
							function() {
								var strArray = $(this).attr("id").split('_');
								var env = strArray[strArray.length - 1];

								if ($(".checkRow_" + env + ":checked").length == 0) {
									alert("삭제할 카테고리를 선택하여 주십시오.");
									return;
								}

								$(".checkRow_" + env + ":checked").each(
										function(i, item) {
											$(item).parentsUntil("tbody")
													.remove();
										});

								if ($("#applyCategoryList_" + env).children(
										"tr").length == 0) {
									$("#applyCategoryList_" + env)
											.append(
													'<tr id="categoryNodata_'+env+'"><td colspan="2">카테고리를 검색해 주세요.</td></tr>');
								}

								//체크박스 전체 선택
								$(".checkAll_" + env).prop("checked", false);
							});

			// 사용상품 스펙 선택삭제 이벤트
			$(document)
					.on(
							"click",
							"a[id^=goSpcCategoryDelete]",
							function() {
								var strArray = $(this).attr("id").split('_');
								var env = strArray[strArray.length - 1];

								if ($(".checkSpecRow_" + env + ":checked").length == 0) {
									alert("삭제할 스펙을 선택하여 주십시오.");
									return;
								}

								$(".checkSpecRow_" + env + ":checked").each(
										function(i, item) {
											$(item).parentsUntil("tbody")
													.remove();
										});

								if ($("#applySpecCategoryList_" + env)
										.children("tr").length == 0) {
									$("#applySpecCategoryList_" + env)
											.append(
													'<tr id="specCategoryNodata_'+env+'"><td colspan="2">스펙을 추가해 주세요.</td></tr>');
								}

								//체크박스 전체 선택
								$(".checkAllSpec_" + env)
										.prop("checked", false);
							});

			// 사용상품 카테고리 선택삭제 이벤트
			$(document).on("click", "input[name=LI_DEL_PRD_SHG]", function() {
				$(this).parent().remove();
			});

			// 아이콘 사용중 설정시
			$(document)
					.on(
							"click",
							"input[name^=PRD_MST_ICN_YN]",
							function() {
								var strArray = $(this).attr("id").split('_');
								var icn_idx = strArray[strArray.length - 1];

								if ($(this).val() == "Y") {
									if ($("#PRD_MST_ICN_ST_DT_" + icn_idx)
											.val().length != 10
											|| $(
													"#PRD_MST_ICN_ED_DT_"
															+ icn_idx).val().length != 10) {
										$("#PRD_MST_ICN_DT_YN_" + icn_idx)
												.prop("checked", true);
									}
								} else {
									$("#PRD_MST_ICN_ST_DT_" + icn_idx).val("");
									$("#PRD_MST_ICN_ED_DT_" + icn_idx).val("");
									$("#PRD_MST_ICN_DT_YN_" + icn_idx).prop(
											"checked", false);
								}
							});

			// 상품 아이콘 날짜 설정
			$(document)
					.on(
							"change",
							"input[type=text][name^=PRD_MST_ICN_][name*=_DT]",
							function() {
								var strArray = $(this).attr("id").split('_');
								var icn_idx = strArray[strArray.length - 1];
								if ($("#PRD_MST_ICN_ST_DT_" + icn_idx).val().length == 10
										&& $("#PRD_MST_ICN_ED_DT_" + icn_idx)
												.val().length == 10) {
									$("#PRD_MST_ICN_DT_YN_" + icn_idx).attr(
											"checked", false);
								}
							});

			// 상품아이콘 제한없음 클릭
			$(document).on("click", "input[name^=PRD_MST_ICN_DT_YN]",
					function() {
						if ($(this).is(":checked") == true) {
							var strArray = $(this).attr("id").split('_');
							var opt_idx = strArray[strArray.length - 1];
							$("#PRD_MST_ICN_ST_DT_" + opt_idx).val('');
							$("#PRD_MST_ICN_ED_DT_" + opt_idx).val('');
						}
					});

			// tab 변경
			$("#menuViewTab").on("click", "a", function() {

				var this_tab_no = $(this).data('tab_no');

				$(this).parent().parent().find('a').each(function(i, item) {
					if (this_tab_no == $(item).data("tab_no")) {
						$("#" + $(item).data("tab_no")).show();
						$(item).parent().attr("class", "in");
					} else {
						$("#" + $(item).data("tab_no")).hide();
						$(item).parent().attr("class", "");
					}
				});
			});

			// 상품상세 PC와 동일하게 체크시 모바일 상세 비활성화
			$(document).on(
					"click",
					"#detailChk",
					function() {
						if ($("#detailChk").is(":checked")) {
							oEditors2.getById["PRD_MST_DETAIL_DESC2"]
									.exec("DISABLE_WYSIWYG");
						} else {
							oEditors2.getById["PRD_MST_DETAIL_DESC2"]
									.exec("ENABLE_WYSIWYG");
						}
					});

			// 옵션 추가 클릭 시
			$(document).on(
					"click",
					"#goProductOption",
					function() {
						//기본TR삭제
						$("#productOptionNodata").remove();

						var params = {
							"OPT_DETAIL_IDX" : 0,
							"OPT_IDX" : 0,
							"OPT_CNT" : 0
						};
						var idx2 = $("#applyproductOptionList").find("tr").not(
								$("table[id^=optDetail]").find("tr")).length;

						params.OPT_IDX = ++idx2;
						params.OPT_DETAIL_IDX = 1;
						params.OPT_CNT = 1;

						$("#productOptionTemplate").tmpl(params).appendTo(
								"#applyproductOptionList");
						treePageSetting();
						return true;

					});

			// 옵션삭제
			$(document)
					.on(
							"click",
							"#goProductOptionDel",
							function() {
								$(this).parentsUntil("tbody").remove();
								if ($("#applyproductOptionList").children("tr").length == 0) {
									$("#applyproductOptionList")
											.append(
													'<tr id="productOptionNodata"><td colspan="8">옵션을 추가해 주세요.</td></tr>');
								}
							});

			//옵션항목 추가
			$(document).on(
					"click",
					"#goProductOptionAdd",
					function() {

						var optattr = $(this).parent("td").parent("tr").parent(
								"tbody").parent("table").attr("id").split("_");
						var optDetail = "#"
								+ $(this).parent("td").parent("tr").parent(
										"tbody").parent("table").attr("id");
						var params = {
							"OPT_DETAIL_IDX" : 0,
							"OPT_IDX" : 0
						};
						var idx2 = optattr[1];
						var idx = $(optDetail).find("tr").length;
						var rowCnt = idx;

						params.OPT_DETAIL_IDX = ++idx;
						params.OPT_IDX = idx2;

						//옵션 추가된 갯수 업데이트
						$("input[name=PRD_OPT_SUB_CNT]").eq(idx2 - 1).val(
								rowCnt + 1);
						$("#productOptionDetailTemplate").tmpl(params)
								.appendTo(optDetail);
						treePageSetting();

					});

			// 옵션 상세 삭제
			$(document).on(
					"click",
					"#goProductOptionDetaildel",
					function() {
						var optattr = $(this).parent("td").parent("tr").parent(
								"tbody").parent("table").attr("id").split("_");
						var idx2 = optattr[1];

						var subCnt = $("input[name=PRD_OPT_SUB_CNT]").eq(
								idx2 - 1).val();

						//옵션 추가된 갯수 업데이트
						$("input[name=PRD_OPT_SUB_CNT]").eq(idx2 - 1).val(
								subCnt - 1);
						$(this).parent("td").parent("tr").remove();
					});

			// 목록 이벤트
			$(document)
					.on(
							"click",
							"#goList",
							function() {
								var $frm = $("#searchForm");
								$frm
										.attr(
												{
													"action" : "<c:out value="${serverDomain}" />/am/product/basicProductList.do",
													"target" : "_self",
													"method" : "post"
												}).submit();
							});

			// 저장 이벤트
			$(document)
					.on(
							"click",
							"#goRegist",
							function() {

								var $frm = $("#frm");
								if ($("#PRD_MST_NM").val() == "") {
									alert("상품명을 입력해주세요.");
									$("#PRD_MST_NM").focus();
									return;
								}

								if ($("#PRD_MST_MD_ID").val() == "") {
									alert("담당MD를 선택해주세요.");
									$("#PRD_MST_MD_ID").focus();
									return;
								}

								//판매가능수량 체크
								if ($("#PRD_MST_SEL_CNT").val() < 1
										|| $("#PRD_MST_SEL_CNT").val() == "") {
									alert("판매가능 수량을 입력해주세요.");
									$("#PRD_MST_SEL_CNT").focus();
									return;
								}
								//장기할부 개월수 체크
								if ($("#PRD_MST_LNG_DIV_YN").val() == "Y") {
									if ($("#PRD_MST_LNG_DIV_MNT1").is(
											":checked") == false
											&& $("#PRD_MST_LNG_DIV_MNT2").is(
													":checked") == false) {
										alert("장기할부 사용시 개월수를 선택 해주셔야 합니다.");
										$("#PRD_MST_LNG_DIV_MNT1").focus();
										return;
									}
								} else {
									$("#PRD_MST_LNG_DIV_MNT1").prop("checked",
											false);
									$("#PRD_MST_LNG_DIV_MNT2").prop("checked",
											false);
								}

								//배교검색 체크
								if ($("#PRD_MST_CPS_YN").val() == "Y") {
									if ($("#PRD_MST_CPS_MDL").val() == "") {
										alert("비교검색 사용시 모델명을 입력해주세요.");
										$("#PRD_MST_CPS_MDL").focus();
										return;
									}
								}

								//배송지정일
								if ($("#PRD_MST_DLV_DSN_YN").val() == "Y") {
									if ($("#PRD_MST_DLV_DT").val() < 1) {
										alert("배송지정일 사용시 배송 가능일은 입력해주세요.");
										$("#PRD_MST_DLV_DT").focus();
										return;
									}
								} else {
									$("#PRD_MST_DLV_DT").val("");
								}

								if ($("#PRD_MST_O2O_YN").val() == "Y") {
									if ($("#PRD_MST_DLV_FEE").val() > 0) {
										alert("쇼핑몰 겟잇나우 사용시 배송비는 0원이어야 합니다.");
										$("#PRD_MST_DLV_FEE").focus();
										return;
									}
								}

								if ($("#PRD_MST_IVB_YN").val() == "Y") {
									if ($("#PRD_MST_DLV_FEE").val() > 0) {
										alert("무형상품 사용시 배송비는 0원이어야 합니다.");
										$("#PRD_MST_DLV_FEE").focus();
										return;
									}
								}

								//상품가격 체크
								if ($("#PRD_MST_PRC").val() < 1
										|| $("#PRD_MST_PRC").val() == "") {
									alert("상품가격을 입력해주세요.");
									$("#PRD_MST_PRC").focus();
									return;
								}
								if ($("#PRD_MST_SCH_PRC").val() < 1
										|| $("#PRD_MST_SCH_PRC").val() == "") {
									alert("검색가를 입력해주세요.");
									$("#PRD_MST_SCH_PRC").focus();
									return;
								}
								if ($("#PRD_MST_CPR_PRC1").val() < 1
										|| $("#PRD_MST_CPR_PRC1").val() == "") {
									alert("기업회원(1등급) 가격을 입력해주세요.");
									$("#PRD_MST_CPR_PRC1").focus();
									return;
								}
								if ($("#PRD_MST_CPR_PRC2").val() < 1
										|| $("#PRD_MST_CPR_PRC2").val() == "") {
									alert("기업회원(2등급) 가격을 입력해주세요.");
									$("#PRD_MST_CPR_PRC2").focus();
									return;
								}

								// 쇼핑채널 필수입력 체크
								if (!$("#PRD_MST_CNL_PC_YN").is(":checked")
										&& !$("#PRD_MST_CNL_MB_YN").is(
												":checked")) {
									alert("쇼핑채널은 필수 입력값입니다.");
									return;
								}

								// 쇼핑채널별 카테고리 필수입력 체크
								if ($("#PRD_MST_CNL_PC_YN").is(":checked")) {
									if ($("input[name=PRD_CTG_IDXs_${Code.CATEGORY_TYPE_PC}]").length == 0) {
										alert("PC카테고리는 필수 입력값입니다.");
										return;
									}
								}
								if ($("#PRD_MST_CNL_MB_YN").is(":checked")) {
									if ($("input[name=PRD_CTG_IDXs_${Code.CATEGORY_TYPE_MOBILE}]").length == 0) {
										alert("모바일카테고리는 필수 입력값입니다.");
										return;
									}
								}

								//상품아이콘 체크
								var icnChk = false;
								$("input[id^=PRD_MST_ICN_YN1_]")
										.each(
												function(idx) {
													var icnYn = $(
															":radio[name=PRD_MST_ICN_YN"
																	+ (idx + 1)
																	+ "]:checked")
															.val();
													var icnDtYn = $(
															"#PRD_MST_ICN_DT_YN_"
																	+ (idx + 1)
																	+ "").is(
															":checked");
													var icnStDt = $(
															"#PRD_MST_ICN_ST_DT_"
																	+ (idx + 1)
																	+ "").val();
													var icnEdDt = $(
															"#PRD_MST_ICN_ED_DT_"
																	+ (idx + 1)
																	+ "").val();

													if (icnYn == "Y") {
														if (!icnDtYn
																&& (icnStDt == "" || icnEdDt == "")) {
															icnChk = true;
														}
														if (icnDtYn
																&& (icnStDt != "" || icnEdDt != "")) {
															$(
																	"#PRD_MST_ICN_ST_DT_"
																			+ (idx + 1)
																			+ "")
																	.val("");
															$(
																	"#PRD_MST_ICN_ED_DT_"
																			+ (idx + 1)
																			+ "")
																	.val("");
														}
													} else {
														$(
																"#PRD_MST_ICN_DT_YN_"
																		+ (idx + 1)
																		+ "")
																.prop(
																		"checked",
																		false);
														$(
																"#PRD_MST_ICN_ST_DT_"
																		+ (idx + 1)
																		+ "")
																.val("");
														$(
																"#PRD_MST_ICN_ED_DT_"
																		+ (idx + 1)
																		+ "")
																.val("");
													}
												});

								if (icnChk) {
									alert("아이콘 사용 선택 시 노출 기간 혹은 제한없음을 선택 하셔야 합니다.");
									return false;
								}

								//옵션체크
								var optArtMsg = "", optChk = false, optFocus = "";
								$("#applyproductOptionList")
										.find("tr")
										.not(
												$("table[id^=optDetail]").find(
														"tr"))
										.each(
												function(idx) {
													if ($(
															"input[name=PRD_OPT_NM]")
															.eq(idx).val() == "") {
														optArtMsg = "옵션명을 입력해주세요";
														optFocus = $(
																"input[name=PRD_OPT_NM]")
																.eq(idx);
														optChk = true;
														return false;
													}
												});
								if (optChk == false) {
									$("table[id^=optDetail]")
											.find("tr")
											.each(
													function(idx2) {
														if ($(
																"input[name=OPT_DTL_NM]")
																.eq(idx2).val() == "") {
															optArtMsg = "옵션값을 입력해주세요";
															optFocus = $(
																	"input[name=OPT_DTL_NM]")
																	.eq(idx2);
															optChk = true;
															return false;
														}
													});
									$("select[name=PRD_OPT_EST_YN]")
											.each(
													function(sidx) {
														if ($(this).val() == "N") {
															$(
																	"table[id^=optDetail_"
																			+ (sidx + 1)
																			+ "]")
																	.find(
																			"input[name=OPT_DTL_ADD_PRC]")
																	.each(
																			function() {
																				if (removeComma($(
																						this)
																						.val()) < 0) {
																					optArtMsg = "필수여부 미사용 시 추가가격은 정수로 입력하셔야 합니다.";
																					optFocus = $(this);
																					optChk = true;
																					return false;
																				}
																			});
														}
													});
								}
								if (optChk) {
									alert(optArtMsg);
									optFocus.focus();
									return false;
								}

								var chnArtMsg = "", chnFocus = "", chkChk = false;
								//채널 2뎁스 가격 입력 체크
								$("input[name^=PRD_CHN_PRC_YN]")
										.each(
												function() {
													var chnCheckedAll = $(this)
															.is(":checked");
													var strArray = $(this)
															.attr("id").split(
																	'_');
													var chn_idx = strArray[strArray.length - 2];

													if (chnCheckedAll) {
														$(
																"input[name^=PRD_CHN_PRC_"
																		+ chn_idx
																		+ "]")
																.each(
																		function(
																				idx) {
																			if ($(
																					this)
																					.val() == "") {
																				chnArtMsg = "검색채널 사용 시 검색가를 입력해주세요.";
																				chnFocus = $(
																						"input[name^=PRD_CHN_PRC_"
																								+ chn_idx
																								+ "]")
																						.eq(
																								idx);
																				chkChk = true;
																				return false;
																			}
																		});
														return false;
													}
												});

								$("input[name=PRD_CHN_PRC]")
										.each(
												function(idx) {
													if ($(this).val() == "") {
														chnArtMsg = "검색채널 사용 시 검색가를 입력해주세요.";
														chnFocus = $(
																"input[name=PRD_CHN_PRC]")
																.eq(idx);
														chkChk = true;
													}
												});

								if (chkChk) {
									alert(chnArtMsg);
									chnFocus.focus();
									return false;
								}

								if ($("#PRD_MST_NFI_IDX").val() == "") {
									alert("상품고시정보 품목을 선택해주세요.");
									$("#PRD_MST_NFI_IDX").focus();
									return;
								}

								if ($("#PRD_MST_BRD_NM").val() == "") {
									alert("상품고시정보 브랜드를 선택해주세요.");
									$("#PRD_MST_BRD_NM").focus();
									return;
								}

								if ($("#PRD_MST_MRK_NM").val() == "") {
									alert("상품고시정보 제조사를 선택해주세요.");
									$("#PRD_MST_MRK_NM").focus();
									return;
								}

								//미판매, 승인대기, 승인거절, 진열X 검색노출여부 N 자동 셋팅
								if ($("#PRD_MST_SEL_STATE").val() == "S"
										|| $("#PRD_MST_APV_STATE").val() == "D"
										|| $("#PRD_MST_APV_STATE").val() == "C"
										|| $("#PRD_MST_DPL_STATE").val() == "N") {
									alert("미판매  혹은 승인대기 혹은 승인거절 혹은 진열 NO 일 때\n검색노출여부는 자동적으로 NO로 변경 됩니다.");
									$("#PRD_MST_SRC_YN").val("N");
								}

								if (confirm("등록 하시겠습니까?")) {
									//금액 콤마 제거
									$("#PRD_MST_PRC")
											.val(
													removeComma($(
															"#PRD_MST_PRC")
															.val()));
									$("#PRD_MST_SCH_PRC").val(
											removeComma($("#PRD_MST_SCH_PRC")
													.val()));
									$("#PRD_MST_CPR_PRC1").val(
											removeComma($("#PRD_MST_CPR_PRC1")
													.val()));
									$("#PRD_MST_CPR_PRC2").val(
											removeComma($("#PRD_MST_CPR_PRC2")
													.val()));
									$("#PRD_MST_PKG_PRC").val(
											removeComma($("#PRD_MST_PKG_PRC")
													.val()));
									$("#PRD_MST_ERP_DSP_PRC").val(
											removeComma($(
													"#PRD_MST_ERP_DSP_PRC")
													.val()));
									$("#PRD_MST_SEL_CNT").val(
											removeComma($("#PRD_MST_SEL_CNT")
													.val()));
									$("input[name=OPT_DTL_ADD_PRC]").each(
											function() {
												$(this).val(
														removeComma($(this)
																.val()));
											});
									$("input[name=OPT_DTL_STK_CNT]").each(
											function() {
												$(this).val(
														removeComma($(this)
																.val()));
											});
									// 카테고리 삭제
									if ($("#pc_category").css("display") == 'none') {
										$("#pc_category").empty();
									} else if ($("#mobile_category").css(
											"display") == 'none') {
										$("#mobile_category").empty();
									}

									//채널 2뎁스 체크
									$("input[name^=PRD_CHN_PRC_YN]")
											.each(
													function() {
														var chnCheckedAll = $(
																this).is(
																":checked");
														var strArray = $(this)
																.attr("id")
																.split('_');
														var chn_idx = strArray[strArray.length - 2];
														var chnType = $(this)
																.attr("type");
														if (chnType == "checkbox") {
															if (chnCheckedAll) {
																$(
																		"input[id^=PRD_CHN_DPT_CHK_"
																				+ chn_idx
																				+ "]")
																		.prop(
																				"checked",
																				true);
																$(this)
																		.val(
																				"Y");
															} else {
																$(this)
																		.prop(
																				"checked",
																				true);
																$(this)
																		.val(
																				"N");
															}
														}
													});

									$("input[name^=PRD_CHN_PRC]")
											.each(
													function() {
														$(this)
																.val(
																		removeComma($(
																				this)
																				.val()));
														$(this).attr(
																"disabled",
																false);
													});
									$("input[name=PRD_MST_BRD_NM]").attr(
											"disabled", false);
									$("input[name=PRD_MST_MRK_NM]").attr(
											"disabled", false);

									try {
										oEditors1.getById["PRD_MST_DETAIL_DESC"]
												.exec("UPDATE_CONTENTS_FIELD",
														[]);
									} catch (e) {
									} //editor 내용을 PRD_MST_DETAIL_DESC TEXTAREA의 VALUE 값으로 만든다.
									try {
										oEditors2.getById["PRD_MST_DETAIL_DESC2"]
												.exec("UPDATE_CONTENTS_FIELD",
														[]);
									} catch (e) {
									} //editor 내용을 PRD_MST_DETAIL_DESC TEXTAREA의 VALUE 값으로 만든다.

									if ($("#detailChk").is(":checked")) {
										$("#PRD_MST_DETAIL_DESC2")
												.val(
														$(
																"#PRD_MST_DETAIL_DESC")
																.val());
									}

									// 상품고시정보 등록처리를 위해 input disabled 변경
									$("input[name^=PRD_MST_NFI_INF]")
											.each(
													function() {
														$(this).attr(
																"disabled",
																false);
													});

									$frm
											.attr(
													{
														"action" : "<c:out value="${serverDomain}" />/am/product/basicProductRegist.do",
														"target" : "_self",
														"method" : "post"
													}).submit();
								}
							});

			//품목정보 등록/수정 폼
			$(document)
					.on(
							"change",
							"#PRD_MST_NFI_IDX",
							function() {

								var prdMstNfiIdx = "<c:out value="${productInfo.PRD_MST_NFI_IDX}" />";
								var prdMstnfiInf = "<c:out value="${PRD_MST_NFI_INF}" />";

								prdMstnfiInf = prdMstnfiInf.split("|");

								$("#createproductNotificationInfoTable")
										.children("tr").remove();
								if ($(this).val() == "") {
									$("#createproductNotificationInfoTable")
											.hide();
									return;
								} else {
									$("#createproductNotificationInfoTable")
											.show();
								}

								var prdNfiChk = false;

								$
										.ajax({
											async : false,
											type : "POST",
											data : {
												"PRD_NFI_IDX" : $(this).val()
											},
											url : "<c:out value="${serverDomain}" />/am/product/productNotificationInfoAjax.do",
											success : function(data) {

												if (data.prdNfiList != null) {
													var arrayObj = new Array();

													$
															.each(
																	data.prdNfiList,
																	function(
																			index,
																			item) {
																		var obj = new Object();

																		obj.PRD_NFI_INFO = item.PRD_NFI_INFO;
																		obj.PRD_NFI_INFO_CODE = item.PRD_NFI_INFO_CODE == '' ? 0
																				: item.PRD_NFI_INFO_CODE;
																		obj.PRD_NFI_INFO_YN = item.PRD_NFI_INFO_YN;

																		if (prdMstNfiIdx == item.PRD_NFI_UP_IDX) {
																			obj.PRD_MST_NFI_INF = prdMstnfiInf[index];
																			prdNfiChk = true;
																		} else {
																			//품질보증기준 강제입력값
																			/* if(item.PRD_NFI_INFO_CODE == "1827"){
																			    obj.PRD_MST_NFI_INF = "공정거래위원회 고시 소비자분쟁해결기준에 준함";
																			}
																			if(item.PRD_NFI_INFO_CODE == "1822"){
																			    obj.PRD_MST_NFI_INF = $("#PRD_MST_CPS_MDL").val();
																			} */
																			obj.PRD_MST_NFI_INF = item.PRD_NFI_INFO_EXE;
																		}

																		obj.PRD_NFI_IDX = index + 1;
																		arrayObj
																				.push(obj);
																	});
													$(
															"#createproductNotificationInfoTable")
															.html(
																	$(
																			"#productNotificationInfoTemplate")
																			.tmpl(
																					arrayObj));

												} else {
													alert("조회된 데이터가 없습니다.");
												}
											},
											error : function(err) {
												alert("오류가 발생하였습니다.\n["
														+ err.status + "]");
											}
										});

								if (!prdNfiChk) {
									fnResultBrand($("#PRD_MST_BRD_IDX").val(),
											$("#PRD_MST_BRD_NM").val(), $(
													"#PRD_MST_BRD_SERV").val()); //AS전화번호
									fnResultMrk($("#PRD_MST_MRK_IDX").val(), $(
											"#PRD_MST_MRK_NM").val()); //제조사
								}
							});

			//상품고시정보 항목 선택
			$(document)
					.on(
							"change",
							"#PRD_NFI_INFO_YN",
							function() {
								var strArray = $(this).attr("name").split('_');
								var idx = strArray[strArray.length - 1];

								if ($(this).val() == 'S') {
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.val("");
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.attr("disabled", false);
								} else if ($(this).val() == 'N') {
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.val('정보없음');
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.attr("disabled", true);
								} else if ($(this).val() == 'D') {
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.val('상세설명참조');
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.attr("disabled", true);
								} else {
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.val("[자동입력]");
									$("input[name=PRD_MST_NFI_INF" + idx + "]")
											.attr("disabled", true);
								}
							});

			//상품가격 일괄 맞춤
			$(document).on("focusout", "#PRD_MST_PRC", function() {
				if ($(this).val() > 0 && $(this).val() != "") {
					var prcPrice = setComma($("#PRD_MST_PRC").val());
					$("#PRD_MST_PRC").val(prcPrice);
					$("#PRD_MST_SCH_PRC").val(prcPrice);
					$("#PRD_MST_CPR_PRC1").val(prcPrice);
					$("#PRD_MST_CPR_PRC2").val(prcPrice);
					//채널별 가격정의
					$("input[id^=PRD_CHN_DPT_PRC]").each(function() {
						$(this).val(prcPrice);
					});
					$("input[id^=PRD_CHN_PRC]").each(function() {
						$(this).val(prcPrice);
					});
				}
			});

			// -- 화면 로딩 기초 셋팅 --

			// 카테고리 / 선택월 view 셋팅
			setViewCategory();

			// 상품 상세설명 클릭시 에디터 height 값 적용(display:none 일때 에디터가 제대로 보이지 않는 증상 해결)
			$(document).on("click", "#descTab", function() {
				showSmartEditor("PRD_MST_DETAIL_DESC", 300, 1);
				showSmartEditor("PRD_MST_DETAIL_DESC2", 300, 2);
			});

			//숫자만 입력
			$(document).on("keyup", ".numbernr", function(event) {
				if (!(event.keyCode >= 37 && event.keyCode <= 40)) {
					var $this = $(this);
					$this.val($this.val().replace(/[^-\.0-9]/g, ''));
				}
			});
			// -- 화면 로딩 기초 셋팅 --

			//관련콘텐트 결과
			fnResultEMgz = function(params) {
				var bCheck = true;
				var $obj = $("#applyproductEmagazineList input[name='MGZ_MST_IDXs_PC']");
				$.each($obj, function() {
					if (params.MGZ_MST_IDX == $(this).val()) {
						alert("[" + params.MGZ_MST_TITLE + "] 이미 선택된 콘텐츠입니다.");
						bCheck = false;
						return false;
					}
				});

				if (bCheck) {
					//기본TR삭제
					$("#productEmagazineNodata").remove();

					var idx = $("#applyproductEmagazineList").find("tr").length;

					$("#emagazineTemplate").tmpl(params).appendTo(
							"#applyproductEmagazineList");
				}
				return true;
			};

			// 사용상품 관련콘텐츠 선택삭제 이벤트
			$(document)
					.on(
							"click",
							"a[id=goEmagazineDelete]",
							function() {

								if ($(".checkEmgzRow:checked").length == 0) {
									alert("삭제할 콘텐츠를 선택하여 주십시오.");
									return;
								}

								$(".checkEmgzRow:checked").each(
										function(i, item) {
											$(item).parentsUntil("tbody")
													.remove();
										});

								if ($("#applyproductEmagazineList").children(
										"tr").length == 0) {
									$("#applyproductEmagazineList")
											.append(
													'<tr id="productEmagazineNodata"><td colspan="3">관련 콘텐츠를 추가해 주세요.</td></tr>');
								}

								//체크박스 전체 선택
								$(".checkAllEmgz").prop("checked", false);
							});

			// 브랜드 팝업
			$(document)
					.on(
							"click",
							"#goBrandPopup",
							function() {
								popup('', "810", "700", "no", "_BrandPopup");
								$("#searchForm")
										.attr(
												{
													"action" : "<c:out value="${serverDomain}" />/am/product/searchBrandPopup.do",
													"target" : "popup_BrandPopup",
													"method" : "post"
												}).submit();
							});

			//브랜드 선택 함수
			fnResultBrand = function(brdMstIdx, brdMstNm, brdMstServ) {
				var nfiCode = $("#B_PRD_NFI_INFO_CODE_1828").parent("td").find(
						"input[name^=PRD_MST_NFI_INF]");

				if (brdMstIdx != "") {
					$("#PRD_MST_BRD_NM").val(brdMstNm);
					$("#PRD_MST_BRD_IDX").val(brdMstIdx);
					$("#PRD_MST_BRD_SERV").val(brdMstServ);
					nfiCode.val(brdMstServ);
				}
			};

			// 제조사 팝업
			$(document)
					.on(
							"click",
							"#goMrkPopup",
							function() {

								popup('', "810", "700", "no", "_MrkPopup");
								$("#searchForm")
										.attr(
												{
													"action" : "<c:out value="${serverDomain}" />/am/product/searchMrkPopup.do",
													"target" : "popup_MrkPopup",
													"method" : "post"
												}).submit();
							});

			//제조사 선택 함수
			fnResultMrk = function(mrkMstIdx, mrkMstNm) {
				var nfiCode = $("#B_PRD_NFI_INFO_CODE_1823").parent("td").find(
						"input[name^=PRD_MST_NFI_INF]");

				if (mrkMstIdx != "") {
					$("#PRD_MST_MRK_NM").val(mrkMstNm);
					$("#PRD_MST_MRK_IDX").val(mrkMstIdx);
					$("#B_PRD_NFI_INFO_CODE_1823").val(mrkMstNm);
					nfiCode.val(mrkMstNm);
				}
			};

			//채널별 전체 체크
			$("input[id^=PRD_CHN_DPT_CHK]").on(
					"click",
					function() {
						var chnCheckedAll = $(this).is(":checked");
						var strArray = $(this).attr("id").split('_');
						var chn_idx = strArray[strArray.length - 1];

						if (chnCheckedAll) {
							$("input[id^=PRD_CHN_PRC_YN_" + chn_idx + "]")
									.each(function() {
										$(this).prop("checked", true);
									});
						} else {
							$("input[id^=PRD_CHN_PRC_YN_" + chn_idx + "]")
									.each(function() {
										$(this).prop("checked", false);
									});
						}

					});

			//채널별 개별가격설정
			$("input[id^=PRD_CHN_DPT_ALL_YN]")
					.on(
							"click",
							function() {
								var chnChecked = $(this).is(":checked");
								var strArray = $(this).attr("id").split('_');
								var chn_idx = strArray[strArray.length - 1];

								if (chnChecked) {
									$("input[id^=PRD_CHN_PRC_" + chn_idx + "]")
											.each(
													function() {
														$(this).attr(
																"disabled",
																false);
														$(this)
																.val(
																		setComma($(
																				"input[name=PRD_CHN_DPT_PRC_"
																						+ chn_idx
																						+ "]")
																				.val()));
													});
									$(
											"input[name=PRD_CHN_DPT_PRC_"
													+ chn_idx + "]").attr(
											"disabled", true);
								} else {
									$("input[id^=PRD_CHN_PRC_" + chn_idx + "]")
											.each(
													function() {
														$(this).attr(
																"disabled",
																true);
														$(this)
																.val(
																		setComma($(
																				"input[name=PRD_CHN_DPT_PRC_"
																						+ chn_idx
																						+ "]")
																				.val()));
													});
									$(
											"input[name=PRD_CHN_DPT_PRC_"
													+ chn_idx + "]").attr(
											"disabled", false);
								}

							});

			//제휴채널 추가
			$("#goChannel").on(
					"click",
					function() {

						if ($("#CHN_DEPT_1").val() == ""
								|| $("#CHN_DEPT_2").val() == "") {
							alert("제휴채널 추가시 제휴채널그룹1 및 제휴채널그룹2를 선택해 주세요.");
							return;
						}

						var bCheck = true;
						var chnDpt3 = $("#CHN_DEPT_2").val().split("^");
						$("input[name=CHN_DTL_CD]").each(
								function() {
									if ($(this).val() == chnDpt3[0]) {
										alert("[" + chnDpt3[1]
												+ "] 동일한 제휴채널그룹2가 있습니다.");
										bCheck = false;
										return false;
									}
								});

						if (bCheck) {
							obj = new Object();
							obj.PRD_CHN_DPT2 = $("#CHN_DEPT_1").val();
							obj.CHN_DTL_CD = chnDpt3[0];
							obj.PRD_CHN_DPT3_NM = chnDpt3[1];

							$("#channelTemplate").tmpl(obj).appendTo(
									"#applyChannelList");
						}
					});

			//제휴채널 삭제
			$(document).on("click", "#goChannelDelete", function() {
				$(this).parent().remove();
			});

			$(document)
					.on(
							"change",
							"#CHN_DEPT_1",
							function() {
								var chnIdx = $(this).val();

								if (chnIdx != "") {
									$
											.ajax({
												type : "POST",
												url : "<c:out value="${serverDomain}"/>"
														+ "/am/product/subChannelListAjax.do",
												data : {
													"CHN_MST_IDX" : chnIdx
												},
												dataType : "JSON",
												async : false,
												success : function(data) {
													var selected = "";
													$("#CHN_DEPT_2")
															.empty()
															.append(
																	"<option value=''>제휴채널그룹2</option>");
													$
															.each(
																	data.ChannelList,
																	function(i,
																			item) {
																		$(
																				"#CHN_DEPT_2")
																				.append(
																						"<option value='"+item.CHN_DTL_CD+"^"+item.CHN_DTL_NM+"' >"
																								+ item.CHN_DTL_NM
																								+ "</option>");
																	});

												},
												error : function(xhr, status,
														error) {
													alert("제휴채널그룹2 호출 중 에러가 발생하였습니다.");
													//alert("code:"+xhr.status);
												}
											});
								} else {
									alert("제휴채널그룹 필수 값이 없습니다.");
									return false;
								}
							});

			$('#PRD_MST_NFI_IDX').trigger('change');

			// 파일 업로드 테스트
			$('#fine-uploader-gallery')
					.fineUploader(
							{
								template : 'qq-template-gallery',
								request : {
									endpoint : '<c:out value="${serverDomain}" />/pc/common/testImageUploader.do',
									inputName : "upload",
									uuidName : "createdUUID",
									filenameParam : "_product_image"
								},
								thumbnails : {
									placeholders : {
										waitingPath : '<c:out value="${cdnDomain}" />/am/js/plugins/fine-uploader/placeholders/waiting-generic.png',
										notAvailablePath : '<c:out value="${cdnDomain}" />/am/js/plugins/fine-uploader/placeholders/not_available-generic.png'
									}
								},
								validation : {
									allowedExtensions : [ 'jpeg', 'jpg', 'gif',
											'png' ],
									itemLimit : 10,
									sizeLimit : 2097152
								},
								deleteFile : {
									enabled : true,
									forceConfirm : true,
									params : {
										"type" : "delete"
									},
									endpoint : '<c:out value="${serverDomain}" />/pc/common/testImageUploader.do?createdUUID=',
								},
								callbacks : {
									onComplete : function(id, name,
											responseJSON, maybeXhr) {
										v_env = Number(id) + 1; // 인덱스 0은 대표이미지의 인덱스이므로 +1 해줌
										resultExec(responseJSON);
										console.log(responseJSON);
									}
								},
								autoUpload : false
							})
					.on(
							'upload',
							function(event, id, name) {
								$(this)
										.fineUploader(
												"setParams",
												{
													"fileObj" : "<c:out value="${commandMap.PRD_FILE_NAME }"/>_"
															+ (id + 1),
													"type" : "upload",
													"pathType" : "product",
													"Allow" : "image",
													"callFunction" : "resultExec",
													"PRD_MST_CD" : "",
													"PRD_FILE_NAME" : "<c:out value="${commandMap.PRD_FILE_NAME }"/>",
													"makeThumbnail" : "Y"
												});
							})
					.on(
							'delete',
							function(event, id, name) {
								// 서버상의 이미지 삭제, AJAX로 호출합니다
								$('.product_image_hidden_inform_' + (id + 1))
										.each(
												function(index) {
													$
															.ajax({
																async : false,
																type : "POST",
																data : {
																	"image_info" : $(
																			this)
																			.val()
																},
																url : "<c:out value="${serverDomain}" />/am/product/upload/basicProductImageRemoveJson.do",
																success : function(
																		data) {
																	if (data.resultYn == "N") {
																		// TODO nothing
																	}
																},
																error : function(
																		err) {
																	alert("오류가 발생하였습니다.\n["
																			+ err.status
																			+ "]");
																}
															});
												});
								// 화면에서 상품이미지 삭제
								$('.product_image_hidden_inform_' + (id + 1))
										.remove();
							});

			// 파일을 서버에 업로드
			$('#trigger-upload').click(function() {
				$('#fine-uploader-gallery').fineUploader('uploadStoredFiles');
			});
		});

		$(function(){

    	$(".colorChip").click(function () {
      		$(this).toggleClass("on");
    		});
		});

		$('.productImgUrl').hide();

		$(document).ready(function(){
		    $("#check1").change(function(){
		        if($("#check1").is(":checked")){
		            $('.productImgUrl').show();
					$('.default').hide();
					$('.optional').hide();
		        }else{
		            $('.productImgUrl').hide();
					$('.default').show();
					$('.optional').show();
		        }
		    });
		});
	//-->
	</script>

</body>
</html>
