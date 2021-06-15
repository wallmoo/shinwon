<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-etc"><!-- page class : page-etc -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>이용약관</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	
	        <p class="text-center mt20">
	            <strong class="xlarge"><span class="warning">마켓플랜트</span> 쇼핑몰 이용약관</strong>
	        </p>
	
	        <div class="tab-a mt20" data-role="navbar"><!-- tab-a -->
	            <ul>
					<li><a href="<c:out value="${mobileDomain }"/>/mobile/member/onlineAgreement.do" class="_pg_link" target="_self">통합회원</a></li>
	                <li class="active"><a href="javascript:;">간편회원</a><span class="blind">현재위치</span></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/member/onlineBusinessAgreement.do" class="_pg_link" target="_self">기업회원</a></li>
	                <li><a href="<c:out value="${mobileDomain }"/>/mobile/member/offlineAgreement.do" class="_pg_link" target="_self">오프라인</a></li>
	            </ul>
	        </div><!-- // tab-a -->
	
	        <div class="padder access-terms"><!-- access-terms -->

	            <div class="links"><!-- links -->
	                <div class="holder">
	                    <ol class="ct list">
	                        <li><a href="#accessA" target="_self">제 1조 (목적)</a></li>
	                        <li><a href="#accessB" target="_self">제 2조 (정의)</a></li>
	                        <li><a href="#accessC" target="_self">제 3조 (약관 등의 명시와 설명 및 개정)</a></li>
	                        <li><a href="#accessD" target="_self">제 4조 (서비스의 제공 및 변경)</a></li>
	                        <li><a href="#accessE" target="_self">제 5조 (서비스의 중단)</a></li>
	                        <li><a href="#accessF" target="_self">제 6조 (회원가입)</a></li>
	                        <li><a href="#accessG" target="_self">제 7조 (회원 탈퇴 및 자격 상실 등)</a></li>
	                        <li><a href="#accessH" target="_self">제 8조 (회원에 대한 통지)</a></li>
	                        <li><a href="#accessI" target="_self">제 9조 (구매신청 및 개인정보 제공 동의 등)</a></li>
	                        <li><a href="#accessJ" target="_self">제 10조 (계약의 성립)</a></li>
	                        <li><a href="#accessK" target="_self">제 11조 (지급방법)</a></li>
	                        <li><a href="#accessL" target="_self">제 12조 (수신확인통지 &middot; 구매신청 변경 및 취소)</a></li>
	                        <li><a href="#accessM" target="_self">제 13조 (재화 등의 공급)</a></li>
	                        <li><a href="#accessN" target="_self">제 14조 (환급)</a></li>
	                        <li><a href="#accessO" target="_self">제 15조 (청약철회 등)</a></li>
	                        <li><a href="#accessP" target="_self">제 16조 (청약철회 등의 효과)</a></li>
	                        <li><a href="#accessQ" target="_self">제 17조 (개인정보보호)</a></li>
	                        <li><a href="#accessR" target="_self">제 18조 (&ldquo;몰&rdquo;의 의무)</a></li>
	                        <li><a href="#accessS" target="_self">제 19조 (면책)</a></li>
	                        <li><a href="#accessT" target="_self">제 20조 (회원의 ID 및 비밀번호에 대한 의무)</a></li>
	                        <li><a href="#accessU" target="_self">제 21조 (이용자의 의무)</a></li>
	                        <li><a href="#accessV" target="_self">제 22조 (연결 &ldquo;몰&rdquo;과 피연결 &ldquo;몰&rdquo;간의 관계)</a></li>
	                        <li><a href="#accessW" target="_self">제 23조 (저작권의 귀속 및 이용제한)</a></li>
	                        <li><a href="#accessX" target="_self">제 24조 (분쟁해결)</a></li>
	                        <li><a href="#accessY" target="_self">제 25조 (재판권 및 준거법)</a></li>
	                        <li><a href="#accessZ" target="_self">제 26조 부칙 제1조 (약관의 효력)</a></li>
	                    </ol>
	                </div>
	            </div><!-- //links -->

	            <h4 id="accessA">제 1조 (목적)</h4>
	
	            <p>
	                이 약관은 (주)이패스씨앤아이(전자상거래 사업자, 이하 &ldquo;회사&rdquo;라 한다)이 운영하는 마켓플랜트 온라인몰(이하 &ldquo;몰&rdquo;이라 한다)에서 제공되는 인터넷 관련 서비스(이하 &ldquo;서비스&rdquo;라 한다)를 이용함에 있어 온라인몰과 이용자의 권리 의무 및 책임사항을 규정함을 목적으로 합니다.
	            </p>
	
	            <p class="message notice-b">
	                PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질을 반하지 않는 한 이 약관을 준용합니다.
	            </p>
	
	            <h4 id="accessB">제 2조 (정의)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;이란 &ldquo;회사&rdquo;가 재화 또는 용역(이하&ldquo;재화 등&rdquo;이라 한다)을 이용자에게 제공하기 위하여 컴퓨터, 모바일 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 온라인몰을 운영하는 사업자의 의미로도 사용합니다. &ldquo;몰&rdquo;은 다음 각 호의 사이트를 포함하며 본 이용약관의 적용을 받습니다.
	                    <ol class="list list-ol">
	                        <li>marketplanta.epasscni.com</li>
	                    </ol>
	                </li>
	                <li><span>②</span> &ldquo;이용자&rdquo;란 &ldquo;몰&rdquo;에 접속하여 이 약관에 따라 &ldquo;몰&rdquo;이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
	                <li><span>③</span> &lsquo;회원&rsquo;이라 함은 &ldquo;몰&rdquo;에 회원등록을 한 자로서, &ldquo;몰&rdquo;이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. </li>
	                <li><span>④</span> &lsquo;비회원&rsquo;이라 함은 회원에 가입하지 않고 &ldquo;몰&rdquo;이 제공하는 서비스를 이용하는 자를 말합니다.</li>
	            </ul>
	
	            <h4 id="accessC">제 3조 (약관 등의 명시와 설명 및 개정)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 &ldquo;몰&rdquo;의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회 &middot; 배송책임 &middot; 환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;은 『전자상거래 등에서의 소비자보호에 관한 법률』, 『약관의 규제에 관한 법률』, 『전자문서 및전자거래기본법』, 『전자금융거래법』, 『전자서명법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『방문판매 등에 관한 법률』, 『소비자기본법』 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
	                <li><span>④</span> &ldquo;몰&rdquo;이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 &ldquo;몰&rdquo;은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li>
	                <li><span>⑤</span> &ldquo;몰&rdquo;이 개정약관을 공지 또는 통지하면서 회원에게 일정 기한 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 따로 공지 또는 고지하였음에도 회원이 명시적으로 거부의사를 표시하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다. 또한, 회원이 개정약관의 적용에 동의하지 않는 경우 &ldquo;몰&rdquo;은 개정약관의 내용을 적용할 수 없으며, 이 경우, 회원은 이용계약을 해지할 수 있습니다. 다만, 기존약관을 적용할 수 없는 특별한 사정이 있는 경우에는 &ldquo;몰&rdquo;은 이용계약을 해지할 수 있습니다. </li>
	                <li><span>⑥</span> &ldquo;몰&rdquo;이 약관을 개정할 경우 용역 등의 구매계약과 관련된 조항은 그 적용일자 이후에 체결되는 용역 등의 구매계약에만 적용되고 그 이전에 이미 체결된 용역 등의 구매계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 용역 등의 구매계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정약관의 공지기간 내에 &ldquo;몰&rdquo;에 송신하여 &ldquo;몰&rdquo;의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</li>
	                <li><span>⑦</span> 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
	            </ul>
	
	            <h4 id="accessD">제 4조 (서비스의 제공 및 변경)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 다음과 같은 업무를 수행합니다.
	                    <ol class="list list-ol">
	                        <li>재화 또는 용역에 대한 정보 제공 및 구매계약의 체결</li>
	                        <li>구매계약이 체결된 재화 또는 용역의 배송</li>
	                        <li>기타 &ldquo;몰&rdquo;이 정하는 업무</li>
	                    </ol>
	                </li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소, 전자우편 주소, 전화 등의 방법으로 즉시 통지합니다.</li>
	                <li><span>④</span> 전항의 경우 &ldquo;몰&rdquo;은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, &ldquo;몰&rdquo;이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
	            </ul>
	
	            <h4 id="accessE">제 5조 (서비스의 중단)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 컴퓨터, 모바일 등 정보통신설비의 보수점검 &middot; 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, &ldquo;몰&rdquo;이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
	                <li><span>③</span> 사업종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 &ldquo;몰&rdquo;은 제8조에 정한 방법으로 이용자에게 통지하고 당초 &ldquo;몰&rdquo;에서 제시한 조건에 따라 소비자에게 보상합니다. </li>
	            </ul>
	
	            <h4 id="accessF">제 6조 (회원가입)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> 이용자는 &ldquo;몰&rdquo;이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. 회원의 특성에 따라 아이핀/휴대폰 인증, 이메일인증 등의 방법으로 인증 절차를 반드시 거쳐야 합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
	                    <ol class="list list-ol">
	                        <li>등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
	                        <li>회원 가입일 현재 만 14세 미만인 경우</li>
	                        <li>기타 회원으로 등록하는 것이 &ldquo;몰&rdquo;의 기술상 현저히 지장이 있다고 판단되는 경우</li>
	                    </ol>
	                </li>
	                <li><span>③</span> 회원가입계약의 성립시기는 &ldquo;몰&rdquo;의 승낙이 회원에게 도달한 시점으로 합니다.</li>
	                <li><span>④</span> 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 &ldquo;몰&rdquo;에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</li>
	                <li><span>⑤</span> &ldquo;몰&rdquo;에서 이메일 인증 방법으로 가입하시면 &ldquo;마켓플랜트 온라인몰&rdquo; 간편회원이 됩니다.</li>
	                <li><span>⑥</span> 회원 탈퇴 이후 회원 재가입 시 기존 ID와 동일한 ID는 사용할 수 없습니다.</li>
	            </ul>
	
	            <h4 id="accessG">제 7조 (회원 탈퇴 및 자격 상실 등)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> 회원은 &ldquo;몰&rdquo;에 언제든지 탈퇴를 요청할 수 있으며 &ldquo;몰&rdquo;은 즉시 회원탈퇴를 처리합니다. 다만, 진행중인 주문/취소/반품 등의 건수가 있는 경우에는 해당 프로세스가 종료된 후 회원탈퇴를 처리합니다.</li>
	                <li><span>②</span> 회원이 다음 각호의 사유에 해당하는 경우, &ldquo;몰&rdquo;은 회원자격을 제한 및 정지시킬 수 있습니다.
	                    <ol class="list list-ol">
	                        <li>가입 신청시에 허위 내용을 등록한 경우</li>
	                        <li>&ldquo;몰&rdquo;을 이용하여 구입한 재화 등의 대금, 기타 &ldquo;몰&rdquo;이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
	                        <li>다른 사람의 &ldquo;몰&rdquo; 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우</li>
	                        <li>&ldquo;몰&rdquo;을 이용하여 법령 또는 이 약관이 금지하거나 공서 양속에 반하는 행위를 하는 경우</li>
	                        <li>&ldquo;몰&rdquo;의 이용과정에서 직원에게 모욕, 협박 또는 음란한 언행 등으로 &ldquo;몰&rdquo;의 운영을 방해하는 경우</li>
	                        <li>&ldquo;몰&rdquo;을 통해 구매한 재화 등을 정당한 이유 없이 상습적으로 취소 또는 반품하여 &ldquo;몰&rdquo;의 업무를 방해하는 경우</li>
	                        <li>재판매 목적으로 재화 등을 대량으로 중복 구매하여 &ldquo;몰&rdquo;의 거래질서를 방해하는 경우</li>
	                        <li>&ldquo;몰&rdquo; 화면에 음란물을 게재하거나 음란사이트를 링크시키는 경우</li>
	                        <li>기타 &ldquo;몰&rdquo;의 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
	                    </ol>
	                </li>
	                <li><span>③</span> &ldquo;몰&rdquo;이 회원 자격을 제한 &middot; 정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 &ldquo;몰&rdquo;은 회원자격을 상실시킬 수 있습니다.</li>
	                <li><span>④</span> &ldquo;몰&rdquo;이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li>
	            </ul>
	
	            <h4 id="accessH">제 8조 (회원에 대한 통지)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;이 회원에 대한 통지를 하는 경우, 회원이 &ldquo;몰&rdquo;과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 불특정다수 회원에 대한 통지의 경우 1주일이상 &ldquo;몰&rdquo; 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
	            </ul>
	
	            <h4 id="accessI">제 9조 (구매신청 및 개인정보 제공 동의 등)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo; 이용자는 &ldquo;몰&rdquo; 상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, &ldquo;몰&rdquo;은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
	                    <ol class="list list-ol">
	                        <li>재화 등의 검색 및 선택</li>
	                        <li>성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
	                        <li>약관내용, 청약 철회권이 제한되는 서비스, 배송료, 설치비 등의 비용부담과 관련한 내용에 대한 확인</li>
	                        <li>이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
	                        <li>재화 등의 구매신청 및 이에 관한 확인 또는 &ldquo;몰&rdquo;의 확인에 대한 동의</li>
	                        <li>결제방법의 선택</li>
	                        <li>기타 &ldquo;몰&rdquo;에서 제공하는 특별한 재화 등에 대한 구매 절차</li>
	                    </ol>
	                </li>
	                <li><span>②</span> &ldquo;몰&rdquo;이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 다음 각호의 사항을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)
	                    <ol class="list list-ol">
	                        <li>개인정보를 제공받는 자</li>
	                        <li>개인정보를 제공받는 자의 개인정보 이용목적</li>
	                        <li>제공하는 개인정보의 항목</li>
	                        <li>개인정보를 제공받는 자의 개인정보 보유 및 이용기간</li>
	                    </ol>
	                </li>
	                <li><span>③</span> &ldquo;몰&rdquo;이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 다음 각호의 사항을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다. 
	                    <ol class="list list-ol">
	                        <li>개인정보 취급위탁을 받는 자</li>
	                        <li>개인정보 취급위탁을 하는 업무의 내용</li>
	                    </ol>
	                </li>
	            </ul>
	
	            <h4 id="accessJ">제 10조 (계약의 성립)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
	                    <ol class="list list-ol">
	                        <li>신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
	                        <li>미성년자가 담배, 주류등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
	                        <li>기타 구매신청에 승낙하는 것이 &ldquo;몰&rdquo; 기술상 현저히 지장이 있다고 판단하는 경우</li>
	                        <li>상행위(재판매)를 목적으로 구매하는 거래이거나, 거래정황상 상행위(재판매)를 목적으로 한 구매로 판단되는 경우</li>
	                    </ol>
	                </li>
	                <li><span>②</span> &ldquo;몰&rdquo;의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;의 승낙을 뜻하는 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
	            </ul>
	
	            <h4 id="accessK">제 11조 (지급방법)</h4>
	
	            <p>
	                &ldquo;몰&rdquo;에서 구매한 재화 또는 용역에 대한 대금 지급방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, &ldquo;몰&rdquo;은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
	            </p>
	
	            <ol class="list list-ol">
	                <li>폰뱅킹, 인터넷 뱅킹, 메일 뱅킹 등의 각종 계좌이체</li>
	                <li>선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
	                <li>온라인 무통장입금</li>
	                <li>전자화폐에 의한 결제</li>
	                <li>&ldquo;몰&rdquo;과 계약을 맺었거나 &ldquo;몰&rdquo;이 인정한 상품권에 의한 결제</li>
	                <li>기타 전자적 지급 방법에 의한 대금 지급 등</li>
	            </ol>
	
	            <h4 id="accessL">제 12조 (수신확인통지 &middot; 구매신청 변경 및 취소)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.</li>
	                <li><span>②</span> 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 &ldquo;몰&rdquo;은 배송 전에 이용자의 요청이 있는 경우에는 지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li>
	            </ul>
	
	            <h4 id="accessM">제 13조 (재화 등의 공급)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, &ldquo;몰&rdquo;이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 다만, 이용자와 &ldquo;몰&rdquo;간 재화 등의 공급 시기에 관하여 서면 또는 구두상의 별도 약정이 있는 경우에는 그러지 아니합니다 이때 &ldquo;몰&rdquo;은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 &ldquo;몰&rdquo;이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 &ldquo;몰&rdquo;이 고의 &middot; 과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
	            </ul>
	
	            <h4 id="accessN">제 14조 (환급)</h4>
	
	            <p>
	                &ldquo;몰&rdquo;은 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.
	            </p>
	
	            <h4 id="accessO">제 15조 (청약철회 등)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;과 재화 등의 구매에 관한 계약을 체결한 이용자는 『전자상거래 등에서의 소비자보호에 관한 법률』 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자 보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</li>
	                <li><span>②</span> 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
	                    <ol class="list list-ol">
	                        <li>이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다.)</li>
	                        <li>이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
	                        <li>시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
	                        <li>같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
	                        <li>&ldquo;몰&rdquo;이 특정 재화 등에 대하여 청약철회 시 회복할 수 없는 중대한 피해가 예상되어 사전에 청약철회 제한에 관하여 고지하고, 이용자의 동의가 이루어진 경우</li>
	                    </ol>
	                </li>
	                <li><span>③</span> 제2항 제2호 내지 제4호의 경우에 &ldquo;몰&rdquo;이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</li>
	                <li><span>④</span> 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시 &middot; 광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</li>
	            </ul>
	
	            <h4 id="accessP">제 16조 (청약철회 등의 효과)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 &ldquo;몰&rdquo;이 이용자에게 재화 등의 환급을 지연한 때에는 그 지연기간에 대하여 『전자상거래 등에서의 소비자보호에 관한 법률 시행령』 제21조의2에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</li>
	                <li><span>③</span> 청약 철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. &ldquo;몰&rdquo;은 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만, 재화 등의 내용이 표시 &middot; 광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 &ldquo;몰&rdquo;이 부담합니다.</li>
	                <li><span>④</span> 이용자가 재화 등을 제공 받을때 발송비를 부담한 경우에 &ldquo;몰&rdquo;은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
	                <li><span>⑤</span> 이미 재화 등이 일부 사용 또는 일부 소비된 경우에는 그 재화 등의 사용 또는 일부 소비에 의하여 소비자가 얻은 이익 또는 그 재화 등의 공급에 소요된 비용에 상당하는 금액으로서 대통령령이 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제24조에서 정하는 범위의 금액의 지급을 이용자에게 청구할 수 있습니다.</li>
	                <li><span>⑥</span> 상품을 구매하여 적립금 또는 사은품을 지급 받은 경우 해당 상품의 취소시 지급 받은 적립금또는 사은품을 환급해야 청약 철회가 가능합니다. 해당 내용을 반환하지 않는 경우, &ldquo;몰&rdquo;은 이용자에게 청약철회를 거부할 수 있습니다.</li>
	            </ul>
	
	            <h4 id="accessQ">제 17조 (개인정보보호)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;은 이용자의 개인정보를 수집 &middot; 이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</li>
	                <li><span>④</span> &ldquo;몰&rdquo;은 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용 &middot; 제공 단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
	                <li><span>⑤</span> &ldquo;몰&rdquo;이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
	                <li><span>⑥</span> 이용자는 언제든지 &ldquo;몰&rdquo;이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 &ldquo;몰&rdquo;은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 &ldquo;몰&rdquo;은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
	                <li><span>⑦</span> &ldquo;몰&rdquo;은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</li>
	                <li><span>⑧</span> &ldquo;몰&rdquo; 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
	                <li><span>⑨</span> &ldquo;몰&rdquo;은 개인정보의 수집 &middot; 이용 &middot; 제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집 &middot; 이용 &middot; 제공에 관한 이용자의 동의 거절시 제한되는 서비스를 구체적으로 명시하고, 필수 수집 항목이 아닌 개인정보의 수집 &middot; 이용 &middot; 제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</li>
	            </ul>
	
	            <h4 id="accessR">제 18조 (&ldquo;몰&rdquo;의 의무)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화 &middot; 용역을 제공하는데 최선을 다하여야 합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;이 상품이나 용역에 대하여 『표시 &middot; 광고의공정화에관한법률』 제3조 소정의 부당한 표시 &middot; 광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
	                <li><span>④</span> &ldquo;몰&rdquo;은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
	            </ul>
	
	            <h4 id="accessS">제 19조 (면책)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 천재지변, 불가항력 기타 &ldquo;몰&rdquo;의 합리적인 통제범위를 벗어난 사유로 인하여 &ldquo;서비스&rdquo;를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 이용자의 귀책사유로 인하여 &ldquo;서비스&rdquo;를 제공할 수 없는 경우에는 그에 대한 책임을 부담하지 않습니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;은 이용자가 &ldquo;서비스&rdquo;를 이용함으로써 기대되는 수익을 얻지 못하거나 &ldquo;서비스&rdquo;를 통해 얻은 자료를 이용하여 발생한 손해에 대해서는 책임을 부담하지 않습니다.</li>
	                <li><span>④</span> 이용자가 화면에 게재한 정보,자료,사실 등의 내용에 관한 신뢰도 또는 정확성에 대하여는 해당 이용자가 책임을 부담하며, &ldquo;몰&rdquo;은 내용의 부정확 또는 허위로 인해 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.</li>
	                <li><span>⑤</span> &ldquo;몰&rdquo;은 &ldquo;서비스&rdquo;이용과 관련하여 이용자의 고의 또는 과실로 인하여 이용자 또는 제3자에게 발생한 손해에 대하여는 아무런 책임을 부담하지 않습니다.</li>
	            </ul>
	
	            <h4 id="accessT">제 20조 (회원의 ID 및 비밀번호에 대한 의무)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</li>
	                <li><span>②</span> 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
	                <li><span>③</span> 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 &ldquo;몰&rdquo;에 통보하고 &ldquo;몰&rdquo;의 안내가 있는 경우에는 그에 따라야 합니다.</li>
	            </ul>
	
	            <h4 id="accessU">제 21조 (이용자의 의무)</h4>
	
	            <p>
	                이용자는 다음 행위를 하여서는 안됩니다.
	            </p>
	
	            <ol class="list list-ol">
	                <li>신청 또는 변경시 허위 내용의 등록</li>
	                <li>타인의 정보 도용</li>
	                <li>&ldquo;몰&rdquo;에 게시된 정보의 변경</li>
	                <li>&ldquo;몰&rdquo;이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
	                <li>&ldquo;몰&rdquo; 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
	                <li>&ldquo;몰&rdquo; 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
	                <li>외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li>
	            </ol>
	
	            <h4 id="accessV">제 22조 (연결 &ldquo;몰&rdquo;과 피연결 &ldquo;몰&rdquo;간의 관계)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> 상위 &ldquo;몰&rdquo;과 하위 &ldquo;몰&rdquo;이 하이퍼 링크(예: 하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함한다)방식 등으로 연결된 경우, 전자를 연결 &ldquo;몰&rdquo;(웹사이트)이라고 하고 후자를 피연결 &ldquo;몰&rdquo;(웹사이트)이라고 합니다.</li>
	                <li><span>②</span> 연결&ldquo;몰&rdquo;은 피연결&ldquo;몰&rdquo;이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결&ldquo;몰&rdquo;의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다.</li>
	            </ul>
	
	            <h4 id="accessW">제 23조 (저작권의 귀속 및 이용제한)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;이 작성한 저작물에 대한 저작권 기타 지적재산권은 &ldquo;몰&rdquo;에 귀속합니다.</li>
	                <li><span>②</span> 이용자는 &ldquo;몰&rdquo;을 이용함으로써 얻은 정보 중 &ldquo;몰&rdquo;에게 지적재산권이 귀속된 정보를 &ldquo;몰&rdquo;의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
	            </ul>
	
	            <h4 id="accessX">제 24조 (분쟁해결)</h4>
	
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치 &middot; 운영합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</li>
	                <li><span>③</span> &ldquo;몰&rdquo;과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시 &middot; 도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
	            </ul>
	
	            <h4 id="accessY">제 25조 (재판권 및 준거법)</h4>
	            
	            <ul class="list list-ol-b">
	                <li><span>①</span> &ldquo;몰&rdquo;과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
	                <li><span>②</span> &ldquo;몰&rdquo;과 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
	            </ul>
	
	            <h4 id="accessZ">제 26조 부칙 제1조 (약관의 효력)</h4>
	
	            <p>
	                이 약관은 2016년 4월 20일부터 시행됩니다.
	            </p>
	            
	        </div><!-- // access-terms -->
			
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
});
//]]>
</script>
</body>
</html>