<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		<div class="sub_content">
			 <!-- layer -->
			 <div id="layer_img_detail" class="layer pro_detail">
			     <div class="layer_content video">
			         <!-- YOUTUBE VIDEO -->
			         <!-- <div class="ev_video" data-video="hgbjMSwKSIE" style="background-image:url(https://img.youtube.com/vi/hgbjMSwKSIE/maxresdefault.jpg)">
                            <span class="ev_play"></span>
                        </div> -->
                     
                     <div id="player" class="js-player" data-plyr-provider="${movieType }"  data-plyr-embed-id="${productInfo.PRD_MST_URL}" >
                     <!-- <div id="player" class="js-player" data-plyr-provider="vimeo" data-plyr-embed-id="76979871"></div> -->
			             
			         </div>
			         
			         <!--//YOUTUBE VIDEO -->
			     </div>
			 	<a href="#none" class="btn_layer_close type02">레이어 닫기</a>
			 </div>
			 <!-- //layer -->
         </div>
         
 <script>

 $(document).ready(function(){
	 setPlayerData("${productInfo.PRD_MST_URL}");
 });
 function setPlayerData(moveUrl){
	  var provider = null;
	  var moveId = null;
	  if(moveUrl.indexOf("https://youtu.be/")>-1){
		  provider = "youtube";
		  moveId = moveUrl.substring("https://youtu.be/".length);
	  }
	  else if(moveUrl.indexOf("https://vimeo.com/")>-1){
		  provider = "vimeo";
		  moveId =  moveUrl.substring("https://vimeo.com/".length);
	  }
	  $("#player").data("plyr-provider", provider);
	  $("#player").data("plyr-embed-id", moveId);
 }

 </script>        
