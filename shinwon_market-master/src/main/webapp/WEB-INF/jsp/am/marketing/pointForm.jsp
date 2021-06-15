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

                <h2 class="title"><span>포인트 적립/차감</span></h2>

                <form id="searchForm">
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchEvtMstShopType" value="<c:out value="${commandMap.searchEvtMstShopType }"/>"/>
                    <input type="hidden" name="searchEvtMstStDt" value="<c:out value="${commandMap.searchEvtMstStDt }"/>"/>
                    <input type="hidden" name="searchEvtMstEdDt" value="<c:out value="${commandMap.searchEvtMstEdDt }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchEvtMstType" value="<c:out value="${commandMap.searchEvtMstType }"/>"/>
                    <input type="hidden" name="searchEvtMstUseYn" value="<c:out value="${commandMap.searchEvtMstUseYn }"/>"/>
                    <input type="hidden" name="searchEvtMstGubun" value="<c:out value="${commandMap.searchEvtMstGubun }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="searchEvtMstStatus" value="<c:out value="${commandMap.searchEvtMstStatus }"/>"/>
                </form>

                <div class="section-title"><!-- section-title -->
                    <h3 class="title"><span>회원선택</span></h3>
                    <div class="more">
                        <a href="#none" id="memberPopup" class="button small primary"><span>회원검색</span></a>
                        <a href="#none" id="" class="button small primary"><span>샘플다운로드</span></a>
                        <a href="#none" id="filePopup"class="button small primary datepicker"><span>엑셀업로드</span></a>
                    </div>
                </div><!-- // section-title -->

                <form id="frm" name="frm">
                    <input type="hidden" name="rownum" id="rownum" value="0"/>

                    <table cellspacing="0" class="table-row table-a">
                        <colgroup>
                            <col style="width: 25%;" />
                            <col style="width: 25%;" />
                            <col style="width: 25%;" />
                            <col style="width: 25%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="checkbox checkAll" checked/></th>
                                <th>NO</th>
                                <th>고객명</th>
                                <th>아이디</th>

                            </tr>
                        </thead>
                        <tbody class="applyMemberList">
                            <tr class="memberNodata"><!-- row -->
                                <td class="td_no_result">회원을 선택해 주세요.</td>
                            </tr>
                        </tbody>
                    </table>

                    <h3 class="title"><span>적립/차감(<i class="require"><em>필수입력</em></i> 필수입력)</span></h3>

                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>포인트구분 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="PIT_MST_GBN" id="stateA" class="radio" value="P"checked="checked"/>
                                    <label for="stateA">적립</label>
                                    <input type="radio" name="PIT_MST_GBN" id="stateB" class="radio" value="M"/>
                                    <label for="stateB">차감</label>
                                </td>
                            </tr>
                            <tr>
                                <th><span>포인트내역 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select id="PIT_MST_BRK_DWN" name="PIT_MST_BRK_DWN" class="select" title="구분">
                                        <option value="">선택</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>포인트 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="PIT_MST_PIT" id="PIT_MST_PIT" class="text onlyNumber" maxlength="10" />
                                </td>
                            </tr>
                            <tr class="pointPeriod">
                                <th><span>포인트 소멸기간</span></th>
                                <td>
                                    <a href="javascript:;" class="js-datepickr"><span class="icon datepickr"><em>날짜선택</em></span></a>
                                    <input type="text" class="text" id="BNR_MST_ST_DT" name="BNR_MST_ST_DT" readonly="readonly" data-target-end="#BNR_MST_ED_DT" value="<ui:formatDate value="${row.BNR_MST_ST_DT }" pattern="yyyy-MM-dd"/>"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>상세내역</span></th>
                                <td>
                                    <textarea cols="30" rows="10"></textarea>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>


				<div class="section-button"><!-- section-button -->
					<div class="wrap text-center">
						<a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
					</div>
				</div><!-- // section-button -->

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

<%-- <script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.js"></script>
<script src="<c:out value="${serverDomain}" />/am/js/jquery.MultiFile.extend.js"></script> --%>
<script id="memberTemplate" type="text/x-jquery-tmpl">
<tr>
    <td>\${RNUM}</td>
    <td>\${NAME}</td>
    <td>\${ID}<input type="hidden" name ="ID" class="ID" value="\${ID}"/></td>
    <td><input type="checkbox" class="checkbox checkRow" name="ID_CHK" value="\${ID}" checked/> </td>
</tr>
</script>
<script>
$(function(){

	$.checkBoxSelect("checkAll", "checkRow");
    $("#frm").find(".checkAll").prop("checked", true);

    getSubCodeList("P");

    $(document).on("click", "#memberPopup", function ()
    {
        popup('<c:out value="${serverDomain}" />/am/member/searchMemberPopup.do',"1200","700","no","_MemberPopup");

    });

    $(document).on("click", "#filePopup", function ()
    {
        popup('<c:out value="${serverDomain}" />/am/marketing/pointMemberUploadPopup.do',"600","300","no","_FilePopup");

    });

    // 목록 버튼 클릭 이벤트
    $(document).on("click", "#goList", function() {
        $("#searchForm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/pointList.do", "target" : "_self", "method" : "post"}).submit();
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function() {
        if($("#rownum").val() == "0")
        {
            alert("[회원] 반드시 선택해 주십시오.");
            $("#memberPopup").focus();
            return;
        }

        if($("#PIT_MST_GBN").val() == "")
        {
            alert("[구분] 반드시 선택해 주십시오.");
            $("#PIT_MST_GBN").focus();
            return;
        }

        if($("#PIT_MST_BRK_DWN").val() == "")
        {
            alert("[포인트내역] 반드시 선택해 주십시오.");
            $("#PIT_MST_BRK_DWN").focus();
            return;
        }

        if($("#PIT_MST_PIT").val() == "")
        {
            alert("[포인트] 반드시 입력해 주십시오.");
            $("#PIT_MST_PIT").focus();
            return;
        }

        if (confirm("저장 하시겠습니까?"))
        {
            $("#frm").attr({"action" : "<c:out value="${serverDomain}" />/am/marketing/pointFormRegist.do", "target" : "_self", "method" : "post"}).submit();
        }

    });
});

getSubCodeList = function(code)
{

    $.ajax({
        type    : "POST",
        url : "<c:out value="${serverDomain}" />/am/marketing/pointCodeAjax.do",
        data    :  { "code":code},
        dataType : "JSON",
        async   : false,
        success : function(data)
        {
            var selected = "";
            $("#PIT_MST_BRK_DWN").empty().append("<option value=''>전체</option>");
            $.each(data.list, function(i,item)
            {

                $("#PIT_MST_BRK_DWN").append("<option value='"+item.CMN_COM_IDX+"'>"+item.CMN_COM_NM+"</option>");
            });

        },
        error   : function(xhr,status,error)
        {
            alert("포인트내역 호출 중 에러가 발생하였습니다.");
            //alert("code:"+xhr.status);
        }
    });
};


//현재 행 삭제
function rowDelete(row)
{
    $(row).parent().parent().remove();

}

fnDuplicationChk = function( selectObj ){

    var bReturn = true;
    var $memberBox = $(".table-a");
    var $obj = $memberBox.find(".applyMemberList .ID");
    $.each($obj, function(){
        if(selectObj == $(this).val()){
            bReturn = false;
            return false;
        }
    });
    return bReturn;
};
fnResultMember = function(params){
    var $memberBox = $(".table-a");
    var bCheck = true;
    var rnum = Number($("#rownum").val());

    //상품중복체크
    $.each( params, function( index, el ){
        if( !fnDuplicationChk( el.ID )){
            alert("["+el.ID+"] 이미 선택된회원입니다.");
            bCheck = false;
            return false;
        }
    });

    if( bCheck ){

        //기본TR삭제
        $memberBox.find(".memberNodata").remove();
        //배열재정의

        var arrayObj = new Array();

        var obj;

        $.each(params, function(index,item){
            rnum++;

            obj = new Object();
            obj.RNUM = String(rnum);
            obj.ID = item.MEM_MST_MEM_ID;
            obj.ERP_ID = item.MEM_MST_ERP_ID;
            obj.NAME = item.MEM_MST_MEM_NM;

            arrayObj.push(obj); //만들어진  object를 배열에 추가
        });
        $("#rownum").val(rnum);
        $( "#memberTemplate" ).tmpl( arrayObj ).appendTo($memberBox.find(".applyMemberList"));

    }

    return true;

};

$(document).on("click", "#stateA", function ()
{
    $('.pointPeriod').show();
});
$(document).on("click", "#stateB", function ()
{
    $('.pointPeriod').hide();
});
</script>

</body>
</html>
