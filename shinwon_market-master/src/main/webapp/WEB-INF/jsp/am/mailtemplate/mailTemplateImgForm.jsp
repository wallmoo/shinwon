<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="basic">

<div id="skipNavigation"><!-- skipNavigation -->
    <a href="#contents" class="sr-only">본문으로 바로가기</a>
</div><!-- // skipNavigation -->

<header><!-- header -->
    <%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</header><!-- // header -->

<div id="container" class="st-container"><!-- container -->
<form id="frmMainLayout" name="frmMainLayout" method="post">
    <input type="hidden" id="selectMenuCode" name="selectMenuCode" value="<c:out value="${selectMenuCode }" />"/>
</form>

    <aside id="navigation"><!-- navigation -->
        <nav>
            <%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
        </nav>
    </aside><!-- // navigation -->

    <div id="body"><!-- body -->

        <section id="contents"><!-- contents -->

            <div id="breadcrumb"><!-- breadcrumb -->
                <a href="#none"><i class="icon-home em"></i> HOME</a>
                &gt;
                <a href="#none">상품메일관리[<c:out value="${tempTitle }" />]</a>
                &gt;
                <span>견적관리</span>
            </div><!-- // breadcrumb -->
    
            <div class="contents-inner"><!-- contents-inner -->

                <h3 class="title">상품메일관리[<c:out value="${tempTitle }" />]</h3>

                <h4 class="title">등록</h4>

                <p>
                    <strong class="strong">*</strong> 표시된 항목은 필수 입력 사항입니다.
                </p>
                
                <form id="searchForm" name="searchForm">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
               	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>"/>
                <input type="hidden" name="searchEmlMstYn" value="<c:out value="${commandMap.searchEmlMstYn }"/>"/>
                <input type="hidden" name="path" id="path" value="<c:out value="${path }"/>"/>
                </form>
                
                <form id="frm" name="frm" enctype="multipart/form-data">
                <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>" />
               	<input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>" />
                <input type="hidden" name="searchEmlMstNm" value="<c:out value="${commandMap.searchEmlMstNm }"/>"/>
                <input type="hidden" name="searchEmlMstYn" value="<c:out value="${commandMap.searchEmlMstYn }"/>"/>
                <input type="hidden" name="path" id="path" value="<c:out value="${path }"/>"/>
	                    
				<div class="table-a"><!-- col list -->
				<table class="core tdleft">
					<colgroup>
						<col style="width: 15%;" />
						<col style="width: auto%;" />
					</colgroup>
					<tbody>
						<tr>
							<th><span>사용여부</span></th>
							<td>
								<input type="radio" class="radio" name="EML_MST_YN" id="EML_MST_YN1" value="Y" checked=true />
	                            <label for="EML_MST_YN1">사용</label>
	                            <input type="radio" class="radio" name="EML_MST_YN" id="EML_MST_YN2" value="N" />
	                            <label for="EML_MST_YN1">미사용</label>
							</td>
						</tr>
						<tr>
							<th><span>메일제목 <em class="strong">*</em></span></th>
							<td><input type="text" name="EML_MST_NM" id="EML_MST_NM" class="text long" maxlength=50 /></td>
						</tr>
						<tr>
							<th><span>발송예정일 <em class="strong">*</em></span></th>
							<td>
								<input type="text" class="text datepicker s-datepicker" id="EML_MST_ST_DT" name="EML_MST_ST_DT" />							
								<select class="select" id="EML_MST_ST_HH" name="EML_MST_ST_HH" >
								<c:forEach begin="0" end="23" step="1" var="i" varStatus="status">
								<fmt:formatNumber pattern="00" value="${i }" var="hour" />
									<option value="${hour }">${hour }</option>
								</c:forEach>
								</select> 시
								<select class="select" id="EML_MST_ST_MM" name="EML_MST_ST_MM" >
								<c:forEach begin="0" end="59" step="1" var="i" varStatus="status">
								<fmt:formatNumber pattern="00" value="${i }" var="minute" />
									<option value="${minute }">${minute }</option>
								</c:forEach>
								</select> 분
							</td>
						</tr>
						<tr>
							<th><span>수신대상 </span></th>
							<td>
								<select name="EML_MST_TGT" id="EML_MST_TGT" class="select">
									<option value="">수신대상</option>
									<c:forEach var="row" items="${targetlist }" varStatus="i">
										<option value="<c:out value="${row.TARGET_ID }" />"><c:out value="${row.TARGET_NM }" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th><span>이미지 <em class="strong">*</em></span></th>
							<td>
								<table id="fileView" style="width:50%;">
	                    			<tr>	                    				
	                    				<td id="defaultFile">	                    					
	                    					<input type="file" name="file" id="files[0]" class="file" value="" />
	                    					<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="U" />
	                    					<br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_UP_URLs" id="EML_LNK_UP_URLs" class="text"  style="width: 60%;" maxlength="100" />	                    						                    					                   					 					               		
	                    				</td>	
	                    				<td>
	                    					<input type="button" name="addFile" id="addFile" value="+"/>
	                    				</td>
	                    			</tr>	                    													                    				                    				                    		
	                    		</table>		                    			                    			                      		
								<small class="desc">* 업로드 가능 파일 : jpg, gif, png</small>
 	                            <small class="desc">* 업로드 용량 : 20MB</small> 
							</td>
						</tr>
					</tbody>
				</table>
				</div><!-- // col list -->
				
                </form>
                <div class="section-button"><!-- section button -->
                    <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
                    <a href="#none" id="goList" class="button button-a"><span>목록</span></a>
                </div><!-- // section button -->    


            </div><!-- // contents-inner -->

        </section><!-- // contents -->
        

    </div><!-- // body -->
    <footer><!-- footer -->
        <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
    </footer><!-- // footer -->
</div><!-- // container -->

<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.validate.js"></script>

<script type="text/javascript">
$(document).ready(function () {
	
	var path = $("#path").val();
	
	// 폼체크
    $("#frm").validate({
        rules: {
        	EML_MST_NM : { required:true },  				  // 메일제목
        	EML_MST_ST_DT : { required:true }                // 발송예정일
        },
        messages: {
        	EML_MST_NM: { required: "메일제목은 필수입력입니다."},
        	EML_MST_ST_DT: { required: "발송예정일은 필수입력입니다."}
        }
    });
	
 	// 파일 행 추가 클릭 이벤트
    $("#addFile").click(function(){
    	var fileNum = $("#fileView tr").children().length;
    	var fileLen = $("input[name=file]").length;
    	if(fileLen == 10){
    		alert("이미지는 최대 10개까지 등록 할 수 있습니다.");
    		return;
    	}else{
	    	$("#fileView").append('<tr><td>' + '<input type="hidden" name="EML_LNK_TYPE" id="EML_LNK_TYPE" value="U" /><input type="file" class="file" name="file" id="files['+ fileNum +']"/><br><br>URL&nbsp;&nbsp;<input type="text" name="EML_LNK_UP_URLs" id="EML_LNK_UP_URLs" class="text"  style="width: 60%;" maxlength="100" />' + '</td><td>'+'<input type="button" onClick="rowDelete(this)" value="-"/>'+'</td></tr>');
			// 고정 첨부파일 행 파일지우기 비활성화
    	}
    	
    });
    
    
 	// 저장 이벤트
    $(document).on("click", "#goRegist", function () 
    {
        var $frm = $("#frm"); 
        if($frm.valid()){
        	
        	var fileLen = 0;
        	var fileResult = true;
        	$frm.find("input[name=file]").each(function(){
				if($(this).val() == "")
				{
					fileResult = false;
					fileLen ++;
				}
        	});
        	
        	if($("input[name=file]").length > 10){
        		alert("이미지는 최대 10개까지 등록 가능합니다.");
        		return;
        	}
        	
        	if(fileLen == $("input[name=file]").length && fileResult == false)
        	{
        		alert("이미지를 입력해주세요.");
        		return;
        	}
        	
        	
        	if (confirm( "등록 하시겠습니까?")) 
            {
        		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"Regist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
 	
 	
 	
 	// 목록 이벤트
    $(document).on("click", "#goList", function () 
    {
      	var $frm = $("#searchForm"); 
      	$frm.attr({"action":"<c:out value="${serverDomain}" />/am/mailtemplate/mailTemplate"+path+"List.do", "target":"_self", "method":"post"}).submit();
    }); 

});

//현재 행 삭제
function rowDelete(row)
{
	$(row).parent().parent().remove();
}
</script>
</body>
</html>