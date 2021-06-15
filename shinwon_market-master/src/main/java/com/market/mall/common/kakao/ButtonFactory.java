package com.market.mall.common.kakao;

import org.json.JSONObject;

public class ButtonFactory {
	public static JSONObject getButtonInstance(ButtonEnum type, String name, String link1, String link2) {
		JSONObject button = new JSONObject();
		button.put("type", type.toString());
		button.put("name", name);
		if(ButtonEnum.WL.equals(type)) {
			button.put("url_mobile", link1);
			if(link2!=null && link2.isEmpty()) {
				button.put("url_pc", link2);
			}
		} else if(ButtonEnum.AL.equals(type)) {
			button.put("scheme_ios", link1);
			button.put("scheme_android", link1);
		} else if(ButtonEnum.DS.equals(type)) {
			
		} else if(ButtonEnum.BK.equals(type)) {
			
		} else if(ButtonEnum.MD.equals(type)) {
			
		}
		return button;
	}
	public static JSONObject getButtonInstance(ButtonEnum type, String name) {
		return getButtonInstance(type, name, null, null);
	}
}
