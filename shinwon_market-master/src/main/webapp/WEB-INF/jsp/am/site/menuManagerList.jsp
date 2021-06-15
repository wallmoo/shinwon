<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" class="no-js is-sm">
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style type="text/css">
<!--
-->
</style>
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

				<h2 class="title"><span>메뉴 관리</span></h2>

				<h3 class="title"><span>목록</span></h3>
				
				<form id="searchForm" name="searchForm" method="post">
					<table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: auto;" />
							<col style="width: 10%;" />
							<col style="width: auto;" />
						</colgroup>
						<tbody>
							<tr><!-- row -->
								<th><span>메뉴명</span></th>
								<td>
									<input type="text" class="text large" name="searchAdmMnuNm" id="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>"/>
								</td>
								<th><span>상태</span></th>
								<td>
									<ul class="form_radio_check_list">
										<li>
											<input type="radio" cass="radio" id="stateA" name="searchAdmMnuOnYN" class="radio" <c:if test="${empty commandMap.searchAdmMnuOnYN }">checked</c:if> value="">
											<label for="stateA">전체</label>
										</li>
										<li>
											<input type="radio" cass="radio" id="stateB" name="searchAdmMnuOnYN" class="radio" <c:if test="${commandMap.searchAdmMnuOnYN eq 'Y' }">checked</c:if> value="Y">
											<label for="stateB">사용</label>
										</li>
										<li>
											<input type="radio" cass="radio" id="stateC" name="searchAdmMnuOnYN" class="radio" <c:if test="${commandMap.searchAdmMnuOnYN eq 'N' }">checked</c:if> value="N">
											<label for="stateC">미사용</label>
										</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table><!-- // table -->
				</form>

				<div class="grid section-button-search"><!-- 검색 하단 버튼 -->
					<a href="javascript:searchClear('searchForm');" class="button small"><span>검색 조건 초기화</span></a>
					<a href="javascript:;" id="search" class="button small primary"><span>검색</span></a>
				</div><!-- // 검색 하단 버튼 -->
				
				<form id="frm" name="frm" method="post">
					<input type="hidden" name="ADM_MNU_IDX" value="" />
					<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
					<input type="hidden" name="searchAdmMnuNm" value="<c:out value="${commandMap.searchAdmMnuNm }"/>"/>
					<input type="hidden" name="searchAdmMnuOnYN" value="<c:out value="${commandMap.searchAdmMnuOnYN }"/>"/>

					<div class="grid section-button-list"><!-- 목록 상단 버튼 -->
						<div class="col-1-2 text-left">  
							<ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
							<span class="pages">
								(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건, <c:out value="${paging.cPage }" /> of <c:out value="${paging.totalPageCount }" /> page)	
							</span>
						</div>
						<div class="col-1-2 text-right">
							<a href="javascript:;" id="modifySort" class="button small"><span>순서 저장</span></a>
							<a href="javascript:;" id="goForm" class="button small primary"><span>등록</span></a>
						</div>
					</div><!-- // 목록 상단 버튼 -->
				</form>

				<table cellspacing="0" class="table-col table-b">
					<colgroup>
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
						<col style="width: auto;" />
					</colgroup>
					<thead>
						<tr>
							<th colspan="2">순서</th>
							<th>메뉴명</th>
							<th>링크 경로</th>
							<th>권한 체크 경로</th>
							<th>등록일</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody class="sort-target">
						<c:choose>
							<c:when test="${not empty list }">
								<c:forEach var="row" items="${list }" varStatus="i">
									<tr>
										<td>
											<a href="javascript:;" class="row-sort" data-sort_type="up">△</a>
											<a href="javascript:;" class="row-sort" data-sort_type="down">▽</a>
										</td>
										<td class="col-sort" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>"><c:out value="${row.ADM_MNU_SORT }"/></td>
										<td class="al">
											<a href="javascript:;" class="list-title" data-adm_mnu_idx="<c:out value="${row.ADM_MNU_IDX }"/>">
												<c:out value="${row.ADM_MNU_NM }"/>
											</a>
										</td>
										<td class="al"><c:out value="${row.ADM_MNU_URL }"/></td>
										<td class="al"><c:out value="${row.ADM_MNU_AUTH_URL }"/></td>
										<td><ui:formatDate value="${row.ADM_MNU_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
										<td><c:out value="${row.ADM_MNU_ON_YN eq 'Y' ? '사용' : '미사용' }"/></td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7">조회결과가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table><!-- // table -->
				
				<div class="section-pagination"><!-- section-pagination -->
					<h4 class="sr-only">목록 페이징</h4>
					<div class="wrap">
						<ui:paging paging="${paging }" jsFunction="goPage" />
					</div>
				</div><!-- // section-pagination -->
				
			</div><!-- // container -->

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
	// 검색 엔터 이벤트 
	$("#searchAdmMnuNm").on("keydown", function(e){
		if(e.keyCode == 13){
			$("#search").trigger("click");
			return false;
		}
	});
	
	// 검색 버튼 클릭 이벤트
	$("#search").on("click", function(){
		var $searchForm = $("#searchForm"); 
		
		$searchForm.find("input[name=pageSize]").val($("#frm").find("select[name='pageSize']").val());
		$searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerList.do", "target":"_self", "method":"post"}).submit(); 
	});
	
	// 페이지 이동
	goPage = function(cPage){
		var $frm = $("#frm");
		$frm.find("input[name=cPage]").val(cPage);
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerList.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 페이지 사이즈 변경
	goPageSize = function(size){
		var $frm = $("#frm");
		$frm.find("#cPage").val("1");
		$frm.find("input[name=pageSize]").val(size);
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerList.do", "target":"_self", "method":"post"}).submit();
	};
	
	// 제목 a Tag 클릭 이벤트
	$(document).on("click", ".list-title", function(){
		var $frm = $("#frm");
		$frm.find("input[name=ADM_MNU_IDX]").val($(this).data("adm_mnu_idx"));
		$frm.attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerEdit.do", "target":"_self", "method":"post"}).submit();
	});
	
	// 등록 버튼 클릭 이벤트
	$("#goForm").on("click", function(){
		$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/menuManagerForm.do", "target":"_self", "method":"post"}).submit();
		return false;
	});
	
	// 메뉴관리 순서 변경 이벤트
	$(document).on("click", ".row-sort", function(){
		var $this = $(this);
		var $tr = $this.parent().parent();
		var type = $this.data("sort_type");
		
		if(type == "up"){
			var $prevTr = $tr.prev(); 
			if($prevTr.length > 0){
				var $trClone = $tr.clone();
				$prevTr.before($trClone);
				$tr.remove();    
			}else{
				alert("최 상위 순서 입니다.");
				return;
			} 
		}else{
			var $nextTr = $tr.next();
			if($nextTr.length > 0){
				var $trClone = $tr.clone();
				$tr.next().after($trClone);
				$tr.remove();
			}else{
				alert("최 하위 순서 입니다.");
				return;
			}
		}
		
		$(".sort-target").find("tr").each(function(i){
			$(this).find(".col-sort").text(i+1);
		});
	});
	
	// 메뉴관리 순서 저장 버튼 클릭 이벤트
	$("#modifySort").on("click", function(){
		if(confirm("저장 하시겠습니까?")){
			var idxArray = new Array();
			var sortArray = new Array();
			
			$(".sort-target").find("tr").each(function(i){
				var $tr = $(this).find(".col-sort");
				idxArray.push($tr.data("adm_mnu_idx"));
				sortArray.push($tr.text());
			});
			
			$.ajax ({
			   async : false,
			   type : "POST",
			   url : "<c:out value="${serverDomain}" />/am/site/menuManagerSortArrayAjax.do", 
			   data : {"ADM_MNU_IDX":idxArray, "ADM_MNU_SORT":sortArray},
			   success : function (data) {
				   alert(data.message);
			   },
			   error : function () {
				   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
			   }
			});
		}
	});
});

//-->
</script>
</body>
</html>
