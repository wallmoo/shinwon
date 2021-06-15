<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/WNSearch.jsp" %><% request.setCharacterEncoding("UTF-8");%><%
    /*
     * subject: 검색 메인 페이지
     * @original author: 조준철
     */
    //실시간 검색어 화면 출력 여부 체크
    boolean isRealTimeKeyword = false;
    //오타 후 추천 검색어 화면 출력 여부 체크
    boolean useSuggestedQuery = true;
    String suggestQuery = "";

    //디버깅 보기 설정
    boolean isDebug = false;

    int TOTALVIEWCOUNT = 3;    //통합검색시 출력건수
    int COLLECTIONVIEWCOUNT = 10;    //더보기시 출력건수
    
	// category index
    String CATE_IDX_FIELD="PRD_CTG_INFO";
    String CATE_IDX_DEPTH="PRD_CTG_INFO:1/SC,PRD_CTG_INFO:2/SC,PRD_CTG_INFO:3/SC,PRD_CTG_INFO:4/SC,PRD_CTG_INFO:5/SC";
    String collectionName="cate_product";

	String START_DATE = "1970.01.01";	// 기본 시작일
	int contCheck = parseInt(getCheckReqXSS(request, "contCheck", "0"), 0);	//초기 콘텐츠값 존재 여부 확인
	// 결과 시작 넘버
    int startCount = parseInt(getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
    int startCount_product = parseInt(getCheckReqXSS(request, "startCount_product", "0"), 0);	//product 번호
    int startCount_emagazine = parseInt(getCheckReqXSS(request, "startCount_emagazine", "0"), 0);	//emagazine 번호
    int startCount_exhibitions = parseInt(getCheckReqXSS(request, "startCount_exhibitions", "0"), 0);	//exhibitions 번호
    int startCount_review = parseInt(getCheckReqXSS(request, "startCount_review", "0"), 0);	//review 번호
    
    String MEM_MST_MEM_GBN = getCheckReqXSS(request, "MEM_MST_MEM_GBN", "");	//기업회원
    String MEM_MST_MEM_GRD = getCheckReqXSS(request, "MEM_MST_MEM_GRD", "");    //기업등급
    
    String query = getCheckReqXSS(request, "query", "");						//검색어
    String reSearch = getCheckReqXSS(request, "reSearch", "");					//결과내 재검색 검색어
    String collection = getCheckReqXSS(request, "collection", "ALL");			//컬렉션이름
    String rt = getCheckReqXSS(request, "rt", "");								//결과내 재검색 체크필드
    String rt2 = getCheckReqXSS(request, "rt2", "");							//결과내 재검색 체크필드
	String reQuery = getCheckReqXSS(request, "reQuery", "");					//결과내 재검색 체크필드
    String realQuery = getCheckReqXSS(request, "realQuery", "");				//결과내 검색어
    String sort = getCheckReqXSS(request, "sort", "RANK");						//정렬필드
    String range = getCheckReqXSS(request, "range", "A");						//기간관련필드
    String startDate = getCheckReqXSS(request, "startDate", START_DATE);		//시작날짜
    String endDate = getCheckReqXSS(request, "endDate", getCurrentDate());		//끝날짜
    String writer = getCheckReqXSS(request, "writer", "");						//작성자
    String searchField = getCheckReqXSS(request, "searchField", "");			//검색필드
    String strOperation  = "" ;												//operation 조건 필드
    String exquery = "" ;													//exquery 조건 필드
    String productCategory = getCheckReqXSS(request, "productCategory", "");			// 상품 카테고리 값
    String productCategoryIndex = getCheckReqXSS(request, "productCategoryIndex", "");	// 상품 카테고리 Index
    int depth2 = parseInt(getCheckReqXSS(request, "depth2", "0"), 0);			// 상품 카테고리 트리
    String category_name = getCheckReqXSS(request, "category_name", "");                               //카테고리 Name
    String category = getCheckReqXSS(request, "category", "");
    int cate_depth = parseInt(getCheckReqXSS(request, "cate_depth", "0"), 0); //카테고리 분류 Depth
    String contents = getCheckReqXSS(request, "contents", "ALL");			//콘텐츠이름
    int cateCount=0; //카테고리 갯수
    int totalCount = 0;
    int productCount=0;
    int emagazineCount=0;
    int exhibitionsCount=0;
    int reviewCount=0;
    
    // 컬렉션별 페이지 카운트
  	int viewResultCountProduct = 16;
   	int viewResultCountEmagazine = 16;
	int viewResultCountExhibitions = 4;
	int viewResultCountReview = 4;
    	
    String[] searchFields = null;

	// 상세검색 검색 필드 설정이 되었을때
    if (!searchField.equals("")) {
		// 작성자
		if (!writer.equals("")) {
			exquery = "<WRITER:" + writer + ">";
		}
	} else {
		searchField = "ALL";
	}

    String[] collections = null;
    if(collection.equals("ALL")) { //통합검색인 경우
        collections = COLLECTIONS;
    } else {                        //개별검색인 경우
        collections = new String[] { collection };
    }
    // >>결과내 재검색
	 if (reQuery.equals("1")) {
		 
		 if(!reSearch.equals("")){
				realQuery = realQuery + " " + reSearch;
		 }
		//realQuery = query + " " + realQuery;
	} else if (!reQuery.equals("2")) {
		realQuery = query + realQuery;
	} 

    WNSearch wnsearch = new WNSearch(isDebug,false, collections, searchFields);

    int viewResultCount = COLLECTIONVIEWCOUNT;
    if ( collection.equals("ALL") ||  collection.equals("") )
        viewResultCount = TOTALVIEWCOUNT;

    for (int i = 0; i < collections.length; i++) {
    	exquery = "";
        //출력건수
        if (collections[i].equals("product")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_product +","+viewResultCountProduct);
        } else if (collections[i].equals("emagazine")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_emagazine +","+viewResultCountEmagazine);
        } else if (collections[i].equals("exhibitions")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_exhibitions +","+viewResultCountExhibitions);
        } else if (collections[i].equals("review")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_review +","+viewResultCountReview);
        } else {
    		wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount +","+viewResultCount);
    	}
    	
      //상품일경우 정렬
        if(collections[i].equals("product")){
        	
        	 //카테고리부스팅
    	    String editSort = "";
    		editSort += "WEIGHT/DESC,RANK/DESC";
    		// Category Boost : 정렬 조건 WEIGHT경우 Category Boost 적용
			// 기업회원일 경우 가격 정렬후 기존 sort값으로 변경    		
	        	if(sort.equals("PRD_MST_PRICE")){
	        		if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1838"))){
		        		sort = "PRD_MST_CPR_PRC1";
		        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
		        		sort ="PRD_MST_PRICE";
	        		}else if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1839"))){
	        			sort = "PRD_MST_CPR_PRC2";
	        			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
		        		sort ="PRD_MST_PRICE";
	        		}else{
	        			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
	        		}
	        	}else if(sort.equals("PRD_MST_PRICE_ASC")){
	        		if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1838"))){
		        		sort = "PRD_MST_CPR_PRC1";
		        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/ASC");
		        		sort ="PRD_MST_PRICE_ASC";
	        		}else if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1839"))){
	        			sort = "PRD_MST_CPR_PRC2";
		        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/ASC");
		        		sort ="PRD_MST_PRICE_ASC";
	        		}else{
	        			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/ASC");
	        		}
	        	}else if(sort.equals("DATE")){
	           	 	wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
	           	}else if(sort.equals("ONLINE_HIT")){
	           	 	wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
	           	}else{
	           		wnsearch.setCollectionInfoValue(collections[i],CATEGORY_BOOST, CATE_IDX_FIELD+",SUB_MATCH,"+realQuery);
	        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, editSort); 
	           	}
        }else{
        	wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
        }
		//검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
		/* if (!realQuery.equals("") ) {
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
      	} else {
            wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
     	}  */
		//콘텐츠 exquery
        if(collections[i].equals("emagazine")){
			if (!contents.equals("") && !contents.equals("ALL")) {
        		exquery += " <MGZ_MST_CTG_NM:contains:" + contents + ">";
			}
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
        //category groupby 설정
        if (collections[i].equals("cate_product")) {
			//wnsearch.setCollectionInfoValue(collections[i], CATEGORY_GROUPBY, CATE_IDX_FIELD+":"+CATE_IDX_DEPTH);
			wnsearch.setCollectionInfoValue(collections[i], CATEGORY_GROUPBY, "PRD_CTG_INFO:1/SC,PRD_CTG_INFO:2/SC,PRD_CTG_INFO:3/SC,PRD_CTG_INFO:4/SC,PRD_CTG_INFO:5/SC");
		}
        
        //category query 설정
        if (collections[i].equals("product")) {
				wnsearch.setCollectionInfoValue(collections[i], CATEGORY_QUERY, CATE_IDX_FIELD+"|"+category);
		}
        //기간 설정 , 날짜가 모두 있을때
        if (!startDate.equals("")  && !endDate.equals("") ) {
             wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, startDate.replaceAll("[.]","/") + "," + endDate.replaceAll("[.]","/") + ",-");
        }
    };
   
    wnsearch.search(realQuery, isRealTimeKeyword, CONNECTION_CLOSE, useSuggestedQuery);

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
     //상품 전체 건수
     productCount = wnsearch.getResultTotalCount("product");
     emagazineCount = wnsearch.getResultTotalCount("emagazine");
     exhibitionsCount = wnsearch.getResultTotalCount("exhibitions");
     reviewCount = wnsearch.getResultTotalCount("review");
     //초기 콘텐츠 값이 있을경우 1 반환
     if (emagazineCount!=0) {
    	 contCheck=1;
     }

    String thisCollection = "";
    if(useSuggestedQuery) {
       suggestQuery = wnsearch.suggestedQuery;
    }
  	//product Category Index Groupby result
    ArrayList<String> productCategoryIndexValueList = new ArrayList<String>();
    ArrayList<Integer> productCategoryIndexCountList = new ArrayList<Integer>();
    int depth = 1;
    
    if (!category.equals("") ) {
    	cate_depth = category.split(":").length;
    }
            
	//카테고리 뎁스
	depth = depth + cate_depth;	
    int productGroupCount = wnsearch.getCategoryCount(collectionName, CATE_IDX_FIELD, depth);
%>

<%@ include file="/WEB-INF/jsp/pc/include/head.jsp" %>

</head>
<body class="page-search">
	<a href="#container;" class="skipnavi" onclick="com.skipnavi('container');">본문 바로가기</a>
	<!-- #wrap S -->
	<section id="wrap"> 
		<%@ include file="/WEB-INF/jsp/pc/include/top_search.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>
		<!-- 이하 페이지별 개별 컨텐츠 삽입 -->
		<!-- #container S -->
	<article id="container" class="container">
		<div class="contents"><!-- .contents S -->
		<form name="search" id="search"  onsubmit="return false;" action="<c:out value="${serverDomain }"/>/pc/search/search.do" method="POST">
			<input type="hidden" name="startCount_product" value="<%=startCount_product%>">
			<input type="hidden" name="startCount_emagazine" value="<%=startCount_emagazine%>">
			<input type="hidden" name="startCount_exhibitions" value="<%=startCount_exhibitions%>">
			<input type="hidden" name="startCount_review" value="<%=startCount_review%>">
			<input type="hidden" name="startCount"value="<%=startCount%>">
			<input type="hidden" name="sort" value="<%=sort%>">
			<input type="hidden" name="collection" value="<%=collection%>">
			<input type="hidden" name="range" value="<%=range%>">
			<input type="hidden" name="startDate" value="<%=startDate%>">
			<input type="hidden" name="endDate"value="<%=endDate%>">
			<input type="hidden" name="category"value="<%=category%>">
			<input type="hidden" name="category_name"value="<%=category_name%>">
			<input type="hidden" name="depth"value="<%=depth%>">
			<input type="hidden" name="cate_depth"value="<%=cate_depth%>">
			<input type="hidden" name="searchField"value="<%=searchField%>">
			<input type="hidden" name="reQuery" />
			<input type="hidden" name="realQuery" value="<%=realQuery%>" />
			<input type="hidden" name="contents"value="<%=contents%>">
			<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${commandMap.MEM_MST_MEM_GBN}"/>" />
			<input type="hidden" name="MEM_MST_MEM_GRD"value="<c:out value="${commandMap.MEM_MST_MEM_GRD}"/>">
			<input type="hidden" name="contCheck"value="<%=contCheck%>">
			<dl class="minW search_box">
				<dt><strong>연관검색어</strong></dt>
				<dd class="key" id="recommendword">
				</dd>
				<dd class="sh">
					<label for="">
						<span>결과 내 재검색 </span>
						<input type="text" name="reSearch" id="reSearch" value="<%=reSearch %>" onKeypress="javascript:pressCheck((event),this);" autocomplete="off"/>
					</label>
					 <a href="javascript:void(0);" onclick="javascript:doreSearch();"><span>검색</span></a> 
				</dd>
			</dl>
			<!-- 검색 결과가 없을 경우 -->
			<!-- .sh_tx_d S -->
			<% if (productCount==0) { %>
			<div class="minW sh_tx_d no_list">
				<strong class="ti">“<strong class="co_red"><%=realQuery%></strong>” 로 검색된 상품이 없습니다.</strong>
				<ul>
					<li><strong>ㆍ 검색어가 올바르게 입력되었는지 확인해 주세요.</strong></li>
					<li><strong>ㆍ 검색어의 띄어쓰기를 조정한 후 검색해 보세요.</strong></li>
					<li><strong>ㆍ 상품명이나 브랜드로 검색하시면 더욱 빠른 결과를 보실 수 있습니다.</strong></li>
				</ul>
			</div>
			<%}else{ %>
			<!--// .sh_tx_d E -->
			<!-- 검색 결과가 있을 경우 -->
			<div class="minW sh_tx_d">
					<%
						for(int i=0; i<productGroupCount; i++){
							String name = wnsearch.getCategoryName(collectionName, CATE_IDX_FIELD, depth, i);
							int count = wnsearch.getDocumentCountInCategory(collectionName,  CATE_IDX_FIELD, depth, i);
							String[] name_split = name.split(":");
							String editName = "";
							if (name_split.length > 0) {
										editName = name_split[name_split.length - 1];
										editName = editName.substring(0, editName.indexOf("_",1));
							}
							//카테고리뎊스
							if(name.startsWith(category)){
								cateCount++;
							}
						}
					%>
				<strong class="ti">“<strong class="co_red"><%=realQuery %></strong>” 검색결과 </strong>
				<strong class="tx_num"><strong class="co_red"><%=cateCount%></strong>개 카테고리, <strong class="co_red"><%= productCount %></strong>개 상품</strong>
			</div>
			<!-- .sh_cateList S -->
			<dl class="minW sh_cateList">
				<dt>
				<!-- 카테고리 Navi -->
					<strong class="blind">카테고리별 검색 결과</strong>
					<a onclick="javascript:doCategoryInit();" href="#">All</a> &gt;
					<%
						String[] categoryNav = category.split(":");
						String categoryName = "";
						for (int i = 0; i < categoryNav.length; i++) {
							categoryName += ":";
							categoryName += categoryNav[i];
							if(!categoryNav[i].equals("")){
							categoryNav[i] = categoryNav[i].substring(0, categoryNav[i].indexOf("_",1));
							}
					%>
							<a onclick="javascript:doCategory1('<%= categoryName.substring(1) %>','<%= ( i + 1 ) %>');" href="#"><%=categoryNav[i] %></a>
					<%
							if (i < categoryNav.length - 1) {
										  out.println(" &gt; ");
							}
						}
					%>
				</dt>
				<dd class="dd_nav">
					<nav>
					<!-- 카테고리 이름(상품갯수) -->
					<%
						for(int i=0; i<productGroupCount; i++){
							String name = wnsearch.getCategoryName(collectionName, CATE_IDX_FIELD, depth, i);
							int count = wnsearch.getDocumentCountInCategory(collectionName,  CATE_IDX_FIELD, depth, i);
							String[] name_split = name.split(":");
							String editName = "";
							if (name_split.length > 0) {
										editName = name_split[name_split.length - 1];
										editName = editName.substring(0, editName.indexOf("_",1));
							}
							//카테고리뎊스
							if(name.startsWith(category)){
					%>
								<%if((i==0) || (i==6) || (i==12)){%> 
								<a href="#" class="f" onClick="javascript:doCategory1('<%=name%>','<%=depth%>');" ><strong><%=editName%></strong><span class="co_red">(<%=count%>)</span></a>
								<%}else if((i==5) || (i==11) || (i==17)){ %>
								<a href="#" class="l" onClick="javascript:doCategory1('<%=name%>','<%=depth%>');" ><strong><%=editName%></strong><span class="co_red">(<%=count%>)</span></a>
								<%}else{ %>
								<a href="#" onClick="javascript:doCategory1('<%=name%>','<%=depth%>');" ><strong><%=editName%></strong><span class="co_red">(<%=count%>)</span></a>
								<%} %>
							<%} %>
					<%} %>
						<%
						if (productGroupCount < 1) {
							String lastCategory = category;
							lastCategory = category.substring(category.lastIndexOf(":") + 1);
							lastCategory = lastCategory.substring(0, lastCategory.indexOf("_", 1));
						%>
						<a href="#" class="f"><strong><%=lastCategory%></strong><span class="co_red"></span></a>
						<%
						}
						%>
					</nav>
					<label for="sel_list_type" >
					<select id="sel_list_type" class="sel_chg" onClick="javascript:doSorting(this.value);" >
							<option value="RANK" <%=sort.equals("RANK")?"selected=\"selected\"":"" %>>추천순</option>
							<option value="DATE" <%=sort.equals("DATE")?"selected=\"selected\"":"" %>>최신순</option>
							<option value="ONLINE_HIT"<%=sort.equals("ONLINE_HIT")?"selected=\"selected\"":"" %>>인기순</option>
							<option value="PRD_MST_PRICE_ASC"<%=sort.equals("PRD_MST_PRICE_ASC")?"selected=\"selected\"":"" %>>가격낮은순</option>
							<option value="PRD_MST_PRICE"<%=sort.equals("PRD_MST_PRICE")?"selected=\"selected\"":"" %>>가격높은순</option>
					</select>
					</label>
				</dd>
				<dd class="dd_list">
					<ol id="productTab">
						<%@ include file="/WEB-INF/jsp/pc/search/result/result_product.jsp" %>
					</ol>
				</dd>
				<dd class="pg_num_box" id="productPag">
							<%=wnsearch.getProductPageLinks(startCount_product , productCount, viewResultCountProduct, 10)%>
				</dd>
				<!-- //paginate -->
				<!--// .dd_list E -->
			</dl>
			<%
				} 
			%>
			<!--// .sh_cateList E -->
			<!-- 콘텐츠영역 -->
			<% if (wnsearch.getResultTotalCount("emagazine")==0 && contCheck==0) { %>
			<div class="minW sh_tx_d no_list">
				<h3 class="minW sh_title"><span class="text text_v2">콘텐츠</span></h3>
				<p class="text_result">“<strong class="co_red"><%=realQuery%></strong>” 로 검색된 콘텐츠가 없습니다.</p>
			</div>
			<%}else{ %>
			<!-- .sh_tabList S -->
			
			<div class="sh_tabList">
			<h3 class="minW sh_title"><span class="text text_v2">콘텐츠</span></h3>
			 <dl >
					<dt class="tab" id="emagazineTab">
						<strong class="blind">검색결과에 따른 라이프가이드, 구매가이드, 상품리뷰, 상품뉴스, Stufr, 테마로 구성된 리스트</strong>
						<a href="javascript:void(0)" onclick="doContents('ALL', '0');" <%=contents.equals("ALL")? "class=\"on\"":"" %>><span>전체</span></a>
						<a href="javascript:void(0)" onclick="doContents('라이프가이드', '0');"<%=contents.equals("라이프가이드")?"class=\"on\"":""%>><span>라이프가이드</span></a>
						<a href="javascript:void(0)" onclick="doContents('구매가이드', '0');"<%=contents.equals("구매가이드")?"class=\"on\"":""%>><span>구매가이드</span></a>
						<a href="javascript:void(0)" onclick="doContents('상품리뷰', '0');"<%=contents.equals("상품리뷰")?"class=\"on\"":""%>><span>상품리뷰</span></a>
						<a href="javascript:void(0)" onclick="doContents('상품뉴스', '0');"<%=contents.equals("상품뉴스")?"class=\"on\"":""%>><span>상품뉴스</span></a>
						<a href="javascript:void(0)" onclick="doContents('테마가이드', '0'); "<%=contents.equals("테마가이드")?"class=\"last on\"":"class=\"last\""%>><span>테마</span></a>
					</dt>
					<dd class="list" id="emagazineResult">
						<%@ include file="/WEB-INF/jsp/pc/search/result/result_emagazine.jsp" %>
					</dd>
					 <dd class="pg_num_box" id="emagazinePaging">
							<%=wnsearch.getEmagazinePageLinks(startCount_emagazine , emagazineCount, viewResultCountEmagazine, 10)%>
					</dd> 
				</dl> 
			</div>
			<%} %>  
			<!--// .sh_tabList E -->
			<!-- .sh_exhibi S -->
			<!-- 기획전 영역 -->
			<% if (wnsearch.getResultTotalCount("exhibitions")==0) { %>
			<h3 class="minW sh_title sh_title_v2"><span class="text">쇼핑 기획전</span></h3>
			<p class="text_result">“<strong class="co_red"><%=realQuery%></strong>” 로 검색된 기획전이 없습니다.</p>
			<%}else{ %>
			<h3 class="minW sh_title sh_title_v2"><span class="text">쇼핑 기획전</span></h3>
			<dl class="minW sh_exhibi">
				<dt class="blind">검색결과에 따른 기획전 리스트 입니다.</dt>
				<dd class="list" id="exhibitionsTab">
					<%@ include file="/WEB-INF/jsp/pc/search/result/result_exhibitions.jsp" %><!-- -->
				</dd>
			<dd class="pg_num_box" id="exhibitionsPag">
					<%=wnsearch.getExhibitionsPageLinks(startCount_exhibitions , exhibitionsCount, viewResultCountExhibitions, 10)%>
				</dd> 
			</dl>
			<%} %>
			<!--// .sh_exhibi  E -->
			<!-- .sh_review  S -->
			<!-- 후기영역 -->
			<% if (wnsearch.getResultTotalCount("review")==0) { %>
			<h3 class="minW sh_title sh_title_v3"><span class="text">상품 후기</span></h3>
			<p class="text_result last">“<strong class="co_red"><%=realQuery%></strong>” 로 검색된 상품후기가 없습니다.</p>
			<%}else{ %>
			<h3 class="minW sh_title sh_title_v3"><span class="text">상품 후기</span></h3>
			<dl class="minW sh_review">
				<dt class="blind"></dt>
				<dd class="list" id="reviewTab">
						<%@ include file="/WEB-INF/jsp/pc/search/result/result_review.jsp" %>
				</dd>
				<dd class="pg_num_box" id="reviewPag">
					<%=wnsearch.getReviewPageLinks(startCount_review , reviewCount, viewResultCountReview, 10)%>
				</dd>
			</dl>
			<% } %>
			<!--// .sh_review  E -->
			</form>
		</div><!--// .contents E -->
		<!-- #laypop S -->
		<%@ include file="/WEB-INF/jsp/pc/product/productLayer.jsp" %>
		<!--// #laypop E -->
	</article>
	<!--// #container E -->
		<!-- // 이하 페이지별 개별 컨텐츠 삽입 종료 -->
		
		<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp" %>
	</section>
<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<script>
//장바구니 담기
insertCart = function(prdMstCd,prdMstOptEstCnt){
		if(prdMstOptEstCnt > 0){
			if(confirm("해당 상품은 필수 옵션이 있습니다\n간편보기에서 필수 옵션 선택 후 장바구니에 담을수 있습니다.\n간편보기로 이동 하시겠습니까?")){
				goProductView(prdMstCd);
				return;
			}else{
				return; 
			}
		}
	$.ajax
    ({
        async : false,
        type : "POST",
        data : {
        			"PRD_MST_CD" : prdMstCd
        			,"OPT_DTL_IDXs" : 0
        			,"REQUEST_CNT_0" : 1
        			,"MEM_CRT_DLV_GBN" : 2096
        		},
        url : "<c:out value="${frontDomain}" />/pc/cart/insertCartAjax.do",
        success : function (data) 
        { 
        	// 1 : 장바구니 등록 성공
        	switch(data.result){
        	case 1:
        		$("#topCartCnt").html(data.cartCnt);
        		com.laypop('show',0,'laypopCart');//팝업 show
        		insertCartFavoriteDummy(prdMstCd);
        		xtractorUpdateCookie('xtr_basket',prdMstCd);
        		break;
        	default :
        		alert(data.resultMsg);
        		break;
        	}
        },
        error : function (err)
        {
            alert("오류가 발생하였습니다.\n[" + err.status + "]");
            window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
        }
	});
	
};

// 관심등록
insertKeeping = function(prdMstCd){
	$.ajax({
		async : false,
		type : "POST",
		data : {
			"PRD_MST_CD" : prdMstCd
		},
		url : "<c:out value="${frontDomain}" />/pc/cart/insertInterestProductAjax.do",
		success : function(data) {
			var result = data.result;//0:로그인 필요 1:성공 -1:실패
			if(result == 0){
				if(confirm(data.resultMsg)){
					var url = location.href;
					url = encodeURIComponent(url);
		        	window.open("<c:out value="${serverSslDomain}"/>/pc/manager/loginPopup.do?url=" + url,"loginPopup","width=850,height=644,scrollbars=no,target=_blank");
				}
			}else{
				com.laypop('show',0,'laypopKeeping');//팝업 show
				insertKeepFavoriteDummy(prdMstCd);
				xtractorUpdateCookie('xtr_sympathy',prdMstCd);
			}
		},
		error : function(err) {
			alert("오류가 발생하였습니다.\n[" + err.status + "]");
			window.jquery
					|| console
							.log('오류가 발생하였습니다: ' + err.status);
		}
	});
};

//간편보기
goProductView = function(prdMstCd){
	if(prdMstCd != ""){
		popup('<c:out value="${frontDomain}"/>/pc/product/productSimpleView.do?prdMstCd='+prdMstCd,"1030","900","no","productViewPopup");
	}else{
		alert("데이터 조회중 오류가 발생하였습니다.\n다시 시도해주세요.");
		return;
	}
};
/*
 * subject: 통합검색page(search.jsp) ajax처리
 * @original author: 조준철
 */
//#############################Product 상품 Ajax ###################################
//pagingProductAjax(페이지 버튼 번호, 페이지 당 문서 수, 현재 검색 결과 수, 전체 검색 결과 수)
//상품ajax페이징
function pagingProductAjax(startCount, viewCount, count, totalCount) {
	 /*
	  * showCount : 페이징 노출 갯수 ex) 1~10면 10, 1~5면 5
	  * pageCount : 전체 page 갯수
	  * loopCount : 마지막 page노출 갯수 확인 ex) 총 page85개일 때 10개씩 8번 노출후 9번째 5개노출할 때 for문에서 사용
	  * preValue  : 이전 page 이동 값
	  * nextValue : 다음 page 이동 값
	  * pagIdx    : 해당 page번호
	  */
	var showCount = 10;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/10) * 10;
	var pagIdx = 0;
	var pagPro = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		pagPro += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagPro += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		pagPro += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagPro += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+((prevValue)*viewCount)+"');\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	}
	for(var iNum = 0; iNum<showCount && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/showCount) * showCount + iNum;
		if(startCount==pagIdx){
			pagPro += "<a href=\"javascript:void(0)\" class=\"on\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			pagPro += "<a href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+pagIdx*viewCount+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	if(nextValue >= pageCount){		
		pagPro += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagPro += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagPro += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagPro += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagPro;
}
//정렬
function doSorting(sort) {
	var searchForm = document.search;
	searchForm.sort.value = sort;
	searchForm.collection.value = "product";
	searchForm.searchField.value = "ALL";
	searchForm.reQuery.value = "2";
	searchForm.startCount_product.value = "0";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/pc/search/searchProductAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#productTab").html(data);
		}
	});
}
//상품 ajax
function doProductPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_product.value = count;
	searchForm.collection.value = "product";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/pc/search/searchProductAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#productTab").html(data);
		}
	});
}
//############################################################################################
//########################################Emagazine 콘텐츠 Ajax##################################
//콘텐츠별 검색 emagazine Ajax처리
function doContents(coll, startCount) {
	 //coll : 콘텐츠 Tab Value
	var searchForm = document.search;
	searchForm.collection.value = "emagazine";
	searchForm.contents.value = coll;
	//콘텐츠 Tab별로 content값도 가지고 넘어가야되서 화면 노출 갯수 값인 16을 곱함
	searchForm.startCount_emagazine.value = startCount*16;
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	var str = "";
	var tab = "";
	var pag = "";
	var contents= coll;
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/pc/search/searchEmagazineAjax.do",
		type: "POST",
		dataType: "json",
		data: searchFormData,
		success: function(data) {
			jQuery.each(data.SearchQueryResult.Collection, function(i, Collection) {
				if(Collection.Id=="emagazine") {
					var emagazineTotal = Collection.DocumentSet.TotalCount;
					var emagazineCount = Collection.DocumentSet.Count;
					//콘텐츠 탭별 class활성화 Ajax
					//ALL
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('ALL', '0');\" class"; 
					if(contents == "ALL"){
						tab += "=\"on\""; 
					}
					tab +="><span>전체</span></a>";
					//라이프가이드
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('라이프가이드', '0');\" class";
					if(contents =="라이프가이드"){
						tab += "=\"on\""; 
					}
					tab += "><span>라이프가이드</span></a>";
					//구매가이드
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('구매가이드', '0');\"class";
					if(contents =="구매가이드"){
						tab += "=\"on\""; 
					}
					tab += "><span>구매가이드</span></a>";
					//상품리뷰
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('상품리뷰', '0');\"class";
					if(contents =="상품리뷰"){
						tab += "=\"on\""; 
					}
					tab += "><span>상품리뷰</span></a>";
					//상품뉴스
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('상품뉴스', '0');\"class";
					if(contents =="상품뉴스"){
						tab += "=\"on\""; 
					}
					tab += "><span>상품뉴스</span></a>";
					//테마가이드
					tab += "<a href=\"javascript:void(0)\" onclick=\"doContents('테마가이드', '0'); \"class";
					if(contents =="테마가이드"){
						tab += "=\"on\""; 
					}
					tab += "><span>테마</span></a>";
					//상품리스트 반복 for문 Ajax
					jQuery.each(Collection.DocumentSet.Document, function(j, Document) {
						//kid T:텍스트, M:동영상, S:이미지 (T일때 클래스 tx_st추가)
						if(j==0 || j==4 || j==8 || j==12){
							if(Document.Field.MGZ_MST_KID=="T"){
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG + "\"class=\"f tx_st\">";
							}else{
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG + "\"class=\"f\">";
							}
						}else if(j==3 || j==7 || j==11 || j==15){
							if(Document.Field.MGZ_MST_KID=="T"){
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG + "\"class=\"l tx_st\">";
							}else{
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG + "\"class=\"l\">";
							}	
						}else{
							if(Document.Field.MGZ_MST_KID=="T"){
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG + "\"class=\"tx_st\">";
							}else{							
								str +="<a href=\"<c:out value="${frontDomain}" />/pc/contents/emagazineView.do?MGZ_MST_IDX=" + Document.Field.MGZ_MST_IDX + "&searchMgzMstCtg=" + Document.Field.MGZ_MST_CTG +"\">";
							}
						}
						//MGZ_MST_CTG (2014:라이프가이드, 2015:구매가이드, 2016:상품리뷰, 2017:상품뉴스, 2279:테마가이드)
						if(Document.Field.MGZ_MST_CTG=="2014"){
							str += "<i class=\"ico_life\">라이프가이드</i>";
						}else if(Document.Field.MGZ_MST_CTG=="2015"){
							str += "<i class=\"ico_guide\">구매가이드</i>";
						}else if(Document.Field.MGZ_MST_CTG=="2016"){
							str += "<i class=\"ico_review\">상품리뷰</i>";
						}else if(Document.Field.MGZ_MST_CTG=="2017"){
							str += "<i class=\"ico_news\">상품뉴스</i>";
						}else if(Document.Field.MGZ_MST_CTG=="2279"){
							str += "<i class=\"ico_theme\">테마</i>";
						}else{
						}
						//M:동영상 썸네일일때 / S:이미지일때 / T:텍스트
						if(Document.Field.MGZ_MST_KID=="M"){
							str += "<span class=\"movie\"><em class=\"blind\">동영상 게시물</em></span>";
							str += "<span class=\"thumb\"><img src=\"<c:out value="${cdnDomain}" />" + Document.Field.IMG_PATH_PC + "\" alt=\"\">";
							str += "<strong class=\"tx_doc\">" + Document.Field.MGZ_MST_TITLE + "</strong>";
							str += "<span class=\"desc\">" + Document.Field.SUBSTR_MGZ_MST_CPY + "</span>";
						}else if(Document.Field.MGZ_MST_KID=="S"){
							str += "<img src=\"<c:out value="${cdnDomain}" />" + Document.Field.IMG_PATH_PC + "\" alt=\"\">";
							str += "<strong class=\"tx_doc\">" + Document.Field.MGZ_MST_TITLE + "</strong>";
							str += "<span class=\"desc\">" + Document.Field.SUBSTR_MGZ_MST_CPY + "</span>";
						}else if(Document.Field.MGZ_MST_KID=="T"){
							str += "<strong class=\"tx_doc\">" + Document.Field.MGZ_MST_TITLE + "</strong>";
							str += "<span class=\"desc\">" + Document.Field.SUBSTR_MGZ_MST_CPY + "</span>";
						}else{
						}
							str += "</a>";
					});
					//페이징 처리 결과 받아오는 부분 (ajax 함수 바로 위에 있음)
					//paginFunction(coll 값, 페이지 버튼 번호, 페이지 당 문서 수, 현재 검색 결과 수, 전체 검색 결과 수)
					pag = pagingFunction(coll, startCount, 16, emagazineCount, emagazineTotal);
				}
			});
			jQuery("#emagazineTab").html(tab);
			jQuery("#emagazineResult").html(str);
			jQuery("#emagazinePaging").html(pag);
		}
  });
}
//paginFunction(coll 값, 페이지 버튼 번호, 페이지 당 문서 수, 현재 검색 결과 수, 전체 검색 결과 수)
//emagazine 콘텐츠 ajax페이징
function pagingFunction(coll, startCount, viewCount, count, totalCount) {
	var showCount = 10;	
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pag = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		pag += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pag += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		pag += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doContents('"+coll+"', '0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pag += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" onClick=\"javascript:doContents('"+coll+"', '"+prevValue+"');\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	}
	for(var iNum = 0; iNum<showCount && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/showCount) * showCount + iNum;
		if(startCount==pagIdx){
			pag += "<a href=\"javascript:void(0)\" class=\"on\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			//다른 상품,기획전,리뷰 paging과 달리 viewCount를 곱해서 던지지 않고 doContents 스크립트에서 viewCount를 곱함			
			pag += "<a href=\"javascript:void(0)\" onClick=\"javascript:doContents('"+coll+"', '"+pagIdx+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	if(nextValue >= pageCount){	
		pag += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pag += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	} else {
		pag += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doContents('"+coll+"', '"+nextValue+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pag += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doContents('"+coll+"', '"+(pageCount-1)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	} 
	return pag;
}
//###########################################################################################
//###########################Exhibitions 기획전 Ajax###########################################
//기획전페이징
function doExhibitionsPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_exhibitions.value = count;
	searchForm.collection.value = "exhibitions";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/pc/search/searchExhibitionsAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#exhibitionsTab").html(data);
		}
	});
}
//기획전ajax페이징
function pagingExhibitionsAjax(startCount, viewCount, count, totalCount) {
	var showCount = 10;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagExh = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		pagExh += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagExh += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		pagExh += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagExh += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+((prevValue)*viewCount)+"');\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	}
	for(var iNum = 0; iNum<showCount && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/showCount) * showCount + iNum;
		if(startCount==pagIdx){
			pagExh += "<a href=\"javascript:void(0)\" class=\"on\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			pagExh += "<a href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+pagIdx*viewCount+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	if(nextValue >= pageCount){		
		pagExh += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagExh += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagExh += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagExh += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagExh;
}
//###########################################################################################
//###########################Review 기획전 Ajax################################################
//리뷰페이징
function doReviewPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_review.value = count;
	searchForm.collection.value = "review";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/pc/search/searchReviewAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#reviewTab").html(data);
		}
	});
}
//리뷰ajax페이징
function pagingReviewAjax(startCount, viewCount, count, totalCount) {
	var showCount = 10;	
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagRev = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)){
		pagRev += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagRev += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		pagRev += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagRev += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+((prevValue)*viewCount)+"');\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	}
	for(var iNum = 0; iNum<showCount && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/showCount) * showCount + iNum;
		if(startCount==pagIdx){
			pagRev += "<a href=\"javascript:void(0)\" class=\"on\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			pagRev += "<a href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+pagIdx*viewCount+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	if(nextValue >= pageCount){		
		pagRev += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagRev += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagRev += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		pagRev += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagRev;
}
</script>
</body>
</html>