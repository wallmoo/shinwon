package com.market.mall.common.kakao;

import java.util.Map;

import com.epasscni.util.StringUtil;

public class MessageFactory {
	public static String getMessageInstance(String templateCode,Map<String,Object> messageMap) {
		if("SWD41".equals(templateCode)) {
			
		} else if("SWD42".equals(templateCode)) {
			
		} else if("SWD43".equals(templateCode)) {
			
		} else if("SWD44".equals(templateCode)) {
			
		} else if("SWD45".equals(templateCode)) {
			
		} else if("SWD46".equals(templateCode)) {
			
		}else if("SWD47".equals(templateCode)) {
			
		}else if("SWD48".equals(templateCode)) {
			
		}else if("SWD49".equals(templateCode)) {
			
		}else if("SWD50".equals(templateCode)) {
			
		}else if("SWD51".equals(templateCode)) {
			
		}else if("SWD52".equals(templateCode)) {
			
		}else if("SWD53".equals(templateCode)) {
			
		}else if("SWD54".equals(templateCode)) {
			
		}else if("SWD55".equals(templateCode)) {
			
		}else if("SWD56".equals(templateCode)) {
			
		}else if("SWD57".equals(templateCode)) {
			return getSwd57Template(messageMap);
		}else if("SWD58".equals(templateCode)) {
			
		}else if("SWD59".equals(templateCode)) {
			
		}else if("SWD60".equals(templateCode)) {
			
		}else if("SWD61".equals(templateCode)) {
			return getSwd61Template(messageMap);
		}else if("SWD62".equals(templateCode)) {
			
		}else if("SWD63".equals(templateCode)) {
			
		}else if("SWD64".equals(templateCode)) {
			return getSwd64Template(messageMap);
		}else if("SWD65".equals(templateCode)) {
			
		}else if("SWD66".equals(templateCode)) {
			
		}else if("SWD67".equals(templateCode)) {
			
		}else if("SWD68".equals(templateCode)) {
			
		}else if("SWD69".equals(templateCode)) {
			
		}else if("SWD70".equals(templateCode)) {
			
		}else if("SWD71".equals(templateCode)) {
			
		}else if("SWD72".equals(templateCode)) {
			
		}else if("SWD73".equals(templateCode)) {
			
		}else if("SWD74".equals(templateCode)) {
			
		}else if("SWD75".equals(templateCode)) {
			
		}else if("SWD76".equals(templateCode)) {
			
		}else if("SWD77".equals(templateCode)) {
			
		}else if("SWD78".equals(templateCode)) {
			
		}else if("SWD79".equals(templateCode)) {
			
		}else if("SWD80".equals(templateCode)) {
			
		}
		return null;
		
	}
	private static String getSwd57Template(Map<String,Object> map) {
		return "[쑈윈도]\r\n" + 
				"안녕하세요, "+StringUtil.getString(map.get("MEM_MST_MEM_NM"))+" 고객님!\r\n" + 
				"회원가입을 축하드립니다.\r\n" + 
				"\r\n" + 
				"고객님의 다양한 스타일을 보여주세요!\r\n" + 
				"회원가입만 해도 5,000 E포인트\r\n" + 
				"+앱 다운로드시 10,000 E포인트도 드려요\r\n" + 
				"\r\n" + 
				"지금 바로 이용해보세요\r\n" + 
				"Show your Style, SHOWINDOW\r\n" + 
				"\r\n" + 
				"☎고객센터 : 1661-2585";
	}

	private static String getSwd64Template(Map<String,Object> map) {
		return "[쑈윈도]\r\n" + 
				"\r\n" + 
				StringUtil.getString(map.get("VDR_MST_NM"))+" 담당자로부터 게시글이 등록되었습니다.\r\n" + 
				"게시글을 확인 후 답변 바랍니다.\r\n" + 
				"\r\n" + 
				"☞ 업무공유 게시판 보러가기\r\n" + 
				StringUtil.getString(map.get("LINK"))+"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"Show your Style, SHOWINDOW";
	}
	private static String getSwd61Template(Map<String,Object> map) {
		return "[쑈윈도]\r\n" + 
				"\r\n" + 
				StringUtil.getString(map.get("VDR_MST_NM"))+" 재입고 등록되었습니다.\r\n" + 
				"상품을 확인 후 주문 바랍니다.\r\n" + 
				"\r\n" + 
				"☞ 업무공유 게시판 보러가기\r\n" + 
				StringUtil.getString(map.get("LINK"))+"\r\n" + 
				"\r\n" + 
				"\r\n" + 
				"Show your Style, SHOWINDOW";
	}
	
}

