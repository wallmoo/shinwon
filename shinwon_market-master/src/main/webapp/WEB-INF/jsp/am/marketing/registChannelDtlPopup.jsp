<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">
	    	
            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>하위채널등록</span></h3>
            </div><!-- // push-guide -->
            
            <p> <i class="require"><em>필수입력</em></i>필수입력정보</p>
            
            <form name="frm" id="frm" >
                <table cellspacing="0" class="table-row table-a"><!-- table -->
					<colgroup>
						<col style="width: 17%;" />
						<col style="width: auto;" />
					</colgroup>
					<tbody>
						<tr>
							<th><label class="label"><span>채널구분</span></label></th>
							<td>
								<span id="CHN_MST_UP_IDX_NM"></span>
							</td>
						</tr>
						<tr><!-- row -->
							<th><label class="label"><span>대표채널명</span></label></th>
							<td>
								<input type="hidden" name="CHN_MST_IDX" id="CHN_MST_IDX" value="<c:out value="${commandMap.CHN_MST_IDX }"/>"/>
		                		<span id="CHN_MST_NM"></span>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>채널명 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								<input type="text" name="CHN_DTL_NM" id="CHN_DTL_NM" class="text"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>채널코드 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								시스템 자동부여
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>기간</span></label></th>
							<td>
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
								<input type="text" class="text date" id="CHN_DTL_ST_DT" name="CHN_DTL_ST_DT" value="<c:out value="${commandMap.CHN_DTL_ST_DT }"/>" readonly="readonly" data-target-end="#CHN_DTL_ED_DT"/>~
								<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
			                    <input type="text" class="text date" id="CHN_DTL_ED_DT" name="CHN_DTL_ED_DT" value="<c:out value="${commandMap.CHN_DTL_ED_DT }"/>" readonly="readonly" data-target-start="#CHN_DTL_ST_DT"/>
			                    <a href="javascript:fnDateSet('CHN_DTL_ST_DT', 'CHN_DTL_ED_DT', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
	                            <a href="javascript:fnDateSet('CHN_DTL_ST_DT', 'CHN_DTL_ED_DT', 0, 0, 0, 0, 0, 7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
	                            <a href="javascript:fnDateSet('CHN_DTL_ST_DT', 'CHN_DTL_ED_DT', 0, 0, 0, 0, 1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>수수료</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_FEE" id="CHN_DTL_FEE" class="text short"  maxlength="5"/> %
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자명</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_MNG_NM" id="CHN_DTL_MNG_NM" class="text" maxlength="10"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자연락처</span></label></th>
							<td>
								<select class="select" name="CHN_DTL_MNG_TEL1" id="CHN_DTL_MNG_TEL1">
		                            <option value="">선택</option>
		                            <c:if test="${not empty codes.HP_CODE }">
		                                <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                    <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                </c:forEach>
		                            </c:if>
		                        </select>-
			                	<input type="text" name="CHN_DTL_MNG_TEL2" id="CHN_DTL_MNG_TEL2" class="text short number" maxlength="4"/>-
			                	<input type="text" name="CHN_DTL_MNG_TEL3" id="CHN_DTL_MNG_TEL3" class="text short number" maxlength="4"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자이메일</span></label></th>
							<td>
								<input type="hidden" name="CHN_DTL_MNG_MAIL" id="CHN_DTL_MNG_MAIL" />
			                	<input type="text" name="CHN_DTL_MAIL_ID" id="CHN_DTL_MAIL_ID" class="text" maxlength="15"/> @
		                        <input type="text" name="CHN_DTL_MAIL_DOMAIN" id="CHN_DTL_MAIL_DOMAIN" class="text" maxlength="15"/>
			                	<select class="select" name="emailDomain" id="emailDomain">
		                        	<option value="">직접입력</option>
			                        <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
			                        	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
			                        		<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
			                        	</c:forEach>
			                        </c:if>
			                    </select>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>쇼핑몰코드</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_SHP_LNK_CD" id="CHN_DTL_SHP_LNK_CD" class="text" maxlength="10"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>쇼핑몰종류</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_SHP_LNK_KND" id="CHN_DTL_SHP_LNK_KND" class="text" maxlength="10"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>사용자ID</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_SHP_LNK_ID" id="CHN_DTL_SHP_LNK_ID" class="text" maxlength="10"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>상태 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								<input type="radio" id="CHN_DTL_USE_YN1" class="radio" name="CHN_DTL_USE_YN" value="Y" checked="checked" />
								<label for="CHN_DTL_USE_YN1">사용</label>
								<input type="radio" id="CHN_DTL_USE_YN2" class="radio" name="CHN_DTL_USE_YN" value="N" />
								<label for="CHN_DTL_USE_YN2">미사용</label>
							</td>
						</tr>
					</tbody>
				</table><!-- // table -->
            </form>
            
	        <div class="grid section-button-search"><!-- section button -->
	        	<a href="#none" id="goEdit" class="button small primary"><span>저장</span></a>
			</div>
        </div>
    </div>
</div>

<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common/jquery.validate.js"></script>

<script type="text/javascript">
$(function () {
	var CHN_MST_UP_IDX_NM = opener.$("#CHN_MST_UP_IDX_NM").val();
	var CHN_MST_NM  = opener.$("#CHN_MST_NM").val();
	
	$("#CHN_MST_UP_IDX_NM").text(CHN_MST_UP_IDX_NM);
	$("#CHN_MST_NM").text(CHN_MST_NM);
	
	$(document).on("change", "#emailDomain", function () {
        var $obj = $("#CHN_DTL_MAIL_DOMAIN");
        var value = $(this).val();

        if(value == "") 
        {
            $obj.removeAttr("readonly");    
        }
        else
        {
            $obj.attr("readonly", "readonly");
        }
        
        $obj.val($(this).val());
        
    });
	
    $(document).on("click", "#goEdit", function () {
     	 
    	if($("#CHN_DTL_NM").val() == "")
    	{
    		alert("[채널명] 반드시 선택해 주십시오.");
            $("#CHN_DTL_NM").focus();
            return;	
    	}
    	
    	if($("#CHN_DTL_MAIL_ID").val() != "" && $("#CHN_DTL_MAIL_DOMAIN").val() != ""){
        	$("#CHN_DTL_MNG_MAIL").val($("#CHN_DTL_MAIL_ID").val() + "@" + $("#CHN_DTL_MAIL_DOMAIN").val());	// 대표_이메일
        }
    	
//     	if($("#CHN_DTL_FEE1").val() != "" && $("#CHN_DTL_FEE2").val() != "")$("#CHN_DTL_FEE").val($("#CHN_DTL_FEE1").val() + "." + $("#CHN_DTL_FEE2").val());
//     	if($("#CHN_DTL_FEE1").val() != "" && $("#CHN_DTL_FEE2").val() == "")$("#CHN_DTL_FEE").val($("#CHN_DTL_FEE1").val());
//     	if($("#CHN_DTL_FEE1").val() == "" && $("#CHN_DTL_FEE2").val() != "")$("#CHN_DTL_FEE").val("0."+$("#CHN_DTL_FEE2").val());

    	var CHN_DTL_FEE = $("#CHN_DTL_FEE").val(); 
    	
    	if(CHN_DTL_FEE != "")
    	{
    		CHN_DTL_FEE = CHN_DTL_FEE.replace(".","");
	    	if(isNaN(CHN_DTL_FEE))
	    	{
	    		alert("수수료는 숫자와 '.'만 입력가능 합니다.");
	    		$("#CHN_DTL_FEE").val(""); 
	            $("#CHN_DTL_FEE").focus();
	            return;	
	    	}
    	}
    	
    	if (confirm("저장 하시겠습니까?")) 
      	{
        	//$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/channelMstRegist.do", "target" : "_self", "method" : "post"}).submit();
        	regAjax();
        	
        }	
    }); 
});


function regAjax() {
	
	var CHN_MST_IDX = $("#CHN_MST_IDX").val();
	var CHN_DTL_NM = $("#CHN_DTL_NM").val();
	var CHN_DTL_ST_DT = $("#CHN_DTL_ST_DT").val();
	var CHN_DTL_ED_DT = $("#CHN_DTL_ED_DT").val();
	var CHN_DTL_FEE = $("#CHN_DTL_FEE").val();
	var CHN_DTL_MNG_NM = $("#CHN_DTL_MNG_NM").val();
	var CHN_DTL_MNG_TEL1 = $("#CHN_DTL_MNG_TEL1").val();
	var CHN_DTL_MNG_TEL2 = $("#CHN_DTL_MNG_TEL2").val();
	var CHN_DTL_MNG_TEL3 = $("#CHN_DTL_MNG_TEL3").val();
	var CHN_DTL_MNG_MAIL = $("#CHN_DTL_MNG_MAIL").val();
	
	var CHN_DTL_SHP_LNK_CD = $("#CHN_DTL_SHP_LNK_CD").val();
	var CHN_DTL_SHP_LNK_KND = $("#CHN_DTL_SHP_LNK_KND").val();
	var CHN_DTL_SHP_LNK_ID = $("#CHN_DTL_SHP_LNK_ID").val();
	
	var CHN_DTL_USE_YN = "";
	
	if($("#CHN_DTL_USE_YN1").is(":checked"))CHN_DTL_USE_YN = "Y";
	else CHN_DTL_USE_YN = "N";
	
    $.ajax({
        type : "POST",
        async:true,
        cache: false,
        dataType :"json",
        url : "<c:out value="${serverDomain}"/>/am/marketing/channelDtlRegist.do",
        data : {
            'CHN_MST_IDX'       : CHN_MST_IDX,
            'CHN_DTL_NM'       : CHN_DTL_NM,
            'CHN_DTL_ST_DT'       : CHN_DTL_ST_DT,
            'CHN_DTL_ED_DT'       : CHN_DTL_ED_DT,
            'CHN_DTL_FEE'       : CHN_DTL_FEE,
            'CHN_DTL_MNG_NM'       : CHN_DTL_MNG_NM,
            'CHN_DTL_MNG_TEL1'       : CHN_DTL_MNG_TEL1,
            'CHN_DTL_MNG_TEL2'       : CHN_DTL_MNG_TEL2,
            'CHN_DTL_MNG_TEL3'       : CHN_DTL_MNG_TEL3,
            'CHN_DTL_MNG_MAIL'       : CHN_DTL_MNG_MAIL,
            'CHN_DTL_USE_YN'       : CHN_DTL_USE_YN,
            'CHN_DTL_SHP_LNK_CD'   : CHN_DTL_SHP_LNK_CD,
            'CHN_DTL_SHP_LNK_KND'   : CHN_DTL_SHP_LNK_KND,
            'CHN_DTL_SHP_LNK_ID'   : CHN_DTL_SHP_LNK_ID,
        },  
        success : fnResult,
        error : function(err){alert("error : " + err.status );}
    });
}

function fnResult(data) {
	
	alert("등록되었습니다.");
	var CHN_MST_IDX_V = $("#CHN_MST_IDX").val();
	
	if(	window.opener.goListPop(CHN_MST_IDX_V) )self.close();
	
}
</script>
</body>
</html>