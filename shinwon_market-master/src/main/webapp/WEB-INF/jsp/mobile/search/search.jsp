<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./common/WNSearch.jsp" %><% request.setCharacterEncoding("UTF-8");%><%
    /*
     * subject: 검색 메인 페이지
     * @original author: SearchTool
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

	
	int contCheck = parseInt(getCheckReqXSS(request, "contCheck", "0"), 0);	//emagazine 초기검색결과 데이터가 존재하면 1 없으면 0
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
    String category1 = getCheckReqXSS(request, "category1", "");                               //카테고리 Name
    String category = getCheckReqXSS(request, "category", "");
    int cate_depth = parseInt(getCheckReqXSS(request, "cate_depth", "0"), 0); //카테고리 분류 Depth
    String contents = getCheckReqXSS(request, "contents", "ALL");			//콘텐츠이름
    int cateCount =0; //카테고리 뎁스 카운트 갯수
    int totalCount = 0;
    int productCount=0;
    int emagazineCount=0;
    int exhibitionsCount=0;
    int reviewCount=0;
    String[] searchFields = null;
    
    // 컬렉션별 페이지 카운트
  	int viewResultCountProduct = 10;
   	int viewResultCountEmagazine = 10;
	int viewResultCountExhibitions = 4;
	int viewResultCountReview = 4;

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
		realQuery = query;
	}  

	 
	/* if(!reSearch.equals("")){
		query = query + " " + reSearch;
	} */
	

    WNSearch wnsearch = new WNSearch(isDebug,false, collections, searchFields);

    int viewResultCount = COLLECTIONVIEWCOUNT;
    if ( collection.equals("ALL") ||  collection.equals("") )
        viewResultCount = TOTALVIEWCOUNT;

    for (int i = 0; i < collections.length; i++) {
    	exquery = "";
	
        //출력건수
        if (collections[i].equals("m_product")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_product +","+viewResultCountProduct);
        } else if (collections[i].equals("m_emagazine")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_emagazine +","+viewResultCountEmagazine);
        } else if (collections[i].equals("m_exhibitions")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_exhibitions +","+viewResultCountExhibitions);
        } else if (collections[i].equals("m_review")) {
        	wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount_review +","+viewResultCountReview);
        } else {
    		wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount +","+viewResultCount);
    	}
		
		//검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
		if (!realQuery.equals("") ) {
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
      	} else {
            wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
     	} 
		//상품일경우 정렬
        if(collections[i].equals("m_product")){
        	
        	//카테고리부스팅
    	    String editSort = "";
    		editSort += "WEIGHT/DESC,RANK/DESC";
    		
    		// Category Boost : 정렬 조건 WEIGHT경우 Category Boost 적용
    		wnsearch.setCollectionInfoValue(collections[i],CATEGORY_BOOST, CATE_IDX_FIELD+",SUB_MATCH,"+realQuery);
    		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, editSort); 
        	
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
        	}
        	if(sort.equals("PRD_MST_PRICE_ASC")){
        		//기업회원1
        		if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1838"))){
	        		sort = "PRD_MST_CPR_PRC1";
	        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/ASC");
	        		sort ="PRD_MST_PRICE_ASC";
        		}else if((MEM_MST_MEM_GBN.equals("683")) && (MEM_MST_MEM_GRD.equals("1839"))){
        			sort = "PRD_MST_CPR_PRC2";
	        		wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/ASC");
	        		sort ="PRD_MST_PRICE_ASC";
        		}else{
        			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "PRD_MST_PRICE/ASC");
        		}
        	}
        	if(sort.equals("DATE")){
           	 	wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
           	}
        	if(sort.equals("ONLINE_HIT")){
           	 	wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, sort + "/DESC");
           	}
        }else{
        	wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE, START_DATE.replaceAll("[.]","/") + ",2030/12/31,-");
            wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD, "RANK/DESC,DATE/DESC");
        }
		
		//콘텐츠 exquery
        if(collections[i].equals("m_emagazine")){
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
        if (collections[i].equals("m_product")) {
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
     //>>상품 전체 건수
     productCount = wnsearch.getResultTotalCount("m_product");
     emagazineCount = wnsearch.getResultTotalCount("m_emagazine");
     exhibitionsCount = wnsearch.getResultTotalCount("m_exhibitions");
     reviewCount = wnsearch.getResultTotalCount("m_review");
     contCheck=0;
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
    
    if (!category.equals("")) {
    	cate_depth = category.split(":").length;
    }
    
	//카테고리 뎁스
	depth = depth + cate_depth;
	//System.out.println("contCheck : " + contCheck);
	//System.out.println("category : " + category);
    int productGroupCount = wnsearch.getCategoryCount(collectionName, CATE_IDX_FIELD, depth);
    
%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
	getPopkeyword();
	//getRollingPopkeyword();
	var searchForm = document.search;
	getRecommend(searchForm.query.value);
	
});

</script>

</head>

<body class="page-search"><!-- page class : page-login page-join -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<!-- #container S -->
		<article id="container" class="container" data-role="content">
		<form name="search" id="search"  onsubmit="return false;" action="<c:out value="${mobileDomain }"/>/mobile/search/search.do" method="POST">
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
			<input type="hidden" name="depth"value="<%=depth%>">
			<input type="hidden" name="cate_depth"value="<%=cate_depth%>">
			<input type="hidden" name="searchField"value="<%=searchField%>">
			<input type="hidden" name="reQuery" />
			<input type="hidden" name="realQuery" value="<%=realQuery%>" />
			<input type="hidden" name="contents"value="<%=contents%>">
			<input type="hidden" name="MEM_MST_MEM_GBN" value="<c:out value="${commandMap.MEM_MST_MEM_GBN}"/>" />
			<input type="hidden" name="MEM_MST_MEM_GRD"value="<c:out value="${commandMap.MEM_MST_MEM_GRD}"/>">
			<input type="hidden" name="contCheck"value="<%=contCheck%>">
			<!-- .section-title S -->
			<section class="section-title _hd_fix">
	            <div class="btn_l">
					<a href="javascript:void(0)" class="btn_back _pg_link back"><span class="blind">이전 페이지로 이동</span></a>
				</div>
	
				<div class="inp_box">
					<label for="inp_hdSh" class="inp_sh">
						<!-- <input type="text" name="inp_hdSh" id="inp_hdSh" /> -->
						<input name="query" id="inp_hdSh" type="text"  value="<%=query%>" onKeypress="javascript:pressCheck((event),this);" autocomplete="off"/>
					</label>
					<a href="#" onclick="javascript:reset();" class="btn_reset"><span class="blind">검색어 지우기</span></a>
				</div>

				<div class="btn_r btn_r_v2">

				<!-- 검색버튼추가(3/25) -->
					<a href="#" onClick="javascript:doSearch();" class="btn_sh"><span class="blind">검색하기</span></a>
				</div>
				 <div id="key_list" class="key_list">
					<ul id="ark_content_list">
					</ul>
					<a href="#" class="btn_keyClose"><strong>닫기</strong></a>
				</div> 
	        </section>
			<!--// .section-title E -->
		
			<!-- .sh_popular S -->
			<%if(realQuery.equals("")){ %>
			<section class="sh_popular">
				<strong class="tx_ti">인기검색어</strong>
				<ol id="popword"> 
				</ol>
			</section>
			<%} %>
			<!--// .sh_popular E -->
			
			<%if(!realQuery.equals("")){ %>
			<!-- .shNsh_d S -->
			<section class="shNsh_d">
				<dl>
					<dt class="blind">검색 결과 내 재검색 폼</dt>
					<dd class="dd_sh">
						<label for="" class="inp_sh">
							<input type="text" name="reSearch" id="reSearch" value="<%=reSearch%>" placeholder="결과 내 재검색" />
						</label>
						<a href="javascript:void(0);" onclick="javascript:doreSearch();"class="btn_gre btn_sh"><strong>검색</strong></a>
					</dd>
					<dd class="dd_related">
						<span class="tx_ti">연관검색어</span>
						<div class="link_box" id="recommendword"> <!-- id="recommendword" 추가하기(3/25)-->
						</div>
					</dd>
				</dl>
			</section>
			
			<!--// .shNsh_d E -->
	
			<!-- .sh_product S -->
			<section class="sh_product">
				<span class="blind">검색 결과에 상품 정보</span>
				<h3>상품</h3>
				<% if (productCount==0) { %>
				<!--검색결과 없을때 -->
				<dl class="no_list">				
					<dt>
						<strong>“<strong class="co_red"><%=realQuery%></strong>” 로</strong>
						<span><strong>검색된 상품이 없습니다.</strong></span>
					</dt>
					<dd>
						<p class="tx_ex">
							<span>검색어가 올바르게 입력되었는지 확인해 주세요. </span>
							<span>검색어의 띄어쓰기를 조정한 후 검색해 보세요.	</span>					 
							<span>상품명이나 브랜드로 검색하시면 더욱 빠른 결과를 보실 수 있습니다.</span>
						</p>
					</dd>
				</dl>
				<%}else{ %>
				<!--검색결과 있을때 -->
				<dl class="dl_con">	
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
					<dt>
						<strong>“<strong class="co_red"><%=realQuery %></strong>” 검색결과</strong>
						<span><strong class="co_red"><%=cateCount%></strong>개 카테고리, <strong class="co_red"><%= productCount %></strong>개 상품</span>
					</dt>
					<dd class="dd_cate">
						<p class="tx_cate">
							<a onclick="javascript:doCategoryInit();" href="#"><span>All</span></a>
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
									<a onclick="javascript:doCategory1('<%= categoryName.substring(1) %>','<%= ( i + 1 ) %>');" href="#"><span><%=categoryNav[i] %></span></a>
							<%
								}
							%>
						</p>
						<ul class="list">
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
									if(name.startsWith(category)){
							%>
								<li><a href="#" onClick="javascript:doCategory1('<%=name%>','<%=depth%>');" ><span><%=editName%>(<%=count%>)</span></a></li>
								<%} %>
							<%} %>
							<%
								if (productGroupCount < 1) {
									String lastCategory = category;
									lastCategory = category.substring(category.lastIndexOf(":") + 1);
									lastCategory = lastCategory.substring(0, lastCategory.indexOf("_", 1));
							%>
							<li><a href="#"><span><%=lastCategory%></span></a></li>
							<%
							}
							%>
						</ul>
					</dd>
					<dd class="dd_pr_list">
						<label for="sel_ingEv" class="sel_box_st0">
							<select id="sel_list_type"  onchange="javascript:doSorting(this.value);"  class="sel_chg">
								<option value="RANK" <%=sort.equals("RANK")?"selected=\"selected\"":"" %>>추천순</option>
								<option value="DATE" <%=sort.equals("DATE")?"selected=\"selected\"":"" %>>최신순</option>
								<option value="ONLINE_HIT"<%=sort.equals("ONLINE_HIT")?"selected=\"selected\"":"" %>>인기순</option>
								<option value="PRD_MST_PRICE_ASC"<%=sort.equals("PRD_MST_PRICE_ASC")?"selected=\"selected\"":"" %>>가격낮은순</option>
								<option value="PRD_MST_PRICE"<%=sort.equals("PRD_MST_PRICE")?"selected=\"selected\"":"" %>>가격높은순</option>
							</select>
						</label>
						<div id="productTab">
							<%@ include file="/WEB-INF/jsp/mobile/search/result/result_m_product.jsp" %>
						</div>
						<div class="pg_num_box" id="productPag">
							<%=wnsearch.getProductPageLinks(startCount_product , productCount, viewResultCountProduct, 5)%>
						</div>
					</dd>
				</dl>
				<%} %>
			</section>
			<!--// .sh_product E -->
			<hr class="hr_2px_st0" />
			<!--// .sh_contents E -->
			<section class="sh_contents">
				<span class="blind">검색 결과에 콘텐츠 정보</span>
				<h3>콘텐츠</h3>
				<% if (emagazineCount==0 && contCheck==0) { %>
				<!--검색결과 없을때 -->
				<dl class="no_list">				
					<dt>
						<strong>“<strong class="co_red"><%=realQuery%></strong>” 로</strong>
						<span><strong>검색된 콘텐츠가 없습니다.</strong></span>
					</dt>
					<dd></dd>
				</dl>
				<%}else{ %>
				<!--검색결과 있을때 -->
				<dl class="dl_con">
					<dt class="ct">
						<a href="javascript:void(0)" onclick="doContents('ALL');" <%=contents.equals("ALL")?"class=\"on\"":"" %>><strong>전체</strong></a>
						<a href="javascript:void(0)" onclick="doContents('라이프가이드');"<%=contents.equals("라이프가이드")?"class=\"on\"":""%>><strong>라이프가이드</strong></a>
						<a href="javascript:void(0)" onclick="doContents('구매가이드');"<%=contents.equals("구매가이드")?"class=\"on\"":""%>><strong>구매가이드</strong></a>
						<a href="javascript:void(0)" onclick="doContents('상품리뷰');"<%=contents.equals("상품리뷰")?"class=\"on\"":""%>><strong>상품리뷰</strong></a>
						<a href="javascript:void(0)" onclick="doContents('상품뉴스');"<%=contents.equals("상품뉴스")?"class=\"on\"":""%>><strong>상품뉴스</strong></a>
						<a href="javascript:void(0)" onclick="doContents('테마가이드');"<%=contents.equals("테마가이드")?"class=\"on\"":""%>><strong>테마</strong></a>
					</dt>
					<dd class="dd_list">
						<ul class="ui-grid-a" id="emagazineTab">
							<%@ include file="/WEB-INF/jsp/mobile/search/result/result_m_emagazine.jsp" %>
						</ul> 
						<div class="pg_num_box" id="emagazinePag">
							<%=wnsearch.getEmagazinePageLinks(startCount_emagazine , emagazineCount, viewResultCountEmagazine, 5)%>
						</div>
					</dd>
				</dl>
			<%} %>
			</section>
			<!--// .sh_contents E -->
			<hr class="hr_2px_st0" />
			<!--// .sh_exhibi E -->
			<section class="sh_exhibi">
				<span class="blind">검색 결과에 기획전 정보</span>
				<h3>기획전</h3>
				<% if (exhibitionsCount==0) { %>
				<!--검색결과 없을때 -->
				<dl class="no_list">				
					<dt>
						<strong>“<strong class="co_red"><%=realQuery %></strong>” 로</strong>
						<span><strong>검색된 기획전이 없습니다.</strong></span>
					</dt>
					<dd></dd>
				</dl>
				<%}else{ %>
				<!--검색결과 있을때 -->
				<ul class="list_d" id="exhibitionsTab">
				<%@ include file="/WEB-INF/jsp/mobile/search/result/result_m_exhibitions.jsp" %> 
				</ul>
				<div class="pg_num_box" id="exhibitionsPag">
					<%=wnsearch.getExhibitionsPageLinks(startCount_exhibitions , exhibitionsCount, viewResultCountExhibitions, 5)%>
				</div>
				<%} %>
			</section>
			<!--// .sh_exhibi E -->
			<hr class="hr_2px_st0" />
			<!--// .sh_reviews E -->
			<section class="sh_reviews">
				<span class="blind">검색 결과에 상품후기 정보</span>
				<h3>상품후기</h3>
				<% if (reviewCount==0) { %>
				<!--검색결과 없을때 -->
				<dl class="no_list">				
					<dt>
						<strong>“<strong class="co_red"><%=realQuery %></strong>” 로</strong>
						<span><strong>검색된 상품후기가 없습니다.</strong></span>
					</dt>
					<dd></dd>
				</dl>
				<%}else{ %>
				<!--검색결과 있을때 -->
				<ul class="list_d" id="reviewTab">
				 <%@ include file="/WEB-INF/jsp/mobile/search/result/result_m_review.jsp" %>
				</ul>
				<div class="pg_num_box" id="reviewPag">
					<%=wnsearch.getReviewPageLinks(startCount_review , reviewCount, viewResultCountReview, 5)%>
				</div>
				<%} %>
			</section>
			<!--// .sh_reviews E -->
			<%} %>
	</form>
	
		</article>
		<!--// #container E -->
		<!-- #laypop S -->
		<%@ include file="/WEB-INF/jsp/mobile/product/productLayer.jsp" %>
		<!--// #laypop E -->

		<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>
	<!--// #wrap E -->

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>

<script type="text/javascript">
$(function(){
	//최상단 검색
	var _inp_hdSh = $('#inp_hdSh'),
		_key_lay = $('#key_list');

	_inp_hdSh.on('keyup', function(e){
		var _this = $(this),
			_val = _this.val();
		if(_val.length == 0) _key_lay.hide();
		else _key_lay.show();
	});

	_key_lay.find('.btn_keyClose').on('click', function(){
		_key_lay.hide();
	});
});
/*
 * subject: 모바일 통합검색page(search.jsp) ajax처리
 * @original author: 조준철
 */
//################################# 상 품 AJAX #########################################
//정렬 ajax
function doSorting(sort) {
	var searchForm = document.search;
	searchForm.sort.value = sort;
	searchForm.reQuery.value = "2";
	searchForm.collection.value = "m_product";
	searchForm.searchField.value = "ALL";
	searchForm.startCount = 0;
	searchForm.startCount_product.value = 0;
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMProductAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			//searchMProductAjax페이지에서 결과값 + 페이징 만들어서 productTab에 뿌림
			jQuery("#productTab").html(data);
		}
	});
}
//상품 ajax (초기 화면은 WNSearch의 페이징)
function doProductPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_product.value = count;
	searchForm.collection.value = "m_product";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMProductAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			//searchMProductAjax페이지에서 결과값 + 페이징 만들어서 productTab에 뿌림
			jQuery("#productTab").html(data);
		}
	});
}
//pagingAjax(페이지 버튼 번호, 페이지 당 문서 수, 현재 검색 결과 수, 전체 검색 결과 수)
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
	var showCount = 5;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagPro = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue== (-showCount)) {
		//pagPro += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagPro += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		//pagPro += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
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
		//pagPro += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagPro += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		//pagPro += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doProductPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagPro;
}
//#################################################################################
//#####################콘텐츠(emagazine) AJAX #######################################
//콘텐츠페이징
function doEmagazinePaging(count) {
	var searchForm = document.search;
	searchForm.startCount_emagazine.value = count;
	searchForm.collection.value = "m_emagazine";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMEmagazineAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#emagazineTab").html(data);
		}
	});
}
//콘텐츠별 검색
function doContents(coll) {
	var searchForm = document.search;
	searchForm.contents.value = coll;
	searchForm.collection.value = "m_emagazine";
	searchForm.startCount_emagazine.value = "0";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMEmagazineAjax.do",
		type: "POST",
		dataType: "text",
		data: searchFormData,
		success: function(data) {
			jQuery("#emagazineTab").html(data);
		}
	});
}
//콘텐츠 ajax페이징
function pagingEmagazineAjax(startCount, viewCount, count, totalCount) {
	var showCount = 5;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagEma = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		//pagEma += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagEma += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		//pagEma += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doEmagazinePaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagEma += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" onClick=\"javascript:doEmagazinePaging('"+((prevValue)*viewCount)+"');\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	}
	for(var iNum = 0; iNum<showCount && iNum<loopCount; iNum++) {
		pagIdx = parseInt(startCount/showCount) * showCount + iNum;
		if(startCount==pagIdx){
			pagEma += "<a href=\"javascript:void(0)\" class=\"on\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		} else {
			pagEma += "<a href=\"javascript:void(0)\" onClick=\"javascript:doEmagazinePaging('"+pagIdx*viewCount+"');\" title=\"페이징\"> "+(parseInt(pagIdx)+1)+" </a>";
		}
	}
	if(nextValue >= pageCount){		
		pagEma += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		//pagEma += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagEma += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doEmagazinePaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		//pagEma += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doEmagazinePaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagEma;
}
//###########################################################################################
//###########################Exhibitions 기획전 Ajax###########################################
//기획전페이징
function doExhibitionsPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_exhibitions.value = count;
	searchForm.collection.value = "m_exhibitions";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMExhibitionsAjax.do",
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
	var showCount = 5;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagExh = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		//pagExh += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagExh += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		//pagExh += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
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
		//pagExh += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagExh += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		//pagExh += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doExhibitionsPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagExh;
}
//###########################################################################################
//###########################Review 기획전 Ajax################################################
//리뷰페이징
function doReviewPaging(count) {
	var searchForm = document.search;
	searchForm.startCount_review.value = count;
	searchForm.collection.value = "m_review";
	searchForm.reQuery.value = "2";
	var searchFormData = $("#search").serialize();
	jQuery.ajaxSetup({cache:false});
	jQuery.ajax({
		url: "/mobile/search/searchMReviewAjax.do",
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
	var showCount = 5;
	var pageCount = parseInt(totalCount%viewCount)==0?parseInt(totalCount/viewCount):parseInt(totalCount/viewCount)+1;
	var loopCount = pageCount - parseInt(startCount/showCount) * showCount;
	var pagIdx = 0;
	var pagRev = "";
	var prevValue = (parseInt(startCount/showCount)-1)*showCount;
	var nextValue = (parseInt(startCount/showCount)+1)*showCount;
	if(prevValue==(-showCount)) {
		//pagRev += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
		pagRev += "<a class=\"ico_ar_l\" href=\"javascript:void(0)\" title=\"이전페이지\"><span class=\"blind\">이전페이지</span></a>";
	} else {
		//pagRev += "<a class=\"ico_ar_first\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('0');\" title=\"처음페이지\"><span class=\"blind\">처음페이지</span></a>";
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
		//pagRev += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}else{
		pagRev += "<a class=\"ico_ar_r\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+((nextValue)*viewCount)+"')\" title=\"다음페이지\"><span class=\"blind\">다음페이지</span></a>";
		//pagRev += "<a class=\"ico_ar_last\" href=\"javascript:void(0)\" onClick=\"javascript:doReviewPaging('"+((pageCount-1)*viewCount)+"')\" title=\"마지막 페이지\"><span class=\"blind\">마지막 페이지</span></a>";
	}
	return pagRev;
}
</script>
</body>
</html>