<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/pc/include/top.jsp"%>
<title>룰렛 이벤트</title>

<!-- Content -->
    <div id="container">
        <div id="content" class="content">

            <!-- LOCATION -->
            <div class="location">
                <ol class="clearboth">
                    <li><a href="#" class="home">홈</a></li>
                    <li class="active">
                        <a href="#">1Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">1Depth Menu 01</a></li>
                            <li><a href="#">1Depth Menu 02</a></li>
                            <li><a href="#">1Depth Menu 03</a></li>
                            <li><a href="#">1Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">2Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">2Depth Menu 01</a></li>
                            <li><a href="#">2Depth Menu 02</a></li>
                            <li><a href="#">2Depth Menu 03</a></li>
                            <li><a href="#">2Depth Menu 04</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">3Depth Menu 01</a>
                        <ul class="depth_list">
                            <li><a href="#">3Depth Menu 01</a></li>
                            <li><a href="#">3Depth Menu 02</a></li>
                            <li><a href="#">3Depth Menu 03</a></li>
                            <li><a href="#">3Depth Menu 04</a></li>
                        </ul>
                    </li>
                </ol>
            </div>
            <!-- //LOCATION -->

            <!-- Title -->
            <div class="pg_tit_wrap">
                <h2 class="pg_tit">이벤트</h2>
            </div>
            <!--// Title -->

            <!-- .pg_sub_tit_wrap -->
            <div class="pg_sub_tit_wrap clearboth">
                <h3 class="pg_sub_tit fl">돌려 돌려 돌림판</h3>
            </div>
            <!-- // .pg_sub_tit_wrap -->
            <!-- .wheelWrap -->
            <div class="wheelWrap" style="background-image:url(${cdnDomain}${imgList.get(2).FILE_NM})">
                <script src="/nas/cdn/PW/js/TweenMax.min.js"></script>
                <script src="/nas/cdn/PW/js/Winwheel.min.js"></script>
                <!-- .wheelInner -->
                <div class="wheelInner">
                    <canvas id='canvas' width='800' height='800'>
                        Canvas not supported, use another browser.
                    </canvas>
                    <span class="pointer"></span>
                    <button type="button" id="spin_button" style="background-image:url(${cdnDomain}${imgList.get(4).FILE_NM});">돌리기</button>
                    <script>
                    	
                    	var prdList = [];
                    	var prdVal = [];
                    	var prdIdx = [];
                    	var prdType = [];
                    	
	               		<c:forEach var="prdRow" items="${prdList}" varStatus="status">
	               			prdType.push('<c:out value="${prdRow.EVT_PRD_TYPE}"/>');
	               			prdList.push('<c:out value="${prdRow.CPN_MST_TITLE}"/>');
	               			prdVal.push('<c:out value="${prdRow.EVT_PNT_VAL}"/>');
		                 	prdIdx.push('<c:out value="${prdRow.EVT_PRD_IDX}"/>')
	               		</c:forEach>
               	
		                var segMents = [];
		                for(var i = 0; i < prdList.length ; i++) {
		                	var curText = prdType == 'C' ? prdList[i] : 'E 포인트 ' + prdVal[i];
		                	
		                	segMents.push({'text' : curText, 'idx' : prdIdx[i]});
		                }
                        var theWheel = new Winwheel({
                            'numSegments'       : segMents.length,            // Specify number of segments.
                            'outerRadius'       : 400,
                            'drawMode'          : 'image',      // drawMode must be set to image.
                            'segments'     : segMents,
                            'animation' :                   // Specify the animation to use.
                            {
                                'type'     : 'spinToStop',
                                'duration' : 5,             // Duration in seconds.
                                'spins'    : 8,             // Number of complete spins.
                                'callbackFinished' : alertPrize,
                                'callbackSound'    : playSound,   // Called when the tick sound is to be played.
                                'soundTrigger'     : 'pin'        // Specify pins are to trigger the sound.
                            },
                            'pins' :
                            {
                                'number'     : segMents.length,
                                'outerRadius': 0,
                            }
                        });
             
                        // Create new image object in memory.
                        var loadedImg = new Image();
                        var audio = new Audio('/nas/cdn/PW/media/tick.mp3');
             
                        // Create callback to execute once the image has finished loading.
                        loadedImg.onload = function()
                        {
                            theWheel.wheelImage = loadedImg;    // Make wheelImage equal the loaded image object.
                            theWheel.draw();                    // Also call draw function to render the wheel.
                        }
             
                        // Set the image source, once complete this will trigger the onLoad callback (above).
                        
                        
                        loadedImg.src = '<c:out value="${cdnDomain}${imgList.get(3).FILE_NM}"/>';
                       
                        function playSound(){
                            // Stop and rewind the sound if it already happens to be playing.
                            audio.pause();
                            audio.currentTime = 0;
                            // Play the sound.
                            audio.play();
                        }

                        // Called when the animation has finished.
                        function alertPrize(indicatedSegment)
                        {
                            // Do basic alert of the segment text.
                            alert("이벤트 당첨 " + indicatedSegment.text);
                        }
                        let wheelSpinning = false;

                        function startSpin(){
                            if (wheelSpinning == false) {
                                theWheel.animation.spins = 8;
                                document.getElementById('spin_button').className = "";
                                // Begin the spin animation by calling startAnimation on the wheel object.
                                theWheel.startAnimation();
                                wheelSpinning = true;
                            }
                        }

                        $('#spin_button').on('click', function(){
                            startSpin();
                        });
                    </script>
                </div>
                <!-- // .wheelInner -->
            </div>
            <!-- // .wheelWrap -->
            <div class="caution_img_area">
                <img src="/nas/cdn/PW/images/@temp/img_cause_4.png" alt="">
            </div>

            <div class="btn_wrap mt100">
                <button type="button" class="btn_large">목록</button>
            </div>

        </div>
    </div>
    <!--// Content -->


<%@ include file="/WEB-INF/jsp/pc/include/footer.jsp"%>