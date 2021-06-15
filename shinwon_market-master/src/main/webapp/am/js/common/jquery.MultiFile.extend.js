(function($) {
	$.fn.extend ({
		/**
		 * jQuery 멀티 파일
		 * @returns
		 */
		multiUploadSet : function () {
			return this.each (function () {
				var $id = this.id; // 파일 아이디
				var $accept = ""; // 업로드 가능한 확장자
				var $max = $(this).data("attach_cnt"); //업로드 최대 갯수
				
				// 초기 셋팅
				if($("#" + $id + "-list").find("div").length == 0){
					$("#" + $id + "-list").hide();
				}else if ( $max == $("#" + $id + "-list").find("div").length){
					$("#" + $id + "-list").find("input:last").attr("disabled",true);
					$("#"+ $id).attr("disabled",true);
				}
				
				// 업로드 가능한 확장자 생성
				switch($(this).data("accept")) {
					case "admin" : //문서파일 / 이미지파일 / 압축파일 가능
						$accept = "gif|jpg|bmp|png|jpeg|txt|doc|docx|dotx|docm|rtf|hwp|hwt|html|htm|pdf|ppt|pptx|xls|xlsx|xml|zip|alz|egg|rar|7z|cab|tar|ace";
						break;
					case "img" : //이미지 확장자 허용
						$accept = "gif|jpg|bmp|png|jpeg";
						break;
					case "media" : // 미디어 확장자 허용
						$accept = "avi|mpg|mpeg|mpe|wmv|asf|asx|rm|mov|dat|mp4";
						break;
					case "document" : // 문서 확장자 허용
						$accept = "txt|doc|docx|dotx|docm|rtf|hwp|hwt|html|htm|pdf|ppt|xls|xlsx|xml";
						break;
					case "zip" : // 압축 확장자 허용
						$accept = "zip|alz|egg|rar|7z|cab|tar|ace";
						break;
					case "audio" : // 오디오 확장자 허용
						$accept = "mp3|ogg|wma|flac|mid|midi|ac3|acc|ria";
						break;
					case "attachFile" : // 첨부파일 확장자 허용
						$accept = "txt|doc|docx|dotx|docm|hwp|pdf|ppt|xls|xlsx|xml|gif|jpg|bmp|png|jpeg|zip|alz|egg|rar|7z|cab|tar|ace|swf|mp4";
						break;
					case "excel" : // 엑셀 확장자 허용
						$accept = "xls";
						break;
					default :
						$accept = "";
						break;
				}
				
				// MutiFile Option
				$(this).MultiFile ({
					accept : $accept, // 업로드 가능한 확장자
					max : $max, // 업로드 최대 갯수
					list : "#" + $id + "-list", // 파일 리스트를 보여줄 DIV 아이디
					STRING : {
						remove : "<span class=\"label label-a\">삭제</span>",  // 파일리스트의 파일 삭제 아이콘
						selected : "$file", // 파일리스트 파일명 Title
						denied : "$ext 는(은) 업로드 할 수 없는 파일 확장자 입니다.", // 확장자 제한 메시지
						duplicate : "$file 는(은) 이미 추가된 파일입니다.", // 중복 파일 제한 메시지
						inputFileName : $(this).attr("name") //이름
					},
					/*
					 * 파일 삭제 후 실행되는 함수 
					 */
					afterFileRemove : function (element, value, master_element){
						if ( $("#" + $id + "-list").find("div").length == 0) {
							$("#" + $id + "-list").hide();
						}
					},
					/*
					 * 파일 추가 후 실행되는 함수 
					 */
					afterFileAppend: function(element, value, master_element){
						$("#" + $id + "-list").show();
					}
				});
			});
		},
		/**
		 * 업로드 된 파일 삭제
		 * @returns
		 */
		removeFile : function (objId) {
			
			// 삭제할 파일의 일련번호를 담을 배열
			var removeFiles = new Array();
			return this.click(function () {
				var $this = $(this); // a tag
				var $seq = $this.data("cmn_fle_idx"); // 파일 일련번호
				var $fileBox = $this.parent(); // 파일 DIV
				var $fileListBox = $this.parent().parent(); // 파일 목록 DIV
				
				var $fileInputId = $this.data("file_input_id"); //파일 찾아보기 버튼 ID
				
				// 파일 삭제시 파일 태그 disabled 해제
				$fileListBox.find("input:last").attr("disabled",false);
				
				if(confirm("Are you sure you want to delete?")){
					// 파일 박스 삭제
					$fileBox.remove();
					// 배열에 파일 일련번호를 담는다.
					removeFiles.push($seq);
					
					//파일 찾기 버튼 활성화
					if($fileInputId == undefined){
						$("#multiFile").attr("disabled",false);
					}else{
						$("#"+$fileInputId).attr("disabled",false);
					}
					
				}
				// form에 있는 노드에 데이터를 담는다.
				$("#" + objId).val(removeFiles);
				
				// 파일 리스트가 없을 경우
				if($fileListBox.find("div").length == 0){
					$fileListBox.hide();
				}
			});
		}
	});
}(jQuery));