<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8">
		<title>상품품번검색</title>
        <link rel="stylesheet" href="/am/css/style.css">
        <script src="/am/js/vendor/modernizr-2.6.2-respond-1.1.0.min.js"></script>
        <script src="/am/js/vendor/jquery-1.11.2.min.js"></script>
	</head>
	<body class="page-popup">
		<div class="modal">
			<div class="modal-wrapper">
				<div class="modal-inner">
					<h2 class="title"><span>상품품번검색</span></h2>
					<table class="table-row table-a">
						<colgroup>
							<col style="width:15%;">
							<col style="width:35%;">
							<col style="width:15%;">
							<col style="width:35%;">
						</colgroup>
						<tbody>
							<tr>
								<th><label for="">상품품번</label></th>
								<td colspan="3"><input type="text" name="" id="" class="text xlarge"></td>
							</tr>
							<tr>
								<th><label for="">상품명</label></th>
								<td><input type="text" name="" id="" class="text xalrge"></td>
								<th><label for="">입점업체</label></th>
								<td><input type="text" name="" id="" class="text xalrge"></td>
							</tr>
							<tr>
								<th><label for="">브랜드</label></th>
								<td><input type="text" name="" id="" class="text xalrge"></td>
								<th><label for="">시즌년도</label></th>
								<td><input type="text" name="" id="" class="text xalrge"></td>
							</tr>
						</tbody>
					</table>
					<div class="grid section-button-search">
						<a href="#" class="button small"><span>초기화</span></a>
						<a href="#" class="button small primary datepicker"><span>검색</span></a>
					</div>
					<div class="grid section-button-list">
						<div class="col-1-2 text-left">
							<select class="select" name="" title="상품 보기 개수">
								<option value="20" selected>20개씩 보기</option>
								<option value="40">40개씩 보기</option>
								<option value="60">60개씩 보기</option>
								<option value="80">80개씩 보기</option>
								<option value="100">100개씩 보기</option>
							</select>
							<span class="pages">(총 <strong class="em">1</strong>건, 1 of 1 page)</span>
						</div>
						<div class="col-1-2 text-right">
							<select name="" id="" class="select">
								<option value="" selected>최근등록일순</option>
							</select>
						</div>
					</div>
					<table cellspacing="0" class="table-col table-b">
						<colgroup>
							<col style="width: auto;">
							<col style="width: auto;">
							<col style="width: auto;">
							<col style="width: auto;">
							<col style="width: auto;">
							<col style="width: auto;">
						</colgroup>
						<thead>
							<tr>
								<th>상품품번</th>
								<th>상품명</th>
								<th>시즌년도</th>
								<th>입점업체</th>
								<th>브랜드</th>
								<th>일반가</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td colspan="6">검색 조건 입력 후 검색버튼을 눌러주세요.</td>
							</tr>
							<tr>
								<td><a href="#"></a></td>
								<td><a href="javascript:goParent('BKP22240','점프 스킨 블루 가죽 자켓')">
									<c:out value="BKP22240" />
								</a>
								</td>
								<td>점프 스킨 블루 가죽 자켓</td>
								<td>2020S/S</td>
								<td>입점사A</td>
								<td>브랜드A</td>
								<td>555,555</td>
							</tr>
						</tbody>
					</table>
					<div class="section-pagination">
						<h4 class="sr-only">목록 페이징</h4>
						<div class="wrap">
							<a class="ir first" href="javascript:;"><em>처음 페이지</em></a>
							<a class="ir prev" href="javascript:;"><em>이전 페이지</em></a>
							<strong>1<span class="semantic">&nbsp;페이지 - 현재 위치</span></strong>
							<a class="ir next" href="javascript:;"><em>다음 페이지</em></a>
							<a class="ir last" href="javascript:;"><em>끝 페이지</em></a>
						</div>
					</div>
					<div class="grid section-button-search">
						<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
					</div>
				</div>
			</div>
		</div>
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery-1.11.2.min.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/plugins.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () 
{
	
	// 검색 엔터 이벤트 
    $('#searchForm').find("input").not(".datepicker").keydown(function (e) 
    {
        if(e.keyCode == 13)
        {
            search();
        }
    });
	
    // 검색
    search = function() 
    {
        var $searchForm = $("#searchForm"); 

        $searchForm.find("input[name='cPage']").val("1");
        $searchForm.find("input[name='pageSize']").val($("#frm").find("select[name='pageSize']").val());
        $searchForm.attr({"action":"<c:out value="${serverDomain}" />/am/product/searchBrandPopup.do", "target":"_self", "method":"post"}).submit(); 
    };
    
    // 페이지 이동
    goPage = function (cPage) 
    {
        var $frm = $("#frm");
        $frm.find("input[name='cPage']").val(cPage);
        $frm.attr({"action":"<c:out value="${serverDomain}"/>/am/product/searchBrandPopup.do", "target":"_self", "method":"post"}).submit();
    };
    
    // 입점업체 선택 
    goParent = function (prdMstIdx, prdMstNm)
    {
    	window.opener.fnResultProductCode(prdMstIdx, prdMstNm);
    	self.close();    	
    };
    
    // 닫기 버튼 클릭
 	$(document).on("click","#closePopup",function()
 	{
 		self.close();
 	});    
        
});
</script>
</body>
</html>
