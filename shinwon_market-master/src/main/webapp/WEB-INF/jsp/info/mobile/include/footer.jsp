<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!-- #footer S -->
	<footer id="footer" class="footer" data-role="footer" role="contentinfo">
		<a href="javascript:window.scrollTo(0,0)" class="btn_top"><i></i><span>TOP</span><span class="blind">맨위로</span></a>
		<ul class="ft_mn1">
			<li class="f"><a href="<c:out value="${mobileBrandDomain }" />/info/mobile/branch/branchList.do" class="_pg_link"><strong>지점안내</strong></a></li>
			<li><a href="<c:out value="${mobileBrandDomain }" />/info/mobile/membership/membershipGuide.do" class="_pg_link"><strong>멤버십 </strong></a></li>
            <li><a href="<c:out value="${mobileBrandDomain }" />/info/mobile/support/supportPraise.do" class="_pg_link"><strong>칭찬하기</strong></a></li>
			<li class="l"><a href="<c:out value="${mobileDomain }" />/mobile/main/index.do" class="_pg_link"><strong>쇼핑몰 바로가기</strong></a></li>
		</ul>
        <div class="padder">
            <div class="links">
                <p>
                    <a href="<c:out value="${mobileDomain }" />/mobile/member/offlineAgreement.do" class="_pg_link">마켓플랜트  멤버십 회원약관</a>
                    <span class="pipe">|</span>
                    <a href="<c:out value="${mobileDomain }" />/mobile/member/offlineMemInfoPolicy.do" class="_pg_link">개인정보취급방침</a>
                </p>
                <p class="mt10">
                    <a href="<c:out value="${mobileDomain }" />/mobile/member/onlineAgreement.do" class="_pg_link">온라인 회원약관</a>
                    <span class="pipe">|</span>
                    <a href="<c:out value="${brnadDomain }" />/info/main/index.do" class="_pg_link">PC버전</a>
                </p>
            </div>

            <address>
                <p class="tx_info">
                    상호 : 마켓플랜트 | 대표이사 : 홍길동<br />
                    사업자등록번호 : <br />
                    주소 : 서울시 <br />
                    마켓플랜트 지점 고객센터 : <a href="#" class="link_tel"></a><br />
                    운영시간 : 평일 09:30~18:30, 토/일/공휴일 : 09:30 ~ 17:30<br />
                    개인정보관리책임자 : 홍길동
                </p>
            </address>
        </div>
		<small>Copyright ⓒ MarketPlant All Rights Reserved.</small>
	</footer>
	<script>
	$(function(){

		// 뒤로가기
		$(".back").on("click",function(){
			if(navigator.userAgent.indexOf("MobileApp") > -1 ){
				window.location="appcall:prevpage$";
			}
			else{
				history.back(-1);
				return false;			
			}
		});
	});
		
	</script>
	