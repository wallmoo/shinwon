<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>세금계산서 신청정보</span></h3>
            </div><!-- // push-guide -->
            
            <form id="frm" name="frm">
		    	<input type="hidden" name="TAX_IVC_IDX" value="<c:out value="${info.TAX_IVC_IDX}"/>"/>
            	
            	<h4 class="title"><span>주문정보</span></h4>
            	
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
							<th><span>주문번호</span></th>
							<td><c:out value="${info.TAX_IVC_ORD_CD}"/></td>
							<th><span>결제금액</span></th>
							<td><fmt:formatNumber value="${info.ORD_MST_PAY_PRC}" type="number"/></td>
						</tr>
						<tr>
							<th><span>결제수단</span></th>
							<td><c:out value="${info.ORD_MST_PAY_TYPE_NM}"/></td>
							<th><span>현금영수증발행여부</span></th>
							<td><c:out value="${not empty info.CASH_AUTH_NO ? '발행':'미발행' }"/></td>	
						</tr>
		            </tbody>
		        </table><!-- // table -->
	        
	        	<h4 class="title"><span>신청정보</span></h4>
	        
		        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
		            <colgroup>
		                <col style="width: 10%;" />
		                <col style="width: auto;" />
		            </colgroup>
		            <tbody>
		                <tr>
							<th><span>신청번호</span></th>
							<td><c:out value="${info.TAX_IVC_IDX}"/></td>
						</tr>
						<tr>
							<th><span>사업체구분 <em class="strong">*</em></span></th>
							<td>
								<input type="radio" id="TAX_IVC_TYPE1" name="TAX_IVC_TYPE" class="checkbox" value="0" <c:if test="${info.TAX_IVC_TYPE eq 0 }">checked="checked"</c:if> />
								<label for="TAX_IVC_TYPE1">법인</label>
								<input type="radio" id="TAX_IVC_TYPE2" name="TAX_IVC_TYPE" class="checkbox" value="1" <c:if test="${info.TAX_IVC_TYPE eq 1 }">checked="checked"</c:if> />
								<label for="TAX_IVC_TYPE2">개인</label>
							</td>
						</tr>
						<tr>
							<th><span>사업자번호 <em class="strong">*</em></span></th>
							<td>
								<input type="text" class="text number" name="TAX_IVC_CPR_NO1" value="<c:out value="${info.TAX_IVC_CPR_NO1}"/>" maxlength="3"/> 
								-
								<input type="text" class="text number" name="TAX_IVC_CPR_NO2" value="<c:out value="${info.TAX_IVC_CPR_NO2}"/>" maxlength="2"/> 
								-
								<input type="text" class="text number" name="TAX_IVC_CPR_NO3" value="<c:out value="${info.TAX_IVC_CPR_NO3}"/>" maxlength="5"/>
							</td>
						</tr>
						<tr>
							<th><span>법인/주민등록번호 <em class="strong">*</em></span></th>
							<td>
								<input type="text" class="text number" name="TAX_IVC_JRD_NO1" value="<c:out value="${info.TAX_IVC_JRD_NO1}"/>" maxlength="6"/> 
								-
								<input type="text" class="text number" name="TAX_IVC_JRD_NO2" value="<c:out value="${info.TAX_IVC_JRD_NO2}"/>" maxlength="7"/>
							</td>
						</tr>
						<tr>
							<th><span>상호/법인명 <em class="strong">*</em></span></th>
							<td><input type="text" class="text" name="TAX_IVC_CPR_NM" value="<c:out value="${info.TAX_IVC_CPR_NM}"/>" maxlength="25"/></td>
						</tr>
						<tr>
							<th><span>담당자명 <em class="strong">*</em></span></th>
							<td><input type="text" class="text" name="TAX_IVC_MNG_NM" value="<c:out value="${info.TAX_IVC_MNG_NM}"/>" maxlength="25"/></td>
						</tr>
						<tr>
							<th><span>이메일주소 <em class="strong">*</em></span></th>
							<td><input type="text" class="text" name="TAX_IVC_MAIL" value="<c:out value="${info.TAX_IVC_MAIL}"/>" maxlength="50"/></td>
						</tr>
						<tr>
							<th><span>발행현황</th>
							<td>
								<select class="select" name="TAX_IVC_STATE">
									<option value="">선택</option>
									<option value="Y" <c:if test="${info.TAX_IVC_STATE eq 'Y'}">selected="selected"</c:if>>발행</option>
									<option value="N" <c:if test="${info.TAX_IVC_STATE eq 'N'}">selected="selected"</c:if>>미발행</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><span>부가설명</th>
							<td>
								<textarea id="TAX_IVC_TXT" name="TAX_IVC_TXT" placeholder="부가설명 최대 300자 이내">${info.TAX_IVC_TXT}</textarea>
								(<span id="msgbyte">0</span><span id="trMsgMaxByte">/300</span>)
							</td>
						</tr>
		            </tbody>
		        </table><!-- // table -->
			</form>
			
			<div class="section-button"><!-- section-button -->
                <div class="wrap text-center">
                    <a href="javascript:save();" class="button button-b"><span>저장</span></a>
                </div>
            </div><!-- // section-button -->
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>

<script type="text/javascript">
$(function(){
var $frm = $("#frm");
	
	//화면 로딩후 바이트 수 체크
	getStrByte(document.getElementById("TAX_IVC_TXT"),'#msgbyte', 300, 2, "Y");
	// 300자 체크
	$(document).on("keyup","#TAX_IVC_TXT",function(){
		getStrByte(this,'#msgbyte', 300, 2);
	});
	
	
	// 폼체크
    $frm.validate({
        rules: {
        	TAX_IVC_CPR_NO1 : { required:true, minlength:3 },  				  // 사업자번호1
        	TAX_IVC_CPR_NO2 : { required:true, minlength:2 },  				  // 사업자번호2
        	TAX_IVC_CPR_NO3 : { required:true, minlength:5 },  				  // 사업자번호3
        	TAX_IVC_JRD_NO1 : { required:true, minlength:6 },  				  // 법인번호1
        	TAX_IVC_JRD_NO2 : { required:true, minlength:7 },  				  // 법인번호2
        	TAX_IVC_CPR_NM : { required:true },  				  // 상호명
        	TAX_IVC_MNG_NM : { required:true },  				  // 담당자명
        	TAX_IVC_MAIL: { required:true, email:true }  				  // 이메일
        },
        messages: {
        	TAX_IVC_CPR_NO1 : { required:"사업자번호는 필수입력 사항입니다." },  				  // 사업자번호1
        	TAX_IVC_CPR_NO2 : { required:"사업자번호는 필수입력 사항입니다." },  				  // 사업자번호2
        	TAX_IVC_CPR_NO3 : { required:"사업자번호는 필수입력 사항입니다." },  				  // 사업자번호3
        	TAX_IVC_JRD_NO1 : { required:"법인번호는 필수입력 사항입니다."},  				  // 법인번호1
        	TAX_IVC_JRD_NO2 : { required:"법인번호는 필수입력 사항입니다." },  				  // 법인번호2
        	TAX_IVC_CPR_NM : { required:"상호명은 필수입력 사항입니다." },  				  // 상호명
        	TAX_IVC_MNG_NM : { required:"담당자명은 필수입력 사항입니다." },  				  // 담당자명
        	TAX_IVC_MAIL: { required:"이메일은 필수입력 사항입니다." }  				  // 이메일
        }
    });
	
    // 저장
    save = function()
    {
    	if($frm.valid()){
    		if(confirm("저장 하시겠습니까?"))
            {
                $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/order/taxIvc/taxIvcModify.do", "target":"_self", "method":"post"}).submit();
            }
    	}
    };	
});
</script>
</body>
</html>
