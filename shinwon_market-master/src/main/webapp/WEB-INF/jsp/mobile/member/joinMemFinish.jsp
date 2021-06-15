<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>

<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <!-- #snb -->
                <!-- // #snb -->

                <div class="complete_bx mb_none">
                    <p class="tit"><span>회원가입</span>이<br>완료되었습니다.</p>
                    <p class="txt">입력하신 개인정보는<br><strong>[마이페이지 > 회원정보 > 회원정보수정]</strong><br>메뉴에서 관리하실 수 있습니다.</p>
                </div>
                <ul class="benefit_list">
                    <li class="b01">
                        <div>
                            <strong>10% 할인쿠폰</strong>
                            <span>전 상품 사용 가능한 할인쿠폰 지급</span>
                        </div>
                    </li>
                    <li class="b02">
                        <div>
                            <strong>3,000원 할인쿠폰</strong>
                            <span>3,000원 이상 구매시 할인쿠폰 즉시 지급</span>
                        </div>
                    </li>
                    <li class="b03">
                        <div>
                            <strong>3,000 포인트</strong>
                            <span>가입 즉시 사용 가능한 포인트 지급</span>
                        </div>
                    </li>
                    <li class="b04">
                        <div>
                            <strong>멤버십 포인트 적립</strong>
                            <span>구매 금액의 등급별 포인트 적립</span>
                        </div>
                    </li>
                </ul>

                <div class="title_wp2 mt30">
                    <h3 class="ct_title2 f12">이벤트 정보 수신 안내</h3>
                </div>
                <div class="tb_row">
                    <table>
                    	
                        <caption>이벤트 정보 수신 안내 : 이메일, SMS, 카카오톡 출력 표입니다.</caption>
                        <colgroup>
                            <col style="width:100px;" />
                            <col />
                        </colgroup>
                        <c:forEach var="row" items="${agreementHistory }" varStatus="i">
                        <tr>
                        	<c:if test="${row.MEM_AGR_TRM_CD eq '0001' }">
                            <th colspan="row">문자</th>
                            </c:if>
                            <c:if test="${row.MEM_AGR_TRM_CD eq '0002' }">
                            <th colspan="row">텔레마케팅</th>
                            </c:if>
                            <c:if test="${row.MEM_AGR_TRM_CD eq '0003' }">
                            <th colspan="row">DM</th>
                            </c:if>
                            <c:if test="${row.MEM_AGR_TRM_CD eq '0004' }">
                            <th colspan="row">이메일</th>
                            </c:if>
                            <c:if test="${row.MEM_AGR_TRM_CD eq '0005' }">
                            <th colspan="row">영리목적광고</th>
                            </c:if>
                            <c:if test="${row.MEM_AGR_TRM_CD eq '0006' }">
                            <th colspan="row">카카오</th>
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
                    </table>
                </div>

                <div class="btn_area dual">
                    <button  class="btn black" onclick="goMain()">메인으로</button>
                    <button  class="btn ok"	onclick="goLogin()">로그인</button>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->


<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script>
	$(function(){
		goMain = function(){
			location.href = "<c:out value="${mobileDomain}" />/mobile/main/index.do";
		}
		goLogin = function(){
			location.href = "<c:out value="${mobileDomain}" />/mobile/manager/login.do";
		}
	});
</script>