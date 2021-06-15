<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/search/common/WNSearch.jsp" %><% request.setCharacterEncoding("UTF-8");%><%
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

    int TOTALVIEWCOUNT = 16;			  //통합검색시 출력건수
    int COLLECTIONVIEWCOUNT = 16;    //더보기시 출력건수

	String START_DATE = "1970.01.01";	// 기본 시작일

	// 결과 시작 넘버
    int startCount = parseInt(getCheckReqXSS(request, "startCount", "0"), 0);	//시작 번호
    String searchKeyword = getCheckReqXSS(request, "searchKeyword", "");						//검색어
    String collection = getCheckReqXSS(request, "collection", "thema");			//컬렉션이름
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
    String searchMgzMstThmCtg1 = getCheckReqXSS(request, "searchMgzMstThmCtg1", "");			//테마코드체크
    String searchMgzMstThmCtg2 = getCheckReqXSS(request, "searchMgzMstThmCtg2", "");			//테마코드체크
    String searchMgzMstThmCtg3 = getCheckReqXSS(request, "searchMgzMstThmCtg3", "");			//테마코드체크
    String themaCode = (String)request.getAttribute("themaCode");    //테마코드
    
    String strOperation  = "" ;												//operation 조건 필드
    String exquery = "" ;													//exquery 조건 필드
    int totalCount = 0;
	int themaCount = 0; //테마카운트
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
    realQuery = searchKeyword;
	/* if (reQuery.equals("1")) {
		realQuery = query + " " + realQuery;
	} else if (!reQuery.equals("2")) {
		realQuery = query;
	} */
    WNSearch wnsearch = new WNSearch(isDebug,false, collections, searchFields);

    int viewResultCount = COLLECTIONVIEWCOUNT;
    if ( collection.equals("ALL") ||  collection.equals("") )
        viewResultCount = TOTALVIEWCOUNT;
    //테마분류코드exquery
    //if(!searchMgzMstThmCtg1.equals("")){
    //	exquery += " <MGZ_MST_CTG_NM:contains:" + searchMgzMstThmCtg1 + ">";
    //}

    for (int i = 0; i < collections.length; i++) {
    	exquery="";
        //출력건수
        wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO, startCount+","+viewResultCount);
        //검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
        if (!searchKeyword.equals("") ) {
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
        
      //테마 exquery
       	exquery += " <MGZ_MST_THM_CTG1:contains:" + themaCode + ">";
		
        //exquery 설정
        if (!exquery.equals("")) {
			wnsearch.setCollectionInfoValue(collections[i], EXQUERY_FIELD, exquery);
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
     //테마카운트
     themaCount = wnsearch.getResultTotalCount("thema");
    String thisCollection = "";
    if(useSuggestedQuery) {
       suggestQuery = wnsearch.suggestedQuery;
    }
%>