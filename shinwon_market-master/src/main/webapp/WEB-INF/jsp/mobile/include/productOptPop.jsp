<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<input type="hidden" name="PRD_MST_CD" id="PRD_MST_CD" value="" />
<input type="hidden" name="MEM_CRT_DLV_GBN" id="MEM_CRT_DLV_GBN" value="" />
<input type="hidden" name="PRD_MST_PRICE" id="PRD_MST_PRICE" value="" />
<script src="<c:out value="${cdnDomain}" />/pc/js/vendor/jquery.tmpl.min.js"></script>
<script id="optionChoiceTemplate" type="text/x-jquery-tmpl">
<div class="f optionDtl">
	<input type="hidden" name="OPT_DTL_IDXs" id="OPT_DTL_IDXs" value = "\${OPT_DTL_IDX}" />
	<input type="hidden" name="OPT_DTL_CNTs" id="OPT_DTL_CNTs" value = "\${OPT_DTL_STK_CNT}" />
	<input type="hidden" name="OPT_PRD_PRCs" id="OPT_PRD_PRCs" value = "\${OPT_PRD_PRC}" />
	<input type="hidden" name="PRD_OPT_EST_YNs" id="PRD_OPT_EST_YNs" value = "\${PRD_OPT_EST_YN}" />
	<input type="hidden" name="PRD_DTL_PRCs" id="PRD_DTL_PRCs" value = "0" />
	<strong class="tx_1">{{html OPT_TITLE}}(\${OPT_DTL_ADD_PRC})</strong>
	<strong class="tx_2">
	{{if PRD_OPT_CNT_YN == 'Y'}}
		<label for="inp_amount2" class="inp_amount _amounyt_ck">
			<span class="blind">구매수량 변경</span>
			<select id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" data-role="none">
				<c:forEach begin="1" end="50" step="1" var="num">
					<option value="<c:out value="${num }" />"><c:out value="${num }" /></option>	
				</c:forEach>
			</select>
			<strong class="tx_num">1</strong>
			<a href="javascript:void(0)" id="dnOptDtlCnt" class="btn_valD"><i>-</i><span class="blind">구매수량 1 내리기</span></a>
			<a href="javascript:void(0)" id="upOptDtlCnt" class="btn_valU"><i>+</i><span class="blind">구매수량 1 올리기</span></a>
		</label>
	{{else}}
		<input type="hidden" value="1" id="REQUEST_CNT_\${OPT_DTL_IDX}" name="REQUEST_CNT_\${OPT_DTL_IDX}" style="width:30px;" />
		<span class="tx_2">1개</span>
	{{/if}}
	</strong>
	<strong class="tx_3">
		\${OPT_PRD_PRICE}원
		<a href="javascript:void(0);" id="optionDtlDel" class="btn_del2"><span class="blind">현제 옵션 삭제</span></a>
	</strong>
</div>
</script>
<script>
$(function(){
	//옵션추가
	$(document).on("change","select[name=getoptDtlCho]" , function(){
		var myArray;
		var obj;
		var arrayObj = new Array();
		
		//console.log("::::>" + $(this).val());
		if($(this).val() != ""){
			myArray = $(this).val().split('^');
			var isbreak = false;
			//이미 선택된 옵션인지 체크
			$("input[name=OPT_DTL_IDXs]").each(function(idx){
				if($(this).val() == myArray[2]){
					alert("이미 선택 된 옵션입니다.");
					isbreak = true;
					return false;
				}
			});
			$("#applyOptionChoiceList").show();

			var prdMstPrc = $("#PRD_MST_PRICE").val();
						
			if(!isbreak){
				obj = new Object();
				obj.PRD_OPT_NM = myArray[0];	//옵션 마스터 옵션명
				obj.OPT_DTL_NM = myArray[1];	//옵션 상세터 옵션명
				obj.OPT_DTL_IDX = myArray[2];	//옵션 상세 Idx
				obj.OPT_DTL_STK_CNT = myArray[4];	//옵션 수량
				
				if(myArray[3] > 0){
					obj.OPT_DTL_ADD_PRC = "+" + myArray[3];	//옵션 추가가격
				}else{
					obj.OPT_DTL_ADD_PRC = myArray[3];	//옵션 추가가격
				}
				obj.PRD_OPT_EST_YN = myArray[5];	//필수옵션 Y / 선택옵션 N
				obj.PRD_OPT_CNT_YN = myArray[6];	//수량선택옵션 Y / 선택옵션 N
				var prdOptPrice = 0;
				
				if(obj.PRD_OPT_EST_YN == "Y"){
					obj.OPT_TITLE = "<i class=\"ico_v\"></i>" + obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(prdMstPrc) + parseInt(obj.OPT_DTL_ADD_PRC);
				}else{
					obj.OPT_TITLE = "<span class=\"co_blu\">[선택]</span>" + obj.PRD_OPT_NM + ":" + obj.OPT_DTL_NM;
					prdOptPrice = parseInt(obj.OPT_DTL_ADD_PRC);
				}
				
				obj.OPT_PRD_PRICE = setComma(prdOptPrice);
				obj.OPT_PRD_PRC = prdOptPrice;
				
				if(obj.OPT_DTL_STK_CNT < 1){
					alert("해당 옵션은 재고가 없습니다.");
					return false;
				}
				
				arrayObj.push(obj); //만들어진  object를 배열에 추가
	
				$("#optionChoiceTemplate").tmpl( arrayObj ).appendTo("#applyOptionChoiceList");
				setTotalPrice(); //금액 계산
			}
		}
	});
	//옵션 삭제
	$(document).on("click","#optionDtlDel",function(){
		var $this = $(this).parent("strong").parent(".optionDtl");
		$this.remove();
		if($("#applyOptionChoiceList").find(".optionDtl").length == 0){
			$("#applyOptionChoiceList").hide();
		}
		setTotalPrice();
	});
	//옵션수량 증가
	$(document).on("click","#upOptDtlCnt",function(){
		
		var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
		var $optTxtNum = $this.find(".tx_num");
		
		if(parseInt($optUpCnt) + 1 > 50){
			alert("옵션 수량은 최대 50개 입니디.");
			$optTxtNum.text(parseInt(1));
			$optUpObj.val(parseInt(1));
			return false;
		}else{
			if($optDtlCnt < parseInt($optUpCnt) + 1){
				alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
				$optTxtNum.text(parseInt(1));
				$optUpObj.val(parseInt(1));
				return;
			}else{
				$optTxtNum.text(parseInt($optUpCnt) + 1);
				$optUpObj.val(parseInt($optUpCnt) + 1);
			}
		}
		
		setTotalPrice();
	});
	//셀렉트박스로 수량 증가 및 감소
	$(document).on("change","select[id^=REQUEST_CNT_]",function(){
		//필수,선택 옵션 수량 변경 일 때만
		if($(this).attr("name") != "REQUEST_CNT_0"){
			var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
			var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
			var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
			var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
			var $optDtlCnt = $this.find("input[name=OPT_DTL_CNTs]").val();	//재고
			var $optTxtNum = $this.find(".tx_num");
			
			if($optUpCnt > 50){
				alert("옵션 수량은 최대 50개 입니디.");
				$optTxtNum.text(parseInt(1));
				$optUpObj.val(parseInt(1));
				return false;
			}else{
				if($optDtlCnt < parseInt($optUpCnt) + 1){
					alert("옵션의 재고수량은 총["+$optDtlCnt+"] 입니다.");
					$optTxtNum.text(parseInt(1));
					$optUpObj.val(parseInt(1));
					return;
				}else{
					$optTxtNum.text(parseInt($optUpCnt));
					$optUpObj.val(parseInt($optUpCnt));
				}
			}
			
			setTotalPrice();
		}
	});
	
	//옵션수량 감소
	$(document).on("click","#dnOptDtlCnt",function(){
		
		var $this = $(this).parent("label").parent("strong").parent(".optionDtl");
		var $optIdx = $this.find("input[name=OPT_DTL_IDXs]").val();
		var $optUpObj = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]");
		var $optUpCnt = $this.find("select[name=REQUEST_CNT_"+$optIdx+"]").val();	// 옵션수량
		var $optTxtNum = $this.find(".tx_num");
		
		if($optUpObj.val() - 1 < 1){
			alert("옵션의 최하 수량은 1입니다.");
			$optUpObj.val(1);
		}else{
			$optTxtNum.text(parseInt($optUpCnt) - 1);
			$optUpObj.val(parseInt($optUpCnt) - 1);
		}
		setTotalPrice();
	});
	
	//구매금액 계산
	setTotalPrice = function(){
		var totPrdPrice = 0;
		var addPirce = 0;
		var optPrdPrc = 0;	//옵션 가격
		var optSelCnt = 0;
		var prdMstPrc = $("#PRD_MST_PRICE").val();
		var prdOptEstCnt = 0;
		var buyPrdCnt = $("#REQUEST_CNT_0").val() == undefined ? 0 : $("#REQUEST_CNT_0").val();	//구매 상품수량
		
		//console.log("prdMstPrc:::::::::>" + prdMstPrc);
		//console.log("buyPrdCnt:::::::::>" + buyPrdCnt);
		
		//필수옵션 여부(선택된 옵션중 필수 옵션 여부)
		$(".optionDtl").find("input").each(function(){
			if($(this).attr("name") == "PRD_OPT_EST_YNs" && $(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		//console.log("prdOptEstCnt::::>" + prdOptEstCnt);
		
		var prdOptMstEstCnt = 0;
		//필수옵션 여부(옵션 선택 셀렉스박스)
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptMstEstCnt ++;
			}
		});
		
		//console.log("prdOptMstEstCnt:::::::>" + prdOptMstEstCnt);
		
		//console.log("PRD_DTL_PRCs::::::::::>"+ $("input[name=PRD_DTL_PRCs]"));
		//console.log("OPT_DTL_IDXs length::::::::::>" + $("input[name=OPT_DTL_IDXs]").length);
		
		//금액 계산
		$("input[name=PRD_DTL_PRCs]").each(function(idx){
			//console.log("idx:::::>" + idx);
			optPrdPrc = $("input[name=OPT_PRD_PRCs]").eq(idx).val();	//옵션가
			prdDtlPrcs = $("input[name=PRD_DTL_PRCs]").eq(idx);		//해당 옵션 선택에 대한 총 가격
			optDtlIdx = $(".optionDtl input[name=OPT_DTL_IDXs]").eq(idx).val();
			optSelCnt = $("select[name=REQUEST_CNT_"+optDtlIdx+"]").val();	//해당 옵션의 선택 수량
			
			//console.log("optPrdPrc::::::>" + optPrdPrc);
			//console.log("prdDtlPrcs:::::>" + prdDtlPrcs);
			//console.log("optDtlIdx::::::>" + optDtlIdx);
			//console.log("optSelCnt::::::>" + optSelCnt);
			
			if(buyPrdCnt > 0){//옵션 마스터의 필수옵션이 없을 때(주 상품 수량)
				if(idx == 0){
					addPirce = parseInt(prdMstPrc) * parseInt(buyPrdCnt);
				}else{
					addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);	
				}
			}else{
				addPirce = parseInt(optPrdPrc) * parseInt(optSelCnt);
			}
			prdDtlPrcs.val(addPirce);
		});

		//옵션에 가격 총 계산
		$("input[name=PRD_DTL_PRCs]").each(function(){
			totPrdPrice = parseInt(totPrdPrice) + parseInt($(this).val());
		});
		if(totPrdPrice == 0){
			totPrdPrice = prdMstPrc;
		}else{
			if(prdOptEstCnt < 1 && buyPrdCnt < 1){//선택한 옵션의 필수 옵션 여부
				totPrdPrice = parseInt(prdMstPrc) + parseInt(totPrdPrice);
			}
		}
	};
	//레이어 닫기
	layerClose = function(){
		$("#optLayerForm").find("input").each(function(idx){
    		var $tag = $(this);
    		switch($tag.attr("type"))
    		{
    			case "hidden" : 
    				$tag.val('');
    		}
    	});
		$("#applyOptionChoiceList").empty();
		$.com.util.layPop('close', $('#layOpt'), true);
	};

	//레이어 호출
	optlayer = function(prdMstCd, prdMstPrice){
    	$("#optlayer").load("<c:out value="${mobileDomain}" />/mobile/product/productOptionView.do", {"prdMstCd":prdMstCd}, function(){
    		if($('#layOpt-popup').length) $('#layOpt-popup').remove();
    		$('#layOpt').popup({role:'popup', overlayTheme: 'a'});
    		$.com.util.layPop('open', $('#layOpt'), true);
    		$("#PRD_MST_CD").val(prdMstCd);
    		$("#PRD_MST_PRICE").val(prdMstPrice);
    	});
	};
	
	optlayer2 = function(prdMstCd, prdMstPrice){
    	$("#optlayer").load("<c:out value="${mobileDomain}" />/mobile/product/productOptionView.do", {"prdMstCd":prdMstCd, "esmCart":"T"}, function(){
    		if($('#layOpt-popup').length) $('#layOpt-popup').remove();
    		$('#layOpt').popup({role:'popup', overlayTheme: 'a'});
    		$.com.util.layPop('open', $('#layOpt'), true);
    		$("#PRD_MST_CD").val(prdMstCd);
    		$("#PRD_MST_PRICE").val(prdMstPrice);
    	});
	};
	
	$(document).on("click", "#btn_ok", function(){
		
		var crtMemCrtDlvGbn	= 2096;
		
		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		$("#MEM_CRT_DLV_GBN").val(crtMemCrtDlvGbn);
		
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				alert("선택하신 옵션중 수량이 잘못된 옵션이 있습니다.");
				cartResult = false;
				return;
			}
		});
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}
		
		if(cartResult){
			var _list			= $('.optionDtl');
			
			var opt_dtl_idxs	= "";
			var prd_dtl_prcs	= "";
			var opt_cnt			= "";
			var opt_text		= "";
			var chk				= $("#chk_pr_"+prdMstCd);
			var opt				= $("#opt_" + prdMstCd);
			var li				= $("#li_" + prdMstCd);
			var optIcon			= $("#pot_" + prdMstCd);
			
			$.each(_list, function(i){
				
				var	_this = $(this);	
				//console.log(_this);
					_OPT_DTL_IDXs	= _this.find('#OPT_DTL_IDXs').val(),
					_PRD_DTL_PRCs	= _this.find('#PRD_DTL_PRCs').val(),
					_REQUEST_CNT	= _this.find("#REQUEST_CNT_" + _OPT_DTL_IDXs).val(),
					_PRD_OPT_EST_YNs= _this.find("#PRD_OPT_EST_YNs").val(),
					_OPT_TEXT		= _this.find(".tx_1").text();
				
				chk.prop("checked", true);
				
				opt_text			+= '<span class="tx_opt" data-prd_dtl_price="'+ _PRD_DTL_PRCs +'" data-opt_idx="'+ _OPT_DTL_IDXs +'" data-prd_mst_cd="'+ prdMstCd + '" data-opt_cnt="'+ _REQUEST_CNT + '" data-opt_est_yn="' + _PRD_OPT_EST_YNs + '" >' + _OPT_TEXT + '<a href="javascript:void(0);" id="optDel" class="btn_del"><span class="blind">옵션삭제</span></a></span>';
			
			});
			
			opt.html(opt_text);
			optIcon.remove();
			var TOT_PRD_MST_PRC = $("#TOT_PRD_MST_PRC").val();
			var TOT_PRD_PRC		= $("#TOT_PRD_PRC").val();
			var tabIdx			= $("#tabIdx").val();
			
			li.find(".pr_m strong").text(setComma(TOT_PRD_PRC));
			li.find(".sel_m strong").text(setComma(TOT_PRD_MST_PRC));
			$.com.thema.total_prc(tabIdx);
		
		}else{
			alert("예상 외 오류가 발생 하였습니다.\n다시 시도해주세요.");
			return;
		}
		
		layerClose();
	});
	
	$(document).on("click", "#btn_esm", function(){
		
		var crtMemCrtDlvGbn	= 2096;
		
		var prdMstCd = $("#PRD_MST_CD").val();
		var cartResult = true;
		
		if(prdMstCd == ""){
			alert("필수 요소가 없습니다.\n다시 시도해주세요.");
			cartResult = false;
			return;
		}
		
		$("#MEM_CRT_DLV_GBN").val(crtMemCrtDlvGbn);
		
		//옵션 수량 체크
		var optDtlIdx = 0;	//옵션키
		var optDtlCnt = 0;	//옵션수량
		
		$("input[name=OPT_DTL_IDXs]").each(function(idx){
			optDtlIdx = $(this).val();
			optDtlCnt = parseInt($("input[name=OPT_DTL_CNTs]").eq(idx).val());
			if(parseInt($("input[name=REQUEST_CNT_"+optDtlIdx+"]").val()) > optDtlCnt){
				alert("선택하신 옵션중 수량이 잘못된 옵션이 있습니다.");
				cartResult = false;
				return;
			}
		});
		
		var prdOptEstCnt = 0;
		var prdOptEstYns = 0;
		//필수옵션 여부
		$("input[name=PRD_OPT_EST_YN]").each(function(){
			if($(this).val() == "Y"){
				prdOptEstCnt ++;
			}
		});
		
		if(prdOptEstCnt > 0){
			$("input[name=PRD_OPT_EST_YNs]").each(function(){
				if($(this).val() == "Y"){
					prdOptEstYns ++;
				}
			});
			if(prdOptEstYns < 1){
				alert("필수 옵션을 선택해주세요.");
				cartResult = false;
				return;
			}
		}
		
		if(cartResult){
			//구매예정가 금액 다시 계산
			setTotalPrice();
			//$("#optLayerForm").appendTo("#applyOptionChoiceList");
			var _list			= $('.optionDtl');
			var $form = $('<form></form>');
			
			$form.append('<input type="hidden" name="PRD_MST_CD" value="'+ prdMstCd +'" />');
			$form.append('<input type="hidden" name="MEM_CRT_DLV_GBN" value="'+ crtMemCrtDlvGbn +'" />');
			
			$.each(_list, function(i){
				
				var	_this = $(this),
					_OPT_DTL_IDXs	= _this.find('#OPT_DTL_IDXs').val(),
					_REQUEST_CNT	= _this.find("#REQUEST_CNT_" + _OPT_DTL_IDXs).val();
				
				$form.append('<input type="hidden" name="OPT_DTL_IDXs" value="'+ _OPT_DTL_IDXs +'" />');
				$form.append('<input type="hidden" name="REQUEST_CNT_'+ _OPT_DTL_IDXs + '" value="'+ _REQUEST_CNT +'" />');
			});
			
			//console.log("$form::::>" + $form.serialize());
			$.ajax({
	            async : false,
	            type : "POST",
	            data : $form.serialize(),
	            url : "<c:out value="${mobileDomain}" />/mobile/product/insertEsmCartAjax.do",
	            success : function (data){
	            	alert("성공했습니다.");
	            	//$(".warning span").text('맞춤견적서 가기 (총 '+ data.cartCnt + '개)');
	            	$form.remove();	
	            	location.reload();
	            	layerClose();
	            },error : function (err){
	                alert("오류가 발생하였습니다.\n[" + err.status + "]");
	                window.jquery || console.log('오류가 발생하였습니다: ' + err.status);
	            }
			});
			
		}else{
			alert("예상 외 오류가 발생 하였습니다.\n다시 시도해주세요.");
			return;
		}
		
		layerClose();
	});
});
</script>