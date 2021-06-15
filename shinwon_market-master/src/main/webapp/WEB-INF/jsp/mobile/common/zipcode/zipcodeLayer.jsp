<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/search/common_zip/WNSearch.jsp" %><% request.setCharacterEncoding("UTF-8");%><%
	//실시간 검색어 화면 출력 여부 체크
	boolean isRealTimeKeyword = false;
	//오타 후 추천 검색어 화면 출력 여부 체크
	boolean useSuggestedQuery = true;
	String suggestQuery = "";
	
	//디버깅 보기 설정
	boolean isDebug = false;
	
	int TOTALVIEWCOUNT = 10;    //통합검색시 출력건수
	int COLLECTIONVIEWCOUNT = 10;    //더보기시 출력건수
	String START_DATE = "1970.01.01";	// 기본 시작일
	
	String submitYn = getCheckReqXSS(request, "submitYn", "N");               //submitYn="Y"일때 초기 결과 호출 하지않으려고
	String searchYn = getCheckReqXSS(request, "searchYn", "");	
	String searchType = getCheckReqXSS(request, "searchType", "");					
    String searchSido = getCheckReqXSS(request, "searchSido", "");            //시도					
    String searchDong = getCheckReqXSS(request, "searchDong", "");           //읍정동
    String searchDoro = getCheckReqXSS(request, "searchDoro", "");            //도로명
    
    int startCount = parseInt(getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
    String searchLoad = getCheckReqXSS(request, "searchLoad", "");			//검색
    String collection = getCheckReqXSS(request, "collection", "ALL");			//컬렉션이름
    String strOperation  = "" ;												//operation 조건 필드
    String exquery = "" ;													//exquery 조건 필드
    String colquery = "";
    String range = getCheckReqXSS(request, "range", "A");						//기간관련필드
    String startDate = getCheckReqXSS(request, "startDate", START_DATE);		//시작날짜
    String endDate = getCheckReqXSS(request, "endDate", getCurrentDate());		//끝날짜
    String writer = getCheckReqXSS(request, "writer", "");						//작성자
    String searchField = getCheckReqXSS(request, "searchField", "");			//검색필드
    String realQuery = getCheckReqXSS(request, "realQuery", "");				//결과내 검색어
    String sort = getCheckReqXSS(request, "sort", "RANK");						//정렬필드
    
  
%>    

	 <%-- <form name="searchForm" id="searchForm" action="<c:out value="${frontDomain}"/>/mobile/search/searchZipCodeAjax.do" method="POST" target="_self"> --%>
	 <form name="searchForm" id="searchForm">
	        	<input type="hidden" name="searchYn" id="searchYn" value="Y">
				<input type="hidden" name="searchDong" id="searchDong" value="<%=searchDong%>">
				<input type="hidden" name="searchDoro" id="searchDoro" value="<%=searchDoro%>">
				<input type="hidden" name="searchLoad" id="searchLoad" value="<%=searchLoad%>">
				<input type="hidden" name="submitYn" id="submitYn" >
				<input type="hidden" name="startCount"value="<%=startCount%>">
	</form>
<!-- # 우편번호 찾기 S -->
	<section id="layZipcode" data-role="popup" data-overlay-theme="a" class="popup_st0">
		<dl class="ui-content">
			<dt>
				<h2>우편번호 찾기</h2>
				<a href="javascript:$.com.util.layPop('close', $('#layZipcode'), true)" class="btn_close"><span class="blind">팝업 닫기</span></a>
			</dt>
			<dd class="dd_con_d">
				<dl class="zipcode_sh zipcode_sh_v2">
					<dt class="sh_spot">
						<strong class="sh_tit">통합검색</strong>
						<span class="sh_desc">도로명 주소나 지번으로 검색하면 통합 검색 결과를 <br/>확인하실 수 있습니다.</span>
					</dt>
				
					<dd class="sh_box">
						<div class="sh_ipt">
							<label for="">
								<input class="sh_ipt" type="text" name="loadName" id="loadName" value="<%=searchLoad %>" placeholder="도로명이나 지번으로 검색해주세요" />
							</label>
							<a href="javascript:void(0)" id="btn_inpClose" class="btn_clear"><span class="blind">검색어 지우기</span></a>
						</div>
						<a href="javascript:void(0)" onClick="javascript:zipSearch('0');" class="btn_gre sh_btn">검색</a>
					</dd>
				</dl>
		
		<div class="zipcode_list" >
			<p class="hd_tx" id="zipFir">
			</p>
			<table>
				<caption>우편번호 찾기에 겸색결과 표</caption>
				<colgroup>
					<col style="width:40px" />
					<col style="width:50px" />
					<col />
				</colgroup>
				<thead id="zipThird">
				</thead>
				<tbody id="searchZip">
				</tbody>
			</table>
		</div>
			<div class="section-pagination" id="zipPage" tabindex="0"><!-- section pagination --> 
	       </div>
	       </dd>
		</dl>
	</section>
<!--//# 우편번호 찾기 E -->
<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script type="text/javascript">
	$(function(){
		$('#btn_inpClose').on('click', function(){
			$(this).prev().find('input').val('');
		});
	});
	
	
	$(function(){
		
		// 검색 엔터 이벤트 
	    $(document).on("keydown", "input[type='text']", function (e) {
	        if(e.keyCode == 13){
	            zipSearch('0');
	            return false;
	        }
	    });
		
		
		var $addrInfo = "";
		// 도로명 선택주소 적용
		setDoroAddrInfo = function(addrIdx){
			$addrInfo = $('.doroInfo');
			var zip = $("#"+addrIdx+" .td_add .doroInfo").data('zip');
			var doroAddr = $("#"+addrIdx+" .td_add .doroInfo").data('doro');
			var jibunAddr = $("#"+addrIdx+" .td_add .doroInfo").data('jibun');
			zipcodeCallback(zip,doroAddr,jibunAddr);
			$.com.util.layPop('close', $('#layZipcode'), true);
		};
		
		// 지번 선택주소 적용
		setJibunAddrInfo = function(addrIdx){
			$addrInfo = $('.jibunInfo');
			
			var zip = $addrInfo.eq(addrIdx).data('zip');	// 우편번호(5자리)
			var doroAddr = $addrInfo.eq(addrIdx).data('doro'); // 도로명주소
			var jibunAddr = $addrInfo.eq(addrIdx).data('jibun'); // 지번주소
			zipcodeCallback(zip,doroAddr,jibunAddr);
			$.com.util.layPop('close', $('#layZipcode'), true);
		};
	});
//검색
function zipSearch(startCount){
	//alert('z');
	var searchForm = document.searchForm;
	//파라미터 셋팅
	searchForm.submitYn.value="Y";
	$('#searchLoad').val($.trim($('#loadName').val()));
	searchForm.startCount.value = startCount;
	var searchFormData = $("#searchForm").serialize();
	var str=""; // 검색결과 있을 경우
	var str_no=""; //검색결과 없을경우
	var tab_third="";
	var tab_fir="";
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchZipCodeAjax.do",
		async : false,
		cache : true,
		type: "POST",
		dataType: "json",
		data: searchFormData,
		success: function(data) {
			jQuery.each(data.SearchQueryResult.Collection, function(i, Collection) {
				var zipCodeTotal = Collection.DocumentSet.TotalCount;
				var zipCodeCount = Collection.DocumentSet.Count;
				tab_fir += "<strong class=\"tx_ti\">검색 결과</strong>";
				tab_fir += "<span class=\"tx_ex\">(해당 주소를 클릭하면 자동 선택됩니다.)</span>";
				jQuery("#zipFir").html(tab_fir);	
					
				tab_third +="<th colspan=\"3\">주소</th>";
				jQuery("#zipThird").html(tab_third);
					if((Collection.DocumentSet.TotalCount) == 0){
						str_no += "<tr tabindex=\"0\">";
						str_no += "<td class=\"no_list\" colspan=\"3\">검색 결과가 없습니다.</td>";
						str_no += "</tr>";
						jQuery("#searchZip").html(str_no);
					}else{
						jQuery.each(Collection.DocumentSet.Document, function(j, Document) {
							str += "<tr tabindex=\"0\" id=\""+j+"\">";
							str += "<td rowspan=\"2\" class=\"f\">" + (j+1) + "</td>";
							str += "<td rowspan=\"2\">" + Document.Field.BASE_ZONE + "</td>";
							str += "<td class=\"td_add\"><a href=\"javascript:setDoroAddrInfo(" + j + ");\" class=\"doroInfo\" data-doro=\"" + Document.Field.DORO_ADDR + "\" data-zip=\"" + Document.Field.BASE_ZONE + "\" data-jibun=\"" + Document.Field.JIBUN_ADDR + "\" ><span class=\"ico_tx btn_gre2\">도로명</span>" + Document.Field.DORO_ADDR + "</a></td>";
							str += "</tr>";
							str += "<tr tabindex=\"0\" id=\""+j+"\">";
							str += "<td class=\"td_add\"><a href=\"javascript:setDoroAddrInfo(" + j + ");\" class=\"doroInfo\" data-doro=\"" + Document.Field.DORO_ADDR + "\" data-zip=\"" + Document.Field.BASE_ZONE + "\" data-jibun=\"" + Document.Field.JIBUN_ADDR + "\" ><span class=\"ico_tx btn_gre3\">지번명</span>" + Document.Field.JIBUN_ADDR + "</a></td>";
							str += "</tr>";
						});
						pag = pagingFunction(startCount, 5, zipCodeCount, zipCodeTotal);
						jQuery("#searchZip").html(str);
						
						jQuery("#zipPage").html(pag);
					}
					
			});
		}
	});
} 
//페이징 처리 함수
//paginFunction(페이지 버튼 번호, 페이지 당 문서 수, 현재 검색 결과 수, 전체 검색 결과 수)
function pagingFunction(startCount, viewCount, count, totalCount) {
	
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/viewCount) * viewCount;
	var pagIdx = 0;
	var pag = "";
	var prevValue = (parseInt(startCount/viewCount)-1)*viewCount;
	var nextValue = (parseInt(startCount/viewCount)+1)*viewCount;
	if(prevValue==-5) {
		pag += "<a class=\"nav first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"ir\">처음페이지</span></a>";
		pag += "<a class=\"nav prev\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"ir\">이전페이지</span></a>";
	} else {
		pag += "<a class=\"nav first\" href=\"javascript:void(0)\" onClick=\"javascript:zipSearch('0');\" title=\"처음페이지\"><span class=\"ir\">처음페이지</span></a>";
		pag += "<a class=\"nav prev\" href=\"javascript:void(0);\" onClick=\"javascript:zipSearch('"+(prevValue)+"');\" title=\"이전페이지\"><span class=\"ir\">이전페이지</span></a>";
	}
	
	for(var iNum = 0; iNum<5 && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/viewCount) * viewCount + iNum;
		if(startCount==pagIdx){
			pag += "<a href=\"javascript:void(0);\" class=\"active\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			pag += "<a href=\"javascript:void(0);\" onClick=\"javascript:zipSearch('"+pagIdx+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	
	if(nextValue > pageCount){
		pag += "<a class=\"nav next\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"ir\">다음페이지</span></a>";
		pag += "<a class=\"nav last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"ir\">마지막 페이지</span></a>";
	} else {
		pag += "<a class=\"nav next\" href=\"javascript:void(0)\" onClick=\"javascript:zipSearch('"+(nextValue)+"')\" title=\"다음페이지\"><span class=\"ir\">다음페이지</span></a>";
		pag += "<a class=\"nav last\" href=\"javascript:void(0)\" onClick=\"javascript:zipSearch('"+(parseInt(pageCount)-1)+"')\" title=\"마지막 페이지\"><span class=\"ir\">마지막 페이지</span></a>";
	} 
	
	return pag;
	
}
</script>
