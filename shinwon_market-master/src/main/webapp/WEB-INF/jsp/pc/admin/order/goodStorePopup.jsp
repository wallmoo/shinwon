<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9"><![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"><!--<![endif]-->
<head>
<%@ include file="/WEB-INF/jsp/am/include/head.jsp" %>
<style>
    .table-row.table-a th, .table-row.table-a td{text-align:center;}
</style>
</head>
<body class="page-popup">

<div class="modal">
	<div class="modal-wrapper">
	    <div class="modal-inner">

            <div class="push-guide instant"><!-- push-guide -->
                <i class="icon"><!-- icon --></i>
                <h3 class="title"><span>우수매장설정</span></h3>
            </div><!-- // push-guide -->

            <div class="section-button text-right" style="margin-bottom:10px;"><!-- section button -->
    	        <a href="#none" id="goRegist" class="button button-b"><span>저장</span></a>
    	    </div><!-- // section button -->

	        <table cellspacing="0" class="table-row table-a" style="margin-bottom: 0;"><!-- table -->
	            <colgroup>
	                <col style="width: 10%;" />
	                <col style="width: auto;" />
	                <col style="width: auto;" />
	            </colgroup>
                <thead>
                    <tr>
                        <th colspan="2">순서</th>
						<th>매장명</th>
						<th>설정여부</th>
                    </tr>
                </thead>
	            <tbody>
	                <tr>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                        <td>1</td>
						<td>현대(아)가산</td>
                        <td>
                            <input type="radio" class="radio" id="set1" name="radio1" checked>
                            <label for="set1">설정</label>
                            <input type="radio" class="radio" id="cancel1" name="radio1">
                            <label for="cancel1">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td>
                            <a href="#none" class="row-sort" data-sort_type="up">△ </a>
                            <a href="#none" class="row-sort" data-sort_type="down"> ▽</a>
                        </td>
                        <td>2</td>
						<td>롯데포항</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>현대신촌</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>AK분당</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>롯데김포공항</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>롯데(아)고양(SG)</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>롯데(아)기흥(SG)</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>롯데본점</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>롯데울산</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
                    <tr>
                        <td colspan="2">-</td>
						<td>현대COEX</td>
                        <td>
                            <input type="radio" class="radio" id="set2" name="radio2" checked>
                            <label for="set2">설정</label>
                            <input type="radio" class="radio" id="cancel2" name="radio2">
                            <label for="cancel2">해지</label>
                        </td>
					</tr>
	            </tbody>
	        </table><!-- // table -->

        </div>
    </div>
</div>

<footer><!-- footer -->
    <%@ include file="/WEB-INF/jsp/am/include/footer.jsp" %>
</footer><!-- // footer -->

<script src="http://bo.marketplanta.epasscni.com:8080/am/js/plugins.js" /></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/ui.js"></script>
<script src="http://bo.marketplanta.epasscni.com:8080/am/js/common.js"></script>
<script type="text/javascript">
$(document).ready(function () {



});

</script>
</body>
</html>
