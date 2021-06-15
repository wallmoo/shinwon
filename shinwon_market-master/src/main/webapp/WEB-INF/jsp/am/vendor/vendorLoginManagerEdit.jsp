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
            <div class="holder"><!-- holder -->
                <div id="lnb" class="container">
                    <div class="wrap modules"><!-- modules -->
                        <div class="title">

                        </div>
                        <div class="core"></div>
                    </div><!-- // modules -->
                </div>
            </div><!-- // holder --></div><!-- // aside -->

        <div id="wrapper"><!-- wrapper -->

            <div id="breadcrumb"></div><!-- breadcrumb -->

            <div id="contents"><!-- contents -->

                <div class="container">

                    <h2 class="title"><span>입점사업무공유관리</span></h2>

                    <h3 class="title"><span>상세</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>
                    <form id="frmProductPlanPopup" name="frmProductPlanPopup" method="post">
    						<input type="hidden" id="searchPrdMstCd" name="searchPrdMstCd" />
    				</form>
                    <form name="frm" id="frm" enctype="multipart/form-data">
                    <div class="section-form"><!-- section-form-a -->
                        <input type="hidden" name="PLN_PRD_CTG_TOP_NM" id="PLN_PRD_CTG_TOP_NM" value="" />

    			  		<table cellspacing="0" class="table-row table-a"><!-- table -->
    	                    <colgroup>
    	                        <col style="width: 15%;" />
    	                        <col style="width: auto;" />
    	                    </colgroup>
    	                    <tbody>
                                <tr>
                                    <th rowspan="2"><span>공유대상</span></th>
    	                            <td>슈퍼관리자</td>
                                </tr>
                                <!-- 입점사 선택시 활성화 -->
                                <tr>
                                    <td class="left">
                                        <table class="table-row table-a" id="tableCategory">
                                            <colgroup>
                                                <col style="width: 10%;">
                                                <col style="width: auto;">
                                                <col style="width: 20%;">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th>NO</th>
                                                    <th>입점사명</th>
                                                    <th>브랜드</th>
                                                </tr>
                                            </thead>
                                            <tbody id="applySpecCategoryList_P">
                                                <tr>
                                                    <td>2</td>
                                                    <td>입점사B</td>
                                                    <td>브랜드B</td>
                                                </tr>
                                                <tr>
                                                    <td>1</td>
                                                    <td>입점사A</td>
                                                    <td>브랜드A</td>
                                                </tr>
                                            </tbody>
                                        </table>
	                                </td>
                                </tr>
                                <!-- //입점사 선택시 활성화 -->
    	                    	<tr>
                                    <th><label class="label"><span>업무구분</span></label></th>
    	                    		<td>이벤트</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>제목</span></label></th>
    	                    		<td>2020 S/S 시즌 쿠폰 이벤트 업무 확인요청</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>내용<i class="require"><em>필수입력</em></i></span></label></th>
    	                    		<td>
                                        퓨즈 담당자 김도영입니다. <br/>
                                        2020 S/S 시즌을 맞이하여 쿠폰 이벤트를 진행하고자 합니다.<br/>
                                        내용은 아래와 같습니다.<br/>
                                        Fuz 브랜드 주문 시 10% 할인 쿠폰 제공<br/>
                                        주문금액 제한 없음<br/>
                                        위 프로모션 내용 확인 부탁드리며, 회신 기다리겠습니다.<br/>
                                        감사합니다.<br/>
    	                    		</td>
    	                        </tr>
                                <tr>
    	                    		<th><label class="label"><span>첨부파일</span></label></th>
                                    <td>
                                        <p><a href="javascript:;">WF7A1018.jpg</a></p>
                                        <p><a href="javascript:;">WF7A1018.jpg</a></p>
                                    </td>
    	                        </tr>
                                <tr>
                                    <th><label class="label"><span>작성자</span></label></th>
                                    <td>immd(입점사담당자)</td>
                                </tr>
                                <tr>
                                    <th><label class="label"><span>등록일</span></label></th>
                                    <td>2019-12-25 14:23:23</td>
                                </tr>
    	                    </tbody>
                    	</table><!-- // table -->
                    </div>
                    </form>

                    <h3 class="title"><span>답변하기</span></h3>
                    <p>
                       <span><i class="require"><em>필수입력</em></i></span> 표시된 항목은 필수 입력 사항입니다.
                    </p>

                    <form id="frm" name="frm" >
                        <input type="hidden" name="BRD_INQ_IDX" value="4267"/>
                        <input type="hidden" name="cPage" value=""/>
                        <input type="hidden" name="searchStartDate" value=""/>
                        <input type="hidden" name="searchEndDate" value=""/>
                        <input type="hidden" name="searchRegNm" value=""/>
                        <input type="hidden" name="searchRegId" value=""/>
                        <input type="hidden" name="searchKeyword" value=""/>
                        <input type="hidden" name="searchBrdInqReplyCd" value=""/>
                        <input type="hidden" name="searchBrdInqUseYn" value=""/>
                        <input type="hidden" name="searchVdrMstIdx" id="searchVdrMstIdx" value=""/>
                        <input type="hidden" name="pageSize" value="20"/>
                        <input type="hidden" name="searchPrdMstErpCd" value="" />

                        <!-- 메일/SMS전송을 위한 정보 -->
                        <input type="hidden" name="BRD_INQ_TYPE" value="Q"/><!-- 문의유형 -->
                        <input type="hidden" name="BRD_INQ_REG_NM" value="김소영"/><!-- 문의자 이름 -->
                        <input type="hidden" name="BRD_INQ_REG_ID" value="sosoworld2"/><!-- 문의자 ID -->
                        <input type="hidden" name="BRD_INQ_EMAIL" value="@"/><!-- 메일 주소 -->
                        <table cellspacing="0" class="table-row table-a"><!-- table -->
                            <colgroup>
                                <col style="width: 20%;" />
                                <col style="width: auto;" />
                            </colgroup>
                            <tbody>
                                <tr>
                                    <th><label class="label"><span>답변상태</span></label></th>
                                    <td>
                                        답변완료
                                    </td>
                                </tr>
                                <tr>
                                    <th><label class="label"><span>답변내용<i class="require"><em>필수입력</em></i></span></label></th>
                                    <td>
                                        <textarea class="textarea xlarge" name="BRD_INQ_REPLY_CONTENTS" id="BRD_INQ_REPLY_CONTENTS" style="height: 500px; width:80%;">&lt;p&gt;다음주 입고 예정입니다.222&lt;/p&gt;</textarea>
                                    </td>
                                </tr>
                                <tr>
                                    <th><label class="label"><span>답변자</span></label></th>
                                    <td>
                                        admin(슈퍼관리자) / 2019.12.04 11:28:29
                                    </td>
                                </tr>
                            </tbody>
                        </table><!-- // table -->
                    </form>
                    <div class="section-button"><!-- section-button -->
                        <div class="wrap text-center">
                            <a href="#none" id="goRegist" class="button primary"><span>저장</span></a>
                            <a href="#none" id="goList" class="button"><span>목록</span></a>
                        </div>
                    </div><!-- // section-button -->



                </div>

            </div><!-- // contents -->

        </div><!-- // wrapper -->

        <div id="quickmenu" class="aside right"><!-- quickmenu-->
            <div class="holder"><!-- holder -->

                <div id="quick" class="container">

                    <div class="wrap modules"><!-- modules -->
                        <ul class="core">
                            <li class="d2 active">
                                <a href="javascript:;" class="d2"><span>admin 님</span></a>
                                <div class="d3 show"><!-- d3 -->
                                    <ul class="d3">
                                        <li class="d3">
                                            <a href="http://bo.marketplanta.epasscni.com/am/manager/logout.do" class="d3"><span>로그아웃</span></a>
                                        </li>
                                    </ul>
                                </div><!-- // d3 -->
                            </li>
                        </ul>
                    </div><!-- // modules -->

                </div>

            </div><!-- // holder --></div><!-- // quickmenu -->

    </div><!-- // container -->

<div id="footer">
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</div>  
  
<%@ include file="/WEB-INF/jsp/am/include/script.jsp" %>
<link rel="stylesheet" type="text/css" href="<c:out value="${serverDomain}" />/am/css/postAddr.css">
<script src="<c:out value="${serverDomain}" />/am/js/postAddr.js"></script>   

<script>    
$(function(){    
        
var $frm = $("#frm");
    
    // 폼체크
    $frm.validate({
        rules: {
            VDR_LGN_NM:{required:true}, // 입점업체명
            VDR_LGN_CEO_NM:{required:true}, // 대표자명
            VDR_LGN_TYPE:{required:true}, // 사업자구분
            VDR_LGN_POST5:{required:true, number:true, maxlength:5}, // 신 우편번호 5자리
            VDR_LGN_DR_ADDR1:{required:true}, // 도로명 기본 주소
            VDR_LGN_DR_ADDR2:{required:true}, // 도로명 상세 주소
            VDR_LGN_JB_ADDR1:{required:true}, // 지번 기본 주소
            VDR_LGN_JB_ADDR2:{required:true}, // 지번 상세 주소
            VDR_LGN_MAIL:{required:true , email:true, maxlength:50}, // 이메일(대표)
            VDR_LGN_JRD_NO1:{required:false, maxlength:6, minlength:6}, // 법인등록번호 숫자 체크
            VDR_LGN_JRD_NO2:{required:false, maxlength:7, minlength:7}  // 법인등록번호 숫자 체크
        },
        messages :{
            VDR_LGN_MAIL : {email:"이메일 주소를 올바로 입력해 주십시오."}          
        }
    });
    
    // 목록 버튼 클릭 이벤트 
    $(document).on("click", "#goList", function () {
       $("#searchForm").attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerList.do", "target":"_self", "method":"post"}).submit(); 
    });
     
    // 등록 이벤트
    $(document).on("click", "#goRegist", function () {
       
        if($frm.valid()){
           
            if (confirm( "저장 하시겠습니까?")) {
                $frm.attr({"action":"<c:out value="${serverDomain}" />/am/vendor/vendorLoginManagerModify.do", "target":"_self", "method":"post"}).submit();
            }
        }
    });
    
    // 임시 비밀번호 발급
    /*     sendTempPw = function(venLgnIdx){
            $.ajax({
                type:"post",
                url : "<c:out value="${serverDomain}" />/am/vendor/sendVendorMemTempPwAjax.do",
                data : {"VDR_LGN_IDX": venLgnIdx},
                dataType : "json",
                async : false,
                success : function (data) 
                {
                    if(data.resultYn == "Y")        
                    {
                        alert("임시 비밀번호가 발송되었습니다.");
                    }
                    else
                    {
                        alert("임시 비밀번호 발송 도중 에러가 발생하였습니다.");
                        return;
                    }
                },
                error : function (err)
                {
                    alert("오류가 발생하였습니다.\n[" + err.status + "]");
                }
            }); 
        }; 
    });*/

});  
  
/*우편번호찾기 > 선택한 주소의 데이터 콜백 */
function openApiDivCallBack(roadFullAddr,roadAddrPart1,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn, detBdNmList){
    document.frm.VDR_LGN_POST5.value = zipNo ;
    document.frm.VDR_LGN_DR_ADDR1.value = roadAddrPart1 + roadAddrPart2 ;
    document.frm.VDR_LGN_DR_ADDR2.value = "" ;
    document.frm.VDR_LGN_JB_ADDR1.value = jibunAddr;
    document.frm.VDR_LGN_JB_ADDR2.value = "";
    document.getElementById('popAddrSearch').style.display='none';  //div 닫기
    //검색 후 해당 주소를 선택 -> div 닫음
}  
</script>

</body>
</html>
