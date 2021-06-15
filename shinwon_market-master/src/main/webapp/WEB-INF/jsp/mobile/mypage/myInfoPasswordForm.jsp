<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="cp01">
                    <div class="alert_bx">
                        <p class="tit">개인정보를 안전하게 보호하기 위하여<br>비밀번호를 한번 더 입력해주세요.</p>
                    </div>
                    <div class="writeWrap">
                        <div class="name">비밀번호</div>
                        	<form id="frm" name="frm">
                        	<input type="hidden" name="memType" id="memType" value="<c:out value="${summaryMap.MEM_MST_MEM_GBN }"/>"/>
                        <div class="form">
                            <input type="password" id="MEM_MST_PW"	name="MEM_MST_PW" title="비밀번호" placeholder="비밀번호 입력">
                            <input type="text" id="hidden" style="display:none;"/>
                        </div>
                        </form>
                    </div>
                    <div class="btn_area half">
                        <button type="button" class="btn ok" onclick="goRegist();">확인</button>
                    </div>
                </div>

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->
<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>

<script src="/nas/cdn/MW/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/jquery.validate.js"></script>
<script src="<c:out value="${serverDomain}" />/nas/cdn/mobile/js/common.js"></script>
    <script type="text/javascript">
        $(".ootd_list").mCustomScrollbar({
            axis:"x",
            advanced:{
                autoExpandHorizontalScroll:true
            }
        });
        
        //엔터이벤트
        $(function(){
    		var $frm = $("#frm");
    		
    		$frm.find("#MEM_MST_PW").keydown(function (e) {
    	        if(e.keyCode == 13)
    	        {
    	            goRegist();
    	        }
    	    });
    		
    	//유효성 검증	
   		$frm.validate({
   	        rules: { MEM_MST_PW:{required:true, minlength:6, maxlength:15} // 비밀번호
   	        	/* MEM_MST_PW:{required:true, minlength:6, maxlength:15, etlandPw:true} // 비밀번호 */
   	        },
   	        messages: {
   	        	/* MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다.", etlandPw:"올바르지 않은 비밀번호 입니다. \n다시한번 입력해 주세요."} */
   	        	MEM_MST_PW: {required:"비밀번호를 입력해주세요.",minlength:"비밀번호는 최소 6글자 이상입니다.", maxlength:"비밀번호는 최대 15글자입니다."}
   	        }
   	        ,ignore: ":hidden"	// hidden 처리된 부분까지 defalut로 validate 체크를 하는데 무시하고 싶은 경우 활성화!
   	        ,onkeyup:false
   		    ,onclick:false
   		    ,onfocusout:false
   	        ,showErrors:function(errorMap, errorList){
   	 	       if(this.numberOfInvalids()) { 
   		    	   //var caption = $(errorList[0].element).attr('caption') || $(errorList[0].element).attr('id');
   		    	   //alert('[' + caption + '] ' + errorList[0].message);
   		    	   var errorOobjId = $(errorList[0].element).attr('id');
   		    	   var caption = $('#'+errorOobjId).parent().parent().children('.label').text();
   		    	   caption = caption.replace('*','').replace(/\s/gi,'');
   		    	   if(caption != null && caption != "") 
   		    	   {
   		    	       alert('[' + caption + '] ' + errorList[0].message);
   		    	   }
   		    	   else
   		    	   {
   		    	       alert(errorList[0].message);
   		    	   }
   		    	   $(errorList[0].element).focus();
   		       }
   	        }
   	    });
    		
   		goRegist = function(){
   			if($frm.valid()){
   	    		$.ajax({
   	                async : false,
   	                type : "POST",
   	                data : {"MEM_MST_PW":$("#MEM_MST_PW").val(),"MEM_MST_MEM_ID":"${commandMap.MEM_MST_MEM_ID}"},
   	                url : "<c:out value="${serverSslDomain}" />/mobile/mypage/checkPwAjax.do",
   	                success : function (data) {
   	                    if(data.successYn == "Y")
   	                    {
   	                        if(data.resultYn == "N")
   	                        {
   	                        	alert("올바르지 않은 비밀번호 입니다. \n다시한번 입력해 주세요.");
   	                        	$("#MEM_MST_PW").focus();
   	                        	return;
   	                        }
   	                        else
   	                        {
   	                        	$frm.attr({"action":"<c:out value="${serverSslDomain}" />/mobile/mypage/myInfoEditForm.do", "target":"_self", "method":"post"}).submit();
   	                        }
   	                    }
   	                    else
   	                    {
   	                        alert("데이터 전송중 데이터가 누락 되었습니다.\n다시 시도해 주십시오.");
   	                        return;
   	                    }
   	                },
   	                error : function () {
   	                    alert("데이터 오류 입니다. 다시 시도 해 주십시오.");
   	                }
   	            });
   	    	}
   	    };
   	});
    </script>