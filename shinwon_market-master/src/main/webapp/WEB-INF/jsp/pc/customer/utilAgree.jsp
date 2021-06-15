<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.dim{display:block}
.layer{display:block;top:50%;left:50%;margin:-320px 0 0 -455px}
</style>
<!-- <script type="text/javascript" src="/nas/cdn/pc/js/com.js"></script> -->
<div class="sub_content">
                <div class="dim"></div>

                <div id="layer_benefit" class="layer type03 is_btn">
                    <div class="layer_header">
                        <h2>서비스이용약관</h2>
                    </div>
                    <div class="layer_content">
                        <div class="agree_box">
                            <c:out value="${serviceTermAgreement.BRD_AGR_CONTENTS}" escapeXml="false"/>
                        </div>
                    </div>
                    <div class="layer_footer">
                        <div class="btn_wrap">
                            <button type="button" class="btn_large purple" onclick="hideModalFn();">확인</button>
                        </div>
                    </div>
                    <a href="javascript:void(0)" class="btn_layer_close" onclick="hideModalFn();">레이어 닫기</a>
                </div>
            </div>
<script>
	function hideModalFn(){
		$("#utilAgreePop").hide();
		$(".dim").hide();				
	}
</script>          