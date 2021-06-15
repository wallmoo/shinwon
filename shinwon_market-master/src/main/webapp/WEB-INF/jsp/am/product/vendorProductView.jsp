<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="ko"><![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="ko"><![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="ko"><![endif]-->
<!--[if IE 9 ]><html class="ie ie9" lang="ko"><![endif]-->
<!--[if (gte IE 10)|!(IE)]><!--><html lang="ko"><!--<![endif]-->
<head>
	<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>
	<jsp:useBean id="now" class="java.util.Date" />
	<link href="<c:out value="${serverDomain}" />/am/js/plugins/fine-uploader/fine-uploader-gallery.css" rel="stylesheet">
</head>
<body>
	<!-- header -->
	<div id="header">
		<%@ include file="/WEB-INF/jsp/am/include/top.jsp"%>
	</div>
	<!-- // header -->
	<!-- #container -->
	<div id="container">
		<!-- #aside -->
		<div id="aside" class="aside left">
			<%@ include file="/WEB-INF/jsp/am/include/left.jsp"%>
		</div>
		<!-- // #aside -->
		<!-- #wrapper -->
		<div id="wrapper">
			<!-- #breadcrumb -->
			<div id="breadcrumb"></div>
			<!-- // #breadcrumb -->
			<!-- #contents -->
			<div id="contents">
				<!-- .container -->
				<div class="container">
					<h2 class="title"><span>상품등록</span></h2>
					<h3 class="title"><span>기본정보 (<i class="require"><em>필수입력</em></i> 필수항목)	</span></h3>
					<form action="#" method="post" enctype="multipart/form-data">
						<fieldset>
							<legend></legend>
							<input type="hidden" name="">
						</fieldset>
					</form>
					<table class="table-row table-a">
						<caption>기본정보의 상품유형, 온라인상품코드, 상품명, 판매가능수량, 쿠폰적용여부, O2O여부, 네이버 쇼핑, 다음 쇼핑하우, 임직원 할인, 제휴사 할인, 시즌 정보, 성별, 포장, 등록일, 수정일을 알 수 있는 표 입니다.</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tr>
							<th><label for="">상품유형<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<div class="tbl_line">
									<select name="" id="" class="select" disabled>
										<option value="" selected>일반</option>
									</select>
								</div>
								<p class="strong">(상품 등록 후에 수정이 불가능한 항목입니다.)</p>
							</td>
							<th><span>온라인상품코드</span></th>
							<td>시스템 자동생성</td>
						</tr>
						<tr>
							<th><label for="">상품명<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<div class="tbl_line">
									<input type="text" name="" id="" value="폭스 퍼 히든 버튼 덕다운 패딩 점퍼" class="text xlarge">
								</div>
								<p class="strong">(공백포함 최대 100자이내 입력)</p>
							</td>
							<th><label for="">판매가능수량<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<div class="tbl_line">
									<input type="text" name="" id="" value="546" class="number text short"> 개
								</div>
								<p class="strong">(777 입력 시 수량 제한없음 처리)</p>
							</td>
						</tr>
						<tr>
							<th><label for="">쿠폰적용여부</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="">NO</option>
								</select>
							</td>
							<th><label for="">O2O여부<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="">NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="">네이버 쇼핑<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>연동안함</option>
								</select>
							</td>
							<th><label for="">다음 쇼핑하우<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>연동안함</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="">임직원 할인<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>NO</option>
								</select>
							</td>
							<th><label for="">제휴사 할인<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="">시즌 정보<i class="require"><em>필수입력</em></i></label></th>
							<td>
								<div class="tbl_line">
									연도
									<select name="" id="" class="select">
										<option value="" selected>2019</option>
									</select>
								</div>
								<div class="tbl_line">
									시즌
									<select name="" id="" class="select">
										<option value="" selected>F/W</option>
									</select>
								</div>
							</td>
							<th><label for="">성별</label></th>
							<td>
								<select name="" id="" class="select">
									<option value="" selected>여성</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><label for="">포장<i class="require"><em>필수입력</em></i></label></th>
							<td colspan="3">
								<select name="" id="" class="select">
									<option value="" style=>NO</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><span>등록일</span></th>
							<td>김신원(MD) / 2019-12-01 12:11:05</td>
							<th><span>수정일</span></th>
							<td>김신원(MD) / 2019-12-01 12:11:05</td>
						</tr>
					</table>
					<h3 class="title"><span>상품가격 (<i class="require"><em>필수입력</em></i> 필수항목)	</span></h3>
					<table class="table-row table-a">
						<caption>상품가격의 일반가(Tag가), 할인율, 판메가, 수수료, 수수료 기간을 알 수 있는 표 입니다.</caption>
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">일반가(Tag가)<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<input type="text" name="" id="" value="990,500" class="text">
								</td>
								<th><label for="">할인율<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>정율(%)</option>
									</select>
									<input type="text" name="" id="" value="12" class="text">
								</td>
							</tr>
							<tr>
								<th><label for="">판메가</label></th>
								<td colspan="3">
									<input type="text" name="" id="" value="12" class="text">
								</td>
							</tr>
							<tr>
								<th><label for="">수수료</label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>브랜드 기본마진</option>
									</select>
									<input type="text" name="" id="" class="text">
									%
								</td>
								<th><label for="">수수료 기간</label></th>
								<td>
									<a href="javascript:;" class="js-datepickr">
										<span class="icon datepickr">
											<em>날짜선택</em>
										</span>
									</a>
									<input type="text" class="text date small" id="PRD_MST_FEE_ST_DT" name="PRD_MST_FEE_ST_DT" value="" readonly data-target-end="#PRD_MST_ICN_ED_DT">
									~
									<a href="javascript:;" class="js-datepickr">
										<span class="icon datepickr">
											<em>날짜선택</em>
										</span>
									</a>
									<input type="text" class="text date small" id="PRD_MST_FEE_ED_DT" name="PRD_MST_FEE_ED_DT" value="" readonly data-target-start="#PRD_MST_ICN_ST_DT_">
								</td>
							</tr>
						</tbody>
					</table>
					<h3 class="title"><span>태그설정 (<i class="require"><em>필수입력</em></i> 필수항목)</span></h3>
					<table class="table-row table-a">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 85%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">일반 TAG<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<div class="tag_cloud_wrap">
										<ul class="tag_cloud_list">
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#청슌한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#오버핏</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#빈티지</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#신상품</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#셀카</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#섹시한</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
											<li>
												<span class="txt">#OOTD</span>
												<button class="button" class="btn_tag_del">X</button>
											</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th><label for="">대표 TAG<i class="require"><em>필수입력</em></i></label></th>
								<td>
									<select name="" id="" class="select">
										<option value="" selected>선택</option>
									</select>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!-- // .container -->
			</div>
			<!-- // #contents -->
		</div>
		<!-- // #wrapper -->
		<!-- #quickmenu -->
		<div id="quickmenu" class="aside right">
			<%@ include file="/WEB-INF/jsp/am/include/quick.jsp"%>
		</div>
		<!-- // #quickmenu -->
	</div>
	<!-- // #container -->
	<!-- #footer -->
	<div id="footer">
		<%@ include file="/WEB-INF/jsp/am/include/footer.jsp"%>
	</div>
	<!-- // #footer -->
	<%@ include file="/WEB-INF/jsp/am/include/script.jsp"%>
	<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
	<script	src="<c:out value="${serverDomain}" />/am/js/plugins/fine-uploader/jquery.fine-uploader.js"></script>
</body>
</html>