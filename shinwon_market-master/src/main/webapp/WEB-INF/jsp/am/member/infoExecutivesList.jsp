<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body><!-- body class, 중요 -->

<div id="header"><!-- header -->
	<%@ include file="/WEB-INF/jsp/am/include/top.jsp" %>
</div><!-- // header -->

<div id="container"><!-- container -->

	<div id="aside" class="aside left"><!-- aside -->
		<%@ include file="/WEB-INF/jsp/am/include/left.jsp" %>
	</div><!-- // aside -->

	<div id="wrapper"><!-- wrapper -->

		<div id="breadcrumb"></div><!-- breadcrumb -->

		<div id="contents"><!-- contents -->

			<div class="container">

                    <h2 class="title"><span>임직원 목록</span></h2>

                    <h3 class="title"><span>검색</span></h3>

                    <form id="searchForm" name="searchForm">
                        <input type="hidden" name="pageSize" value="" />
    	                <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 10%;" />
    	                        <col style="width: auto;" />
                                <col style="width: 10%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
                                <tr>
                                    <th class="5"><span>가입일</span></th>
                                    <td colspan="5">
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" name="searchInfoStartDate" id="searchInfoStartDate" class="text date small" value="<c:out value="${commandMap.searchInfoStartDate }"/>" readonly="readonly" data-target-end="#searchInfoEndDate"/> ~
										<a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
										<input type="text" name="searchInfoEndDate" id="searchInfoEndDate" class="text date small" value="<c:out value="${commandMap.searchInfoEndDate }"/>" readonly="readonly" data-target-start="#searchInfoStartDate"/>
										<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, 0,  '-');" class="button button-a xsmall"><span>오늘</span></a>
										<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -7,  '-');" class="button button-a xsmall"><span>일주일</span></a>
										<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, 0, -15,  '-');" class="button button-a xsmall"><span>15일</span></a>
										<a href="javascript:fnDateSet('searchInfoEndDate', 'searchInfoStartDate', 0, 0, 0, 0, -1, 0,  '-');" class="button button-a xsmall"><span>한달</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>회원등급</span></th>
                                    <td>
										<select class="select" name="searchMemSwType" id="searchMemSwType" >
											<option value="">전체</option>
										</select>    
                                    </td>
                                    <th><span>아이디</span></th>
                                    <td>
                                        <input type="text" class="text xlarge" placeholder="아이디입력" name="searchId" id="searchId"  value="<c:out value="${commandMap.searchId }"/>" >
                                    </td>
                                    <th><span>이름</span></th>
                                    <td>
                                        <input type="text" name="searchNm" id="searchNm" class="text xlarge" placeholder="이름 입력" value="<c:out value="${commandMap.searchNm }"/>" />
                                    </td>
                                </tr>
                                <tr>
                                    <th><span>휴대폰(뒤자리)</span></th>
                                    <td>
                                        <input type="text" name="searchTel" id="searchTel" class="text onlyNumber" placeholder="4자리 입력" value="<c:out value="${commandMap.searchTel }"/>" maxlength="4"/>
                                    </td>
                                    <th><span>생년월일</span></th>
                                    <td colspan="3">
                                        <input type="text" name="searchBirth" id="searchBirth" class="text onlyNumber" value="<c:out value="${commandMap.searchBirth }"/>" maxlength="8" placeholder="YYYYMMDD(8자리)"/>
                                    </td>
                                </tr>
                                
								<tr>
									<th><span>특정권한</span></th>
									<td colspan="5">
										<ul class="form_radio_check_list">
											<li>
												<input type="checkbox" class="check" name="search3626" id="search3626" value="3626" />
												<label for="search3626">리뷰어회원</label>
											</li>
											<li>
												<input type="checkbox" class="check" name="search3627" id="search3627" value="3627" />
												<label for="search3627">특정리뷰회원</label>
											</li>
											<li>
												<input type="checkbox" class="check" name="search3628" id="search3628"  value="3628" />
												<label for="search3628">특정OOTD회원</label>
											</li>
										</ul>
									</td>
								</tr>                                
                               
    	                    </tbody>
    	                </table><!-- // table -->
                    </form>

                    <div class="grid section-button-search"><!-- 검색 하단 버튼 -->
                        <a href="javascript:searchClear('searchForm');" class="button small"><span>초기화</span></a>
                        <a href="javascript:goSearch()" id="search" class="button small primary"><span>검색</span></a>
                    </div>

                    <form id="frm" name="frm">
                        <input type="hidden" name="cPage" value="${commandMap.cPage}" />
						<input type="hidden" name="searchYn" value="Y" />
						<input type="hidden" name="searchInfoStartDate" value="<c:out value="${commandMap.searchInfoStartDate }"/>" />
						<input type="hidden" name="searchInfoEndDate" value="<c:out value="${commandMap.searchInfoEndDate }"/>" />
						<input type="hidden" name="searchId" value="<c:out value="${commandMap.searchId }"/>"/>
						<input type="hidden" name="searchNm" value="<c:out value="${commandMap.searchNm }"/>"/>
						<input type="hidden" name="searchTel" value="<c:out value="${commandMap.searchTel }"/>"/>
						<input type="hidden" name="searchBirth" value="<c:out value="${commandMap.searchBirth }"/>"/>
						<input type="hidden" name="searchMemberType" value="<c:out value="${commandMap.searchMemberType }"/>"/>
						<input type="hidden" name="searchMemGrade" value="<c:out value="${commandMap.searchMemGrade }"/>"/>
						<input type="hidden" name="searchJoinPath" value="<c:out value="${commandMap.searchJoinPath }"/>"/>
						<input type="hidden" name="searchJoinType" value="<c:out value="${commandMap.searchJoinType }"/>"/>
						<input type="hidden" name="search3626" value="<c:out value="${commandMap.search3626 }"/>"/>
						<input type="hidden" name="search3627" value="<c:out value="${commandMap.search3627 }"/>"/>
						<input type="hidden" name="search3628" value="<c:out value="${commandMap.search3628 }"/>"/>
						
						<!--                      
    	                <input type="hidden" name="PLN_MST_IDX" value="" />
    					<input type="hidden" name="searchPlnMstShopType" value="" />
    					<input type="hidden" name="searchPlnMstTitle" value="" />
    					<input type="hidden" name="searchPlnMstStDt" value="2020-01-21" />
    					<input type="hidden" name="searchPlnMstEdDt" value="2020-01-21" />
    					<input type="hidden" name="searchPlnMstStatus" value="" />
    					<input type="hidden" name="searchPlnMstUseYn" value="" />
                        -->
                        
                        <h3 class="title"><span>목록</span></h3>

    	                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                     		<div class="col-1-2 text-left">
    	                 		<select class="select" id="pageSize" name="pageSize" onchange="javascript:goPage(1);" title="상품 보기 개수" ><option value="20" selected>20개씩 보기</option><option value="40" >40개씩 보기</option><option value="60" >60개씩 보기</option><option value="80" >80개씩 보기</option><option value="100" >100개씩 보기</option></select>
                                <span class="pages">
    	                        	(총 <strong class="em">${totalCount}</strong>건, ${commandMap.cPage} of <fmt:formatNumber value="${totalCount/commandMap.pageSize+(1-(totalCount/commandMap.pageSize%1))%1}" minFractionDigits="0" maxFractionDigits="0"/> page)
    	                        </span>
    						</div>

    	                    <div class="col-1-2 text-right">
                                <button  id="changeNormalMember" class="button small"><span>일반회원 전환</span></button>
                                <a href="#none" id="excelDown" class="button small primary"><span>엑셀 다운로드</span></a>
    	                        <a href="/am/member/infoExecutivesRegist.do" id="goForm" class="button small primary"><span>등록</span></a>
    	                    </div>
                    	</div><!-- // 목록 상단 버튼 -->

    	                <table cellspacing="0" class="table-col table-b"><!-- table -->
    						<colgroup>
    							<col style="width: 10%;" />
    							<col style="width: 8%;" />
    							<col style="width: 10%;" />
    							<col style="width: 10%;" />
    							<col style="width: 8%;" />
    							<col style="width: 10%;" />
    							<col style="width: 15%;" />
    							<col style="width: 20%;" />
    							<col style="width: 15%;" />
    						</colgroup>
    						<thead>
    							<tr>
                                    <th><input type="checkbox" class="checkbox checkAll" /></th>
    								<th>NO</th>
    								<th>아이디</th>
    								<th>회원이름</th>
    								<th>성별</th>
    								<th>생년월일</th>
    								<th>회원분류/회원등급</th>
    								<th>임직원포인트</th>
    								<th>가입일</th>
    							</tr>
    						</thead>
    						<tbody>
    							
    							<c:forEach items="${list}" var="row" varStatus="i">
	    							<tr>
	                                    <td><input type="checkbox" class="checkbox checkRow" value="<c:out value="${row.MEM_MST_MEM_ID }"/>"/></td>
	                                    <td>${i.count}</td>
	                                    <td class="text-left">
	                                    	<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
												<c:out value="${row.MEM_MST_MEM_ID }"/>
											</a>
										</td>
	                                    <td class="text-left">
	                                    	<a href="javascript:goMemberViewPopup('<c:out value="${serverDomain}" />','<c:out value="${row.MEM_MST_MEM_ID }" />');" title="새 창 으로 열립니다.">
												<c:out value="${row.MEM_MST_MEM_NM }"/>
											</a>
	                                    </td>
	                                    <td><c:if test="${'F' eq row.MEM_IPN_SEX}">여성</c:if><c:if test="${'M' eq row.MEM_IPN_SEX}">남성</c:if></td>
	                                    <td>${row.MEM_IPN_BIR }</td>
	                                    <td>${row.MEM_MST_SW_TYPE }/${row.MEM_MST_MEM_GRD }</td>
	                                    <!--  
	                                    <td>${row.MEM_MST_MEM_GBN }/${row.MEM_MST_MEM_GRD }</td>
	                                    -->
	                                    
	                                    <td><fmt:formatNumber value="${row.MEM_SW_POINT}" groupingUsed="true" />p</td>
	                                    <%-- <td><fmt:formatNumber value="${row.MEM_MST_PNT}" groupingUsed="true" />p</td> --%>
	                                    
	                                    <td>${row.MEM_MST_REG_DT }</td>
									</tr>
    							</c:forEach>
    							
							</tbody>
    					</table>

    					<div class="section-pagination"><!-- section pagination -->
    	                    <h4 class="sr-only">목록 페이징</h4>
    	                    <div class="wrap"><!-- 개발 시 wrap 이하 모듈 시작 -->
    	                        <!-- <a class="nav first" href="javascript:;" ><i><em>첫 페이지</em></i></a> <a class="nav prev" href="javascript:;" ><i><em>이전 페이지</em></i></a> <strong><em>현재 페이지 -</em><span>1<span></strong> <a class="nav next" href="javascript:;" ><i><em>다음 페이지</em></i></a> <a class="nav last" href="javascript:;" ><i><em>마지막 페이지</em></i></a> -->
    	                        <ui:paging paging="${paging }" jsFunction="goPage" />
                            </div>
    	                </div><!-- // section pagination -->

    				</form>
                </div>

		</div><!-- // contents -->

	</div><!-- // wrapper -->

	<div id="quickmenu" class="aside right"><!-- quickmenu-->
		<%@ include file="/WEB-INF/jsp/am/include/quick.jsp" %>
	</div><!-- // quickmenu -->

</div><!-- // container -->

<div id="footer">
	<%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>


<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>

<script>
$(function(){
	 $.checkBoxSelect("checkAll", "checkRow");
	 
	 $('#changeNormalMember').click(function(){
		 
		 
		 var $frm = $('#frm');
		 var num = 0 ;
		 var checkList = $frm.find('input[type=checkbox].checkRow');
		 for(var i=0;i<checkList.length;i++){
			 var dom = $(checkList[i]);
			 if(dom.is(":checked")){
				 num = num *1 +1 ;
			 }
		 }
		 
		 if ( num == 0 ){
			 alert( '일반회원으로 전환할 1개 이상의 아이디를 선택하세요' );
			 return ;
		 }		 
		 
		if (confirm("일반회원으로 전환하시겠습니까?")) {
			
			 var $frm = $('#frm');
			 var num = 0 ;
			 var checkList = $frm.find('input[type=checkbox].checkRow');
			 for(var i=0;i<checkList.length;i++){
				 var dom = $(checkList[i]);
				 if(dom.is(":checked")){
					 $frm.append('<input type="hidden" name="targetMemberList" value="'+dom.val()+'">');
				 }
			 }

			 $frm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoExecutivesChangeNormal.do", "target":"_self", "method":"post"}).submit();				 

		}     		 
	 });
	 
	// 회원 검색 클릭 이벤트
	goSearch = function()
	{
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoExecutivesList.do", "target":"_self", "method":"post"}).submit();
	};

	// 회원 검색 엔터 이벤트
	$('#searchForm').find("input").not(".datepicker").keydown(function (e){
		if(e.keyCode == 13)
		{
			goSearch();
		}
	});

	// 페이지 이동
	goPage = function (cPage)
	{
		var $frm = $("#frm");
		$frm.find("input[name='cPage']").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}"/>/am/member/infoExecutivesList.do", "target":"_self", "method":"post"}).submit();
	};


	// 회원등급 셀렉트박스 변경 이벤트
	getMemGradeList = function(memberType, targetSelectId){
		$.ajax({
			type:"post",
			url : "<c:out value="${serverDomain}" />/am/member/getMemGradeListAjax.do",
			data : {"MEM_MST_MEM_GBN": memberType},
			dataType : "json",
			async : false,
			success : function(data){
				var selectedIdx = "${commandMap.searchMemSwType}";
				$("#"+targetSelectId).html("<option value=\"\">전체</option>");
				if(data.memGradeList.length > 0){
					$.each(data.memGradeList, function(idx, item){
						if ( item.CMN_COM_USE_YN == 'Y') {
							var selected = item.CMN_COM_IDX == selectedIdx ? "selected" : ""; //기존 선택된 회원구분이 있는 경우 selected
							$("#"+targetSelectId).append("<option value=\""+ item.CMN_COM_IDX +"\" "+ selected +">"+ item.CMN_COM_NM +"</option>");							
						}

					});
				}
			},
			error : function(err){
				alert("오류가 발생하였습니다.\n[" + err.status + "]");
			}
		});
	};
	
	goDownload = function()
	{ 
		var $searchForm = $("#searchForm");
		$searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/member/infoExecutivesExcelDownload.do", "target":"_self", "method":"post"}).submit();
	};


	$('#excelDown').on('click',function(){
		goDownload();
	});	
	
});

$(document).ready(function () {
    //Paging count select 박스 적용
    
    getMemGradeList( '3076', "searchMemSwType");    
    
    
    var vPageSize = '<c:out value="${commandMap.pageSize }"/>';
    if ( vPageSize != '' )
      $('#pageSize').val( vPageSize );
    
    if ( "<c:out value="${commandMap.search3626 }"/>" == '3626'  )
    	$('#search3626').attr( 'checked', 'checked');
    	//$('#search3626').is(':checked')

    if ( "<c:out value="${commandMap.search3627 }"/>" == '3627'  )
    	$('#search3627').attr( 'checked', 'checked');
    
    if ( "<c:out value="${commandMap.search3628 }"/>" == '3628'  )
    	$('#search3628').attr( 'checked', 'checked');    
    
	    
});



//-->
</script>

</body>
</html>
