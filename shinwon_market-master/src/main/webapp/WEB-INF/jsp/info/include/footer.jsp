<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="footer"><!-- #footer -->
    <div class="upper">
        <div class="wrap">
            <div class="links">
                <ul class="tab">
                    <li><a href="<c:out value="${frontDomain}" />/pc/member/offlineAgreement.do" target="_blank" title="새 창 열림">마켓플랜트  멤버십 회원약관</a></li>
                    <li><a href="<c:out value="${frontDomain}" />/pc/member/offlineMemInfoPolicy.do" target="_blank" title="새 창 열림" class="co_red">개인정보취급방침</a></li>
                    <li><a href="<c:out value="${frontDomain}" />/pc/member/onlineAgreement.do" target="_blank" title="새 창 열림">온라인 회원약관</a></li>
                </ul>
            </div>
            <div class="familysite">
                <select id="familySite" onchange= "javascript:go_url(this.options[this.selectedIndex].value);" >
                    <option value="">Family Site 바로가기</option>
                </select>
            </div>
        </div>
    </div>
    <script language= "javascript">

	function go_url(url)
	{
    	if(url != '')   window.open(url, '_blank');
	}

</script>
    
    <div class="downer">
        <div class="wrap">
            <p>
                상호 : <strong>마켓플랜트</strong>
                <span class="pipe">|</span>
                대표이사 : 홍길동
                <span class="pipe">|</span>사업자등록번호 : 
                <span class="pipe">|</span>서울 특별시
            </p>
            <p>
                마켓플랜트 직영점 고객센터 : 
                <span class="pipe">|</span>운영시간 : 평일 09:30~18:30, 토/일/공휴일 : 09:30 ~ 17:30
            </p>
            <p>
                개인정보관리책임자 : 홍길동
            </p>
            <p>
                MARKET PLANT &copy; ALL Rights Resolved
            </p>
            <div class="sns">
                <a href="https://www.facebook.com/" target="_blank" title="새 창 열림"><i class="icon facebook"><em>마켓플랜트 페이스북</em></i></a>
                <a href="http://blog.naver.com/" target="_blank" title="새 창 열림"><i class="icon blog"><em>마켓플랜트 블로그</em></i></a>
            </div>
        </div>
    </div>
</div><!-- // #footer -->