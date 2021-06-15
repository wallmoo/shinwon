<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/mobile/include/head.jsp" %>
</head>

<body class="page-mypage"><!-- page class : page-login -->
	<a href="#container;" class="skipnavi" onclick="$.com.layout.skipnavi('container');">본문 바로가기</a>

	<!-- #wrap S -->
	<section id="wrap">

		<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
		<%@ include file="/WEB-INF/jsp/mobile/include/aside.jsp" %>
		<%-- _upper.html : GNB 등 헤더 레이아웃 삽입, 한 개의 파일로 관리 --%>

		<%-- 각 화면 본문 시작 --%>
		<article id="container" class="container" data-role="content">
			<!-- .cate_gnb S -->
	
	        <div class="section-title _hd_fix"><!-- section-title -->
	            <h2>1:1문의</h2>
	            <a href="javascript:history.back(); return false;" class="back _pg_link"><span></span><em class="blind">이전 페이지로 이동</em></a>
	        </div><!-- // section-title -->
	        
	        <div class="padder mt10">
	            <p class="text-right">
	                <span class="essential"><em class="blind">필수입력 항목은</em></span> 필수 입력 입니다.
	            </p>
	        </div>
			<form name="frm" id="frm" enctype="multipart/form-data">
	        <double-submit:preventer/>
	        <ul class="form-a qna-write"><!-- form-a -->
	            <li class="name">
	                <div class="tit">고객명</div>
	                <div class="field">
	                    <strong><c:out value="${sessionUser.MEM_MST_MEM_NM }"/></strong>
	                </div>
	            </li>
	            <li class="tel">
	                <div class="tit">
	                    <label for="phone">휴대폰 번호</label>
	                </div>
	                <div class="field">
	                    <label for="MEM_ADV_HP1" class="sel_box_st0">
	                        <select id="MEM_ADV_HP1" name="MEM_ADV_HP1" class="select" title="휴대폰 번호 앞자리">
	                            <option value="">선택</option>
                                <c:if test="${not empty codes.HP_CODE }">
                                    <c:forEach var="hpRow" items="${codes.HP_CODE }" varStatus="i">
                                        <option value="<c:out value="${hpRow.CMN_COM_NM }"/>"><c:out value="${hpRow.CMN_COM_NM }"/></option>
                                    </c:forEach>
                                </c:if>
	                        </select>
	                    </label> -
	                    <input type="text" class="text number" maxlength="4" name="MEM_ADV_HP2" id="MEM_ADV_HP2" title="휴대폰 번호 중간자리"> -
	                    <input type="text" class="text number" maxlength="4" name="MEM_ADV_HP3" id="MEM_ADV_HP3" title="휴대폰 번호 끝자리">
	                    <p class="desc">
	                        <input type="checkbox" id="MEM_ADV_MBL_YN" name="MEM_ADV_MBL_YN" value="Y" class="checkbox">
	                        <label for="MEM_ADV_MBL_YN">답변을 SMS로 받으시겠습니까?</label>
	                    </p>
	                </div>
	            </li>
	            <li class="mail">
	                <div class="tit">
	                    <label for="mail">이메일 주소</label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="text" id="MEM_ADV_MAIL_ID" name="MEM_ADV_MAIL_ID" class="text" title="이메일 아이디" maxlength="20" data-err_msg_id="memEmailId"> @
	                        <input type="text" class="text" title="이메일 도메인" id="MEM_ADV_MAIL_DOMAIN" name="MEM_ADV_MAIL_DOMAIN" data-err_msg_id="memEmailDomain">
	                    </p>
	                    <p>
	                        <label for="emailDomainSelectbox" class="sel_box_st0">
	                            <select id="emailDomainSelectbox" class="select">
	                                <option value="">직접입력</option>
	                                <c:if test="${not empty codes.EMAIL_DOMAIN_CODE }">
			                            <c:forEach var="emailRow" items="${codes.EMAIL_DOMAIN_CODE }">
			                            	<option value="<c:out value="${emailRow.CMN_COM_NM }"/>"><c:out value="${emailRow.CMN_COM_NM }"/></option>
		                            	</c:forEach>
		                            </c:if>
	                            </select>
	                            <input type="hidden" id="MEM_ADV_MAIL" name="MEM_ADV_MAIL"/>
	                        </label>
	                    </p>
	                    <!-- <p class="desc">
	                        <input type="checkbox" id="mailY" class="checkbox">
	                        <label for="mailY">답변을 이메일로 받으시겠습니까? </label>
	                    </p> -->
	                </div>
	            </li>
	            <li class="type">
	                <div class="tit">
	                    <label for="bbsType">문의유형<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <label for="MEM_ADV_QST_TYPE_UP" class="sel_box_st0">
	                        <select id="MEM_ADV_QST_TYPE_UP" name="MEM_ADV_QST_TYPE_UP" class="select" title="문의유형 첫번째 카테고리">
	                            <option value="">선택해 주세요</option>
								<c:if test="${not empty inqTypeCodeList }">
								    <c:forEach var="inqTypeCodeRow" items="${inqTypeCodeList }" varStatus="i" >
								        <option value="<c:out value="${inqTypeCodeRow.CMN_COM_IDX }"/>">
								            <c:out value="${inqTypeCodeRow.CMN_COM_NM }"/>
								        </option>
								    </c:forEach>
								</c:if>
	                        </select>
	                    </label>
	                    <label for="MEM_ADV_QST_TYPE" class="sel_box_st0">
	                        <select id="MEM_ADV_QST_TYPE" name="MEM_ADV_QST_TYPE" class="select" title="문의유형 두번째 카테고리">
	                            <option value="">문의유형</option>
	                        </select>
	                    </label>
	                </div>
	            </li>
	            <li class="search">
	                <div class="tit">
	                    <label for="ORD_MST_CD">주문번호</label>
	                </div>
	                <div class="field">
	                    <input type="text" id="ORD_MST_CD" name="ORD_MST_CD" class="text" disabled=true>
	                    <a href="javascript:;" onclick="goOrderListPopup(); return false;" class="button primary small"><span>검색</span></a>
	                </div>
	            </li>
	            <li class="search">
	                <div class="tit">
	                    <label for="MEM_ADV_MDL_NO">상품코드</label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_ADV_MDL_NO" name="MEM_ADV_MDL_NO" class="text" disabled=true>
	                    <a href="javascript:;" onclick="goPorductListPopup(); return false;" class="button primary small"><span>검색</span></a>
	                </div>
	            </li>
	            <li class="subject">
	                <div class="tit">
	                    <label for="MEM_ADV_TITLE">제목<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <input type="text" id="MEM_ADV_TITLE" name="MEM_ADV_TITLE" class="text">
	                </div>
	            </li>
	            <li class="message">
	                <div class="tit">
	                    <label for="MEM_ADV_CONTENTS">내용<span class="essential"><em class="blind">필수입력</em></span></label>
	                </div>
	                <div class="field">
	                    <textarea class="textarea" id="MEM_ADV_CONTENTS" name="MEM_ADV_CONTENTS"></textarea>
	                </div>
	            </li>
	            <li class="answer">
	                <div class="tit">
	                    <label for="answerType">답변 희망형태</label>
	                </div>
	                <div class="field">
	                    <p>
	                        <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN1" value="Y" checked="checked" class="radio">
	                        <label for="MEM_ADV_MAIL_YN1">이메일</label>
	                    </p>
	                    <p>
	                        <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN2" value="T" class="radio">
	                        <label for="MEM_ADV_MAIL_YN2">전화상담</label>
	                    </p>
	                    <p>
	                        <input type="radio" name="MEM_ADV_MAIL_YN" id="MEM_ADV_MAIL_YN3" value="N" class="radio">
	                        <label for="MEM_ADV_MAIL_YN3">받지않음(마이페이지에서 확인)</label>
	                    </p>
	                </div>
	            </li>
	        </ul><!-- // form-a -->
	        </form>
	        <section id="searchCode" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #searchCode -->
	        	<dl class="ui-content">
			    	<dt>
			        	<h2>상품 검색</h2>
			        	<a href="javascript:$.com.util.layPop('close', $('#searchCode'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
			    	</dt>
			   		<dd class="dd_con_d">
						<form id="searchForm" name="searchForm">
						<input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>   
						<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
						<input type="hidden" id="searchPrdCtgIdx" name="searchPrdCtgIdx" value="<c:out value="${commandMap.searchPrdCtgIdx }"/>" />
						<input type="hidden" name="searchYn" value="Y" />
			     				<div class="section-search"><!-- section-search -->
								<ul class="form-a"><!-- form-a -->
									<li>
			   							<div class="tit">
			       							<label for="category1">카테고리 선택</label>
			   							</div>
			   							<div class="field">
			       						<p>
								            <label for="searchPrdCtgDepth1" class="sel_box_st0">
								                <select id="searchPrdCtgDepth1" name="searchPrdCtgDepth1" class="select" title="대카테고리">
								                    <option value="">대카테고리</option>
								                </select>
								            </label>
								        </p>
								        <p>
								            <label for="searchPrdCtgDepth2" class="sel_box_st0">
								                <select id="searchPrdCtgDepth2" name="searchPrdCtgDepth2" class="select" title="중카테고리">
								                    <option value="">중카테고리</option>
								                </select>
								            </label>
								        </p>
								        <p>
								            <label for="searchPrdCtgDepth3" class="sel_box_st0">
								                <select id="searchPrdCtgDepth3" name="searchPrdCtgDepth3" class="select" title="소카테고리">
								                    <option value="">소카테고리</option>
								                </select>
								            </label>
								        </p>
			   						</div>
								</li>
								<li>
								    <div class="tit">
								        <label for="productName">상품명</label>
								    </div>
								    <div class="field">
								        <input type="text" id="searchPrdMstNm" name="searchPrdMstNm" value="<c:out value="${commandMap.searchPrdMstNmKor }"/>" class="productName">
								    </div>
								</li>
								<li class="code">
								    <div class="tit">
								        <label for="productCode">상품코드</label>
								    </div>
			    					<div class="field">
			       						<input type="text" id="searchPrdMstCd" name="searchPrdMstCd" value="<c:out value="${commandMap.searchPrdMstCd }"/>" class="productName">
			          						<a href="javascript:search();" class="button primary small"><span>검색하기</span></a>
			       					</div>
			   					</li>
							</ul><!-- // form-a -->
						</div><!-- // section-search -->
						<div id="searchProductList">
							
						</div>
			   		</form>
			    	</dd>
				</dl>
	        </section>
	        <section id="searchNumber" data-role="popup" data-overlay-theme="a" class="popup_st0"><!-- #searchNumber -->
	            <dl class="ui-content">
	                <dt>
	                    <h2>주문 내역</h2>
	                    <a href="javascript:$.com.util.layPop('close', $('#searchNumber'))" class="btn_close"><span class="blind">팝업 닫기</span></a>
	                </dt>
	                <dd class="dd_con_d">
	
	                    <div class="padder mt20">
	                        <ul class="list list-a">
	                            <li>최근 6개월 동안의 주문내역입니다.</li>
	                        </ul>
	                    </div>
	
	                    <div id="searchOrderList">
							
						</div>
	                </dd>
	            </dl>
	        </section><!-- // #searchNumber -->
	        <div class="padder mt20">
	            <ul class="list list-a">
	                <li>파일 첨부는 PC용 사이트에서만 지원합니다.</li>
	                <li>문의하신 내용과 답변내용 확인하실 수 있습니다.</li>
	                <li>질문 내용에 만족하실만한 답변 작성을 위해서 시간 소요가 될 수 있는 점 양해 부탁드립니다.</li>
	                <li>답변완료된 문의는 수정 하실 수 없습니다.</li>
	            </ul>
	        </div>
	            
	        <div class="section-button"><!-- section-button -->
	            <a href="javascript:;" id="goRegist" class="button primary"><span>문의하기</span></a>
	        </div><!-- // section-button -->
				
		</article>
	<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>
		
	</section>

<%-- 각 화면 본문 끝 --%>

<%-- _downer.html : 풋터 모듈 및 개별 js 컴포넌트 삽입, 퍼포먼스 이슈로 하단에 배치하는 것이 좋습니다. --%>

<%-- 이하 아래 구문은 개별 jsp 에 항상 삽입 됩니다. --%>
<%@ include file="/WEB-INF/jsp/mobile/include/script.jsp" %>
<script type="text/javascript">
//<![CDATA[
$(function(){
	$(document).on("click , change", "#MEM_ADV_QST_TYPE_UP", function (){
    	var code = $("#MEM_ADV_QST_TYPE_UP").val();
    	getSubCodeList(code);
    	
    	if(code == "107" || code == "108"){
	    	if(code == "107"){//상품문의
	    		$("#MEM_ADV_MDL_NO").attr("disabled",false);
	    		$("#ORD_MST_CD").attr("disabled",true);
	    		$("#ORD_MST_CD").val("");
	    	}else if(code == "108"){//주문결제 문의
	    		$("#ORD_MST_CD").attr("disabled",false);
	    		$("#MEM_ADV_MDL_NO").attr("disabled",true);
	    		$("#MEM_ADV_MDL_NO").val("");
	    	}else{
	    		$("#MEM_ADV_MDL_NO").attr("disabled",true);
	    		$("#ORD_MST_CD").attr("disabled",true);
	    		$("#MEM_ADV_MDL_NO").val("");
	    		$("#ORD_MST_CD").val("");
	    	}
    	}else{
    		$("#MEM_ADV_MDL_NO").attr("disabled",true);
    		$("#ORD_MST_CD").attr("disabled",true);
    		$("#MEM_ADV_MDL_NO").val("");
    		$("#ORD_MST_CD").val("");
    	}
    });
	//문의유형 하위 불러오기
	getSubCodeList = function(code)
    {
    	$.ajax({
            type	: "POST",
            url : "<c:out value="${mobileDomain}" />/mobile/mypage/getSubCodeAjax.do",
            data	:  { "code":code},
            dataType : "JSON",
            async   : false,
            success	: function(data)
            {
                $("#MEM_ADV_QST_TYPE").empty().append("<option value=''>문의유형</option>");
                $.each(data.listCode, function(i,item) 
                {  
                	$("#MEM_ADV_QST_TYPE").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
                	 
                });
                com.sel_chg($("#MEM_ADV_QST_TYPE"), 'chg');

            },
            error   : function(xhr,status,error)
            { 
                alert("코드 호출 중 에러가 발생하였습니다.");
                //alert("code:"+xhr.status); 
            }
        });
    };
    
    fileDel = function(){
    	$("#multiFile1").val("");
    };
    
    //등록
    $(document).on("click", "#goRegist", function () {
    	var $frm = $("#frm");
    	if($("#MEM_ADV_MBL_YN").is(":checked") || $(":radio[name=MEM_ADV_MAIL_YN]:checked").val() == 'T'){
	    	if($.trim($("#MEM_ADV_HP1").val()) == ""){
				alert("휴대폰 번호 앞자리를 선택해주세요.");
				$("#MEM_ADV_HP1").focus();
				return;
			}
	    	
	    	if($.trim($("#MEM_ADV_HP2").val()) == ""){
				alert("휴대폰 번호 중간자리를 입력해주세요.");
				$("#MEM_ADV_HP2").focus();
				return;
			}
	    	
	    	if($.trim($("#MEM_ADV_HP3").val()) == ""){
				alert("휴대폰 번호 끝자리를 입력해주세요.");
				$("#MEM_ADV_HP3").focus();
				return;
			}
    	}
    	
//     	if($(":radio[name=MEM_ADV_MAIL_YN]:checked").val() == 'Y'){
//     		if($.trim($("#MEM_ADV_MAIL_ID").val()) == ""){
// 				alert("이메일 아이디을 입력해주세요.");
// 				$("#MEM_ADV_MAIL_ID").focus();
// 				return;
// 			}
	    	
// 	    	if($.trim($("#MEM_ADV_MAIL_DOMAIN").val()) == ""){
// 				alert("이메일 도메인을 입력해주세요.");
// 				$("#MEM_ADV_MAIL_DOMAIN").focus();
// 				return;
// 			}
//     	}
//     	if($.trim($("#MEM_ADV_MAIL_ID").val()) != "" && $.trim($("#MEM_ADV_MAIL_DOMAIN").val()) != ""){
//     		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
//     		//이메일 주소 
// 	    	$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val()+"@"+$("#MEM_ADV_MAIL_DOMAIN").val());
	    	
// 	    	if(!regEmail.test($("#MEM_ADV_MAIL").val())) {
// 	            alert('이메일 주소가 유효하지 않습니다');
// 	            $("#MEM_ADV_MAIL_DOMAIN").focus();
// 	            return false;
// 	        }
//     	}
    	
    	if($.trim($("#MEM_ADV_QST_TYPE_UP").val()) == ""){
			alert("문의유형을 선택해주세요.");
			$("#MEM_ADV_QST_TYPE_UP").focus();
			return;
		}
    	
    	if($.trim($("#MEM_ADV_QST_TYPE").val()) == ""){
			alert("문의유형의 상세유형을 선택해주세요.");
			$("#MEM_ADV_QST_TYPE").focus();
			return;
		}
    	
    	if($("#MEM_ADV_QST_TYPE_UP").val() == "107"){
    		if($("#MEM_ADV_MDL_NO").val() == ""){
    			alert("문의유형이 상품일 경우 상품코드를 등록해주세요.")
    			return;
    		}
    	}
    	
    	if($("#MEM_ADV_QST_TYPE_UP").val() == "108"){
    		if($("#ORD_MST_CD").val() == ""){
    			alert("문의유형이 주문일 경우 주문번호를 등록해주세요.")
    			return;
    		}
    	}
    	
    	
    	if($.trim($("#MEM_ADV_TITLE").val()) == ""){
			alert("제목을 입력해 주십시오.");
			$("#MEM_ADV_TITLE").focus();
			return;
		}
    	
    	if($.trim($("#MEM_ADV_CONTENTS").val()) == ""){
			alert("내용을 입력해 주십시오.");
			$("#MEM_ADV_CONTENTS").focus();
			return;
		}
    	
    	if(confirm("문의내역을 등록 하시겠습니까?"))
       	{
    		if($("#MEM_ADV_QST_TYPE_UP").val() == "107"){
    			$("#MEM_ADV_MDL_NO").attr("disabled",false);
    		}
			if($("#MEM_ADV_QST_TYPE_UP").val() == "108"){
				$("#ORD_MST_CD").attr("disabled",false);
    		}
			
			$("#MEM_ADV_MAIL").val($("#MEM_ADV_MAIL_ID").val() + "@" + $("#MEM_ADV_MAIL_DOMAIN").val());
    		$frm.attr({"action":"<c:out value="${mobileDomain}"/>/mobile/mypage/inquiryRegist.do", "target":"_self", "method":"post"}).submit();
       	}
    });
    
    //상품검색 팝업
    goPorductListPopup = function(){
    	var code = $("#MEM_ADV_QST_TYPE_UP").val();
    	if(code == "107"){
	 		$.com.util.layPop('open', $('#searchCode'), true);
    	}else{
    		alert("문의유형이 상품일때만 검색이 가능합니다.");
    		return;
    	}
    };
    //검색된 상품코드 적용
    fnResultProduct = function(prdMstCd){
    	$("#MEM_ADV_MDL_NO").val(prdMstCd);
    	$.com.util.layPop('close', $('#searchCode'));
    };
    
  	//주문내역 팝업
    goOrderListPopup = function(){
    	var code = $("#MEM_ADV_QST_TYPE_UP").val();
    	if(code == "108"){
    		$.com.util.layPop('open', $('#searchNumber'), true);
    	}else{
    		alert("문의유형이 주문/결제 일 때만 검색이 가능합니다.");
    		return;
    	}
    };
    
  	//검색된 주문번호 적용
    resultOrderCd = function(ordMstCd){
    	$("#ORD_MST_CD").val(ordMstCd);
    	$.com.util.layPop('close', $('#searchNumber'));
    };
    
 	// 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function () {
        $("#frm").attr({"action":"<c:out value="${mobileDomain}"/>/pc/mypage/myInquiryList.do", "target":"_self", "method":"post"}).submit();
    });
 	
 	// 이메일 도메인 select box 변경 이벤트
    $(document).on("click", "#emailDomainSelectbox", function () 
    {
        var $domain = $("#MEM_ADV_MAIL_DOMAIN");

        if($(this).val() == "")
        {
            $domain.prop("readonly", false);
            $domain.val("");
        }
        else
        {
            $domain.prop("readonly", true);
            $domain.val($(this).val());
            $("#memEmailDomain").html("");
        }
    });
 	
    if( $("#searchForm").find("input[name='searchPrdCtgIdx']").val() == "")
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");
    }
    else
    {
    	getCategoryList("searchPrdCtgDepth1", "-1", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");
    	getCategoryList("searchPrdCtgDepth2", "<c:out value="${commandMap.searchPrdCtgDepth1}" />", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");
    	getCategoryList("searchPrdCtgDepth3", "<c:out value="${commandMap.searchPrdCtgDepth2}" />", "<c:out value="${commandMap.searchPrdCtgDepth3}" />", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");
    }
	
	$(document).on("click", "#searchPrdCtgDepth1", function () 
    {
		getCategoryList("searchPrdCtgDepth2", $("#searchPrdCtgDepth1 option:selected").val(), "", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");
        getCategoryList("searchPrdCtgDepth3", "", "", "<c:out value="${mobileDomain}"/>", $("#searchPrdCtgEnv option:selected").val());

    });
    $(document).on("click", "#searchPrdCtgDepth2", function () 
    {
        getCategoryList("searchPrdCtgDepth3", $("#searchPrdCtgDepth2 option:selected").val(), "", "<c:out value="${mobileDomain}"/>", "<c:out value="${commandMap.PRD_CTG_ENV}" />");

    });
    
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

        // 상품 카테고리 검색 조건
        var searchCategoryIdx = "";
        var tempCategoryIdx = "";
        
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth1 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth2 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        tempCategoryIdx = $searchForm.find("#searchPrdCtgDepth3 option:selected").val();
        if (tempCategoryIdx != '')
        {
        	searchCategoryIdx = tempCategoryIdx;
        }
        $searchForm.find("#searchPrdCtgIdx").val(searchCategoryIdx);

        
        $.ajax({
            async : false,
            type : "POST",
            data : $searchForm.serialize(),
            dataType : "html",
            url : "<c:out value="${mobileDomain}" />/mobile/product/searchProductListAjax.do",
            success : function (data) 
            {
            	
            	if(data != null)
    			{
    				$("#searchProductList").html(data);
    			}
    			else
    			{
    				alert("조회된 데이터가 없습니다.");
    			}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
        });
    };
    
    goPage = function (cPage) 
    {
    	var $pageFrm = $("#searchForm");
        $pageFrm.find("input[name='cPage']").val(cPage);
        search();
    };
    
 	// 주문내역 검색
    searchOrdList = function() 
    {

	 	var $searchOrdForm = $("#searchOrdForm"); 

        $.ajax({
            async : false,
            type : "POST",
            data : $searchOrdForm.serialize(),
            dataType : "html",
            url : "<c:out value="${mobileDomain}" />/mobile/customer/orderInfoAjax.do",
            success : function (data) 
            {
            	if(data != null)
    			{
    				$("#searchOrderList").html(data);
    			}
    			else
    			{
    				alert("조회된 데이터가 없습니다.");
    			}
            },
            error : function (err)
            {
                alert("오류가 발생하였습니다.\n[" + err.status + "]");
            }
        });
    };
    
	// 페이지 이동
    goPage2 = function (cPage) 
    {
    	var $searchOrdForm = $("#searchOrdForm");
		$searchOrdForm.find("input[name='cPage']").val(cPage);
		searchOrdList();
    };
    
    searchOrdList();
    search();
});
//]]>
</script>
</body>
</html>