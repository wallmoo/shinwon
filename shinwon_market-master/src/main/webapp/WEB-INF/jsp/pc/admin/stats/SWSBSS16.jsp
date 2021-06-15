<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="/am/css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CAMPAIGN PUSH ADMIN</title>
</head>
<body class="page-popup">

	<div class="modal">
		<!-- modal -->

		<div class="modal-wrapper">
			<!-- modal-wrapper -->

			<div class="modal-inner">
				<!-- modal-inner -->

                <h2 class="title"><span>주문내역상세</span></h2>

                    <!-- 탭부분 -->

                    <h3 class="title"><span>쿠폰정보</span></h3>

                    <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
                        <colgroup>
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>쿠폰번호</span></th>
                                <th><span>쿠폰명</span></th>
                                <th><span>할인금액/율</span></th>
                                <th><span>할인구분</span></th>
                                <th><span>부여수량</span></th>
                                <th><span>사용수량</span></th>
                                <th><span>사용율</span></th>
                                <th><span>할인금액</span></th>
                                <th><span>매출금액</span></th>
                            </tr>
                            <tr>
                                <td>ETLDIU834</td>
                                <td>회원가입 7% 할인쿠폰</td>
                                <td>7%</td>
                                <td>정율</td>
                                <td>100</td>
                                <td>60</td>
                                <td>60</td>
                                <td>3,000,000</td>
                                <td>99,999,999</td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                    <h3 class="title"><span>주문정보</span></h3>

                    <div class="section-title mt10"><!-- section-title -->
                        <div class="more">
                            <a href="javascript:goExcelDown();" class="button small primary"><span>엑셀 다운로드</span></a>
                        </div>
                    </div><!-- // section-title -->

                    <table cellspacing="0" class="table-col table-b"><!-- table -->
                        <thead>
                            <tr>
                                <th>주문일시<br/>(주문번호)</th>
                                <th>주문자</th>
                                <th>수령인</th>
                                <th>브랜드</th>
                                <th>이미지</th>
                                <th>상품/옵션정보</th>
                                <th>상품가격</th>
                                <th>수량</th>
                                <th>할인금액</th>
                                <th>배송비</th>
                                <th>결제금액</th>
                                <th>결제수단</th>
                                <th>주문매체</th>
                                <th>배송구분</th>
                                <th>주문상태</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="2">2019-11-25<br/>01:58:19<br/>(<a href="#">201911260A</a>)</td>
                                <td rowspan="2">전지현<br/>(<a href="#">qwer</a>)</td>
                                <td rowspan="2">전지현</td>
                                <td>BESTIBELLI</td>
                                <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                                <td>
                                    <a href="#">상품명</a><br/>
                                    <a href="#">(상품코드)</a><br/>
                                    COLOR : XX /<br/>
                                    SIZE : XX<br/>
                                </td>
                                <td>39,000</td>
                                <td>1</td>
                                <td rowspan="2" class="text-right">
                                    전체 : 120,000<br/>
                                    ------------------------<br/>
                                    쿠폰할인 : 10,000<br/>
                                    프로모션할인 : 5,000<br/>
                                    통합포인트 : 5,000<br/>
                                    E포인트 : 100,000<br/>
                                </td>
                                <td>2,500</td>
                                <td rowspan="2">160,400</td>
                                <td rowspan="2">PAYCO</td>
                                <td rowspan="2">APP</td>
                                <td>일반택배</td>
                                <td>배송완료</td>
                            </tr>
                            <tr>
                                <td class="border-left">FAHRENHEIT</td>
                                <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                                <td>
                                    <a href="#">상품명</a><br/>
                                    <a href="#">(상품코드)</a><br/>
                                    COLOR : XX /<br/>
                                    SIZE : XX<br/>
                                </td>
                                <td>39,100</td>
                                <td>1</td>
                                <td>0</td>
                                <td>일반택배</td>
                                <td>결제완료</td>
                            </tr>
                            <tr>
                                <td>2019-11-25<br/>01:58:19<br/>(<a href="#">201911260A</a>)</td>
                                <td>전현빈지현<br/>비회원</td>
                                <td>전지현</td>
                                <td>BESTIBELLI</td>
                                <td><span class="thumbnail_img"><img src="../profile.jpg"></span></td>
                                <td>
                                    <a href="#">이태리 블루 </a><br/>
                                    <a href="#">라운드 니트<br/>(PWUCI8009)</a><br/>
                                    COLOR : BL /<br/>
                                    SIZE : 100<br/>
                                </td>
                                <td>239,500</td>
                                <td>1</td>
                                <td class="text-right">
                                    전체 : 120,000<br/>
                                    ------------------------<br/>
                                    쿠폰할인 : 10,000<br/>
                                </td>
                                <td>2,500</td>
                                <td>122,000</td>
                                <td>가상계좌</td>
                                <td>APP</td>
                                <td>매장발송<br/>롯데본점<br/>(SG)</td>
                                <td>입금대기</td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->

                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none" id="goList" class="button large"><span>닫기</span></a>
                        </div>
                    </div><!-- // section-button -->

			</div>
			<!-- //modal-inner -->

		</div>
		<!-- //modal-wrapper -->

	</div>
	<!-- //modal -->

	<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
	<script
		src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>
	<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>

	<script>
		//<![CDATA[
		$(function() {

		});
		//]]>
	</script>
</body>
</html>
