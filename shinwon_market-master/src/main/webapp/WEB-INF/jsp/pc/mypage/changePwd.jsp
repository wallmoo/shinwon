<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<script>
window.history.forward(); 
</script>

<body class="page-mypage">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">
		
		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
	
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
	    <article id="container" class="container">
	        <div class="minW contents"><!-- contents S -->
	
	            <dl class="loc">
	                <dt class="blind">현재 카테고리 경로</dt>
	                <dd class="f"><a href="<c:out value="${frontDomain }"/>/pc/main/index.do" class="ico_home"><span class="ir">홈</span></a></dd>
	                <dd><a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do"><span>마이페이지</span></a></dd>
	                <dd><a href="javascript:void(0)"><span>회원정보</span></a></dd>
	                <dd class="l"><a href="javascript:void(0)"><span>회원정보수정</span></a></dd>
	            </dl>
	
	            <%@ include file="/WEB-INF/jsp/pc/mypage/mypage.jsp" %>
	
	            <div id="body"><!-- #body -->
	
	                <h3 class="title">회원정보수정</h3>
	
	                <div class="my-info-guide"><!-- my-info-guide -->
	                    <div class="holder">
	                        <ul class="list list-a">
	                            <li>회원님의 정보를 중 변경된 내용이 있는 경우, 아래에서 수정해주세요.</li>
	                            <li>회원정보는 개인정보취급방침에 따라 안전하게 보호됩니다.</li>
	                        </ul> 
	                        <c:if test="${(summaryMap.MEM_MST_MEM_GBN == Code.COMMON_PRI_MEMBER_GRADE || summaryMap.MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE) && summaryMap.MEM_MST_JOI_RTE == Code.JOIN_TYPE_ONLINE}">
								<ul class="list list-c small">
		                            <li>마켓플랜트는 통합 회원 전환 서비스를 진행하고 있습니다.</li>
		                            <li>통합회원은 하나의 ID로 온라인, 오프라인 서비스를 이용하실 수 있습니다.</li>
		                        </ul>
		                        <div class="action">
		                            <a href="<c:out value="${frontDomain }"/>/pc/event/memberBenefit.do" class="btn_st2 btn_blk large"><span>통합회원 혜택보기</span></a>
		                            <a href="javascript:goChange();" class="btn_st2 btn_rd large"><span>통합회원으로 전환하기</span></a>
		                        </div>	                        
	                        </c:if>
	                    </div>
	                </div><!-- // my-info-guide -->
	
	                <div class="my-info-tab"><!-- my-info-tab -->
	                    <h4 class="title">
	                        비밀번호 변경
	                        <span class="guide">(<span class="essential warning"><em class="blind">필수입력 표시된 항목은 </em></span>
	                            필수 입력사항 입니다.)
	                        </span>
	                    </h4>
	
	                    <ul class="tab-a item-2"><!-- tab-a -->
	                        <li><a href="javascript:goMyInfoEdit();"><span>기본정보</span></a></li>
	                        <li class="active"><a href="javascript:;"><span>비밀번호 변경</span></a><span class="blind">현재위치</span></li>
	                    </ul><!-- // tab-a -->
	                </div><!-- // my-info-tab -->
	                            
	                <form id="frm" name="frm">
		        		<input type="hidden" name="MEM_MST_MEM_ID" id="MEM_MST_MEM_ID" value="<c:out value="${commandMap.MEM_MST_MEM_ID }"/>"/>
		        		
		        		<double-submit:preventer/>
		                
		                <table class="table-a table-form mt0"><!-- table-a -->
		                <caption>변경할 비밀번호, 비밀번호 확인으로 구성된 비밀번호 변경  입력 테이블입니다.</caption>
		                <colgroup>
		                    <col style="width: 170px;" />
		                    <col style="width: auto;" />
		                </colgroup>
		                <tbody>
		                    <tr>
		                        <th scope="row"><label for="password">변경할 비밀번호<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <input type="password" id="MEM_MST_PW" name="MEM_MST_PW" class="text" maxlength="15" 
		                            		data-err_msg_id="memPw" onkeydown="javascript:deleteCheckMsg();"/>
		                            <p class="dotum desc">
		                                띄어쓰기 없이 6~15자 영문,숫자,특수문자 중 2개 이상을 조합하여 입력해 주세요.<br />
		                                아이디와 동일한 비밀번호는 사용할 수 없습니다.
		                            </p>
		                            <p class="message" id="memPw"></p>
		                            <p class="message" id="memPwCheck"></p>
		                        </td>
		                    </tr>
		                    <tr>
		                        <th scope="row"><label for="password2">비밀번호 확인<span class="essential"><em class="blind">필수입력</em></span></label></th>
		                        <td>
		                            <input type="password" id="MEM_MST_PW_RE" name="MEM_MST_PW_RE" class="text" maxlength="15" data-err_msg_id="memPwRe"/>
		                            <p class="dotum desc">
	                                	비밀번호 확인을 위해 다시 한번 입력해주세요. 
		                            </p>
		                            <p class="message" id="memPwRe"></p>
		                        </td>
		                    </tr>
		                </tbody>
		                </table><!-- // table-a -->
		            </form>
	
	                <div class="section-button mt30"><!-- section-button -->
	                    <a href="javascript:goPwdModify();" class="btn_st1 btn_rd xlarge"><span>수정</span></a>
	                    <c:choose>
	                    	<c:when test="${memberInfo.MEM_MST_MEM_GBN eq Code.MEMBER_TYPE_SIMPLE}">
								<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do" id="goCancel" class="btn_st1 btn_blk777 xlarge"><span>취소</span></a>	                    	
	                    	</c:when>
	                    	<c:otherwise>
	                    		<a href="<c:out value="${frontDomain }"/>/pc/mypage/myPageMain.do" class="btn_st1 btn_blk777 xlarge"><span>취소</span></a>
	                    	</c:otherwise>
	                    </c:choose>
	                </div><!-- // section-button -->
	
	            </div><!-- // #body -->
	
	        </div><!--// .contents E -->
	    </article>
	    <!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>
	
	<form id="changeFrm" name="changeFrm">
		<input type="hidden" name="gubun" id="gubun" value="ONLINE<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/>
	</form>
	
	<form id="tabFrm" name="tabFrm">
	</form>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		var $frm = $("#frm");
		
		// 폼체크
	    $frm.validate(
	    {
	        rules: 
	        {
	            MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true}, // 비밀번호
	            MEM_MST_PW_RE:{required:true, minlength:6, maxlength:15, equalTo:"#MEM_MST_PW"} // 비밀번호 확인
	        },
	        messages :
	        {
	        	MEM_MST_PW: {required:"[비밀번호]는 필수 정보입니다.",minlength:"[비밀번호]는 최소 6글자 이상입니다.", maxlength:"[비밀번호]는 최대 15글자입니다."},
	        	MEM_MST_PW_RE: {required:"[비밀번호 확인]은 필수 정보입니다.",minlength:"[비밀번호 확인]은 최소 6글자 이상입니다.", maxlength:"[비밀번호 확인]은 최대 15글자입니다.",equalTo: "비밀번호를 잘못 입력 하셨습니다. \n 다시 입력해주시기 바랍니다."}
	        }
	    });
		
	 	// 수정 버튼 클릭 이벤트
	    goPwdModify = function () {
	    	
 			if($frm.valid()){
 				
 				// 비밀번호와 아이디가 같은지 체크
 	       		if("${commandMap.MEM_MST_MEM_ID}" == $("#MEM_MST_PW").val()){
 	       			$("#memPwCheck").html("아이디와 동일한 비밀번호는 사용하실 수 없습니다.");
 	       			$("#MEM_MST_PW").focus();
 	       			return;
 	       		}
 				
 				if (confirm( "비밀번호를 변경하시겠습니까?")) {
 	                $frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/myPwdModify.do", "target":"_self", "method":"post"}).submit();
 	            }  
 			}
    	};
	    
    	// 기본정보 수정 클릭 이벤트
    	goMyInfoEdit = function(){
    		$("#tabFrm").attr({"action":"<c:out value="${serverSslDomain }"/>/pc/mypage/myInfoEditForm.do", "target":"_self", "method":"post"}).submit();
    	};
    	
    	// 통합회원 전환하기 버튼 클릭 이벤트
		goChange = function(){
			$("#changeFrm").attr({"action":"<c:out value="${serverSslDomain }"/>/pc/manager/changeOnlineMemCert.do", "target":"_self", "method":"post"}).submit();
		};
		
		// 비밀번호의 체크 메세지 초기화
	    deleteCheckMsg = function(){
	    	$("#memPwCheck").html("");
	    	
	    };
	});
</script>
</body>
</html>