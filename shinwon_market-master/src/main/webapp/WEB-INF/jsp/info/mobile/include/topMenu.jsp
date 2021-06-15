<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- #header S -->
 <!-- .section-title S -->
	        <a href="javascript:void(0)" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        
            <a href="#infoGnb" class="nav-view js-toggler"><i class="icon"><span class="blind">마켓플랜트소개 메뉴 <em>열기</em></span></i></a>

            <div id="infoGnb" data-role="collapsible-set"><!-- #infoGnb -->
                <div class="gnb-wrap" data-role="collapsible-set">
                	<div class="section" data-role="collapsible" data-collapsed="true">

                    <h3>마켓플랜트 소개<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introCompany') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introCompany.do">브랜드 스토리</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introBI') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introBI.do">BI소개</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPrize') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPrize.do">수상내역</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPress') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPress.do">보도자료</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/intro/introPosition') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/intro/introPosition.do">본사위치</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>지점안내<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/branch/branchList') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/branch/branchList.do">지점안내</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>멤버십가이드<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/membership/membershipGuide') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/membership/membershipGuide.do">멤버십안내</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/membership/membershipGrade') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/membership/membershipGrade.do">등급별혜택</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>고객지원센터<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportNotice') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportNotice.do">공지사항</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportPraise') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportPraise.do">마켓플랜트 칭찬하기</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportCounsel') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportCounsel.do">상담하기</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportFAQ') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportFAQ.do">FAQ</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/support/supportAS') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/support/supportAS.do">A/S센터 안내</a></li>
                    </ul>
                </div>
                <div class="section" data-role="collapsible" data-collapsed="true">
                    <h3>채용정보<i><!-- icon --></i></h3>
                    <ul>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitModel') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitModel.do">인재상</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitWelfare') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitWelfare.do">인사/복리후생</a></li>
                        <li <c:if test="${fn:indexOf(requestUrl,'/info/mobile/recruit/recruitJob') > -1}">class="active"</c:if>>
                        	<a href="<c:out value="${mobileBrandDomain}" />/info/mobile/recruit/recruitJob.do">직무소개</a></li>
                    </ul>
                </div>
            </div><!-- // #infoGnb -->
         <div class="overlay"><!-- overlay --></div>
        </div>
