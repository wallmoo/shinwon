<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	<div id="container">
		<div id="content" class="content">
			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">아이디 찾기 완료</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<c:choose>
					<c:when test="${commandMap.memType eq 'memberSns' }">
						<!-- SNS 회원일 경우 -->
						<div class="id_find">
							<p class="sns_info">‘<strong><c:out value="${commandMap.MEM_MST_MEM_NM}"/></strong>님은 <strong>SNS(<c:out value="${commandMap.snsType}"/>)</strong> 가입 회원이며</p>
							아이디는 <strong class="id_txt"><c:out value="${commandMap.MEM_MST_MEM_ID}"/></strong> 입니다.’
						</div>
						<!-- SNS 회원일 경우 -->										</c:when>
					<c:otherwise>
						<div class="id_find">
							‘<strong><c:out value="${commandMap.MEM_MST_MEM_NM}"/></strong>님의 아이디는 <strong class="id_txt">	<c:out value="${commandMap.MEM_MST_MEM_ID}"/></strong> 입니다.’
						</div>
					</c:otherwise>
				</c:choose>

				<div class="btn_wrap">
					<button class="btn_large" id="goPasswordFind">비밀번호 찾기</button>
					<button class="btn_large ok" id="goLogin">로그인</button>
				</div>
			</div>
		</div>
	</div>
	
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
		
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
// 	$(function(){
// 		//탭
// 		var tab_list = $('.join_top .tab a'),
// 			tab_con = $('.idPwChk_con');
	
// 		tab_list.on('click',function(){
// 			var _this = $(this),
// 				_idx = _this.index();
	
// 			_this.addClass('on').siblings().removeClass('on');
// 			tab_con.children().eq(_idx).show().siblings().hide();		
// 		});
// 	});
</script>
<script>
	$(document).ready(function(){
		$("#goLogin").on("click",function(){
			location.href = "/pc/manager/login.do"
		});
		$("#goPasswordFind").on("click",function(){
			location.href = "/pc/manager/myInfoSearch.do?gubun=PW"
		});
		
	});
</script>
</body>
</html>