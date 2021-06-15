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

            <div class="container"><!-- container -->

                <h2 class="title"><span>쿠폰발행내역</span></h2>

                <h3 class="title"><span>온라인쿠폰발행내역</span></h3>

                <div class="tab-list"><!-- tab -->
                    <ul>
                        <li><a href="javascript:;" id="goEventEntryList">발행내역</a></li>
                        <li class="in"><a href="#none">관리자 발급</a></li>
                    </ul>
                </div><!-- // tab -->

                <form id="searchForm" name="searchForm">
                	<input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>쿠폰번호</span></th>
                                <td>
                                    <span><c:out value="${commandMap.CPN_MST_IDX}"/></span>
                                </td>
                            </tr>
                            <tr>
                                <th><span>쿠폰종류</span></th>
                                <td>${commandMap.CPN_MST_GBN_NM}</td>
                            </tr>
                            <tr>
                                <th><span>고객쿠폰명</span></th>
                                <td>
                                   	<span><c:out value="${commandMap.CPN_MST_TITLE}"/></span>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

				<h3 class="title"><span>관리자 발급</span></h3>
               	<form id="frm" name="frm" enctype="multipart/form-data">
               		<input type="hidden" name="CPN_MST_IDX" id="CPN_MST_IDX" value="${commandMap.CPN_MST_IDX}" />
                    <input type="hidden" name="CPN_MST_YN" id="CPN_MST_YN" value="${commandMap.CPN_MST_YN}" />
                    <input type="hidden" name="searchCpnMstGbn" value="<c:out value="${commandMap.searchCpnMstGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstTitle" value="<c:out value="${commandMap.searchCpnMstTitle }"/>"/>
                    <input type="hidden" name="searchCpnMstIdx" value="<c:out value="${commandMap.searchCpnMstIdx }"/>"/>
                    <input type="hidden" name="searchCpnMstIsuGbn" value="<c:out value="${commandMap.searchCpnMstIsuGbn }"/>"/>
                    <input type="hidden" name="searchCpnMstShopType" value="<c:out value="${commandMap.searchCpnMstShopType }"/>"/>
                    <input type="hidden" name="searchCpnMstUseYn" value="<c:out value="${commandMap.searchCpnMstUseYn }"/>"/>
                    <input type="hidden" name="searchCpnMstSeDt" value="<c:out value="${commandMap.searchCpnMstSeDt }"/>"/>
                    <input type="hidden" name="searchCpnMstStDt" value="<c:out value="${commandMap.searchCpnMstStDt }"/>"/>
                    <input type="hidden" name="searchCpnMstEdDt" value="<c:out value="${commandMap.searchCpnMstEdDt }"/>"/>
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="CPN_MST_GBN" value="<c:out value="${commandMap.CPN_MST_GBN }" />" />

               		<div class="grid section-button-list">
						<div class="text-right">
	                        <a href="#none" id="goMemberAdd" class="button small primary js-modal" title="새 창 으로 열립니다."><span>회원검색</span></a>
							<a href="#none" id="filePopup" class="button small"><span>파일선택</span></a>
	                    </div>
	         		</div>
        			<input type="hidden" name="rownum" id="rownum" value="0"/>
				 	<table class="table-col table-b" id="tableMember">
	                	<colgroup>
	                    	<col style="width: 10%;" />
							<col style="width: 15%;" />
							<col style="width: 35%;" />
							<col style="width: 40%;" />
	                  	</colgroup>
	                   	<thead>
	                  		<tr>
                                <th><input type="checkbox" class="checkbox checkAll"></th>
	                      		<th>NO</th>
								<th>고객명</th>
								<th>아이디</th>
	                       	</tr>
	                 	</thead>
	                    <tbody id="applyMemberList">
	                      	<tr id="MemberNodata"><!-- row -->
				            	<td colspan="4">회원을 검색해 주세요.</td>
				         	</tr>
	                  	</tbody>
	               	</table>
	               	<div class="grid section-button-list">
						<div class="text-right">
	                        <a href="#none" id="goRegist" class="button small primary js-modal" title="새 창 으로 열립니다."><span>쿠폰발급</span></a>
							<a href="#none" id="goList" class="button small"><span>목록</span></a>
	                    </div>
	         		</div>
               	</form>
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
<script src="<c:out value="${serverDomain}" />/am/js/vendor/jquery.tmpl.min.js"></script>
<script id="MemberTemplate" type="text/x-jquery-tmpl">
<tr>
    <td><input type="checkbox" class="checkbox checkRow" name="PRD_MEM_CDs" value="\${MEM_MST_MEM_ID}" /></td>
	<td>\${RNUM}</td>
	<td>\${MEM_MST_MEM_NM}<input type="hidden" name="APPLY_MEM_NMs" value="\${MEM_MST_MEM_NM}"/></td>
	<td>\${MEM_MST_MEM_ID}<input type="hidden" name="APPLY_MEM_IDXs" value="\${MEM_MST_MEM_ID}"/></td>
</tr>
</script>
<script>
$(function(){
	$(document).on("click", "#filePopup", function ()
	{
		popup('<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueUploadPopup.do',"550","300","no","_FilePopup");

	});

	/*--------------회원--------------------------*/

    //체크박스 전체 선택
    $.checkBoxSelect("checkAll", "checkRow");

    // 회원검색
    $(document).on("click", "#goMemberAdd", function ()
    {
    	window.open("<c:out value="${serverDomain}"/>/am/member/searchMemberPopup.do","searchMemberPopup","width=900,height=700,scrollbars=yes,target=_blank");

    });

  //회원 중복체크
    fnDuplicationChkMember = function( selectObj ){
		var bReturn = true;
    	var $obj = $("#applyMemberList input[name='PRD_MEM_CDs']");

    	$.each($obj, function(){
    		if( selectObj == $(this).val() ){
    			bReturn = false;
    			return false;
    		}
    	});
    	return bReturn;
    };

    //회원선택시 호출되는 메소드
    fnResultMember = function(params){
    	var bCheck = true;
    	var rnum = Number($("#rownum").val());
    	//회원중복체크
    	$.each( params, function( index, el ){
    		if( !fnDuplicationChkMember( el.MEM_MST_MEM_ID )){
    			alert("["+el.MEM_MST_MEM_ID+"] 이미 선택된 회원입니다.");
				bCheck = false;
    			return false;
    		}

    	});
    	if( bCheck ){

        	//배열재정의
        	var arrayObj = new Array();
    		var obj;
    		var searchType = "";
    		$.each(params, function(index,item){
    			rnum++;
        		obj = new Object();
        		obj.RNUM                = String(rnum);
        		//obj.MEM_MST_ERP_ID 		= item.MEM_MST_ERP_ID;
        		obj.MEM_MST_MEM_NM 		= item.MEM_MST_MEM_NM;
        		obj.MEM_MST_MEM_ID 		= item.MEM_MST_MEM_ID;

        		arrayObj.push(obj); //만들어진  object를 배열에 추가
        	});

    		    $("#rownum").val(rnum);
            	$("#MemberNodata").remove();
    			$( "#MemberTemplate" ).tmpl( arrayObj ).appendTo( "#applyMemberList" );

    		return true;
    	}
    };

    // 회원 선택삭제 이벤트
    $(document).on("click", "#goMemberDelete", function ()
    {
    	if( $(".checkRow:checked").length == 0 ){
    		alert("삭제할 회원을 선택하여 주십시오.");
    		return;
    	}
        $("#applyMemberList").children("tr").each(function()
        {
        	if ( $(this).find("input[name='PRD_MEM_CDs']").is(":checked") )
        	{
        		$(this).remove();
        	}
        });

        if ( $("#applyMemberList").children("tr").length == 0 )
        {
        	$("#applyMemberList").append('<tr id="MemberNodata"><td colspan="3">협력업체를 검색해 주세요.</td></tr>');
        }
        //체크박스 전체 선택
        $(".checkAll").prop("checked", false);

    });


    /*--------------회원 끝--------------------------*/

	 // 탭 클릭 이벤트
    $(document).on("click", "#goEventEntryList", function () {
        $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueDet.do", "target" : "_self", "method" : "post"}).submit();
    });

 	// 상세페이지 이동
    $(document).on("click", "#list-field .list-title", function () {
        var $frm = $("#frm");
        var $this = $(this);
        $frm.find("input[name='CPN_MST_IDX']").val($this.data("cpn_mst_idx"));
        var viewType = $this.data("view_type");
        var url = "";
        if(viewType == "view")
        {
        	url = "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueDet.do";
        }

        $frm.attr({"action":url, "target":"_self", "method":"get"}).submit();
    });

    // 페이지 사이즈 변경 이벤트
    $(document).on("change", "select[name='pageSize']", function () {
        goPage(1);
    });

 // 등록 이벤트
    $(document).on("click", "#goRegist", function() {

    	if( $(".checkRow:checked").length == 0 ){
    		alert("[회원] 반드시 선택해 주십시오.");
            $("#memberPopup").focus();
            return;
    	}

    	if (confirm("쿠폰발급 하시겠습니까?"))
  		{
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueRegist.do", "target" : "_self", "method" : "post"}).submit();
        }

    });
    $(document).on("click", "#goList", function ()
    {
      	$("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/marketing/onlineCouponIssueList.do", "target":"_self", "method":"post"}).submit();
    });

});
</script>

</body>
</html>
