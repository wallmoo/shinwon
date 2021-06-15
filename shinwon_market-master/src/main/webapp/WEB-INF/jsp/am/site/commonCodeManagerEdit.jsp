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

                <h2 class="title"><span>공통코드 관리</span></h2>

                <h3 class="title"><span>수정</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm">
                    <input type="hidden" name="CMN_COM_IDX" value="${row.CMN_COM_UP_IDX }" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchType" value="<c:out value="${commandMap.searchType }"/>"/>
                    <input type="hidden" name="searchWord" value="<c:out value="${commandMap.searchWord }"/>"/>
                    <input type="hidden" name="searchCmnComUseYn" value="<c:out value="${commandMap.searchCmnComUseYn }"/>"/>
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                </form>
                
                <form id="frm" name="frm">
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
	                        <c:if test="${not empty row }">
	                             <input type="hidden" name="CMN_COM_IDX" value="${row.CMN_COM_IDX }" />
	                            <input type="hidden" name="CMN_COM_LEVEL" value="${row.CMN_COM_LEVEL}" />
	                            <input type="hidden" name="CMN_COM_UP_IDX" value="${row.CMN_COM_UP_IDX }"/>
	                            <input type="hidden" name="CMN_COM_TOP_IDX" value="${row.CMN_COM_TOP_IDX }"/>
	                            
	                            <tr>
	                                <th><span>최상위코드 / 최상위 코드명</span></th>
	                                <td>
	                                    <c:out value="${row.CMN_COM_TOP_IDX }"/> / <c:out value="${row.CMN_COM_TOP_NM }"/>
	                                </td>
	                            </tr>
	                            <tr>
	                                <th><span>상위 코드 / 상위 코드명</span></th>
	                                <td>  
	                                    <c:out value="${row.CMN_COM_UP_IDX }" /> / <c:out value="${row.CMN_COM_UP_NM }"/>
	                                </td>
	                            </tr>
	                        </c:if>  
                            <tr>
                                <th><span>코드</span></th>
                                <td>
                                    <c:out value="${row.CMN_COM_IDX }"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>코드명 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="CMN_COM_NM" id="CMN_COM_NM" class="text" value="<c:out value="${row.CMN_COM_NM }"/>" maxlength="40"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>참조1</span></th>
                                <td>
                                    <input type="text" name="CMN_COM_ETC1" id="CMN_COM_ETC1" class="text xlarge" value="<c:out value="${row.CMN_COM_ETC1 }"/>" maxlength="50"/>
                                </td>
                            </tr>
                            <tr>   
                                <th><span>참조2</span></th>
                                <td>
                                    <input type="text" name="CMN_COM_ETC2" id="CMN_COM_ETC2" class="text xlarge" value="<c:out value="${row.CMN_COM_ETC2 }"/>" maxlength="50"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>참조3</span></th>  
                                <td>
                                    <input type="text" name="CMN_COM_ETC3" id="CMN_COM_ETC3" class="text" style="width:95%;" value="<c:out value="${row.CMN_COM_ETC3 }"/>" maxlength="1000"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>사용설정 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" id="stateA" name="CMN_COM_USE_YN" value="Y" class="radio" <c:if test="${row.CMN_COM_USE_YN eq 'Y' }">checked="checked"</c:if>/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" id="stateB" name="CMN_COM_USE_YN" value="N" class="radio" <c:if test="${row.CMN_COM_USE_YN eq 'N' }">checked="checked</c:if>/>
                                    <label for="stateB">미사용</label>
                                </td>  
                            </tr>
                        </tbody>  
                    </table><!-- // table -->
                </form>
                
                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <c:if test="${not empty row }">
                            <a href="#none" id="goEdit" class="button large"><span>상위 코드 목록</span></a>
                        </c:if>  
                        <a href="#none" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="#none" id="goList" class="button large"><span>목록</span></a>
                    </div>
                </div><!-- // section-button -->
                
                <h3 class="title"><span>하위 코드 리스트</span></h3>
                
                <div class="grid section-button-list"><!-- 목록 상단 버튼 -->
                    <div class="col-1-2 text-left">  
                        <ui:pageSizeBox value="${paging.pageSize }" name="pageSize" type="" jsFunction="goPage"/>
                        <span class="pages">(총 <strong class="em"><c:out value="${paging.totalRecordCount }" /></strong>건)</span>
                    </div>
                    <div class="col-1-2 text-right">
                        <a href="#none" id="modifySort" class="button small"><span>순서 저장</span></a>
                        <a href="#none" id="goForm" class="button small primary datepicker"><span>하위 코드 등록</span></a>
                    </div>
                </div><!-- // 목록 상단 버튼 -->
                     
                
                <form id="childForm" name="childForm">
                    <input type="hidden" name="CMN_COM_IDX" value="${row.CMN_COM_IDX }" />
                    
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 3%;" />
                            <col style="width: 2%;" />
                            <col style="width: 10%;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: auto;" />
                            <col style="width: 10%;" />
                            <col style="width: 10%;" />
                        </colgroup>
                        <thead>
                            <tr>
                                <th colspan="2">순서</th>
                                <th>코드</th>
                                <th>코드 명</th>
                                <th>참조1</th>
                                <th>참조2</th>
                                <th>참조3</th>
                                <th>등록일</th>
                                <th>상태</th>
                            </tr>
                        </thead>
                        <tbody class="sort-target">
                            <c:choose>
                                <c:when test="${not empty list }">
                                    <c:set var="listNum" value="${paging.listNum}" />
                                    <c:forEach var="row" items="${list }" varStatus="i">
                                        <tr>
                                            <td>
                                                <a href="#none" class="row-sort" data-sort_type="up">△</a>
                                                <a href="#none" class="row-sort" data-sort_type="down">▽</a>
                                            </td>
                                            <td class="col-sort" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>"><c:out value="${row.CMN_COM_SORT }"/></td>
                                            <td><c:out value="${row.CMN_COM_IDX }"/></td>
                                            <td>
                                                <a href="#none" class="list-title" data-cmn_com_idx="<c:out value="${row.CMN_COM_IDX }"/>">
                                                    <c:out value="${row.CMN_COM_NM }"/>
                                                </a>
                                            </td>
                                            <td><c:out value="${row.CMN_COM_ETC1 }"/></td>
                                            <td><c:out value="${row.CMN_COM_ETC2 }"/></td>
                                            <td><c:out value="${row.CMN_COM_ETC3 }"/></td>
                                            <td><ui:formatDate value="${row.CMN_COM_REG_DT }" pattern="yyyy.MM.dd HH:mm:ss"/></td>
                                            <td><c:out value="${row.CMN_COM_USE_YN eq 'Y'?'사용':'미사용' }"/></td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="9">검색 조건을 선택하신 후, 검색해 주십시오.</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>  
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
<script src="<c:out value="${serverDomain}" />/am/js/webtoolkit.base64.js" charset="utf-8"></script>

<script>    
$(function(){  
        
	// 폼체크
    $("#frm").validate({
        rules: {
            ADM_MNU_NM:{required:true}, // 코드 명
            CMN_COM_USE_YN:{required:true} // 상태
        }
        
    });
    
    // 상위 코드 목록 버튼 클릭 이벤트
    $(document).on("click", "#goEdit", function () {
        $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/commonCodeManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/commonCodeManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
    
    
    // 저장버튼 클릭 이벤트
    $(document).on("click", "#goRegist", function () {
        var $frm = $("#frm"); 
        if($frm.valid()){
            if (confirm( "저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/site/commonCodeManagerModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 하위 코드 등록 버튼 클릭 이벤트
    $(document).on("click", "#goForm", function () {
        $("#childForm").attr({"action":"<c:out value="${serverDomain}" />/am/site/commonCodeManagerForm.do", "target":"_self", "method":"post"}).submit();
    });
    
    // 제목 a Tag 클릭 이벤트
    $(document).on("click", ".list-title", function () {
        var $childForm = $("#childForm");
        $childForm.find("input[name='CMN_COM_IDX']").val($(this).data("cmn_com_idx"));
        $childForm.attr({"action":"<c:out value="${serverDomain}" />/am/site/commonCodeManagerEdit.do", "target":"_self", "method":"post"}).submit();
    });
    
    
    // 공통코드 순서 변경 이벤트
    $(document).on("click", ".row-sort", function () {
        
        var $this = $(this);
        var $tr = $this.parent().parent();
        var type = $this.data("sort_type");
        
        if(type == "up")
        {
            var $prevTr = $tr.prev(); 
            if($prevTr.length > 0)
            {
                var $trClone = $tr.clone();
                $prevTr.before($trClone);
                $tr.remove();    
            }
            else
            {
                alert("최 상위 순서 입니다.");
                return;
            } 
        }
        else
        {
            var $nextTr = $tr.next();
            if($nextTr.length > 0)
            {
                var $trClone = $tr.clone();
                $tr.next().after($trClone);
                $tr.remove();
            }
            else
            {
                alert("최 하위 순서 입니다.");
                return;
            }
        }
        
        $(".sort-target").find("tr").each(function (i) {
            $(this).find(".col-sort").text(i+1);
        });
    });
    
    // 공통코드 순서 저장 버튼 클릭 이벤트  
    $(document).on("click", "#modifySort", function () {
        if (confirm( "저장 하시겠습니까?")) {
            var idxArray = new Array();
            var sortArray = new Array();
            
            $(".sort-target").find("tr").each(function (i) {
                var $tr = $(this).find(".col-sort");
                idxArray.push($tr.data("cmn_com_idx"));
                sortArray.push($tr.text());
            });
            
            $.ajax ({
               async : false,
               type : "POST",
               url : "<c:out value="${serverDomain}" />/am/site/commonCodeManagerSortArrayAjax.do", 
               data : {"CMN_COM_IDX":idxArray, "CMN_COM_SORT":sortArray},
               success : function (data) {
                   alert(data.message);
               },
               error : function () {
                   alert("오류가 발생하였습니다.\n다시 시도 해 주십시오.");   
               }
            });
        }
    });
     
});
</script>

</body>
</html>
