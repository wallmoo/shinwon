<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/mobile/include/top.jsp" %>
<!-- #container -->
        <div id="container">
            <!-- #content_area -->
            <div id="content_area">
                <div class="event_detail">
                    <!-- .wheelWrap -->
                    <div class="wheelWrap">
                        <p class="title"><img src="/nas/cdn/MW/images/content/event/img_wheel_title.png" alt="100% 당첨 SHINWONMALL 출석룰렛 룰렛만 돌려도 포인트가 100% 쏟아진다!"></p>
                        <script src="/nas/cdn/MW/js/TweenMax.min.js"></script>
                        <script src="/nas/cdn/MW/js/Winwheel.min.js"></script>
                        <!-- .wheelInner -->
                        <div class="wheelInner">
                            <canvas id='canvas' width='272' height='272'>
                                Canvas not supported, use another browser.
                            </canvas>
                            <span class="pointer"></span>
                            <button type="button" id="spin_button">돌리기</button>
                            <script>
                                let theWheel = new Winwheel({
                                    'numSegments'       : 8,            // Specify number of segments.
                                    'outerRadius'       : 136,
                                    'drawMode'          : 'image',      // drawMode must be set to image.
                                    'segments'     :                // Define segments.
                                    [
                                       {'text' : '10포인트'},
                                       {'text' : '20포인트'},
                                       {'text' : '50포인트'},
                                       {'text' : '30포인트'},
                                       {'text' : '10포인트'},
                                       {'text' : '20포인트'},
                                       {'text' : '1,000포인트'},
                                       {'text' : '30포인트'}
                                    ],
                                    'animation' :                   // Specify the animation to use.
                                    {
                                        'type'     : 'spinToStop',
                                        'duration' : 5,             // Duration in seconds.
                                        'spins'    : 8,             // Number of complete spins.
                                        'callbackFinished' : alertPrize,
                                        //'callbackSound'    : playSound,   // Called when the tick sound is to be played.
                                        'soundTrigger'     : 'pin'        // Specify pins are to trigger the sound.
                                    },
                                    'pins' :
                                    {
                                        'number'     : 10,
                                        'outerRadius': 0,
                                    }
                                });
                     
                                // Create new image object in memory.
                                let loadedImg = new Image();
                                let audio = new Audio('/nas/cdn/MW/media/tick.mp3');
                     
                                // Create callback to execute once the image has finished loading.
                                loadedImg.onload = function()
                                {
                                    theWheel.wheelImage = loadedImg;    // Make wheelImage equal the loaded image object.
                                    theWheel.draw();                    // Also call draw function to render the wheel.
                                }
                     
                                // Set the image source, once complete this will trigger the onLoad callback (above).
                                loadedImg.src = "/nas/cdn/MW/images/content/event/img_wheel_w272.png";
                                
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
                    <div class="event_caution_wrap">
                        <img src="/nas/cdn/MW/images/_temp/img_event_red.jpg" alt="">
                    </div>
                    <div class="btn_area">
                        <button type="button" class="btn black">목록</button>
                    </div>
                </div>
                

            </div>
            <!-- // #content_area -->
        </div>
        <!-- // #container -->

<%@ include file="/WEB-INF/jsp/mobile/include/footer.jsp" %>