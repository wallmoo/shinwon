<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-cate"><!-- page class : page-login -->
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>
<!-- #wrap S -->
<section id="wrap">
	<!-- .smart_filter_d S -->
	<section id="smart_filter_d" class="smart_filter_d">
		
		<header>
			<h3>SMART FILTER</h3>
			<a href="b0101.대.카테고리_Page.html"  class="_pg_link btn_close"><span class="blind">스마트필터 닫기</span></a>
		</header>

		<dl class="firter_list">
			<dt class="blind">설치형태, 브랜드, 가격대별로 구성된 검색 필터</dt>
			<dd class="dd_chk">
				<fieldset data-role="controlgroup">
					<legend>설치형태</legend>
					<input type="checkbox" name="chk_inst_0" id="chk_inst_0" data-all="true">
					<label for="chk_inst_0">ALL</label>
					<input type="checkbox" name="chk_inst_1" id="chk_inst_1">
					<label for="chk_inst_1">벽걸이형</label>
					<input type="checkbox" name="chk_inst_2" id="chk_inst_2">
					<label for="chk_inst_2">스탠드형</label>
					<input type="checkbox" name="chk_inst_3" id="chk_inst_3">
					<label for="chk_inst_3">2in1 멀티형</label>
				</fieldset>
			</dd>
			<dd class="dd_chk">
				<fieldset data-role="controlgroup">
					<legend>브랜드</legend>
					<input type="checkbox" name="chk_brand_0" id="chk_brand_0" data-all="true">
					<label for="chk_brand_0">ALL</label>
					<input type="checkbox" name="chk_brand_1" id="chk_brand_1">
					<label for="chk_brand_1">벽걸이형</label>
					<input type="checkbox" name="chk_brand_2" id="chk_brand_2">
					<label for="chk_brand_2">스탠드형</label>
					<input type="checkbox" name="chk_brand_3" id="chk_brand_3">
					<label for="chk_brand_3">2in1 멀티형</label>
				</fieldset>
			</dd>
			<dd class="dd_rice">
				<fieldset data-role="controlgroup">
					<legend>가격대별</legend>
					<input type="text" name="" id="" placeholder="최저금액" />
					<i>~</i>
					<input type="text" name="" id="" placeholder="최고금액" />
				</fieldset>
			</dd>
			<dd class="dd_btn">
				<a href="javascript:void(0)" class="btn_red"><span>검색초기화</span></a>
				<a href="javascript:void(0)" class="btn_gre"><span>상세검색</span></a>
			</dd>
		</dl>
	</section>
	<!--// .smart_filter_d E -->
</section>
<!--// #wrap E -->
<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[

//]]>
</script>
</body>
</html>