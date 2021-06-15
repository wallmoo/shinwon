<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>
</head>

<body class="page-join">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/pc/include/top.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
		<article id="container" class="container">
			<form id="dataForm" name="dataForm" method="post">
			<input type="hidden" name="AUTO_MEM_CPR_NM" id="AUTO_MEM_CPR_NM"/>
			<input type="hidden" name="AUTO_MEM_CPR_NO1" id="AUTO_MEM_CPR_NO1"/>
			<input type="hidden" name="AUTO_MEM_CPR_NO2" id="AUTO_MEM_CPR_NO2"/>
			<input type="hidden" name="AUTO_MEM_CPR_NO3" id="AUTO_MEM_CPR_NO3"/>
			<input type="hidden" name="joinType" id="joinType" value="memberBusiness"/> 
			
			<div class="contents"><!-- .contents S -->
				<dl class="join_top"><!-- .join_top S -->
					<dt><h2>마켓플랜트 쇼핑몰 회원가입</h2></dt>
					<dd class="tx_sub">
						<p>기업회원으로 가입하시면 기업회원 할인을 받으실 수 있습니다.<br/>
							기업회원 확인을 위해 사업자등록번호로  가입 가능합니다.</p>
					</dd>
					<dd class="nv stp_4">
						<ol>
							<li class="f on"><strong><span>01</span>사업자인증</strong></li>
							<li><strong><span>02</span>약관동의</strong></li>
							<li><strong><span>03</span>정보입력</strong></li>
							<li class="l"><strong><span>04</span>가입완료</strong></li>
						</ol>
					</dd>
				</dl><!--// .join_top E -->
	
				<ul class="join_con"><!-- .join_con S -->
					<li class="certi_con">
						<div class="con">
							<table>
								<caption>사업자인증 / 기업명, 사업자 등록번호로 구성된 표</caption>
								<colgroup>
								<col style="width:160px;*width:140px" />
								<col />
								</colgroup>
								<tbody>
									<tr class="tr_comName">
										<th><label for="MEM_CPR_NM"><span>기업명</span></label></th>
										<td>
											<div class="inp_box memCprNm">
												<input type="text" name="MEM_CPR_NM" id="MEM_CPR_NM" maxlength="20"/>
											</div>
										</td>
									</tr>
									<tr class="tr_regist">
										<th><label for="MEM_CPR_NO1"><span>사업자 등록번호</span></label></th>
										<td>
											<div class="inp_box memCprNo">
												<input type="text" name="MEM_CPR_NO1" id="MEM_CPR_NO1" maxlength="3" class="number">
												<i>-</i>
												<input type="text" name="MEM_CPR_NO2" id="MEM_CPR_NO2" maxlength="2" class="number">
												<i>-</i>
												<input type="text" name="MEM_CPR_NO3" id="MEM_CPR_NO3" maxlength="5" class="number">
											</div>
										</td>
									</tr>
									<tr class="tr_comEx">
										<td colspan="2">
											<span class="blind">유의사항</span>
											<p class="tx_ex2">
												<span>기업고객이 되시면 마켓플랜트에서 제공되는 기업회원 할인가로 상품을 구매하실 수 있습니다.</span>
												<span>사업자등록번호 인증 후 가입 가능합니다. </span>
												<span>등록하신 사업자등록번호는 기업회원 인증을 위한 확인 용도로만 사용됩니다.</span>
											</p>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</li>
					<li class="btn_box certCpr">
						<a href="javascript:goCert();" class="btn_st2 btn_rd"><span>사업자인증  확인</span></a>
					</li>
					
					<li class="certi_con comId_con businessList">
						<div class="con">
							<p class="tx_ex">
								<strong id="cprNm"></strong>(으)로 가입되어 있는 아이디입니다.<br/>
								<span>5</span>개의 아이디까지 가입이 가능합니다.
							</p>
							<table class="table_st3">
								<caption>기업으로 등록된 아이디 / 아이디로 구성된 표</caption>
								<colgroup>
								<col style="width:167px;*width:147px" />
								<col />
								</colgroup>
								<tbody class="cprId">
								</tbody>
							</table>
						</div>
					</li>
					<li class="btn_box addCpr">
					</li>
				</ul><!--// .join_con E -->
                
			</div><!--// .contents E -->
			</form>
		</article>
		<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->

		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	
	</section>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
	$(function(){
		
		$(".businessList").hide();	// 기업 아이디 목록 숨김
		$(".addCpr").show(); // 기업 아이디 추가 버튼 숨김
		
		var $dataForm = $("#dataForm");
		
		// 폼체크
	    $dataForm.validate(
	    {
	        rules: 
	        {
	        	MEM_CPR_NM:{required:true},	// 기업명
	        	MEM_CPR_NO1:{required:true, number:true, minlength:3, maxlength:3},	// 사업자 번호1
	        	MEM_CPR_NO2:{required:true, number:true, minlength:2, maxlength:2},	// 사업자 번호2
	        	MEM_CPR_NO3:{required:true, number:true, minlength:5, maxlength:5}	// 사업자 번호3
	        },
	        messages :
	        {
	        	MEM_CPR_NM : {required:"[기업명]은 필수 정보입니다."},
	        	MEM_CPR_NO1 : {required:"[사업자등록번호]첫번째 자리는 필수 정보입니다."},
	        	MEM_CPR_NO2 : {required:"[사업자등록번호]두번째 자리는 필수 정보입니다."},
	        	MEM_CPR_NO3 : {required:"[사업자등록번호]세번째 자리는 필수 정보입니다."}
	        }
	        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
		        ,onkeyup:false
			    ,onclick:false
			    ,onfocusout:false
		        ,showErrors:function(errorMap, errorList){
	 	       if(this.numberOfInvalids()) { 
		    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
		    	   //alert('[' + caption + '] ' + errorList[0].message);
		    	   var errorOobjId = $(errorList[0].element).attr('id');
		    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
		    	   caption = caption.replace('*','').replace(/\s/gi,'');
		    	   if(caption != null && caption != "") 
		    	   {
		    	       alert('[' + caption + '] ' + errorList[0].message);
		    	   }
		    	   else
		    	   {
		    	       alert(errorList[0].message);
		    	   }
		    	   $(errorList[0].element).focus();
		       }
	        }
	    });
		
		// 사업자인증 확인 클릭 이벤트
		goCert = function(){
			
			if($dataForm.valid()){
           		
				$.ajax({
   	                async : false,
   	                type : "POST",
   	                data : $dataForm.serialize(),
   	                url : "<c:out value="${serverSslDomain}" />/pc/member/checkBusinessNoAjax.do",
   	                success : function (data) {
   	                	if(data.successYn == "Y"){
   	                		alert("인증처리가 완료되었습니다.");
   	   	                	
   	   	                    if(data.resultYn == "Y"){
   	   	                    	$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemBusinessStep2.do", "target":"_self", "method":"post"}).submit();
   	   	                    }
   	   	                    else
   	   	                    {
   	   	                    	if(data.businessList.length > 0){
   									$(".memCprNm input").remove();
   									$(".memCprNo").children().remove();
   									$(".certCpr").remove();
   									
   	   	                    		$.each(data.businessList, function(idx, item){
   	   	                    			if(idx == 0){
   	   	                    				$("#AUTO_MEM_CPR_NM").val(item.MEM_CPR_NM);
   	   	                    				$("#AUTO_MEM_CPR_NO1").val(item.MEM_CPR_NO1);
   	   	                    				$("#AUTO_MEM_CPR_NO2").val(item.MEM_CPR_NO2);
   	   	                    				$("#AUTO_MEM_CPR_NO3").val(item.MEM_CPR_NO3);
   	   	                    				$(".memCprNm").append(item.MEM_CPR_NM);
   	   	                    				$(".memCprNo").append(item.MEM_CPR_NO1 + "<i>-</i>" + item.MEM_CPR_NO2 + "<i>-</i>" + item.MEM_CPR_NO3);
   	   	                    				$("#cprNm").html(item.MEM_CPR_NM);
   	   	                    			}
   									
   		   	         					$(".cprId").append("<tr><th><span>아이디</span></th><td>"+ item.MEM_CPR_MEM_ID + "</td></tr>");
   		   	         				});
   	   	                    		
   	   	                    		if(data.businessList.length > 4){
   	   	                    			$(".addCpr").append("<a href='javascript:goLogin();' class='btn_st2 btn_rd'>로그인 하기</a>");	
   	   	                    		}
   	   	                    		else{
   	   	                    			$(".addCpr").append("<a href='javascript:goJoin();' class='btn_st2 btn_rd'>추가로 가입하기</a>");   	                    			
   	   	                    		}
   	   	         				
   		   	         				$(".businessList").show();
   		   	         				$(".addCpr").show();
   	   	                    	}
   	   	                    }
   	                	}
   	                	else{
   	                		alert("유효하지 않은 사업자등록번호입니다.");
                            return;
   	                	}
   	                },
   	                error : function () {
   	                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
   	                }
   	            });
			}
		};
		
		// 로그인 하기 버튼 클릭 이벤트
		goLogin = function(){
			$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/manager/login.do", "target":"_self", "method":"post"}).submit();		
		};	
		
		// 추가로 가입하기 버튼 클릭 이벤트
		goJoin = function(){
			$dataForm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/member/joinMemBusinessStep2.do", "target":"_self", "method":"post"}).submit();
		};
	});
</script>
</body>
</html>