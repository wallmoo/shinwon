<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
<link href="/etland/images/favicon/favicon_e.ico" rel="icon" type="image/x-icon"/>
<link href="/etland/images/favicon/favicon_e.ico" rel="shortcut icon" type="image/x-icon"/>
<link rel="stylesheet" type="text/css" href="<c:out value="${cdnDomain }" />/pc/css/event_prenatal.css">
<script type="text/javascript" src="http://www.etland.co.kr/etland/js/check.js"></script>
<script type="text/javascript" src="http://www.etland.co.kr/etland/js/notice_popup.js"></script>
<script type="text/javascript" src="http://fv.ja-bit.com/js/vendor/jQueryRotate3.js"></script>
<!-- <script src="../../../../nas/cdn/pc/js/placeholders.min.js"></script> -->
<style>
	.mam_d .ev_part .td_cou .sel_d{width: 245px!important;}
</style>
</head>
<body class="page-theme">
<section id="wrap">
	<!-- #header S -->
	<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		
				<div id="mam_d" class="mam_d" style="text-align:center">
					
					<!-- .ev_info S -->
					<dl class="ev_info">
						<dt>
							<div class="blind">
								<h2>마켓플랜트와 함께하는</h2>
								<h1>제 2회 오감만족<br/>태교파티</h1>
								
								<dl>
									<dt>마켓플랜트 인재육성 프로젝트</dt>
									<dd>우리 아이 만나는 날을 함께 준비하세요!</dd>
								</dl>
		
								<dl>
									<dt>행사일자</dt>
									<dd>6월 4일(토) ~ 6월 5일(일)</dd>
									<dt>행사장소</dt>
									<dd>지산 포레스트리조트(경기도 이천)</dd>
									<dt>참가인원</dt>
									<dd>임산부 50쌍 (총 100명)</dd>
									<dt>참가접수</dt>
									<dd>마켓플랜트 쇼핑몰 (온라인 접수)</dd>
									<dt>접수기간</dt>
									<dd>3월 14일(월) ~ 5월 15일(일)</dd>
									<dt>당첨발표</dt>
									<dd>5월 23일(수)</dd>
								</dl>
							</div>
						</dt>
						<dd>
							<div class="blind">
								<h2>주요행사</h2>
								<strong>이찬오 셰프와 함께하는 우리아이 건강 이유식 만들기</strong>
								<strong>태교 콘서트
									<span>출연진 : 옹알스, 티얀, 맨삼이, 아다지오</span>
								</strong>
								<strong>태교 부부요가 클래스</strong>
		
								<p>※ 이 행사는 임산부를 위한 이벤트로 임신여부가 확인이 되지 않으면 참가가 불가하오니,
								<br/>당첨자는 꼭 산모수첩 등 임신확인서류를 지참하셔야 합니다.</p>
							</div>
							<a href="javascript:prepare();"><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/btn_schedule.png" alt="일정 자세히 보기" /></a>
						</dd>
					</dl>
					<!-- .ev_info E -->
					
					<!-- .ev_movie S -->
					<div class="ev_movie">
						<h3><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/tit_movie.png" alt="제 1회 오감만족 태교파티 다시보기" /></h3>
						<div class="movie">
							<iframe width="758" height="422" src="https://www.youtube.com/embed/DUT4256QqHw" frameborder="0" allowfullscreen></iframe>
						</div>
					</div>
					<!-- .ev_movie E -->
					
					<!-- .ev_part S -->
					<div class="ev_part">
						<dl class="con_dl">
							<dt class="con_ti">
								<a href="javascript:void(0);" class="btn_ev_close"><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/btn_ev_part_close.png" alt="신청서닫기" /></a>
								<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/ly_tit_01.png" alt="오감만족 태교파티" />
							</dt>
							<dd class="con_form">
								<form>
									<table>
										<caption></caption>
										<colgroup>
										<col style="width:90px" />
										<col style="width:345px" />
										<col style="width:90px" />
										<col />
										</colgroup>
										<tfoot>
											<tr>
												<th colspan="4">
													<!-- .clause_box S -->
													<div class="clause_box">
														<strong><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/tit_clause.png" alt="개인정보 및 이벤트 약관 동의" /></strong>
														<p><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_clause.png" alt="개인정보 및 이벤트 약관에 대한 내용"  longdesc="#tx_clause" /></p>
														<div id="tx_clause" class="tx_clause">
															<dl>
																<dt class="blind">본인은 귀사가 개인정보를 수집하고 이용함에 있어 내용을 충분히 확인하고, 이용에 동의합니다.</dt>
																<dd class="blind">
																	수집항목 : 이름, 휴대전화, E-mail<br/>
																	수집이용목적 : 이벤트 안내 및 시상안내<br/>
																	보유/이용기간 : 본인이 동의를 철회할 때까지
																</dd>
																<dd class="ra_box ra_01">
																	<label for="sAgree1_y" <c:if test="${info.AGREE1 eq 'Y' }">class="on"</c:if>>
																		<input type="radio" id="sAgree1_y" name="sAgree1" value="Y" <c:if test="${info.AGREE1 eq 'Y' }">checked="checked"</c:if> />
																		<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_agreement.png" alt="동의함" />
																	</label>
																	<label for="sAgree1_n" <c:if test="${info.AGREE1 eq 'N' || empty info }" >class="on"</c:if>>
																		<input type="radio" id="sAgree1_n" name="sAgree1" value="N"  <c:if test="${info.AGREE1 eq 'N' || empty info }" >checked="checked" </c:if> />
																		<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_disagree.png" alt="동의하지않음" />
																	</label>
																</dd>
																<dt class="blind">개인정보 3자제공</dt>
																<dd class="blind">
																	 - 후원사 마케팅 및 광고 활용을 위해 귀사가 수집한 개인정보를 외부업체에 제공함을 확인하고 이에 동의 합니다.<br/>
																	 제공항목 : 이름, 휴대폰, 이메일, 예정일 등<br/>
																	 제공업체 : 미정<br/>
																	 보유/이용기간 : 본인이 동의를 철회할 때까지
																</dd>
																<dd class="ra_box ra_02">
																	<label for="sAgree2_y" <c:if test="${info.AGREE2 eq 'Y' }">class="on"</c:if>>
																		<input type="radio" id="sAgree2_y" name="sAgree2" value="Y" <c:if test="${info.AGREE2 eq 'Y' }">checked="checked"</c:if> />
																		<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_agreement.png" alt="동의함" />
																	</label>
																	<label for="sAgree2_n" <c:if test="${info.AGREE2 eq 'N' || empty info }" >class="on"</c:if> >
																		<input type="radio" id="sAgree2_n" name="sAgree2" value="N" <c:if test="${info.AGREE2 eq 'N' || empty info }" >checked="checked"</c:if> />
																		<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_disagree.png" alt="동의하지않음" />
																	</label>
																</dd>
															</dl>
														</div>
														
														<!-- S -->
														<c:choose>
															<c:when test="${commandMap.MEM_LOGIN_YN eq 'N' }">
																<a href="javascript:checkLogin();" class="btn_submit"><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/btn_submit.png" alt="제출하기" /></a>	
															</c:when>
															<c:otherwise>
																<a href="javascript:goPrenatal();" class="btn_submit"><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/btn_submit.png" alt="제출하기" /></a>
															</c:otherwise>
														</c:choose>
														
														<!-- E -->
													</div>
													<!-- .clause_box E -->
												</th>
											</tr>
										</tfoot>
										<tbody>
											<tr>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_name.png" alt="회원명" /></th>
												<td class="td_com">
													<input type="text" id="supName" name="supName" value="<c:out value="${commandMap.MEM_MST_MEM_NM }" />" onclick="javascript:checkLogin();" readonly="readonly" />
												</td>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_phone.png" alt="휴대전화" /></th>
												<td class="td_phone">
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sHtel1" name="sHtel1" value="">
														<button type="button" class="my_value" id="iHtel1" value="" onclick="javascript:checkLogin();"><c:choose><c:when test="${not empty info}"><c:out value="${info.HTEL1}" /></c:when><c:otherwise><c:out value="${userInfo.MEM_MST_HP1 }" /></c:otherwise></c:choose></button>
														<ul class="a_list">
															<li><a href="javascript:void(0);" code="010">010</a></li>
															<li><a href="javascript:void(0);" code="011">011</a></li>
															<li><a href="javascript:void(0);" code="016">016</a></li>
															<li><a href="javascript:void(0);" code="017">017</a></li>
															<li><a href="javascript:void(0);" code="018">018</a></li>
															<li><a href="javascript:void(0);" code="019">019</a></li>
														</ul>
													</div>
													
													<span>-</span>
													<input type="text" id="sHtel2" name="sHtel2" value="<c:out value="${userInfo.MEM_MST_HP2 }" />" onclick="javascript:checkLogin();" maxlength="4" />
													<span>-</span>
													<input type="text" id="sHtel3" name="sHtel3" value="<c:out value="${userInfo.MEM_MST_HP3 }" />" onclick="javascript:checkLogin();" maxlength="4" />
												</td>
											</tr>
											<tr>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_companion.png" alt="동반자" /></th>
												<td class="td_com">
													<input type="text" id="sPatner" name="sPatner" value="" onclick="javascript:checkLogin();" maxlength="5" />
												</td>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_relation.png" alt="관계" /></th>
												<td class="td_rel">
													<input type="text" id="sRelation" name="sRelation" value="" onclick="javascript:checkLogin();" maxlength="10" />
												</td>
											</tr>
											<tr>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_nickname.png" alt="태명" /></th>
												<td class="td_nic">
													<input type="text" id="sBname" name="sBname" value="" onclick="javascript:checkLogin();" maxlength="10" />
												</td>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_due_date.png" alt="출산예정일" /></th>
												<td class="td_due">
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sDuedate1" name="sDuedate1" value="">
														<button type="button" class="my_value" id="iDuedate1" value="" onclick="javascript:checkLogin();"><c:out value="${info.DUE_YEAR}" /></button>
														<ul class="a_list">
															<li><a href="javascript:void(0);" code="2016">2016</a></li>
															<li><a href="javascript:void(0);" code="2017">2017</a></li>
														</ul>
													</div>
													<span>년</span>
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sDuedate2" name="sDuedate2" value="">
														<button type="button" class="my_value" id="iDuedate2" value="" onclick="javascript:checkLogin();"><c:out value="${info.DUE_MONTH}" /></button>
														<ul class="a_list" style="height: 400px; overflow-y: scroll;">
															<li><a href="javascript:void(0);" code="01">01</a></li>
															<li><a href="javascript:void(0);" code="02">02</a></li>
															<li><a href="javascript:void(0);" code="03">03</a></li>
															<li><a href="javascript:void(0);" code="04">04</a></li>
															<li><a href="javascript:void(0);" code="05">05</a></li>
															<li><a href="javascript:void(0);" code="06">06</a></li>
															<li><a href="javascript:void(0);" code="07">07</a></li>
															<li><a href="javascript:void(0);" code="08">08</a></li>
															<li><a href="javascript:void(0);" code="09">09</a></li>
															<li><a href="javascript:void(0);" code="10">10</a></li>
															<li><a href="javascript:void(0);" code="11">11</a></li>
															<li><a href="javascript:void(0);" code="12">12</a></li>
														</ul>
													</div>
													<span>월</span>
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sDuedate3" name="sDuedate3" value="">
														<button type="button" class="my_value" id="iDuedate3" value="" onclick="javascript:checkLogin();"><c:out value="${info.DUE_DAY}" /></button>
														<ul class="a_list" style="height: 400px; overflow-y: scroll;">
															<li><a href="javascript:void(0);" code="01">01</a></li>
															<li><a href="javascript:void(0);" code="02">02</a></li>
															<li><a href="javascript:void(0);" code="03">03</a></li>
															<li><a href="javascript:void(0);" code="04">04</a></li>
															<li><a href="javascript:void(0);" code="05">05</a></li>
															<li><a href="javascript:void(0);" code="06">06</a></li>
															<li><a href="javascript:void(0);" code="07">07</a></li>
															<li><a href="javascript:void(0);" code="08">08</a></li>
															<li><a href="javascript:void(0);" code="09">09</a></li>
															<li><a href="javascript:void(0);" code="10">10</a></li>
															<li><a href="javascript:void(0);" code="11">11</a></li>
															<li><a href="javascript:void(0);" code="12">12</a></li>
															<li><a href="javascript:void(0);" code="13">13</a></li>
															<li><a href="javascript:void(0);" code="14">14</a></li>
															<li><a href="javascript:void(0);" code="15">15</a></li>
															<li><a href="javascript:void(0);" code="16">16</a></li>
															<li><a href="javascript:void(0);" code="17">17</a></li>
															<li><a href="javascript:void(0);" code="18">18</a></li>
															<li><a href="javascript:void(0);" code="19">19</a></li>
															<li><a href="javascript:void(0);" code="20">20</a></li>
															<li><a href="javascript:void(0);" code="21">21</a></li>
															<li><a href="javascript:void(0);" code="22">22</a></li>
															<li><a href="javascript:void(0);" code="23">23</a></li>
															<li><a href="javascript:void(0);" code="24">24</a></li>
															<li><a href="javascript:void(0);" code="25">25</a></li>
															<li><a href="javascript:void(0);" code="26">26</a></li>
															<li><a href="javascript:void(0);" code="27">27</a></li>
															<li><a href="javascript:void(0);" code="28">28</a></li>
															<li><a href="javascript:void(0);" code="29">29</a></li>
															<li><a href="javascript:void(0);" code="30">30</a></li>
															<li><a href="javascript:void(0);" code="31">31</a></li>
														</ul>
													</div>
													<span>일</span>
												</td>
											</tr>
											<tr>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_abode.png" alt="거주지역" /></th>
												<td class="td_abo">
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sLifeArea" name="sLifeArea" value="">
														<button type="button" class="my_value" id="iLifeArea" value="" onclick="javascript:checkLogin();"><c:out value="${info.LIFE_AREA }" /></button>
														<ul class="a_list" style="height: 400px; overflow-y: scroll;">
															<li><a href="javascript:void(0);" code="서울특별시">서울특별시</a></li>
															<li><a href="javascript:void(0);" code="강원도">강원도</a></li>
															<li><a href="javascript:void(0);" code="경기도">경기도</a></li>
															<li><a href="javascript:void(0);" code="경상남도">경상남도</a></li>
															<li><a href="javascript:void(0);" code="경상북도">경상북도</a></li>
															<li><a href="javascript:void(0);" code="광주광역시">광주광역시</a></li>
															<li><a href="javascript:void(0);" code="대구광역시">대구광역시</a></li>
															<li><a href="javascript:void(0);" code="대전광역시">대전광역시</a></li>
															<li><a href="javascript:void(0);" code="부산광역시">부산광역시</a></li>
															<li><a href="javascript:void(0);" code="세종특별자치시">세종특별자치시</a></li>
															<li><a href="javascript:void(0);" code="울산광역시">울산광역시</a></li>
															<li><a href="javascript:void(0);" code="인천광역시">인천광역시</a></li>
															<li><a href="javascript:void(0);" code="전라남도">전라남도</a></li>
															<li><a href="javascript:void(0);" code="전라북도">전라북도</a></li>
															<li><a href="javascript:void(0);" code="제주특별자치도">제주특별자치도</a></li>
															<li><a href="javascript:void(0);" code="충청남도">충청남도</a></li>
															<li><a href="javascript:void(0);" code="충청북도">충청북도</a></li>
														</ul>
													</div>
												</td>
												<th><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_coute.png" alt="신청경로" /></th>
												<td class="td_cou">
													<div class="sel_d">
														<span class="ctrl"><span class="arrow"></span></span>
														<input type="hidden" id="sAppRoot" name="sAppRoot" value="">
														<button type="button" class="my_value" id="iAppRoot" value="" onclick="javascript:checkLogin();"><c:out value="${info.APP_ROOT }" /></button>
														<ul class="a_list" style="height: 400px; overflow-y: scroll;">
															<li><a href="javascript:void(0);" code="온라인카페">온라인카페</a></li>
															<li><a href="javascript:void(0);" code="기사">기사</a></li>
															<li><a href="javascript:void(0);" code="잡지(맘앤앙팡)">잡지</a></li>
															<li><a href="javascript:void(0);" code="페이스북">페이스북</a></li>
															<li><a href="javascript:void(0);" code="블로그">블로그</a></li>
															<li><a href="javascript:void(0);" code="가타">기타</a></li>
														</ul>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
		
							</dd>
						</dl>
						<a href="javascript:void(0)" id="btn_part" class="btn_part"><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/btn_letter.png" alt="파티 참가하기!" /></a>
						<div class="tx_clause_01">
							<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_clause_01.png" alt="이벤트 유의사항 내용" longdesc="#tx_clause_01" />
							<div id="tx_clause_01" class="blind">
								<strong>이벤트 유의사항</strong>
								<ol>
									<li>위 이벤트는 임산부를 위한 행사로 임신 여부가 확인되어야 참가 가능합니다.</li>
									<li>동반자는 1인만 가능합니다. (※ 영유아, 어린이 등 기존 자녀 동반은 불가합니다.)</li>
									<li>위 신청하기 게시판에 글을 남기면 자동으로 참가 신청이 완료됩니다.</li>
									<li>당첨자 선정 과정에서 확인 절차가 있을 수 있습니다. (유선 연락)</li>
									<li>당첨자 발표는 이벤트존에 게시될 예정입니다.</li>
									<li>당첨 후 최대 3회 이상 연락이 닿지 않을 경우 다른 참여자에게 기회가 돌아갑니다. (유선 연락)</li>
									<li>부당한 방법으로 이벤트에 참여할 경우 경고 없이 참여 자격이 박탈될 수 있습니다.</li>
									<li>본 이벤트는 당사 사정에 따라 별도의 고지 없이 변경 또는 종료될 수 있습니다.</li>
									<li>잘못된 정보 입력의 경우 당첨 기회가 넘어갈 수 있으니 다시 한 번 확인하시기 바랍니다.(마이랜드에서 확인)</li>
								</ol>
							</div>
						</div>
		
						<!-- .part_list S -->
						<div class="part_list">
							<h3><img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/tit_current.png" alt="신청자 현황" /></h3>
							
							<ul class="list_d" id="sPrenatalList">
								<c:if test="${not empty list }" >
								<c:set var="listNum" value="${paging.listNum}" />
								
								<c:forEach items="${list }" var="row" varStatus="sta">
								<li>
									<span class="no">No.<c:out value="${listNum }" /></span>
									<strong><c:out value="${row.MEM_MST_MEM_ID}" /> 님<br/>
									신청완료</strong>
									<span class="date"><c:out value="${row.INDATE }"/></span>
								</li>
								<c:set var="listNum" value="${listNum - 1}" />
								</c:forEach>
								</c:if>
							</ul>
							
							<div class="section-pagination section-pagination_v2" id="pg" style="padding:30px 0;">
								<ui:frontpaging paging="${paging }" jsFunction="goPage" />
							</div>
					
							<!-- 
							<div class="pg_num">
								<a href="javascript:void(0)" class="btn_ar ico_pp"><img src="http://www.etland.co.kr/etland/images/renewal15/mam/btn_pp_b.gif" alt="처음으로" /></a>
								<a href="javascript:void(0)" class="btn_ar ico_p"><img src="http://www.etland.co.kr/etland/images/renewal15/mam/btn_p_b.gif" alt="이전으로" /></a>
								
								<a href="javascript:void(0)">1</a>
								<a href="javascript:void(0)">2</a>
								<a href="javascript:void(0)">3</a>
								<a href="javascript:void(0)" class="on">4</a>
		
								<a href="javascript:void(0)" class="btn_ar ico_n"><img src="http://www.etland.co.kr/etland/images/renewal15/mam/btn_n_b.gif" alt="다음으로" /></a>
								<a href="javascript:void(0)" class="btn_ar ico_nn"><img src="http://www.etland.co.kr/etland/images/renewal15/mam/btn_nn_b.gif" alt="마지막으로" /></a>
							</div>
							-->
						</div>
						<!-- .part_list E -->
					</div>
					<!-- .ev_part E -->
					
					<!-- .ev_movie E -->
		
		
					<!-- .ev_star S -->
					<div class="ev_star">
						<div class="tx_clause_02">
							<img src="<c:out value="${cdnDomain }" />/pc/img/event/prenatal/txt_clause_02.png" alt="이벤트 유의사항 내용" longdesc="#tx_clause_02" />
							<div id="tx_clause_02" class="blind">
								<strong>이벤트 유의사항</strong>
								<ol>
									<li>위 이벤트는 이벤트 기간 내의 신규 회원을 대상으로 진행 합니다. (8월 17일~9월 20일)</li>
									<li>신규 가입 후 꼭 글을 남기셔야 이벤트 참가로 인정 됩니다.</li>
									<li>이벤트 목적과 관련 없는 내용으로 판단되는 글은 별도의 안내 없이 삭제 될 수 있습니다.</li>
									<li>당첨자 발표는 9월 30일 이벤트 게시판(쇼핑몰 우측 날개 배너)에서 확인하실 수 있습니다.</li>
									<li>잘못 된 정보 입력으로 발생한 불이익은 당사에서 책임지지 않습니다.</li>
									<li>본 이벤트는 별도의 공지 없이 내용 변경 될 수 있습니다.</li>
								</ol>
							</div>
						</div>
					</div>
					<!-- .ev_star E -->
		
				</div>
						
						
					<!--------------------------------------------- 내용 END------------------------------------------------->
					
					
					
					
					<iframe id="hideIframe" height="0" width="0" style="display:none;" src=""></iframe>
					
					

<!--------------------------------------- 하단 내용및 날개배너 테이블 레이아웃 START------------------------------------------------>		  
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- END OF ENVIRONMENT SCRIPT -->
<form name="eventFrm">
	<input type="hidden" name="tc" id="tc" value="">
	<input type="hidden" name="gb" id="gb" value=""> 
	<input type="hidden" name="EVNT_SNO" id="EVNT_SNO" value="312">
	<input type="hidden" name="pageNum1" id="pageNum1" value="1">
	<input type="hidden" name="sPageNo" id="sPageNo">
	<input type="hidden" name="upIngb" id="upIngb" value="<c:out value="${upIngb }" />">
</form>

			
	</div><!-- 전체 DIV 닫음 -->		
	
	
	<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>	
	
	
</div>
</section>
<!-- Bottom 끝 //-->
    </td>
  </tr>
</table>

</body>
</html>
<!--------------------------------------- 하단 내용및 날개배너 테이블 레이아웃 END------------------------------------------------>

<script type="text/javascript">
	$(document).ready(function(){
		function pranatalClose(){
			part_con = $('.mam_d .ev_part .con_dl'),
			btn_img = $('#btn_part');
			if(part_con.hasClass('open')){
				part_con.removeClass('open').slideUp();
				btn_img.show();
			}else{
				part_con.addClass('open').slideDown();
				btn_img.hide();				
			}
		}
		
		//파티참가버튼
		$('#btn_part,.btn_ev_close').click(function(){
			pranatalClose();
		});
		
		//라디오버튼
		$('#tx_clause label').click(function(){
			$(this).addClass('on').children('input').attr("checked", true);
			$(this).siblings().removeClass('on');
		});
	
		<c:if test="${not empty info}">
		
			$("#iHtel1").val('<c:out value="${info.HTEL1}" />');
			$("#sHtel2").val('<c:out value="${info.HTEL2}" />');
			$("#sHtel3").val('<c:out value="${info.HTEL3}" />');
			$("#sPatner").val('<c:out value="${info.PARTNER}" />');
			$("#sRelation").val('<c:out value="${info.RELATION}" />');
			$("#sBname").val('<c:out value="${info.B_NM}" />');
			$("#iDuedate1").val('<c:out value="${info.DUE_YEAR}" />');
			$("#iDuedate2").val('<c:out value="${info.DUE_MONTH}" />');
			$("#iDuedate3").val('<c:out value="${info.DUE_DAY}" />');
			$("#iLifeArea").val('<c:out value="${info.LIFE_AREA}" />');
			$("#iAppRoot").val('<c:out value="${info.APP_ROOT}" />');
		
	
		</c:if>
	});
	
	$('.mam_d .ev_part .con_form .sel_d').each(function(){
		sel_d($(this));
	});
	
	
	function checkLogin(){
		<c:if test="${commandMap.MEM_LOGIN_YN eq 'N'}">
		if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")){
			var url = location.href;
			url = encodeURIComponent(url);
        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
		}
		</c:if>
	}
	
	//셀렉트
	function sel_d(idx){
		var select_root = idx,
		select_value = select_root.find('.my_value'),
		select_ctrl = select_root.find('.ctrl'),
		select_a = select_root.find('>ul>li>a'),
		select_input = select_root.find('>ul>li>input[type=radio]'),
		select_label = select_root.find('>ul>li>label');
	
		// Radio Default Value
		select_value.each(function(){
			var default_value = $(this).next('.i_list').find('input[checked]').next('label').text();
			$(this).append(default_value);
		});
		
		// Line
		select_value.bind('focusin',function(){$(this).addClass('outLine')});
		select_value.bind('focusout',function(){$(this).removeClass('outLine')});
		select_input.bind('focusin',function(){$(this).parents('div.sel_box').children('div.my_value').addClass('outLine')});
		select_input.bind('focusout',function(){$(this).parents('div.sel_box').children('div.my_value').removeClass('outLine')});
													
		select_value.click(show_option);
		select_ctrl.click(show_option);
		select_root.removeClass('open');
		select_root.mouseleave(function(){$(this).removeClass('open')});
		select_a.click(set_anchor).click(hide_option).focus(i_hover).hover(i_hover);
		select_input.change(set_label).focus(set_label);
		select_label.hover(i_hover).click(hide_option);
		// Show
		function show_option(){
			$(this).parents('div.sel_d:first').toggleClass('open');
		}			
		// Hover
		function i_hover(){
			$(this).parents('ul:first').children('li').removeClass('hover');
			$(this).parents('li:first').toggleClass('hover');
		}			
		// Hide
		function hide_option(){
			var t = $(this);
			setTimeout(function(){
				t.parents('div.sel_d:first').removeClass('open');
			}, 1);
		}
		// Set Input
		function set_label(){
			var v = $(this).next('label').text();
			$(this).parents('ul:first').prev('.my_value').addClass('selected').text('').append(v);
		}			
		// Set Anchor
		function set_anchor(){
			var v = $(this).text(),
				vCode = $(this).attr("code");

			$(this).parents('ul:first').prev('.my_value').addClass('selected').text('').append(v);
			$(this).parents('ul:first').parent().find("input").val(v);

		}
	}
	
	function prepare(){
		var intWidth = 957,
			intHeight = 600,
			intW = (screen.width - intWidth) / 2,
			intH = (screen.height - intHeight) / 2,
			strUrl = '<c:out value="${frontDomain}" />/pc/prenatal/prepare2.do',
			popNm = 'prepare',
			optionNm = 'toolbar=no,menubar=no,resizable=no,width='+intWidth+',height='+intHeight+',left='+intW+',top='+intH+',scrollbars=yes',
			strPop = window.open(strUrl, popNm, optionNm);
		
		//console.log
		strPop.focus(true);
	}
	
	function goPrenatal(){
	
		var varAgree1 = $(':radio[name="sAgree1"]:checked').val();
		var varAgree2 = $(':radio[name="sAgree2"]:checked').val();

		$("#sHtel1").val($("#iHtel1").html());
		$("#sDuedate1").val($("#iDuedate1").html());
		$("#sDuedate2").val($("#iDuedate2").html());
		$("#sDuedate3").val($("#iDuedate3").html());
		$("#sLifeArea").val($("#iLifeArea").html());
		$("#sAppRoot").val($("#iAppRoot").html());
		
		if(varAgree1 == "N"){
			alert("개인정보 수집에 동의해 주세요.");
			return;
		}else if(varAgree2 == "N"){
			alert("개인정보 3자제공에 동의해 주세요.");
			return;
		}else if($("#supName").val() == ""){
			alert("회원명이 없습니다.");
			$("#supName").focus();
			return;
		}else if($("#sHtel1").val() == ""){
			alert("전화번호 첫째자리를 선택해 주세요.");
			$("#sHtel1").focus();
			return;
		}else if($("#sHtel2").val() == ""){
			alert("전화번호 둘째자리가 없습니다.");
			$("#sHtel2").focus();
			return;
		}else if($("#sHtel3").val() == ""){
			alert("전화번호 셋째자리가 없습니다.");
			$("#sHtel3").focus();
			return;
		}else if($("#sPatner").val() == ""){
			alert("동반자명이 없습니다.");
			$("#sPatner").focus();
			return;
		}else if($("#sRelation").val() == ""){
			alert("동반자와의 관계가 없습니다.");
			$("#sRelation").focus()
			return;
		}else if($("#sBname").val() == ""){
			alert("태명이 없습니다.");
			$("#sBname").focus();
			return;
		}else if($("#sDuedate1").val() == ""){
			alert("출산예정 년도를 선택해 주세요.");
			$("#sDuedate1").focus();
			return;
		}else if($("#sDuedate2").val() == ""){
			alert("출산예정 월을 선택해 주세요.");
			$("#sDuedate2").focus();
			return;
		}else if($("#sDuedate3").val() == ""){
			alert("출산예정 일을 선택해 주세요.");
			$("#sDuedate3").focus();
			return;
		}else if($("#sLifeArea").val() == ""){
			alert("거주지역을 선택해 주세요.");
			$("#sLifeArea").focus();
			return;
		}else if($("#sAppRoot").val() == ""){
			alert("신청경로를 선택해 주세요.");
			$("#sAppRoot").focus();
			return;
		}
		
		try{
			$.ajax({
				async 	: false,
				type: "POST", 
				url: "/pc/prenatal/prenatalProcess.do",
				dataType: "json",
				data: {
					sName: $("#supName").val(),
					sHtel1: $("#sHtel1").val(),
					sHtel2: $("#sHtel2").val(),
					sHtel3: $("#sHtel3").val(),
					sPatner: $("#sPatner").val(),
					sRelation: $("#sRelation").val(),
					sBname: $("#sBname").val(),
					sDuedate1: $("#sDuedate1").val(),
					sDuedate2: $("#sDuedate2").val(),
					sDuedate3: $("#sDuedate3").val(),
					sLifeArea: $("#sLifeArea").val(),
					sAppRoot: $("#sAppRoot").val(),
					sAgree1: varAgree1,
					sAgree2: varAgree2,
					EVNT_SNO:$("#EVNT_SNO").val(),
					EVNT_LNO: "1",
					upIngb : $("#upIngb").val()
				},
				success:  function(result){
					alert(result.resultMsg);
					goPage(1);
				},error :  function(result){
					displayError();
				}
			});
			
		}catch(err){
			alert(err);
		}
	}
	
	goPage		= function(page){
		$.ajax({
			async 		: false,
			type		: "POST",
			url			: "/pc/prenatal/prenatalEventListAjax.do",
			dataType	: "json",
			data		: {	"cPage": page
							},
			success : function(data) {
				var innerHtml	= "";
				
				if(data.totalCount == 0){
					innerHtml = "";
				}else{
					
					var listNum		= data.listNum;
					$.each(data.list, function(i,item){
						
						innerHtml +='<li>';
						innerHtml += '<span class="no">No.' + listNum + '</span>';
						innerHtml += '<strong>' + item.MEM_MST_MEM_ID + ' 님<br/>';
						innerHtml += '신청완료</strong>'
						innerHtml += '<span class="date">' + item.INDATE +'</span>';
						innerHtml += '</li>';
						
						listNum 	= listNum - 1;
					});
					
					$("#sPrenatalList").html(innerHtml);
					
					var firstPageNo 				= data.firstPageNo;
		            var firstPageNoOnPageList 		= data.firstPageNoOnPageList;
		            var totalPageCount 				= data.totalPageCount;
		            var lastPageNoOnPageList 		= data.lastPageNoOnPageList;
		            var cPage 						= data.cPage;
		            var lastPageNo 					= data.lastPageNo;
		            var pageSize 					= data.pageSize;
		            var pagingSize 					= data.pagingSize;
		            
		            innerHtml 	= "";
		            
		            if(totalPageCount > pagingSize){
		            	if(firstPageNoOnPageList > pagingSize){
		            		innerHtml += '<a class="nav first" href="javascript:goPage(' + firstPageNo + ');" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:goPage(' + (firstPageNoOnPageList - 1) + ');" ><span class="blind">이전 페이지</span></a>';
		            	}else{
		            		innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
		            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
		            	}
		            }else{
		            	innerHtml += '<a class="nav first" href="javascript:;" ><span class="blind">처음 페이지</span></a>';
	            		innerHtml += '<a class="nav prev" href="javascript:;" ><span class="blind">이전 페이지</span></a>';
		            }
		            
		            
		            if (lastPageNoOnPageList > totalPageCount){
		                lastPageNoOnPageList = totalPageCount;
		            }
	            	
	            	for(var i=firstPageNoOnPageList; i<= lastPageNoOnPageList; i++){
	            		
		                if(i==cPage){
		                	innerHtml +='<a href="javascript:void(0)" class="num active">' + i + '</a>';
		                }else{
		                	innerHtml +='<a href="javascript:goPage(' + i + ')" class="num">' + i + '</a>';
		                }
		            }
		            	
	            	if(totalPageCount > pagingSize){
		                if(lastPageNoOnPageList < totalPageCount){
		                	innerHtml +='<a class="nav next" href="javascript:goPage('+ (lastPageNoOnPageList + 1) + ')"><span class="blind">다음페이지</span></a>';
		                	innerHtml +='<a class="nav last" href="javascript:goPage('+ lastPageNo +')" ><span class="blind">끝 페이지</span></a>';
		                }else {
		                	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
		                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
		                }
		            } else {
		            	innerHtml +='<a class="nav next" href="javascript:;" ><span class="blind">다음 페이지</span></a>'; 
	                   	innerHtml +='<a class="nav last" href="javascript:;" ><span class="blind">끝 페이지</span></a>';
		            }
		            	
		            $("#pg").html(innerHtml);
				}
				
				
			}, error : function(err) {
				window.jquery
					|| console.log('오류가 발생하였습니다: ' + err.status);
			}
		});
	}; // goPage end
	
	
</script>	

