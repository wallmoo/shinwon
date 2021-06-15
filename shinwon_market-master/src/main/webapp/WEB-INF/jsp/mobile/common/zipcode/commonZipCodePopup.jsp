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
    
    int totalCount = 0;
    String[] searchFields = null;
	
	String[] collections = null;
    if(collection.equals("ALL")) { //통합검색인 경우
        collections = COLLECTIONS;
    } else {                        //개별검색인 경우
        collections = new String[] { collection };
    }
    realQuery = searchLoad;
 	/*  if (reQuery.equals("1")) {
		realQuery = query + " " + realQuery;
	} */
	//System.out.println("realQuery:" + realQuery);
	
	
	WNSearch wnsearch = new WNSearch(isDebug,false, collections, searchFields);
	 

	    int viewResultCount = COLLECTIONVIEWCOUNT;
	    if ( collection.equals("ALL") ||  collection.equals("") )
	        viewResultCount = TOTALVIEWCOUNT;

	    for (int i = 0; i < collections.length; i++) {
	    	exquery = "";
	    	//출력건수
	        wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount+","+viewResultCount);
			
			//검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
			if (!realQuery.equals("") ) {
	            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
	      	} else {
	            wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
	            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
	     	}
			
	        //searchField 값이 있으면 설정, 없으면 기본검색필드
	        if (!searchField.equals("") && !searchField.equals("WRITER") && searchField.indexOf("ALL") == -1 ) {
				wnsearch.setCollectionInfoValue(collections[i], SEARCH_FIELD, searchField);
			}

	        //operation 설정
	        if (!strOperation.equals("")) {
				wnsearch.setCollectionInfoValue(collections[i], FILTER_OPERATION, strOperation);
			}
	      	//exquery 설정
	        if (!exquery.equals("")) {
				wnsearch.setCollectionInfoValue(collections[i], EXQUERY_FIELD, exquery);
			}
	      	
	         //collection query 설정
	        if (!colquery.equals("")) {
				wnsearch.setCollectionInfoValue(collections[i], COLLECTION_QUERY, colquery);
			} 
	        
	        //기간 설정 , 날짜가 모두 있을때
	        if (!startDate.equals("")  && !endDate.equals("") ) {
	             wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, startDate.replaceAll("[.]","/") + "," + endDate.replaceAll("[.]","/") + ",-");
	        }
	        

	    };
	  //submitYn="Y"일때 초기 결과 호출 하지않으려고
	   	if(submitYn.equals("Y")){
	    wnsearch.search(realQuery, isRealTimeKeyword, CONNECTION_CLOSE, useSuggestedQuery);
	   	}
	     // 디버그 메시지 출력
	    String debugMsg = wnsearch.printDebug() != null ? wnsearch.printDebug().trim() : "";
	    if ( !debugMsg.trim().equals("")) {
	         out.println(debugMsg);
	    }

	     // 전체건수 구하기
	    if ( collection.equals("ALL") ) {
	        for (int i = 0; i < collections.length; i++) {
	           totalCount += wnsearch.getResultTotalCount(collections[i]);
	        }
	    } else {
	      //개별건수 구하기
	        totalCount = wnsearch.getResultTotalCount(collection);
	    }
		System.out.println("totalCount :" + totalCount);
	    String thisCollection = "";
	    if(useSuggestedQuery) {
	       suggestQuery = wnsearch.suggestedQuery;
	    }
	    
%>    

	<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-join">
<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

<!-- #wrap S -->
<section id="wrap">
	
	<!-- #container S -->
	<article id="container" class="container" data-role="content">
        
        <div class="section-title _hd_fix"><!-- section-title -->
            <h2>우편번호 찾기</h2>
            <a href="javascript:void(0);" class="_pg_link back"><span></span><em class="blind">이전 페이지로 이동</em></a>
        </div><!--// section-title -->
        
        <form name="searchForm" id="searchForm" action="<c:out value="${frontDomain}"/>/mobile/common/commonZipCodePopup.do" method="POST" target="_self">
	        	<input type="hidden" name="searchYn" id="searchYn" value="Y">
				<input type="hidden" name="searchDong" id="searchDong" value="<%=searchDong%>">
				<input type="hidden" name="searchDoro" id="searchDoro" value="<%=searchDoro%>">
				<input type="hidden" name="searchLoad" id="searchLoad" value="<%=searchLoad%>">
				<input type="hidden" name="submitYn" id="submitYn" >
				<input type="hidden" name="startCount"value="<%=startCount%>">
			</form>

        <dl class="zipcode_sh">
			<dt>
				<strong>통합검색</strong>
				<span>도로명 주소나 지번으로 검색하면 통합 검색 결과를 <br/>확인하실 수 있습니다.</span>
			</dt>
			<dd>
				<label for="">
					<input type="text" name="loadName" id="loadName" value="<%=searchLoad %>" placeholder="도로명이나 지번으로 검색해주세요" />
				</label>
				<a href="javascript:void(0)" id="btn_inpClose" class="btn_inpClose"><i></i><span class="blind">검색어 지우기</span></a>
				<a href="javascript:search()" class="btn_gre"><strong>검색</strong></a>
			</dd>
		</dl>
		
		<div class="zipcode_list">
			<p class="hd_tx">
				<strong class="tx_ti">검색 결과</strong>
				<span class="tx_ex">(해당 주소를 클릭하면 자동 선택됩니다.)</span>
			</p>

			<table>
				<caption>우편번호 찾기에 겸색결과 표</caption>
				<colgroup>
					<col style="width:50px" />
					<col style="width:50px" />
					<col />
				</colgroup>
				<thead>
					<th colspan="3">주소</th>
				</thead>
				<tbody>
					 <%@ include file="/WEB-INF/jsp/mobile/search/result/result_mobile_postnm.jsp" %>
				</tbody>
			</table>
		</div>
			<div class="section-pagination"><!-- section pagination --> 
		            <%=wnsearch.getPageLinks(startCount, totalCount, viewResultCount, 10)%> 
		       </div><!-- // section pagination -->
		
	</article>
	<!--// #container E -->
    
</section>
<!--// #wrap E -->
</body>

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
	            search();
	            return false;
	        }
	    });
		
		
		// 검색 클릭 이벤트
		search = function(){
			var $searchForm = $('#searchForm');
			
			//파라미터 셋팅
			$('#searchLoad').val($.trim($('#loadName').val()));
			$("#submitYn").val('Y');
			//$searchForm.attr({"action":"<c:out value="${domain}"/>/mobile/common/commonZipCodePopup.do", "target":"_self", "method":"post"}).submit();
			$searchForm.submit();
		};
		
		
		
		var $addrInfo = "";
		// 도로명 선택주소 적용
		setDoroAddrInfo = function(addrIdx){
			$addrInfo = $('.doroInfo');
			
			var zip = $addrInfo.eq(addrIdx).data('zip');	// 우편번호(5자리)
			var doroAddr = $addrInfo.eq(addrIdx).data('doro'); // 도로명주소
			var jibunAddr = $addrInfo.eq(addrIdx).data('jibun'); // 지번주소
			opener.zipcodeCallback(zip,doroAddr,jibunAddr);
			this.close();
		};
		
		// 지번 선택주소 적용
		setJibunAddrInfo = function(addrIdx){
			$addrInfo = $('.jibunInfo');
			
			var zip = $addrInfo.eq(addrIdx).data('zip');	// 우편번호(5자리)
			var doroAddr = $addrInfo.eq(addrIdx).data('doro'); // 도로명주소
			var jibunAddr = $addrInfo.eq(addrIdx).data('jibun'); // 지번주소
			opener.zipcodeCallback(zip,doroAddr,jibunAddr);
			this.close();
		};
	});
</script>