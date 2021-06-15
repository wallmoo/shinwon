<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SHINWON API Test Page</title>
<script src="/am/js/vendor/jquery-1.11.2.min.js" type="text/javascript"></script>
</head>
<body>
    <div>
        <span>API : productUpdate</span><br/>
        STYLE_NO : <input type="text" id="productUpdate" value="FXB51620" /><br/>
        <button id="btnProductUpdate">productUpdate</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : partInfo</span>
        <button id="btnPartInfo">partInfo</button>
    </div>
    <div style="margin-top:30px;">
        <span>API : stockInfo</span><br/>
        STYLE_NO : <input type="text" id="stockInfo1" value="FXB51620" /><br/>
        SEASON_YEAR : <input type="text" id="stockInfo2" value="2019" /><br/>
        COLOR_CODE : <input type="text" id="stockInfo3" value="WH" /><br/>
        SIZE_CODE : <input type="text" id="stockInfo4" value="95" /><br/>
        <button id="btnStockInfo">stockInfo</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : AllStockInfo</span><br/>
        STYLE_NO : <input type="text" id="allStockInfo1" value="FXB51620" /><br/>
        SEASON_YEAR : <input type="text" id="allStockInfo2" value="2019" /><br/>
        COLOR_CODE : <input type="text" id="allStockInfo3" value="WH" /><br/>
        SIZE_CODE : <input type="text" id="allStockInfo4" value="95" /><br/>
        <button id="btnAllStockInfo">AllStockInfo</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : ProductMaster2</span><br/>
        STYLE_NO : <input type="text" id="productMaster2" value="FXB51620" /><br/>
        <button id="btnProductMaster2">productMaster2</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : O2OFeeRate</span><br/>
        APPLY_YYMM : <input type="text" id="o2oFeeRate1" value="202005" /><br/>
        <button id="btnO2oFeeRate">O2OFeeRate</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : O2OFeeRateResult</span><br/>
        PART_DIV(유통망) : <input type="text" id="o2oFeeRateResult1" value="D" /><br/>
        PART_NO(매장번호) : <input type="text" id="o2oFeeRateResult2" value="1005" /><br/>
        BRAND(브랜드) : <input type="text" id="o2oFeeRateResult3" value="F" /><br/>
        APPLY_YYMM(적용년월) : <input type="text" id="o2oFeeRateResult4" value="202005" /><br/>
        <button id="btnO2oFeeRateResult">O2OFeeRateResult</button><br/>
    </div>
    <div style="margin-top:30px;">
        <span>API : partUpdate</span><br/>
        PART_DIV(유통망) : <input type="text" id="partUpdate1" value="D" /><br/>
        PART_NO(매장번호) : <input type="text" id="partUpdate2" value="1005" /><br/>
        BRAND(브랜드) : <input type="text" id="partUpdate3" value="F" /><br/>
        STATE(지역구분) : <input type="text" id="partUpdate4" value="서울특별시" /><br/>
        ZIP_NO(우편번호) : <input type="text" id="partUpdate5" value="25355" /><br/>
        ADDR(주소) : <input type="text" id="partUpdate6" value="서울특별시 강서구 염창동 333" /><br/>
        PART_PHONE_NO(매장전화번호) : <input type="text" id="partUpdate7" value="0252253535" /><br/>
        CELL_PHONE_NO(대표휴대폰번호) : <input type="text" id="partUpdate8" value="01001010101" /><br/>
        <button id="btnPartUpdate">partUpdate</button><br/>
    </div>
    
    <div style="margin-top:150px;">
        <span>result</span><br/>
        <div style="border-width: 1; border-color: RED"><span id="resultBox"></span></div><br/>
    </div>
</body>
<script>
    $(document).ready(function()
    {
        $('#btnProductUpdate').on('click', 
                function()
                {
                    callAjax('/api/productUpdate', {STYLE_NO:$('#productUpdate').val()});
                });
        $('#btnStockInfo').on('click', 
                function()
                {
                    callAjax('/api/stockInfoTest', {
                        STYLE_NO:$('#stockInfo1').val(),
                        SEASON_YEAR:$('#stockInfo2').val(),
                        COLOR_CODE:$('#stockInfo3').val(),
                        SIZE_CODE:$('#stockInfo4').val()
                    });
                });
        $('#btnAllStockInfo').on('click', 
                function()
                {
                    callAjax('/api/allStockInfoTest', {
                        STYLE_NO:$('#allStockInfo1').val(),
                        SEASON_YEAR:$('#allStockInfo2').val(),
                        COLOR_CODE:$('#allStockInfo3').val(),
                        SIZE_CODE:$('#allStockInfo4').val()
                    });
                });
        $("#btnPartInfo").on("click", function() {
            if(!confirm("정말로 동기화 하시겠습니까?")){
                return;
            }
                callAjax('/api/partInfoTest', {});
        });
        $("#btnO2oFeeRate").on("click", function() {
                callAjax('/api/o2oFeeRateTest', {APPLY_YYMM : $('#o2oFeeRate1').val()});
        });
        $("#btnO2oFeeRateResult").on("click", function() {
                callAjax('/api/o2oFeeRateResultTest', {
                    PART_DIV : $('#o2oFeeRateResult1').val(),
                    PART_NO : $('#o2oFeeRateResult2').val(),
                    BRAND : $('#o2oFeeRateResult3').val(),
                    APPLY_YYMM : $('#o2oFeeRateResult4').val()
                });
        });
        $("#btnPartUpdate").on("click", function() {
                callAjax('/api/partUpdate', {
                    PART_DIV : [$('#partUpdate1').val()],
                    PART_NO : [$('#partUpdate2').val()],
                    BRAND : [$('#partUpdate3').val()],
                    STATE : [$('#partUpdate4').val()],
                    ZIP_NO : [$('#partUpdate5').val()],
                    ADDR : [$('#partUpdate6').val()],
                    PART_PHONE_NO : [$('#partUpdate7').val()],
                    CELL_PHONE_NO : [$('#partUpdate8').val()]
                });
        });
        $("#btnProductMaster2").on("click", function() {
                callAjax('/api/productMaster2', {
                    STYLE_NO:$('#productMaster2').val(),
                });
        });
    });

    var callAjax = function(_url, _param)
    {
        $('#resultBox').html('');
        $.ajax(
        {
            url : _url+'.do', // 클라이언트가 요청을 보낼 서버의 URL 주소
            data : JSON.stringify(_param),
            type : "POST", // HTTP 요청 방식(GET, POST)
            contentType: 'application/json',
            dataType : "json", // 서버에서 보내줄 데이터의 타입
            success : function(data){
                $('#resultBox').html(JSON.stringify(data));
            },
            error : function(err){
                $('#resultBox').html(JSON.stringify(err));
            }
        });
    }
</script>
</html>