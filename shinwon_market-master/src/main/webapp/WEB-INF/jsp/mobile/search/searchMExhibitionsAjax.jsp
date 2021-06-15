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
    int productGroupCount = wnsearch.getCategoryCount(collectionName, CATE_IDX_FIELD, depth);
   
/*
* subject: product 페이지
* @original author: SearchTool
*/
	thisCollection = "m_exhibitions";
    int count = 0;
    int thisTotalCount = 0;
	if (collection.equals("ALL") || collection.equals(thisCollection)) {
		count = wnsearch.getResultCount(thisCollection);
		thisTotalCount = wnsearch.getResultTotalCount(thisCollection);
		for(int idx = 0; idx < count; idx ++) {
		if ( thisTotalCount > 0 ) {
			 String DOCID                    = wnsearch.getField(thisCollection,"DOCID",idx,false);
             String PLN_MST_IDX              = wnsearch.getField(thisCollection,"PLN_MST_IDX",idx,false);
             String PLN_MST_CHANNEL_PC_YN    = wnsearch.getField(thisCollection,"PLN_MST_CHANNEL_PC_YN",idx,false);
             String PLN_MST_CHANNEL_MOBILE_YN  = wnsearch.getField(thisCollection,"PLN_MST_CHANNEL_MOBILE_YN",idx,false);
             String PLN_MST_TITLE            = wnsearch.getField(thisCollection,"PLN_MST_TITLE",idx,false);
             String PLN_MST_ST_DT            = wnsearch.getField(thisCollection,"PLN_MST_ST_DT",idx,false);
             String PLN_MST_ED_DT            = wnsearch.getField(thisCollection,"PLN_MST_ED_DT",idx,false);
             String PLN_MST_ST_HH            = wnsearch.getField(thisCollection,"PLN_MST_ST_HH",idx,false);
             String PLN_MST_ED_HH            = wnsearch.getField(thisCollection,"PLN_MST_ED_HH",idx,false);
             String PLN_MST_ST_MI            = wnsearch.getField(thisCollection,"PLN_MST_ST_MI",idx,false);
             String PLN_MST_ED_MI            = wnsearch.getField(thisCollection,"PLN_MST_ED_MI",idx,false);
             String PLN_MST_PC_BANNER        = wnsearch.getField(thisCollection,"PLN_MST_PC_BANNER",idx,false);
             String PLN_MST_MOBILE_BANNER    = wnsearch.getField(thisCollection,"PLN_MST_MOBILE_BANNER",idx,false);
             String PC_ATT_PATH              = wnsearch.getField(thisCollection,"PC_ATT_PATH",idx,false);
             String PC_SYS_NM                = wnsearch.getField(thisCollection,"PC_SYS_NM",idx,false);
             String PC_ALT_TXT               = wnsearch.getField(thisCollection,"PC_ALT_TXT",idx,false);
             String MOBILE_ATT_PATH          = wnsearch.getField(thisCollection,"MOBILE_ATT_PATH",idx,false);
             String MOBILE_SYS_NM            = wnsearch.getField(thisCollection,"MOBILE_SYS_NM",idx,false);
             String MOBILE_ALT_TXT           = wnsearch.getField(thisCollection,"MOBILE_ALT_TXT",idx,false);
             String ALIAS                    = wnsearch.getField(thisCollection,"ALIAS",idx,false);
				PLN_MST_TITLE= wnsearch.getKeywordHl(PLN_MST_TITLE,"<font color=red>","</font>");
				PLN_MST_PC_BANNER= wnsearch.getKeywordHl(PLN_MST_PC_BANNER,"<font color=red>","</font>");
				PLN_MST_MOBILE_BANNER= wnsearch.getKeywordHl(PLN_MST_MOBILE_BANNER,"<font color=red>","</font>");
         String URL = "URL 정책에 맞게 작성해야 합니다.";

%>
		<li>
			<a href="<c:out value="${mobileDomain}" />/mobile/event/planProductList.do?PLN_MST_IDX=<%=PLN_MST_IDX%>">
			<img src="<c:out value="${cdnDomain}" /><%=PC_ATT_PATH%><%=PC_SYS_NM%>" alt="" />
			<strong class="tx_ti"><%=PLN_MST_TITLE%></strong>
			<span class="tx_date"><ui:formatDate value="<%=PLN_MST_ST_DT%>" pattern="yyyy.MM.dd"/> ~ <ui:formatDate value="<%=PLN_MST_ED_DT%>" pattern="yyyy.MM.dd"/></span>						
			</a>
		</li>

 <%
			}
		}
	}
%>
<script>
{
	var startCount = parseInt('<%=startCount_exhibitions%>')/parseInt('<%=viewResultCountExhibitions%>');
	var pagExh = pagingExhibitionsAjax(startCount, '<%=viewResultCountExhibitions%>', '<%=count%>', '<%=totalCount%>');
	jQuery("#exhibitionsPag").html(pagExh);
}
</script>

      