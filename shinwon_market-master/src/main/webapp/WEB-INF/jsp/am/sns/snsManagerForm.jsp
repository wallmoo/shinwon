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

                <h2 class="title"><span>SNS 관리</span></h2>

                <h3 class="title"><span>등록</span></h3>
                
                <p>
                    <i class="require"><em>필수입력</em></i> 표시된 항목은 필수 입력 사항입니다.
                </p>

                <form id="searchForm" name="searchForm">
                    <input type="hidden" name="pageSize" value="<c:out value="${commandMap.pageSize }"/>" />
                    <input type="hidden" name="cPage" value="<c:out value="${commandMap.cPage }"/>"/>
                    <input type="hidden" name="searchStartDate" value="<c:out value="${commandMap.searchStartDate }"/>"/>
                    <input type="hidden" name="searchEndDate" value="<c:out value="${commandMap.searchEndDate }"/>"/>
                    <input type="hidden" name="searchSnsType" value="<c:out value="${commandMap.searchSnsType }"/>"/>       
                    <input type="hidden" name="searchSnsUseYn" value="<c:out value="${commandMap.searchSnsUseYn }"/>"/>       
                </form>
 
                <form id="frm" name="frm">
                    <table cellspacing="0" class="table-row table-a"><!-- table -->
                        <colgroup>
                            <col style="width: 15%; min-width: 180px;" />
                            <col style="width: auto;" />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>SNS 구분코드 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <select class="select" name="SNS_MST_TYPE" id="SNS_MST_TYPE">
                                        <option value="">선택</option>
                                        <c:if test="${not empty codeList }">
                                            <c:forEach var="codeRow" items="${codeList }" varStatus="i">
                                                <option value="<c:out value="${codeRow.CMN_COM_IDX }"/>">
                                                    <c:out value="${codeRow.CMN_COM_NM }"/>
                                                </option>     
                                            </c:forEach>
                                        </c:if> 
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS API_KEY <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="text" name="SNS_MST_API_KEY" id="SNS_MST_API_KEY" class="text long"/>
                                </td>
                            </tr>
                            <tr>
                                <th><span>SNS 사용여부 <i class="require"><em>필수입력</em></i></span></th>
                                <td>
                                    <input type="radio" name="SNS_MST_USE_YN" id="stateA" value="Y" class="radio" checked="checked"/>
                                    <label for="stateA">사용</label>
                                    <input type="radio" name="SNS_MST_USE_YN" id="stateB" value="N" class="radio" /> 
                                    <label for="stateB">미사용</label>
                                </td>
                            </tr>
                        </tbody>
                    </table><!-- // table -->
                </form>

                <div class="section-button"><!-- section-button -->
                    <div class="wrap text-center">
                        <a href="javascript:;" id="goRegist" class="button large primary"><span>저장</span></a>
                        <a href="javascript:;" id="goList" class="button large"><span>목록</span></a>
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

<script>    
$(function(){  
        
    // 폼체크 : validate 따로 설치 후 확인
    $("#frm").validate({  
        rules: {  
            SNS_MST_TYPE:{required:true},     // SNS 구분코드
            SNS_MST_API_KEY:{required:true},  // SNS API_KEY
            SNS_MST_USE_YN:{required:true}    // SNS 사용여부
        },
        messages :   
        {              
            SNS_MST_TYPE: {required:" [SNS 구분코드]는 필수 정보입니다."},
            SNS_MST_API_KEY: {required:" [SNS API_KEY]는 필수 정보입니다."},
            SNS_MST_USE_YN: {required:" [SNS 사용여부]는 필수 정보입니다."}
        },
        autoMessage: false  // label text 자동완성 해제
    });   
    
    $(document).on("change", "#SNS_MST_TYPE", function(){
        
        var snsTypeNm = $.trim($("#SNS_MST_TYPE option:selected").text());
        
        $.ajax({      
            type: "POST", 
            data: {"SNS_MST_TYPE": $("#SNS_MST_TYPE").val()},  // SNS 타입 이름
            dataType: "JSON",
            async: false,   
            url: "<c:out value="${serverDomain}" />/am/sns/checkSnsTypeAjax.do",
            
            success : function (data) {
                if(data.successYn == "Y")
                {   
                    if(data.resultYn == "Y")  
                    {   
                        
                    }
                    else  
                    {   
                        alert("해당 " + snsTypeNm + "(은)는 이미 활성화 중입니다.");
                        $("#SNS_MST_TYPE option:eq(0)").prop("selected", true);
                        $("#SNS_MST_TYPE").focus();  
                    }  
                    
                    return;
                }  
                else
                {
                    alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
                    $("#SNS_MST_TYPE option:eq(0)").prop("selected", true);
                    $("#SNS_MST_TYPE").focus();  
                    return;
                }
            },
            error : function () {
                alert("데이터 오류입니다. 다시 시도 해 주십시오.");
                $("#SNS_MST_TYPE option:eq(0)").prop("selected", true);
                $("#SNS_MST_TYPE").focus();  
            }
            
        }); 
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });

    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
        
        var $frm = $("#frm"); 
        
        if($frm.valid()){ 
              
            if($("#SNS_MST_TYPE").val() == "")
            {
                alert("[SNS구분코드]반드시 선택해 주십시오.");
                $("#SNS_MST_TYPE").focus();
                return;
            }
            
            if($.trim($("#SNS_MST_API_KEY").val()) == "")
            {
                alert("[SNS API_KEY]반드시 입력해 주십시오.");
                $("#SNS_MST_API_KEY").focus();
                return;
            }
        
            if (confirm("저장 하시겠습니까?")) {
                $("#frm").attr({"action":"<c:out value="${serverDomain}" />/am/sns/snsManagerRegist.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
});
</script>

</body>
</html>
