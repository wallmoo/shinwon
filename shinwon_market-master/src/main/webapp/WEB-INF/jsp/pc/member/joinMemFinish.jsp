<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>

	<div id="container">
		<div id="content" class="content">
            <!-- LOCATION -->
            <%@ include file="/WEB-INF/jsp/pc/include/location.jsp" %>
            <!-- //LOCATION -->
            <!-- ****************************************************************************

            S : 콘텐츠 시작

            ***************************************************************************** -->

			<!-- Title -->
			<div class="pg_tit_wrap">
				<h2 class="pg_tit">가입완료</h2>
			</div>
			<!--// Title -->

			<div class="sub_content">
				<div class="join_step">
					<ol>
						<li><span>STEP 01 <strong>약관동의</strong></span></li>
						<li><span>STEP 02 <strong>정보입력</strong></span></li>
						<li><span>STEP 03 <strong>피드설정</strong></span></li>
						<li class="on"><span>STEP 04 <strong>가입완료</strong></span></li>
					</ol>
				</div>

				<div class="join_complete">
					<div class="txt">
						<h3>‘<strong>회원가입</strong>이 완료되었습니다.’</h3>
						<p>입력하신 개인정보는 <strong>[마이페이지 &gt; 회원정보 &gt; 회원정보수정]</strong> 메뉴에서 관리하실 수 있습니다.</p>
					</div>
					<ul class="member_info">
						<li class="ico01 coupon">
							<dl>
								<dt>ALL</dt>
								<dd>
									<strong>10<span>%</span></strong>
									<em>COUPON</em>
								</dd>
							</dl>
						</li>
						<li class="ico02 coupon">
							<dl>
								<dt>ALL</dt>
								<dd>
									<strong>10<span>%</span></strong>
									<em>COUPON</em>
								</dd>
							</dl>
						</li>
						<li class="ico03 point">
							<dl>
								<dt>3,000 포인트</dt>
								<dd>5,000<span>P</span></dd>
							</dl>
						</li>
					</ul>
				</div>

				<div class="tit-area">
					<h3 class="tits2">이벤트 정보 수신 안내</h3>
				</div>
				<div class="table_wrap">
					<table class="tb_row">
						<caption>이벤트 정보 수신 안내 : 이메일, SNS, 카카오톡 리스트 표입니다.</caption>
						<colgroup>
							<col style="width:20%">
							<col style="width:auto">
						</colgroup>
						<tbody>     
							<c:forEach var="row" items="${agreementHistory }" varStatus="i">
								<tr>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0001' }">
	                                    <th scope="row">문자</th>
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0002' }">
	                                    <th scope="row">텔레마케팅</th>
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0003' }">
	                                    <th scope="row">DM</th>
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0004' }">
	                                    <th scope="row">이메일</th>
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0005' }">
	                                    <th scope="row">영리목적광고</th>
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_CD eq '0006' }">
	                                    <th scope="row">카카오</th>
	                                </c:if>
									<td>
									<c:if test="${row.MEM_AGR_TRM_YN eq 'Y' }">
	                                    	동의
	                                </c:if>
	                                <c:if test="${row.MEM_AGR_TRM_YN eq 'N' }">
	                                    	비동의
	                                </c:if>  
	                                /<ui:formatDate value="${row.MEM_AGR_REG_DT }"  pattern="yyyy.MM.dd HH:mm:ss"/>
	                                </td>
                                </tr>
                            </c:forEach>
							
						</tbody>
					</table>
				</div>

				<div class="btn_wrap">
					<button onclick="goMain()" class="btn_large">메인으로</button>
					<button onclick="goLogin()" class="btn_large ok">로그인</button>
				</div>
			</div>
		</div>
	</div>
	
<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>

<script>
	$(function(){
		goMain = function(){
			location.href = "<c:out value="${frontDomain}" />/pc/main/index.do";
		}
		goLogin = function(){
			location.href = "<c:out value="${frontDomain}" />/pc/manager/login.do";
		}
	});
</script>