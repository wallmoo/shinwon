package com.market.mall.pc.contents.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.viewer.JSON;
import com.market.mall.common.SessionsUser;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.contents.service.ContentListService;

@Controller
public class ContentListController {

	 @Resource(name="contentListService")
	 private ContentListService contentListService;


	 
	 
	 
	 private int getContentDefaultOffset(Map<String, Object> commandMap, String key) {
		 try {
			 if(commandMap.containsKey(key)) 
				 return Integer.parseInt(commandMap.get(key).toString());
			 else 
				 return 1;
		 } catch (Exception e) {
			 return 1;
		 }
	 }
	 private int getContentDefaultTotCount(int prevCount, int newCount, int curCount) {
		int totCount = 2 + prevCount - newCount;
		
		if(totCount > 20 - curCount) totCount = 20 - curCount;
		
		return totCount;
	 }
	 private void setContentParam(Map<String, Object> paramMap, int offset, int count) {
		 paramMap.put("STARTNUM", offset);
		 paramMap.put("ENDNUM", offset + count);
	 }
	 /**
	  * 
	  * <pre>
	  * 1. MethodName : contentListAjax
	  * 2. ClassName : ContentListService.java
	  * 3. Comment : 컨텐트 리스트 Ajax
	  * 4. 작성자 : MR.Park
	  * 5. 작성일 : 2020. 05. 02.
	  * </pre>
	  *
	  * @param request
	  * @param commandMap
	  * @return
	  * @throws Exception
	  */
	 @RequestMapping("/pc/contents/contentListAjax")
	 public JSON contentListAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap) throws Exception{
		 JSON json			= new JSON();
		 
		 int planOffset = getContentDefaultOffset(commandMap, "planOffset"); //기획전
		 int timeOffset = getContentDefaultOffset(commandMap, "timeOffset"); //타임특가
		 int newOffset = getContentDefaultOffset(commandMap, "newOffset"); //신상품
		 int eventOffset = getContentDefaultOffset(commandMap, "eventOffset"); //이벤트
		 int pickOffset = getContentDefaultOffset(commandMap, "pickOffset"); //셀러픽
		 int ootdOffset = getContentDefaultOffset(commandMap, "ootdOffset"); //OOTD
		 int haulOffset = getContentDefaultOffset(commandMap, "haulOffset"); //하울
		 int bestOffset = getContentDefaultOffset(commandMap, "bestOffset"); //베스트리뷰
		 int fundOffset = getContentDefaultOffset(commandMap, "fundOffset"); //펀딩
		 int topOffset = getContentDefaultOffset(commandMap, "topOffset"); //탑셀러상품
		 int bannerOffset = getContentDefaultOffset(commandMap, "bannerOffset"); //고정배너
		 
		

		 List<Map<String, Object>> cPlanList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cTimeList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cNewList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cEventList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cPickList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cOotdList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cBestList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cFundList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cHaulList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cBannerList = new ArrayList<Map<String,Object>>();
		 List<Map<String, Object>> cTopList = new ArrayList<Map<String,Object>>();
		 
		 int totCount = 2;
		 int curCount = 0;
		 
		 Map<String, Object> paramMap = new HashMap<>();
		 
		 
		 if(commandMap.containsKey("id_type") && commandMap.get("id_type").toString().equals("list")) {
			 paramMap.put("ID_TYPE", commandMap.get("id_type"));
			 
			 JSONArray jsonArray = new JSONArray(commandMap.get("tag_bnd_id").toString());
			 ArrayList<String> ids =new ArrayList<>();
			 
			 for(int i = 0 ; i <  jsonArray.length(); i++) 
				 ids.add(jsonArray.getString(i));
				 
			 paramMap.put("TAG_BND_ID", ids);
	
		 } else {
			 paramMap.put("TAG_BND_ID", commandMap.get("tag_bnd_id"));
		 }
		 
		 
		 
		 User curUser = SessionsUser.getSessionUser(request);
		 paramMap.put("MEM_MST_ID", curUser.getMEM_MST_MEM_ID());
		 paramMap.put("USER_ENV_TYPE", Code.USER_ENV_TYPE_PC);
		 paramMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_LARGE);
		 	 
		 setContentParam(paramMap, planOffset, totCount);
		 List<Map<String, Object>> planList = contentListService.selectPlanContentsList(paramMap); //기획전 목록
		 cPlanList.addAll(planList);
		 curCount += planList.size();
		 
		 totCount = getContentDefaultTotCount(totCount, planList.size(), curCount);
		 planOffset += planList.size();
		 
		 setContentParam(paramMap, timeOffset, totCount);
		 List<Map<String, Object>> timeList = contentListService.selectTimeContentsList(paramMap); //타임특가 목록
		 cTimeList.addAll(timeList);

		 curCount += timeList.size();
		 totCount = getContentDefaultTotCount(totCount, timeList.size(), curCount);

		 timeOffset += timeList.size();
		 
		 setContentParam(paramMap, newOffset, totCount);
		 List<Map<String, Object>> newList = contentListService.selectNewContentsList(paramMap); //신상품  목록
		 cNewList.addAll(newList);
		 
		 curCount += newList.size();
		 totCount = getContentDefaultTotCount(totCount, newList.size(), curCount);

		 newOffset += newList.size();
		
		 setContentParam(paramMap, eventOffset, totCount);
		 List<Map<String, Object>> eventList = contentListService.selectEventContentsList(paramMap); //이벤트  목록
		 cEventList.addAll(eventList);
		 
		 curCount += eventList.size();
		 totCount = getContentDefaultTotCount(totCount, eventList.size(), curCount);
	
		 eventOffset += eventList.size();
		 
		 setContentParam(paramMap, pickOffset, totCount);
		 List<Map<String, Object>> pickList = contentListService.selectPickContentsList(paramMap); //셀러픽  목록
		 cPickList.addAll(pickList);
		 
		 curCount += pickList.size();
		 totCount = getContentDefaultTotCount(totCount, pickList.size(), curCount);
		
		 
		 pickOffset += pickList.size();
		 
		 setContentParam(paramMap, ootdOffset, totCount);
		 List<Map<String, Object>> ootdList = contentListService.selectOotdContentsList(paramMap); //OOTD  목록
		 cOotdList.addAll(ootdList);
		 
		 curCount += ootdList.size();
		 totCount = getContentDefaultTotCount(totCount, ootdList.size(), curCount);
	
		 ootdOffset += ootdList.size();
		 
		 setContentParam(paramMap, bestOffset, totCount);
		 List<Map<String, Object>> bestList = contentListService.selectBestContentsList(paramMap); //베스트리뷰  목록
		 cBestList.addAll(bestList);
		 
		 curCount += bestList.size();
		 totCount = getContentDefaultTotCount(totCount, bestList.size(), curCount);
		
		 bestOffset += bestList.size();
		 
		 setContentParam(paramMap, fundOffset, totCount);
		 List<Map<String, Object>> fundList = contentListService.selectFundContentsList(paramMap); //펀딩  목록
		 cFundList.addAll(fundList);
		 
		 curCount += fundList.size();
		 totCount = getContentDefaultTotCount(totCount, fundList.size(), curCount);
		
		 fundOffset += fundList.size();
		 
		 setContentParam(paramMap, haulOffset, totCount);
		 List<Map<String, Object>> haulList = contentListService.selectHaulContentsList(paramMap); //하울  목록
		 cHaulList.addAll(haulList);
		 
		 curCount += haulList.size();
		 totCount = getContentDefaultTotCount(totCount, haulList.size(), curCount);
		
		 haulOffset += haulList.size();
		 
		 
		 setContentParam(paramMap, topOffset, totCount);
		 List<Map<String, Object>> topList = contentListService.selectTopContentsList(paramMap); //탑셀러  목록
		 cTopList.addAll(topList);
		 
		 curCount += topList.size();
		 totCount = getContentDefaultTotCount(totCount, topList.size(), curCount);
		
		 topOffset += topList.size();
		 
		 if(bannerOffset == 0) {
			 setContentParam(paramMap, bannerOffset, totCount);
			 List<Map<String, Object>> bannerList = contentListService.selectBannerContentsList(paramMap); //고정배너  목록
			 cBannerList.addAll(bannerList);
			 
			 curCount += bannerList.size();
			 totCount = getContentDefaultTotCount(totCount, bannerList.size(), curCount);
			
			 bannerOffset += bannerList.size(); 
		 }		 

		 Map<String, Object> offsetMap = new HashMap<>();
		 offsetMap.put("planOffset", planOffset);
		 offsetMap.put("timeOffset", timeOffset);
		 offsetMap.put("newOffset", newOffset);
		 offsetMap.put("eventOffset", eventOffset);
		 offsetMap.put("pickOffset", pickOffset);
		 offsetMap.put("ootdOffset", ootdOffset);
		 offsetMap.put("bestOffset", bestOffset);
		 offsetMap.put("fundOffset", fundOffset);
		 offsetMap.put("haulOffset", haulOffset);
		 offsetMap.put("topOffset", topOffset);
		 offsetMap.put("bannerOffset", bannerOffset);
		 
		 Map<String, Object> listMap = new HashMap<>();
		 listMap.put("planList", cPlanList);
		 listMap.put("timeList", cTimeList);
		 listMap.put("newList", cNewList);
		 listMap.put("eventList", cEventList);
		 listMap.put("pickList", cPickList);
		 listMap.put("ootdList", cOotdList);
		 listMap.put("bestList", cBestList);
		 listMap.put("fundList", cFundList);
		 listMap.put("haulList", cHaulList);
		 listMap.put("topList", cTopList);
		 listMap.put("bannerList", cBannerList);	 
	
		 json.addObject("list", listMap);
		 json.addObject("offset", offsetMap);
		 json.addObject("count", curCount);
		 
		 return json;
	 }
	 
	 
}
