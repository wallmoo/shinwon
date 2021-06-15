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
                <h3 class="title"><span>채널정보</span></h3>
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
								<c:out value="${row.CHN_MST_UP_IDX_NM }"/>
							</td>
						</tr>
						<tr><!-- row -->
							<th><label class="label"><span>대표채널명</span></label></th>
							<td>
								<input type="hidden" name="CHN_MST_IDX" id="CHN_MST_IDX" value="<c:out value="${commandMap.CHN_MST_IDX }"/>"/>
		                		<c:out value="${row.CHN_MST_NM }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>채널명 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								<input type="hidden" name="CHN_DTL_CD" id="CHN_DTL_CD" value="<c:out value="${commandMap.CHN_DTL_CD }"/>"/>
		                		<c:out value="${row.CHN_DTL_NM }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>채널코드 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								<c:out value="${row.CHN_DTL_CD }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>기간</span></label></th>
							<td>
								 <ui:formatDate value="${row.CHN_DTL_ST_DT }" pattern="yyyy.MM.dd"/> ~ 
						    	 <ui:formatDate value="${row.CHN_DTL_ED_DT }" pattern="yyyy.MM.dd"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>수수료</span></label></th>
							<td>
								<c:out value="${row.CHN_DTL_FEE }"/> %
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자명</span></label></th>
							<td>
								<input type="text" name="CHN_DTL_MNG_NM" id="CHN_DTL_MNG_NM" class="text" value="<c:out value="${row.CHN_DTL_MNG_NM }"/>" maxlength="10"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자연락처</span></label></th>
							<td>
								<select class="select" name="CHN_DTL_MNG_TEL1" id="CHN_DTL_MNG_TEL1">
		                            <option value="">선택</option>
		                            <c:if test="${not empty codes.HP_CODE }">
		                                <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
		                                    <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"  <c:if test="${ row.CHN_DTL_MNG_TEL1 eq hpRow.CMN_COM_NM  }"> selected="selected"</c:if>   ><c:out value="${hpRow.CMN_COM_NM }"/></option>
		                                </c:forEach>
		                            </c:if>
		                        </select>-
			                	<input type="text" name="CHN_DTL_MNG_TEL2" id="CHN_DTL_MNG_TEL2" class="text short" maxlength="4" value="<c:out value="${row.CHN_DTL_MNG_TEL2 }"/>"/>-
			                	<input type="text" name="CHN_DTL_MNG_TEL3" id="CHN_DTL_MNG_TEL3" class="text short" maxlength="4" value="<c:out value="${row.CHN_DTL_MNG_TEL3 }"/>"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>담당자이메일</span></label></th>
							<td>
								<input type="hidden" name="CHN_DTL_MNG_MAIL" id="CHN_DTL_MNG_MAIL" />
			                	<input type="text" name="CHN_DTL_MAIL_ID" id="CHN_DTL_MAIL_ID" class="text" maxlength="15"  value="<c:out value="${row.CHN_DTL_MAIL_ID }"/>"/> @
		                        <input type="text" name="CHN_DTL_MAIL_DOMAIN" id="CHN_DTL_MAIL_DOMAIN" class="text" maxlength="15"  value="<c:out value="${row.CHN_DTL_MAIL_DOMAIN }"/>"/>
			                	<select class="select" name="emailDomain" id="emailDomain">
		                        <option value="">직접입력</option>
			                        <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
			                        	<c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }" varStatus="i">
			                        		<option value="<c:out value="${emailRow.CMN_COM_NM }"/>" <c:if test="${emailRow.CMN_COM_NM eq row.CHN_DTL_MAIL_DOMAIN }">selected="selected"</c:if>><c:out value="${emailRow.CMN_COM_NM }"/></option>
			                        	</c:forEach>
			                        </c:if>
			                    </select>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>쇼핑몰코드</span></label></th>
							<td>
								<c:out value="${row.CHN_DTL_SHP_LNK_CD }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>쇼핑몰종류</span></label></th>
							<td>
								<c:out value="${row.CHN_DTL_SHP_LNK_CD }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>사용자ID</span></label></th>
							<td>
								<c:out value="${row.CHN_DTL_SHP_LNK_ID }"/>
							</td>
						</tr>
						<tr>
							<th><label class="label"><span>상태 <i class="require"><em>필수입력</em></i></span></label></th>
							<td>
								<input type="radio" id="CHN_DTL_USE_YN1" class="radio" name="CHN_DTL_USE_YN" value="Y" <ui:select v="${row.CHN_DTL_USE_YN }" t="Y" g="checked"/> />
								<label for="CHN_DTL_USE_YN1">사용</label>
								<input type="radio" id="CHN_DTL_USE_YN2" class="radio" name="CHN_DTL_USE_YN" value="N" <ui:select v="${row.CHN_DTL_USE_YN }" t="N" g="checked"/>/>
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

<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
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
	
    $(document).on("click", "#goEdit", function () {
     	 
    	if($("#CHN_DTL_MAIL_ID").val() != "" && $("#CHN_DTL_MAIL_DOMAIN").val() != ""){
        	$("#CHN_DTL_MNG_MAIL").val($("#CHN_DTL_MAIL_ID").val() + "@" + $("#CHN_DTL_MAIL_DOMAIN").val());	// 대표_이메일
        }
    	
    	if (confirm("저장 하시겠습니까?")) 
      	{
        	//$("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/channelMstRegist.do", "target" : "_self", "method" : "post"}).submit();
        	regAjax();
        	
        }	
    });
    
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
});


function regAjax() {
	
	var CHN_DTL_CD = $("#CHN_DTL_CD").val();
	var CHN_DTL_MNG_NM = $("#CHN_DTL_MNG_NM").val();
	var CHN_DTL_MNG_TEL1 = $("#CHN_DTL_MNG_TEL1").val();
	var CHN_DTL_MNG_TEL2 = $("#CHN_DTL_MNG_TEL2").val();
	var CHN_DTL_MNG_TEL3 = $("#CHN_DTL_MNG_TEL3").val();
	var CHN_DTL_MNG_MAIL = $("#CHN_DTL_MNG_MAIL").val();
	var CHN_DTL_USE_YN = "";
	
	if($("#CHN_DTL_USE_YN1").is(":checked"))CHN_DTL_USE_YN = "Y";
	else CHN_DTL_USE_YN = "N";
	
    $.ajax({
        type : "POST",
        async:true,
        cache: false,
        dataType :"json",
        url : "<c:out value="${serverDomain}"/>/am/marketing/channelDtlModify.do",
        data : {
            'CHN_DTL_CD'       : CHN_DTL_CD,
            'CHN_DTL_MNG_NM'       : CHN_DTL_MNG_NM,
            'CHN_DTL_MNG_TEL1'       : CHN_DTL_MNG_TEL1,
            'CHN_DTL_MNG_TEL2'       : CHN_DTL_MNG_TEL2,
            'CHN_DTL_MNG_TEL3'       : CHN_DTL_MNG_TEL3,
            'CHN_DTL_MNG_MAIL'       : CHN_DTL_MNG_MAIL,
            'CHN_DTL_USE_YN'       : CHN_DTL_USE_YN
        },  
        success : fnResult,
        error : function(err){alert("error : " + err.status );}
    });
}

function fnResult(data) {
	
	alert("수정 되었습니다.");
	var CHN_MST_IDX_V = $("#CHN_MST_IDX").val();
	
	if(	window.opener.goListPop(CHN_MST_IDX_V) )self.close();
	
}
</script>
</body>
</html>