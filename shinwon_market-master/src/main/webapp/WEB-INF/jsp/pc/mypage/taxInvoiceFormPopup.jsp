<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-popup">

<div id="popContainer"><!-- popContainer -->

    <h1 class="title">세금계산서 신청</h1>

    <div id="popWrapper" class="tax-invoice"><!-- popWrapper -->

        <h2 class="title">주문정보</h2>
        
		<form id="frm" name="frm">
		<input type="hidden" id="ORD_MST_CD" name="ORD_MST_CD" value="<c:out value="${commandMap.ORD_MST_CD }"/>"/>
		
        <table class="table-a table-col"><!-- table-a -->
        <caption>주문번호, 결제금액, 결제수단, 현금영수증발행여부로 구성된 주문정보 테이블입니다.</caption>
        <colgroup>
            <col style="width: 160px;" />
            <col style="width: auto;" />
        </colgroup>
        <tbody>
            <tr>
                <th scope="row">주문번호</th>
                <td><c:out value="${orderInfo.ORD_MST_CD }"/></td>
            </tr>
            <tr>
                <th scope="row">결제금액</th>
                <td><fmt:formatNumber value="${orderInfo.ORD_MST_PAY_PRC}" type="number"/> 원</td>
            </tr>
            <tr>
                <th scope="row">결제수단</th>
                <td><c:out value="${orderInfo.ORD_MST_PAY_TYPE_NM }"/></td>
            </tr>
            <tr>
                <th scope="row">현금영수증발행여부</th>
                <td>${orderInfo.ORD_MST_CSH_RCP eq 'Y' ? '발행' : '미발행' }</td>
            </tr>
        </tbody>
        </table><!-- // table-a -->

        <h2 class="title">
            신청정보
            <span class="desc">
                <span class="essential"><em class="blind">필수입력 표시는</em></span>
                필수항목입니다.
            </span>
        </h2>

        <table class="table-a table-col"><!-- table-a -->
        <caption><!-- 신청번호,  -->사업체구분, 사업자번호, 법인등록번호, 상호/법인명, 담당자명, 이메일주소, 부가설명으로 구성된 세금계산서 신청정보 입력 테이블입니다.</caption>
        <colgroup>
            <col style="width: 160px;" />
            <col style="width: auto;" />
        </colgroup>
        <tbody>
            <!-- <tr>
                <th scope="row">신청번호</th>
                <td>11</td>
            </tr> -->
            <tr>
                <th scope="row"><label for="TAX_IVC_TYPE_0">사업체구분 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <label for="TAX_IVC_TYPE_0" class="js-radio on">
                        <input type="radio" name="TAX_IVC_TYPE" id="TAX_IVC_TYPE_0" checked="checked" value="0" />
                        법인
                    </label>
                    <label for="TAX_IVC_TYPE_1" class="js-radio">
                        <input type="radio" name="TAX_IVC_TYPE" id="TAX_IVC_TYPE_1" value="1" />
                        개인
                    </label>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_CPR_NO1">사업자번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <input type="text" id="TAX_IVC_CPR_NO1" name="TAX_IVC_CPR_NO1" maxlength="3" class="text small" title="사업자번호 앞자리" /> -
                    <input type="text" id="TAX_IVC_CPR_NO2" name="TAX_IVC_CPR_NO2" maxlength="2" class="text small" title="사업자번호 중간자리" /> -
                    <input type="text" id="TAX_IVC_CPR_NO3" name="TAX_IVC_CPR_NO3" maxlength="5" class="text small" title="사업자번호 끝자리" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_JRD_NO1">법인등록번호 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <input type="text" id="TAX_IVC_JRD_NO1" name="TAX_IVC_JRD_NO1" class="text" maxlength="6" title="법인등록번호 앞자리" /> -
                    <input type="text" id="TAX_IVC_JRD_NO2" name="TAX_IVC_JRD_NO2" class="text" maxlength="7" title="법인등록번호 끝자리" />
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_CPR_NM">상호/법인명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <input type="text" id="TAX_IVC_CPR_NM" name="TAX_IVC_CPR_NM" class="text" maxlength="25"/>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_MNG_NM">담당자명 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <input type="text" id="TAX_IVC_MNG_NM" name="TAX_IVC_MNG_NM" class="text" maxlength="10"/>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_MAIL">이메일주소 <span class="essential"><em class="blind">필수입력</em></span></label></th>
                <td>
                    <input type="text" id="TAX_IVC_MAIL" name="TAX_IVC_MAIL" class="text xlarge" maxlength="30"/>
                </td>
            </tr>
            <tr>
                <th scope="row"><label for="TAX_IVC_TXT">부가설명</label></th>
                <td>
                    <textarea id="TAX_IVC_TXT" name="TAX_IVC_TXT" onkeyup="getStrByte(this,'#byte', 300, 2);" class="textarea" style="height: 80px;" placeholder="최대 150자 이내로 입력가능합니다" title="최대 150자 이내로 입력가능합니다"></textarea>
                </td>
            </tr>
        </tbody>
        </table><!-- // table-a -->
        </form>

        <div class="section-button"><!-- section-button -->
            <a href="javascript:goSave();;" class="btn_st1 btn_blk large"><span>확인</span></a>
            <a href="javascript:self.close();" class="btn_st1 btn_white large"><span>취소</span></a>
        </div><!-- // section-button -->

    </div><!-- // popWrapper -->
</div><!-- // popContainer -->

<%@ include file="/WEB-INF/jsp/pc/include/script.jsp" %>
<script>
$(function(){
	var $frm = $("#frm");
	
	// 폼체크
    $frm.validate({
        rules: {
        	TAX_IVC_CPR_NO1:{required:true, number:true, minlength:3 , maxlength:3 },	// 사업자번호 앞자리
        	TAX_IVC_CPR_NO2:{required:true, number:true, minlength:2 , maxlength:2}, // 사업자번호 중간자리
        	TAX_IVC_CPR_NO3:{required:true, number:true, minlength:5 , maxlength:5}, // 사업자번호 뒷자리
        	TAX_IVC_JRD_NO1:{required:true, number:true, minlength:6 , maxlength:6 },	// 법인번호 앞자리
        	TAX_IVC_JRD_NO2:{required:true, number:true, minlength:7 , maxlength:7}, // 법인번호 중간자리
        	TAX_IVC_CPR_NM:{required:true}, // 상호/법인명
        	TAX_IVC_MNG_NM:{required:true}, // 담당자명
        	TAX_IVC_MAIL:{required:true, email:true} // 이메일주소
        },
        messages :{
        	TAX_IVC_CPR_NO1:{required:"사업자번호 첫자리를 입력해주십시오.", number:"[사업자번호 첫자리]숫자를 입력해주세요.", minlength:"[사업자번호 첫자리]최소 3글자 이상입니다." , maxlength:"[사업자번호 첫자리]최대 3글자입니다." },	// 사업자번호 앞자리
        	TAX_IVC_CPR_NO2:{required:"사업자번호 중간자리를 입력해주십시오.", number:"[사업자번호 중간자리]숫자를 입력해주세요.", minlength:"[사업자번호 중간자리]최소 2글자 이상입니다." , maxlength:"[사업자번호 중간자리]최대 2글자입니다."}, // 사업자번호 중간자리
        	TAX_IVC_CPR_NO3:{required:"사업자번호 끝자리를 입력해주십시오.", number:"[사업자번호 끝자리]숫자를 입력해주세요.", minlength:"[사업자번호 끝자리]최소 5글자 이상입니다." , maxlength:"[사업자번호 끝자리]최대 5글자입니다."}, // 사업자번호 뒷자리
        	TAX_IVC_JRD_NO1:{required:"법인번호 첫자리를 입력해주십시오.", number:"[법인번호 첫자리]숫자를 입력해주세요.", minlength:"[법인번호 첫자리]최소 6글자 이상입니다." , maxlength:"[법인번호 첫자리]최대 6글자입니다." },	// 법인번호 앞자리
        	TAX_IVC_JRD_NO2:{required:"법인번호 끝자리를 입력해주십시오.", number:"[법인번호 끝자리]숫자를 입력해주세요.", minlength:"[법인번호 끝자리]최소 7글자 이상입니다." , maxlength:"[법인번호 끝자리]최대 7글자입니다."}, // 법인번호 중간자리
        	TAX_IVC_CPR_NM:{required:"상호/법인명을 입력해주십시오."}, // 상호/법인명
        	TAX_IVC_MNG_NM:{required:"담당자명을 입력해주십시오."}, // 담당자명
        	TAX_IVC_MAIL:{required:"이메일 주소를 입력해주십시오.", email:"메일 형식에 맞게 써주세요."} // 이메일주소
        }
      	//,ignore: ":hidden"
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
	
 	// 확인 버튼 클릭 이벤트
    goSave = function(){
       if($frm.valid())
       {
       	if(confirm("신청 하시겠습니까?")){
       		$frm.attr({"action":"<c:out value="${serverSslDomain}" />/pc/mypage/insertTaxIvcProc.do", "target":"_self", "method":"post"}).submit();
       	}
       }
    };
});
</script>
</body>
</html>