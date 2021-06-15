<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-mypage -->
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
	            <h2>배송지 등록</h2>
	            <a href="javascript:;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	        
	        <div class="padder mt10">
	            <p class="text-right small">
	                <span class="essential"><em class="blind">필수입력</em></span> 표시는 필수 입력 사항
	            </p>
	        </div>
	
	        <form name="frm" id="frm">
				<input type="hidden" name="pageStatus" value="<c:out value="${commandMap.pageStatus}"/>"/>
				<input type="hidden" name="MEM_DLV_IDX" value="<c:out value="${commandMap.MEM_DLV_IDX}"/>"/>
				<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
		        <ul class="form-a address-write"><!-- form-a -->
		            <li class="name">
		                <div class="tit">
		                    <label for="name">배송지명<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <input type="text" class="text" name="MEM_DLV_NM" id="MEM_DLV_NM" maxlength="15" value="<c:out value="${row.MEM_DLV_NM }"/>" />
		                    <p class="desc">
		                        <input type="checkbox" class="checkbox" id="MEM_DLV_BSC_YN" name="MEM_DLV_BSC_YN" value="Y" <c:if test="${row.MEM_DLV_BSC_YN eq 'Y'}">checked="checked"</c:if> />
		                        <label for="MEM_DLV_BSC_YN">기본 배송지로 설정</label>
		                    </p>
		                </div>
		            </li>
		            <li class="name">
		                <div class="tit">
		                    <label for="dear">받으시는 분<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                     <input type="text" name="MEM_DLV_RCV_NM" id="MEM_DLV_RCV_NM" class="text" maxlength="10" value="<c:out value="${row.MEM_DLV_RCV_NM }"/>"/>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="phone">휴대폰 번호<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <label for="MEM_DLV_HP1" class="sel_box_st0">
		                        <select id="MEM_DLV_HP1" name="MEM_DLV_HP1" class="sel_chg" title="휴대폰 번호 앞자리">
			                        <c:if test="${not empty codes.HP_CODE }">
				                         <c:forEach var="hpRow" items="${codes.HP_CODE }">
				                             <option value="<c:out value="${hpRow.CMN_COM_NM }"/>" <c:if test="${hpRow.CMN_COM_NM eq row.MEM_DLV_HP1}">selected="selected"</c:if>><c:out value="${hpRow.CMN_COM_NM }"/></option>
				                         </c:forEach>
				                     </c:if>
			                    </select>
		                    </label> -
		                    <input type="text" class="text number" id="MEM_DLV_HP2" name="MEM_DLV_HP2" maxlength="4" title="휴대폰 번호 중간자리" value="<c:out value="${row.MEM_DLV_HP2 }"/>"/> -
		                    <input type="text" class="text number" id="MEM_DLV_HP3" name="MEM_DLV_HP3" maxlength="4" title="휴대폰 번호 끝자리" value="<c:out value="${row.MEM_DLV_HP3 }"/>"/>
		                </div>
		            </li>
		            <li class="tel">
		                <div class="tit">
		                    <label for="tel">전화번호</label>
		                </div>
		                <div class="field">
		                    <label for="MEM_DLV_TEL1" class="sel_box_st0">
		                        <select id="MEM_DLV_TEL1" name="MEM_DLV_TEL1" class="sel_chg" title="전화번호 앞자리">
			                        <option value="">선택</option>
				                    <c:if test="${not empty codes.TEL_CODE }">
				                        <c:forEach var="telRow" items="${codes.TEL_CODE }">
				                            <option value="<c:out value="${telRow.CMN_COM_NM }"/>" <c:if test="${telRow.CMN_COM_NM eq row.MEM_DLV_TEL1}">selected="selected"</c:if>><c:out value="${telRow.CMN_COM_NM }"/></option>
				                        </c:forEach>
				                    </c:if>
			                    </select>
		                    </label> -
		                    <input type="text" class="text number" id="MEM_DLV_TEL2" name="MEM_DLV_TEL2" maxlength="4" title="전화번호 중간자리" value="<c:out value="${row.MEM_DLV_TEL2 }"/>" /> -
		                    <input type="text" class="text number" id="MEM_DLV_TEL3" name="MEM_DLV_TEL3" maxlength="4" title="전화번호 끝자리" value="<c:out value="${row.MEM_DLV_TEL3 }"/>"/>
		                </div>
		            </li>
		            <li class="address">
		                <div class="tit">
		                    <label for="MEM_DLV_ZIP">주소<span class="essential"><em class="blind">필수입력</em></span></label>
		                </div>
		                <div class="field">
		                    <p class="zip">
		                        <input type="text" id="MEM_DLV_ZIP_CDE5" name="MEM_DLV_ZIP_CDE5" class="text number" maxlength="5" title="우편번호" readonly="readonly" value="<c:out value="${row.MEM_DLV_ZIP_CDE5 }"/>"/>
		                        <a href="javascript:$.com.util.layPop('open', $('#layZipcode'), true)" class="button small"><span>우편번호 찾기</span></a>
		                    </p>
		                    <p>
		                        <input type="text" class="text" id="MEM_DLV_DRO_ADR1" name="MEM_DLV_DRO_ADR1" title="도로명 주소" placeholder="도로명 주소" maxlength="60" readonly="readonly" value="<c:out value="${row.MEM_DLV_DRO_ADR1 }"/>"/>
		                    </p>
		                    <p>
		                        <input type="text" class="text" id="MEM_DLV_JBN_ADR1" name="MEM_DLV_JBN_ADR1" title="지번 주소" placeholder="지번 주소" maxlength="60" readonly="readonly" value="<c:out value="${row.MEM_DLV_JBN_ADR1 }"/>" />
		                    </p>
		                    <p>
		                        <input type="text" class="text address" id="MEM_DLV_ADR2" name="MEM_DLV_ADR2" title="이하 주소" placeholder="주소 상세" maxlength="60" value="<c:out value="${row.MEM_DLV_DRO_ADR2 }"/>"/>
		                    </p>
		                </div>
		            </li>
		        </ul><!-- // form-a -->
		    </form>
	        
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:;" id="goSubmit" class="button primary"><span>확인</span></a>
	            <a href="javascript:goCancel();" class="button _pg_link" target="_self"><span>취소</span></a>
	        </div><!-- // section-button -->
			
			<%@ include file="/WEB-INF/jsp/mobile/common/zipcode/zipcodeLayer.jsp" %>
				
		</article>
		<!--// #container E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->
	
	<form id="searchFrm" name="searchFrm">
		<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
	</form>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
//<![CDATA[
$(function(){
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	MEM_DLV_NM:{required:true}, // 구분
        	MEM_DLV_RCV_NM:{required:true}, // 받는 사람 이름
        	MEM_DLV_HP1:{required:true,number:true}, // 휴대폰번호1
        	MEM_DLV_HP2:{required:true,number:true}, // 휴대폰번호2
        	MEM_DLV_HP3:{required:true,number:true}, // 휴대폰번호3
        	MEM_DLV_TEL1:{required:{depends:function(){
                if($("#MEM_DLV_TEL2").val() != "" || $("#MEM_DLV_TEL3").val() != "") return true;
                else return false;
            }},number:true}, // 전화번호1
            MEM_DLV_TEL2:{required:{depends:function(){
                if($("#MEM_DLV_TEL1").val() != "" || $("#MEM_DLV_TEL3").val() != "") return true;
                else return false;
            }},number:true}, // 전화번호2
            MEM_DLV_TEL3:{required:{depends:function(){
                if($("#MEM_DLV_TEL1").val() != "" || $("#MEM_DLV_TEL2").val() != "") return true;
                else return false;
            }},number:true}, // 전화번호3
            MEM_DLV_ZIP_CDE5:{required:true, number:true, minlength:5, maxlength:5}, // 주소 우편번호
            MEM_DLV_JBN_ADR1:{required:true},	// 지번 주소 앞부분
	        MEM_DLV_DRO_ADR1:{required:true}, // 도로명 주소 앞부분
	        MEM_DLV_ADR2:{required:true} // 상세 주소
        },
        messages :{
        	MEM_DLV_NM : {required:"[배송지명]을 입력해주세요."},
        	MEM_DLV_RCV_NM : {required:"[받으시는 분]을 입력해주세요."},
        	MEM_DLV_HP1: {required:"[휴대폰번호] 첫번째 자리를 선택해주세요."},
        	MEM_DLV_HP2: {required:"[휴대폰번호]두번째 자리를 입력해주세요.", number:"[휴대폰번호]두번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_HP3: {required:"[휴대폰번호]세번째 자리를 입력해주세요.", number:"[휴대폰번호]세번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_TEL1: {required:"[전화번호]첫번째 자리를 선택해주세요."},
        	MEM_DLV_TEL2: {required:"[전화번호]두번째 자리를 입력해주세요.", number:"[전화번호]두번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_TEL3: {required:"[전화번호]세번째 자리를 입력해주세요.", number:"[전화번호]세번째 자리를 숫자로 입력해주세요."},
        	MEM_DLV_ZIP_CDE5: {required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_DRO_ADR1:{required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_JBN_ADR1:{required:"[우편번호 검색]을 해주세요."},
        	MEM_DLV_ADR2:{required:"[상세 주소]를 입력해주세요."},
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
    
 	// 우편번호 callback 함수
	zipcodeCallback = function (zip,doroAddr,jibunAddr)
	{
		$('#MEM_DLV_ZIP_CDE5').val(zip);
		$('#MEM_DLV_DRO_ADR1').val(doroAddr);
		$('#MEM_DLV_JBN_ADR1').val(jibunAddr);
	};

	// 확인 버튼 클릭 이벤트
    var submitCnt = 0;
    $(document).on("click", "#goSubmit", function () {
    	
    	if(submitCnt == 0)
        {
            var $frm = $("#frm");
            
            if($frm.valid())
            {
                if (confirm( "저장하시겠습니까?"))
                {
                    submitCnt = submitCnt + 1;
                    $("#frm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveProc.do", "target":"_self", "method":"post"}).submit();
                }
            }
        }
        else
        {
            alert("등록/수정이 진행중입니다.");
            return;
        }
    });
    
 	// 취소 버튼 클릭 이벤트
    goCancel = function(){
   		$("#searchFrm").attr({"action":"<c:out value="${mobileDomain}" />/mobile/mypage/myDeliveList.do", "target":"_self", "method":"post"}).submit();
    };
});
//]]>
</script>
</body>
</html>