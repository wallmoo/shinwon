<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/am/search/common_zip/WNSearch.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	//실시간 검색어 화면 출력 여부 체크
	boolean isRealTimeKeyword = false;
	//오타 후 추천 검색어 화면 출력 여부 체크
	boolean useSuggestedQuery = true;
	String suggestQuery = "";

	//디버깅 보기 설정
	boolean isDebug = false;

	int TOTALVIEWCOUNT = 10; //통합검색시 출력건수
	int COLLECTIONVIEWCOUNT = 10; //더보기시 출력건수
	String START_DATE = "1970.01.01"; // 기본 시작일

	String submitYn = getCheckReqXSS(request, "submitYn", "N"); //submitYn="Y"일때 초기 결과 호출 하지않으려고
	String searchYn = getCheckReqXSS(request, "searchYn", "");
	String searchType = getCheckReqXSS(request, "searchType", "");
	String searchSido = getCheckReqXSS(request, "searchSido", ""); //시도					
	String searchSigungu = getCheckReqXSS(request, "searchSigungu", ""); //시군구
	String searchBuildNm = getCheckReqXSS(request, "searchBuildNm", ""); //건물명					
	String searchDong = getCheckReqXSS(request, "searchDong", ""); //읍정동
	String searchDoro = getCheckReqXSS(request, "searchDoro", ""); //도로명
	String searchBuildMainNo = getCheckReqXSS(request,
			"searchBuildMainNo", ""); //건물본번
	String searchBuildSubNo = getCheckReqXSS(request,
			"searchBuildSubNo", ""); //건물부번
	String searchJinomain = getCheckReqXSS(request, "searchJinomain",
			""); //지번본번
	String searchJinosub = getCheckReqXSS(request, "searchJinosub", ""); //지번부번
	String searchMountYn = getCheckReqXSS(request, "searchMountYn", ""); //산여부

	int startCount = parseInt(
			getCheckReqXSS(request, "startCount", "0"), 0); //시작 번호
	String searchLoad = getCheckReqXSS(request, "searchLoad", ""); //검색
	String collection = getCheckReqXSS(request, "collection", "ALL"); //컬렉션이름
	String strOperation = ""; //operation 조건 필드
	String exquery = ""; //exquery 조건 필드
	String colquery = "";
	String range = getCheckReqXSS(request, "range", "A"); //기간관련필드
	String startDate = getCheckReqXSS(request, "startDate", START_DATE); //시작날짜
	String endDate = getCheckReqXSS(request, "endDate",
			getCurrentDate()); //끝날짜
	String writer = getCheckReqXSS(request, "writer", ""); //작성자
	String searchField = getCheckReqXSS(request, "searchField", ""); //검색필드
	String realQuery = getCheckReqXSS(request, "realQuery", ""); //결과내 검색어
	String sort = getCheckReqXSS(request, "sort", "RANK"); //정렬필드

	int totalCount = 0;
	String[] searchFields = null;
	/* System.out.println("searchMountYn:" + searchMountYn);
	System.out.println("searchYn:" + searchYn);
	 System.out.println("searchType:" + searchType);
	System.out.println("searchSido:" + searchSido);
	System.out.println("searchSigungu:" + searchSigungu);
	System.out.println("searchBuildNm:" + searchBuildNm);
	System.out.println("searchDong:" + searchDong);
	System.out.println("searchDoro:" + searchDoro);
	System.out.println("searchBuildMainNo:" + searchBuildMainNo);
	System.out.println("searchBuildSubNo:" + searchBuildSubNo);
	System.out.println("searchLoad:" + searchLoad);
	System.out.println("submitYn:" + submitYn);*/

	String[] collections = null;
	if (collection.equals("ALL")) { //통합검색인 경우
		collections = COLLECTIONS;
	} else { //개별검색인 경우
		collections = new String[] { collection };
	}
	realQuery = searchLoad;
	/*  if (reQuery.equals("1")) {
		realQuery = query + " " + realQuery;
	} */
	//System.out.println("realQuery:" + realQuery);

	WNSearch wnsearch = new WNSearch(isDebug, false, collections,
			searchFields);

	int viewResultCount = COLLECTIONVIEWCOUNT;
	if (collection.equals("ALL") || collection.equals(""))
		viewResultCount = TOTALVIEWCOUNT;

	for (int i = 0; i < collections.length; i++) {
		exquery = "";
		//출력건수
		wnsearch.setCollectionInfoValue(collections[i], PAGE_INFO,
				startCount + "," + viewResultCount);

		//검색어가 없으면 DATE_RANGE 로 전체 데이터 출력
		if (!realQuery.equals("")) {
			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD,
					sort + "/DESC");
		} else {
			wnsearch.setCollectionInfoValue(collections[i], DATE_RANGE,
					START_DATE.replaceAll("[.]", "/") + ",2030/12/31,-");
			wnsearch.setCollectionInfoValue(collections[i], SORT_FIELD,
					"RANK/DESC,DATE/DESC");
		}

		//우편번호 colquery
		if (collections[i].equals("postnm")) {
			//건물명
			if (!searchBuildNm.equals("")) {
				colquery += " <SIGUNGU_BUILDING:contains:"
						+ searchBuildNm + ">";
			}
			if (!searchDong.equals("")) {
				colquery += " <BUBJUNG_DONG:contains:" + searchDong
						+ ">";
			}
			if (!searchDoro.equals("")) {
				colquery += " <DORO:contains:" + searchDoro + ">";
			}
		}
		//우편번호 exquery
		if (collections[i].equals("postnm")) {
			//시도,시군구
			if (!searchSido.equals("")) {
				exquery += " <SIDO:contains:" + searchSido + ">";
			}
			if (!searchSigungu.equals("")) {
				exquery += " <SIGUNGU:contains:" + searchSigungu + ">";
			}
			//건물번호
			if (!searchBuildMainNo.equals("")) {
				exquery += " <BUILDING1:contains:" + searchBuildMainNo
						+ ">";
			}
			if (!searchBuildSubNo.equals("")) {
				exquery += " <BUILDING2:contains:" + searchBuildSubNo
						+ ">";
			}
			//지번번호
			if (!searchJinomain.equals("")) {
				exquery += " <JIBUN1:contains:" + searchJinomain + ">";
			}
			if (!searchJinosub.equals("")) {
				exquery += " <JIBUN2:contains:" + searchJinosub + ">";
			}
			if (searchMountYn.equals("1")) {
				exquery += " <MOUNT_YN:contains:" + searchMountYn + ">";
			}
		}
		//searchField 값이 있으면 설정, 없으면 기본검색필드
		if (!searchField.equals("") && !searchField.equals("WRITER")
				&& searchField.indexOf("ALL") == -1) {
			wnsearch.setCollectionInfoValue(collections[i],
					SEARCH_FIELD, searchField);
		}

		//operation 설정
		if (!strOperation.equals("")) {
			wnsearch.setCollectionInfoValue(collections[i],
					FILTER_OPERATION, strOperation);
		}
		//exquery 설정
		if (!exquery.equals("")) {
			wnsearch.setCollectionInfoValue(collections[i],
					EXQUERY_FIELD, exquery);
		}

		//collection query 설정
		if (!colquery.equals("")) {
			wnsearch.setCollectionInfoValue(collections[i],
					COLLECTION_QUERY, colquery);
		}

		//기간 설정 , 날짜가 모두 있을때
		if (!startDate.equals("") && !endDate.equals("")) {
			wnsearch.setCollectionInfoValue(
					collections[i],
					DATE_RANGE,
					startDate.replaceAll("[.]", "/") + ","
							+ endDate.replaceAll("[.]", "/") + ",-");
		}

	}
	;
	//submitYn="Y"일때 초기 결과 호출 하지않으려고
	if (submitYn.equals("Y")) {
		wnsearch.search(realQuery, isRealTimeKeyword, CONNECTION_CLOSE,
				useSuggestedQuery);
	}
	// 디버그 메시지 출력
	String debugMsg = wnsearch.printDebug() != null ? wnsearch
			.printDebug().trim() : "";
	if (!debugMsg.trim().equals("")) {
		out.println(debugMsg);
	}

	// 전체건수 구하기
	if (collection.equals("ALL")) {
		for (int i = 0; i < collections.length; i++) {
			totalCount += wnsearch.getResultTotalCount(collections[i]);
		}
	} else {
		//개별건수 구하기
		totalCount = wnsearch.getResultTotalCount(collection);
	}
	System.out.println("totalCount :" + totalCount);
	String thisCollection = "";
	if (useSuggestedQuery) {
		suggestQuery = wnsearch.suggestedQuery;
	}
%>
