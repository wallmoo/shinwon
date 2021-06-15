<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>

<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
</head>
<body class="page-popup">
    <div class="modal">
        <div class="modal-wrapper">
            <div class="modal-inner">
                <h3 class="title"><span>상품일괄수정</span></h3>
                <form id="frm" name="frm" enctype="multipart/form-data">
                    <table class="table-row table-a">
                        <colgroup>
                            <col style="width:15%;">
                            <col style="width:auto;">
                            <col style="width:15%;">
                        </colgroup>
                        <tbody>
                            <tr>
                                <th><span>파일첨부</span></th>
                                <td>
									<div class="tbl_line">
										<input type="file" name="file" id="file" class="" accept=".xls">
										<a href="javascript:;" id="update" class="button button-a goBrandPopup"><span>적용</span></a>
									</div>
									<div class="tbl_line">
										<p class="txt_warn">xls 파일만 첨부할 수 있습니다.</p>
									</div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                <h3 class="title result" style="display:none;"><span>처리결과</span></h3>
                <table class="table-row table-a result" style="display:none;">
                    <colgroup>
                        <col style="width:15%;">
                        <col style="width:auto;">
                        <col style="width:15%;">
                    </colgroup>
                    <tbody>
                        <tr>
                            <th><span>처리결과</span></th>
                            <td>전체 업로드 상품수 : <em id="all"></em>개</td>
	                        <td><a href="#none" id="excelDown" class="button  primary"><span>엑셀 다운로드</span></a></td>
                        </tr>
                        <tr>
                            <th><span>성공개수</span></th>
                            <td colspan="2"><em id="successN"></em>개</td>
                        </tr>
                        <tr>
                            <th><span>실패개수</span></th>
                            <td  colspan="2">
                            	<ul>
	    	                        <li><em id="failN"></em>개</li>
	    	                        <li>■ 실패상세내역</li>
	    	                        <li>
	    	                        	<table class="table-row table-a table-col">
	    	                        		<colgroup>
												<col style="width: 10%;" />
												<col style="width: 10%;" />
												<col style="width: auto;" />
											</colgroup>
											<thead>
												<tr>
													<th>NO</th>
													<th>엑셀 행 번호</th>
													<th>실패상세내역</th>
												</tr>
											</thead>
											<tbody id="failList">
											</tbody>
	    	                        	</table>
	    	                        </li>
    	                        </ul>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="grid section-button-search">
					<a href="#none" id="closePopup" class="button small"><span>닫기</span></a>
				</div>
				<div class="exp_plan_box">
					<h4>유의사항</h4>
					<ul class="zum_list">
						<li>CSV 파일 등록 시 샘플 엑셀 파일의 '쇼핑몰상품명/세트상품여부/set_product1/set_product2/네이버지식쇼핑/컬러관리/성별' 을 입력 후 [파일등록] 버튼 클릭 시 선택된 세트상품이 일괄 등록됩니다.
							<ol class="cicle_num_list">
								<li>세트 상품 ERP 코드 : 자동 생성되므로 등록시에는 값을 넣지 마세요.</li>
								<li>쇼핑몰상품명 : 상품의 기본 상품명을 설정할 수 있습니다.</li>
								<li>세트상품여부 : 상품의 세트여부를 설정할 수 있습니다. (Y : 기본값)</li>
								<li>set_product1* : 숫자 9자리의 1번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
								<li>set_product2* : 숫자 9자리의 2번 상품의 TAG코드를 입력할 수 있습니다. (필수 데이터로 입력하지 않은 경우 저장 불가능)</li>
								<li>네이버지식쇼핑 : 네이버쇼핑 노출여부를 설정할 수 있습니다. (Y : 노출, N : 노출안함)</li>
								<li>컬러관리 : 상품의 컬러옵션을 설정할 수 있습니다.</li>
								<li>성별 : 상품의 주요 사용 성별을 설정할 수 있습니다. (M : 남성, W : 여성, F : 유니섹스)</li>
							</ol>	
						</li>
					</ul>
				</div>
				                
				<form id="failFrm" name="failFrm">
					<input type="hidden" id="selectedFailList" name="selectedFailList" value=""/>
				</form>
            </div>
        </div>
    </div>
    <script src="<c:out value="${serverDomain}" />/am/js/ui.js"></script>
    <script src="<c:out value="${serverDomain}" />/am/js/common.js"></script>
    <script>
    	var failList = null;

    	$(document).on("click","#closePopup",function(){
    		self.close();
    	}); 

    	// 엑셀 다운로드
    	$(document).on("click", "#excelDown", function () {
    		if(failList.length > 10000){
    			alert("엑셀 다운로드는 10000건 이하만 가능합니다.");
    			return;
    		}else if(failList.length == 0){
    			alert("저장할 내역이 없습니다.");
    			return;
    		}
    		var $searchForm = $("#failFrm");
    		$searchForm.attr({"action": "<c:out value="${serverDomain}" />/am/product/basicProductBatchEditListDownload.do", "target":"_self", "method":"post"}).submit();
    	});

    	$(document).on("click","#update",function(){
    		if($("#file").val() == ""){
    			alert("선택 된 파일이 없습니다.");
    			return;
    		}

    		var $frm = $("#frm");
            var value = $frm.find("#file").val();
            var ext = value.slice(value.indexOf(".") + 1).toLowerCase();
            if("xls" != ext)
            {
                alert(".xls 파일만 업로드 가능합니다.\n파일확장자를 확인해 주십시오.");
                return;
            }
            else
            {
            	
            	var data = new FormData();
                $.each($('#file')[0].files, function(i, file) {          
                    data.append('file', file);
                });
				$.ajax
                ({
                    async : false,
                    type : "POST",
                    data : data,
                    processData: false,
                    contentType: false,
                    url : "<c:out value="${serverDomain}" />/am/product/basicProductBatchEditExcelAjax.do",
                    success : function (data) 
                    { 
                    	$("#all").text(data.allSize);
                    	$("#successN").text((data.allSize - data.failList.length));
                    	$("#failN").text(data.failList.length);                    	
                    	$("#totalCount").text(data.failList.length);

                        if(data.failList.length > 0){
                        	failList = data.failList;
                        	var html = "";
                        	var obj;
                        	
                        	for(var i=0; i<failList.length; i++){
                        		obj = failList[i];
                        		html += "<tr>\
                        					<td>" + (failList.length-i) + "</td>\
                        					<td>" + obj.row + "</td>\
                        					<td>" + obj.PRD_MST_NM_BEFORE + "</td>\
                        			    </tr>";
                        	}
                        	$("#failList").html(html);

                    		$("#selectedFailList").val(JSON.stringify(failList));
                        } else{
                        	$("#failList").html("<tr><td class='td_no_result' colspan='3'>데이터가 없습니다.</td></tr>");
                        }
                        
                        

                    	$(".result").show();
                    },
                    error : function (err)
                    {
                        alert("오류가 발생하였습니다.\n[" + err.status + "]");
                    }
                });
            	
            	
                //$frm.attr({"action":"<c:out value="${serverDomain}" />/am/marketing/pointMemberUpload.do", "target":"_self", "method":"post"}).submit();
            }
    	}); 
   	</script>		
</body>
</html>