<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="zipcode-wrap" style="display:none; border-bottom: solid 1px #ccc; width:100%;height:300px; position:relative; margin-bottom: 5px; left: 0; top: 0; z-index: 9999;">
<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
</div>

<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>

<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('zipcode-wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
    
$(function(){
	$(document).on("click", ".search-zipcode", function(e) {
		e.preventDefault();
		var post1_id = $(this).data("post1_id");
		var post2_id = $(this).data("post2_id");
		var addr1_id = $(this).data("addr1_id");
		var addr2_id = $(this).data("addr2_id");
		
		var new_post_id = $(this).data("new_post_id");
		var new_addr1_id = $(this).data("new_addr1_id");
		var new_addr2_id = $(this).data("new_addr2_id");
		
		var opener_fn = $(this).data("opener_fn");
        
		 // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
		 
        new daum.Postcode({
            oncomplete: function(data) {
            	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	        	// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
	            var extraRoadAddr = ''; // 도로명 조합형 주소 변수
	
	            // 법정동명이 있을 경우 추가한다.
	            if(data.bname !== ''){
	                extraRoadAddr += data.bname;
	            }
	            // 건물명이 있을 경우 추가한다.
	            if(data.buildingName !== ''){
	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	            }
	            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	            if(extraRoadAddr !== ''){
	                extraRoadAddr = ' (' + extraRoadAddr + ')';
	            }
	            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
	            if(fullRoadAddr !== ''){
	                fullRoadAddr += extraRoadAddr;
	            }else{
	            	//도로명 주소가 없는 경우 지번 주소로 대체한다.
	            	fullRoadAddr =  data.jibunAddress;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            //document.getElementById("sample4_postcode1").value = data.postcode1;
	            //document.getElementById("sample4_postcode2").value = data.postcode2;
	            //document.getElementById("sample4_roadAddress").value = fullRoadAddr;
	            //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	            
	            $("#"+post1_id).val(data.postcode1);
	            $("#"+post2_id).val(data.postcode2);
	            $("#"+addr1_id).val(data.jibunAddress);
	            //$("#"+addr2_id).focus();
	            
	            $("#"+new_post_id).val(data.zonecode);
	            $("#"+new_addr1_id).val(fullRoadAddr);
	            $("#"+new_addr2_id).focus();
	            
	            if(opener_fn != undefined){
	            	window[opener_fn].call();
	            }
	
	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	            /* if(data.autoRoadAddress) {
	                //예상되는 도로명 주소에 조합형 주소를 추가한다.
	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                document.getElementById("guide").innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	
	            } else if(data.autoJibunAddress) {
	                var expJibunAddr = data.autoJibunAddress;
	                document.getElementById("guide").innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	
	            } else {
	                document.getElementById("guide").innerHTML = '';
	            } */

	            
	            // iframe을 넣은 element를 안보이게 한다.
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+"px";
                $('#modalScroll').trigger('refresh.pushr');
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    });
});
</script>