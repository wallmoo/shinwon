package com.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.manager.controller.LoginManagerController;
import com.market.mall.am.manager.service.LoginManagerService;
import com.market.mall.am.member.service.InfoMemberService;
import com.market.mall.am.member.service.RestMemberService;
import com.market.mall.pc.mypage.service.MyInfoService;

@Controller
public class MemberInfoController {
	
	@Resource(name="pcMyInfoService")
	private MyInfoService pcMyInfoService;
	
	@Resource(name="restMemberService")
	private RestMemberService restMemberService;
	
	@Resource(name="infoMemberService") private InfoMemberService infoMemberService;

	@ResponseBody
	@RequestMapping(value="/api/loginYesterday", method=RequestMethod.POST)
	public Map<String,Object> loginYesterday (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
        List<Map<String,Object>> list = this.pcMyInfoService.selectYesterdayLoginUser(request, commandMap);
        Map<String,Object> returnMap = new HashMap<String,Object>(); 
        returnMap.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
        	returnMap.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        	return returnMap;
        }
        returnMap.put("list", list);
        return returnMap;
        
	}
	
	
	@ResponseBody
	@RequestMapping(value="/api/memberUpdate", method=RequestMethod.POST)
	public Map<String,Object> myInfoModify (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
        Map<String,Object> returnMap = this.pcMyInfoService.updateMyInfoWithoutErp(request, commandMap);
        Map<String,Object> result = new HashMap<String,Object>();
        // 결과 코드
        String returnMsg =  (String) returnMap.get("returnMsg");
        
        if("S01".equals(returnMsg))
        {
        	result.put("resultCode", HttpServletResponse.SC_OK);
        	result.put("msg", "회원정보가 수정되었습니다.");
        }
        else if("F01".equals(returnMsg))
        {
        	result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        	result.put("msg", "회원정보 수정에 실패하셨습니다.");
        }
        else if("E99".equals(returnMsg))
        {
        	result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        	result.put("msg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
        }
        else
        {
        	result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        	result.put("msg", "회원정보 수정에 실패하였습니다.\\n문제가 계속 발생 시 관리자에게 문의해주세요.");
        }
        
        return result;
        
	}
	@ResponseBody
	@RequestMapping(value="/api/memberGradeSelect", method=RequestMethod.POST)
	public Map<String,Object> memberGradeView (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> result = new HashMap<String,Object>();
        List<Map<String,Object>> list = this.pcMyInfoService.selectMemberGrade(request, commandMap);
        result.put("resultCode", HttpServletResponse.SC_OK);
        if(list==null || list.isEmpty()) {
        	result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        	return result;
        }
        result.put("list", list);
        return result;
        
	}
	
	@ResponseBody
	@RequestMapping(value="/api/memberWithdraw", method=RequestMethod.POST)
	public Map<String,Object> memberWithdraw (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> result = new HashMap<String,Object>();
		
        // 회원 탈퇴
        Map<String,Object> returnMap = this.pcMyInfoService.deleteMyInfo(request, commandMap);
        
        // 결과 값
		String resultMsg = StringUtil.getString(returnMap.get("resultMsg"),"");
        
        if("S01".equals(resultMsg))
        {
            result.put("msg", "정상적으로 회원탈퇴가 되었습니다.");
            result.put("resultCode", HttpServletResponse.SC_OK);
        }  
        else if("F01".equals(resultMsg))
        {
        	result.put("msg", "회원탈퇴에 실패하셨습니다.");
        	result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
        }
        else if("F02".equals(resultMsg))
        {
            result.put("msg", "데이터가 누락되었습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
            result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            
        }
        else if("E99".equals(resultMsg))
        {
            result.put("msg", "알수 없는 오류가 발생하였습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
            result.put("resultCode", HttpServletResponse.SC_NOT_ACCEPTABLE);
        }
        else
        {  
            result.put("msg", "회원탈퇴에 실패하였습니다.\\n문제가 계속 발생시 관리자에게 문의해주세요.");
            result.put("resultCode", HttpServletResponse.SC_NOT_ACCEPTABLE);
        }
        return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/api/memberWithdrawList", method=RequestMethod.POST)
	public Map<String,Object> memberWithdrawList (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> result = new HashMap<String,Object>();
		
		commandMap.put("MEM_MST_UPD_IP", request.getRemoteAddr());
        // 회원 탈퇴
        result.put("msg", "정상적으로 회원탈퇴가 되었습니다.");
        result.put("resultCode", HttpServletResponse.SC_OK);
        // 결과 값
		try {
			org.json.JSONObject jCommandMap = new org.json.JSONObject(commandMap);
			JSONArray jArrayIds =  jCommandMap.getJSONArray("MEM_MST_MEM_ID");
			for(int index = 0; index < jArrayIds.length(); index++) {
				Map<String,Object> member = new HashMap<String,Object>();
				member.put("MEM_MST_MEM_ID", jArrayIds.getString(index));
				member.put("MEM_MST_LEV_RSN_CD", "3810");
				this.pcMyInfoService.deleteMyInfoList(request, member);
			}
		}catch (Exception e) {
			result.put("msg", "예외가 발생하였습니다");
	        result.put("resultCode", HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	        return result;
		}
        return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/api/testMemberPointCheck", method=RequestMethod.POST)
	public Map<String,Object> testMemberPointCheck (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("ESHOP_ID", "EEEE");
		return ErpRequest.requestMemberPointCheck(params);
	}
	
	@ResponseBody
	@RequestMapping(value="/api/restMemberList", method=RequestMethod.POST)
	public Map<String,Object> restMemberList (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		int totalCount = restMemberService.selectRestMemberListCount(commandMap);
		Map<String, Object> result = new HashMap<String, Object>();
		if(totalCount>0) {
			result.put("restMemberList", restMemberService.selectRestMemberList(commandMap));
		}
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/api/restMemberRegist", method=RequestMethod.POST)
	public Map<String,Object> restMemberRegist (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "").equals("")) {
			result.put("msg", "데이터가 누락되었습니다.");
            result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return result;
		}
		org.json.JSONObject jCommandMap = new org.json.JSONObject(commandMap);
		JSONArray jArrayIds =  jCommandMap.getJSONArray("MEM_MST_MEM_ID");
		
		List<String> memIdList = new ArrayList<String>();
		for(int index = 0; index < jArrayIds.length(); index++) {
			memIdList.add(jArrayIds.getString(index));
			commandMap.put("MEM_MST_MEM_ID", jArrayIds.getString(index));
			restMemberService.insertRestMember(commandMap);
		}
		
		List<String> memIdListSplit = new ArrayList<String>();
		for(int i=0;i<memIdList.size();i++) {
			memIdListSplit.add(memIdList.get(i));
			if(i>0 && (i%950 == 0 || i == memIdList.size()-1 )) {
				Map<String,Object> wrapper = new HashMap<String,Object>();
				wrapper.put("MEM_MST_MEM_ID", memIdListSplit);
				restMemberService.deleteMasterMember(wrapper);
				memIdListSplit.clear();
			}
		}				
		result.put("msg", "정상 처리 되었습니다.");
        result.put("resultCode", HttpServletResponse.SC_OK);
        
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/api/restMemberDelete", method=RequestMethod.POST)
	public Map<String,Object> restMemberDelete (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "").equals("")) {
			result.put("msg", "데이터가 누락되었습니다.");
            result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return result;
		}
		org.json.JSONObject jCommandMap = new org.json.JSONObject(commandMap);
		JSONArray jArrayIds =  jCommandMap.getJSONArray("MEM_MST_MEM_ID");
		
		List<String> memIdList = new ArrayList<String>();
		for(int index = 0; index < jArrayIds.length(); index++) {
			memIdList.add(jArrayIds.getString(index));
			commandMap.put("MEM_MST_MEM_ID", jArrayIds.getString(index));
			restMemberService.insertMasterMember(commandMap);
		}
		
		
		List<String> memIdListSplit = new ArrayList<String>();
		for(int i=0;i<memIdList.size();i++) {
			memIdListSplit.add(memIdList.get(i));
			if(i>0 && (i%950 == 0 || i == memIdList.size()-1 )) {
				Map<String,Object> wrapper = new HashMap<String,Object>();
				wrapper.put("MEM_MST_MEM_ID", memIdListSplit);
				restMemberService.deleteRestMemberList(wrapper);
				memIdListSplit.clear();
			}
		}
		result.put("msg", "정상 처리 되었습니다.");
        result.put("resultCode", HttpServletResponse.SC_OK);
        
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/api/getEshopID", method=RequestMethod.POST)
	public Map<String,Object> getEshopID (HttpServletRequest request, @RequestBody Map<String,Object> commandMap) throws Exception
	{
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("resultCode", HttpServletResponse.SC_OK);
		result.put("msg", "데이터가 조회되었습니다.");
		
		if(StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"), "").equals("")) {
			result.put("msg", "데이터가 누락되었습니다.");
            result.put("resultCode", HttpServletResponse.SC_BAD_REQUEST);
            return result;
		}
		org.json.JSONObject jCommandMap = new org.json.JSONObject(commandMap);
		JSONArray jArrayIds =  jCommandMap.getJSONArray("MEM_MST_MEM_ID");
		
		List<String> memIdList = new ArrayList<String>();
		for(int index = 0; index < jArrayIds.length(); index++) {
			memIdList.add(jArrayIds.getString(index));
		}
		commandMap.put("MEM_MST_MEM_ID", memIdList);
		List<Map<String,Object>> list = infoMemberService.selectMemberEshop(request,commandMap);
		if(list.isEmpty()) {
			result.put("resultCode", HttpServletResponse.SC_BAD_GATEWAY);
		}
		result.put("list", list);
		return result;
	}
}

