<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-access">

<h1 class="title"><span>기타 위탁업체 보기</span></h1>

<div id="popContainer" class="trust"><!-- popContainer -->

    <div id="popWrapper"><!-- popWrapper -->
            
        <table class="table-a">
	        <caption>위탁 업체명, 제위탁의 범위, 공유되는 정보, 보유 및 이용기간으로 구성된 위탁업체 정보 테이블입니다.</caption>
	        <colgroup>
	            <col style="width: auto;" />
	            <col style="width: 120px;" />
	            <col style="width: 120px;" />
	            <col style="width: 120px;" />
	        </colgroup>
	        <thead>
	            <tr>
	                <th scope="col">위탁 업체명</th>
	                <th scope="col">제위탁의 범위</th>
	                <th scope="col">공유되는 정보</th>
	                <th scope="col">보유 및 이용기간</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td class="al">
	                </td>
	                <td>배송</td>
	                <td>고객명, 연락처, 주소, 배송내역</td>
	                <td>배송 완료시</td>
	            </tr>
	            <tr>
	                <td class="al">
	                </td>
	                <td>A/S대행</td>
	                <td>고객명, 연락처, 주소, 구매내역, A/S의뢰내용</td>
	                <td>서비스 종료시</td>
	            </tr>
	        </tbody>
        </table>

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<a href="javascript:;" class="popup-close"><span class="blind">팝업닫기</span></a>
</body>
</html>