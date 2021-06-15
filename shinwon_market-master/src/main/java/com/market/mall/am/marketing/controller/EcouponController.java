package com.market.mall.am.marketing.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.json.Json;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.epasscni.common.annotations.RequestParams;
import com.epasscni.util.ExcelUtil;
import com.epasscni.util.PagingRenderer;
import com.epasscni.util.StringUtil;
import com.epasscni.viewer.JSON;
import com.market.mall.am.common.service.CommonService;
import com.market.mall.am.marketing.service.EcouponService;
import com.market.mall.common.SessionsAdmin;
import com.market.mall.common.SessionsUser;
import com.market.mall.common.annotations.AccessLevelAdmin;
import com.market.mall.model.Code;
import com.market.mall.model.Paging;
import com.market.mall.model.Admin;
import com.market.mall.model.Admin.ROLEADMIN;

import egovframework.rte.fdl.property.EgovPropertyService;

/**
 * @PackageName: com.market.mall.am.marketing.controller
 * @FileName : EcouponController.java
 * @Date :
 * @프로그램 설명 : 관리자 > 마케팅 관리 > 쿠폰 관리를 처리하는 Controller Class
 * @author
 */
@Controller
@AccessLevelAdmin(ROLEADMIN.administrator)
public class EcouponController {

	@Resource(name = "ecouponService")
	private EcouponService ecouponService;

	@Resource(name = "commonService")
	private CommonService commonService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponList
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       : 2
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponList")
	public ModelAndView onlineCouponList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		// 이벤트 목록 갯수
		String searchGb = StringUtil.getString(commandMap.get("searchGb"), "Y");
		if ("Y".equals(searchGb)) {
			int totalCount = this.ecouponService.selectOnlineCouponListCount(commandMap);

			Paging paging = new Paging(totalCount, commandMap);
			mv.addObject("paging", paging);

			List<Map<String, Object>> list = null;
			if (totalCount > 0) { // 이벤트 목록
				list = this.ecouponService.selectOnlineCouponList(commandMap);
			}
			// 쿠폰 형태 리스트
			mv.addObject("totalCount", totalCount);
			mv.addObject("list", list);
		}
		mv.addObject("commandMap", commandMap);
		mv.addObject("couponTypeList", this.commonService.selectCode("COUPON_TYPE"));
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponForm
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponForm")
	public ModelAndView onlineCouponForm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		List<Map<String, Object>> planList = null;

		// 쿠폰번호
		// String onlineCouponNO = this.ecouponService.selectOnlineCouponNO(commandMap);

		// 기획전 목록 가져오기
		planList = this.ecouponService.selectPlanList(commandMap);

		// commandMap.put("CPN_MST_IDX", onlineCouponNO);
		// mv.addObject("onlineCouponNO", onlineCouponNO);
		mv.addObject("couponTypeList", this.commonService.selectCode("COUPON_TYPE"));
		mv.addObject("planList", planList);
		mv.addObject("cpnMemGradeList", this.commonService.selectCode("COMMON_PRI_MEMBER_GRADE"));
		mv.addObject("commandMap", commandMap);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponFormRegist
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    :  관리자 > 마케팅 관리 > 온라인쿠폰생성
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponFormRegist")
	public ModelAndView onlineCouponRegist(HttpServletRequest request, @RequestParams Map<String, Object> commandMap,
			@RequestParams(value = "APPLY_IDXs") String[] APPLY_IDXs,
			@RequestParams(value = "APPLY_IDXs2") String[] APPLY_IDXs2,
			@RequestParams(value = "PRD_CTG_IDXs") String[] PRD_CTG_IDXs,
			@RequestParams(value = "APPLY_BND_IDXs") String[] APPLY_BND_IDXs,
			@RequestParams(value = "APPLY_BND_IDXs2") String[] APPLY_BND_IDXs2,
			@RequestParams(value = "APPLY_VDR_IDXs") String[] APPLY_VDR_IDXs) throws Exception {
		ModelAndView mv = new ModelAndView();
		String alertMsg = "";
		
		// 일반회원 사용 유무
		commandMap.putIfAbsent("CPN_MST_NML_YN", "Y");

		// 적용상품 배열
		commandMap.put("arrPRD_MST_CD", APPLY_IDXs);
		commandMap.put("arrPRD_MST_CD2", APPLY_IDXs2);

		// 카테고리
		commandMap.put("arrPRD_CTG_IDX", PRD_CTG_IDXs);

		// 브랜드
		commandMap.put("arrPRD_BND_IDXs", APPLY_BND_IDXs);
		commandMap.put("arrPRD_BND_IDXs2", APPLY_BND_IDXs2);

		// 협력업체
		commandMap.put("arrPRD_VDR_IDXs", APPLY_VDR_IDXs);

		int result = this.ecouponService.insertOnlineCoupon((MultipartHttpServletRequest) request, commandMap);

		// view Page Info
		if (result > 0) {
			mv.addObject("alertMsg", "등록 되었습니다.");
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
					+ "/am/marketing/onlineCouponList.do");

		} else {
			mv.addObject("alertMsg", "등록에 실패하였습니다.");
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
					+ "/am/marketing/onlineCouponList.do");
		}

		commandMap.clear();
		commandMap.put("searchGb", "Y");

		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponListEdit
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰목록 수정 폼 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponListEdit")
	public ModelAndView onlineCouponListEdit(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> listY = null;
		List<Map<String, Object>> listN = null;

		String CPN_MST_TGT_GBN = null;
		String CPN_MST_ETC_GBN = null;

		if (!"".equals(StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""))) {
			Map<String, Object> resultMap = this.ecouponService.selectOnlineCouponListInfo(commandMap);

			Map<String, Object> row = (Map<String, Object>) resultMap.get("row");
			
			// 타임쿠폰 발급기간 및 발급수량
			row.put("scheduleMap", ecouponService.selectScheduleDetail(commandMap));

			mv.addObject("row", resultMap.get("row"));

			CPN_MST_TGT_GBN = StringUtil.getString(row.get("CPN_MST_TGT_GBN"), "");
			CPN_MST_ETC_GBN = StringUtil.getString(row.get("CPN_MST_ETC_GBN"), "");

			if (CPN_MST_TGT_GBN.equals(Code.CPN_MST_TGT_GBN_PRD)) {
				// 쿠폰적용상품 목록
				listY = this.ecouponService.onlineCouponListEditY(commandMap);
			} else if (CPN_MST_TGT_GBN.equals(Code.CPN_MST_TGT_GBN_BRD)) {
				listY = this.ecouponService.onlineCouponListEditY_C(commandMap);
			} else if (CPN_MST_TGT_GBN.equals("D")) {
				listY = this.ecouponService.onlineCouponListEditY_D(commandMap);
			}

			if (CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_PRD)) {
				// 쿠폰적용제외 목록
				listN = this.ecouponService.onlineCouponListEditN(commandMap);
			} else if (CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_CATE)) {
				listN = this.ecouponService.onlineCouponListEditN_B(commandMap);
			} else if (CPN_MST_ETC_GBN.equals(Code.CPN_MST_ETC_GBN_BRD)) {
				listN = this.ecouponService.onlineCouponListEditN_C(commandMap);
			} else if (CPN_MST_ETC_GBN.equals("D")) {
				listN = this.ecouponService.onlineCouponListEditN_D(commandMap);
			}

			mv.addObject("downloadUrl", "/pc/mypage/dwnCoupon.do?CPN_MST_IDXs=" + commandMap.get("CPN_MST_IDX"));
		}

		mv.addObject("commandMap", commandMap);
		mv.addObject("listY", listY);
		mv.addObject("listN", listN);

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponFormModify
	 * 2. ClassName  : EventController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponFormModify")
	public ModelAndView onlineCouponFormModify(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = 0;
		if (!"".equals(StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""))) {
			result = this.ecouponService.updateOnlineCoupon((MultipartHttpServletRequest) request, commandMap);
		}
		// view Page Info
		if (result > 0) {
			mv.addObject("alertMsg", "수정 되었습니다.");
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
					+ "/am/marketing/onlineCouponList.do");
		} else {
			mv.addObject("alertMsg", "수정에 실패하였습니다.");
			mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
					+ "/am/marketing/onlineCouponList.do");
		}
		mv.addObject("commandMap", commandMap);
		mv.setViewName("/am/common/result");
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponModifyStatus
	 * 2. ClassName  : EventController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 이원중
	 * 5. 작성일       : 2020-06-09
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */

	@RequestMapping("/am/marketing/onlineCouponModifyStatus")
	public JSON onlineCouponModifyStatusAjax(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		JSON json = new JSON();
		int result = 0;
		if (!"".equals(StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""))) {
			result = this.ecouponService.updateOnlineCouponStatus(request, commandMap);
		}

		if (result > 0) {
			json.put("result", "success");
		} else {
			json.put("result", "fail");
		}

		return json;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueList
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueList")
	public ModelAndView onlineCouponIssueList(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		// 목록 갯수
		int totalCount = this.ecouponService.selectOnlineCouponListCount(commandMap);

		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject("paging", paging);

		commandMap.put("startNum", paging.getStartNum());
		commandMap.put("endNum", paging.getEndNum());

		List<Map<String, Object>> list = null;
		if (totalCount > 0) {
			// 이벤트 목록
			list = this.ecouponService.selectOnlineCouponList(commandMap);

		}

		// 쿠폰 형태 리스트
		mv.addObject("totalCount", totalCount);
		mv.addObject("commandMap", commandMap);
		mv.addObject("list", list);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueDet
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueDet")
	public ModelAndView onlineCouponIssueDet(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		// 쿠폰 목록 갯수
		int totalCount = this.ecouponService.onlineCouponIssueDetCount(commandMap);

		// 쿠폰명
		String onlineCouponNm = this.ecouponService.selectOnlineCouponNm(commandMap);

		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject("paging", paging);

		commandMap.put("startNum", paging.getStartNum());
		commandMap.put("endNum", paging.getEndNum());
		commandMap.put("CPN_MST_TITLE", onlineCouponNm);
		commandMap.put("CPN_MST_GBN_NM", ecouponService.selectOnlineCouponGbnNm(commandMap));

		List<Map<String, Object>> list = null;
		if (totalCount > 0) {
			// 쿠론 발행 목록
			list = this.ecouponService.onlineCouponIssueDetList(commandMap);
		}

		// 쿠폰 형태 리스트
		mv.addObject("totalCount", totalCount);
		mv.addObject("commandMap", commandMap);
		mv.addObject("list", list);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueDetOff
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueDetOff")
	public ModelAndView onlineCouponIssueDetOff(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();

		// 이벤트 목록 갯수
		int totalCount = this.ecouponService.onlineCouponIssueDetCount(commandMap);

		// 쿠폰명
		String onlineCouponNm = this.ecouponService.selectOnlineCouponNm(commandMap);

		Paging paging = new Paging(totalCount, commandMap);
		mv.addObject("paging", paging);

		commandMap.put("startNum", paging.getStartNum());
		commandMap.put("endNum", paging.getEndNum());
		commandMap.put("CPN_MST_TITLE", onlineCouponNm);

		List<Map<String, Object>> list = null;
		if (totalCount > 0) {
			// 이벤트 목록
			list = this.ecouponService.onlineCouponIssueDetList(commandMap);

		}

		// 쿠폰 형태 리스트
		mv.addObject("totalCount", totalCount);
		mv.addObject("commandMap", commandMap);
		mv.addObject("list", list);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueAdm
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 쿠폰 관리 목록 
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commadnMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueAdm")
	public ModelAndView onlineCouponIssueAdm(HttpServletRequest request, @RequestParams Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();

		// 쿠폰명
		String onlineCouponNm = this.ecouponService.selectOnlineCouponNm(commandMap);
		// 쿠폰 종류 구분(이름)
		String CPN_MST_GBN_NM = this.ecouponService.selectOnlineCouponGbnNm(commandMap);

		commandMap.put("CPN_MST_TITLE", onlineCouponNm);
		commandMap.put("CPN_MST_GBN_NM", CPN_MST_GBN_NM);

		// 쿠폰 형태 리스트
		mv.addObject("commandMap", commandMap);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueRegist
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    :  관리자 > 프로모션 관리 > 온라인쿠폰생성(관리자 발급)
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueRegist")
	public ModelAndView onlineCouponIssueRegist(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap,
			@RequestParams(value = "APPLY_MEM_IDXs") String[] APPLY_MEM_IDXs) throws Exception {
		ModelAndView mv = new ModelAndView();
		String alertMsg = "";
		int intMem = 0;

		// 회원 배열
		commandMap.put("arrPRD_MEM_IDXs", APPLY_MEM_IDXs);

		Map<String, Object> resultMap = this.ecouponService.selectOnlineCouponListInfo(commandMap); // 쿠폰 정보
		Map<String, Object> row = (Map<String, Object>) resultMap.get("row");

		if (row != null) {
			String strCpnmstLmtYnChk = (String) row.get("CPN_MST_LMT_YN");

			if ("N".equals(strCpnmstLmtYnChk)) {
				int intCpnMstIsuCnt = Integer.parseInt(String.valueOf(row.get("CPN_MST_ISU_CNT").toString())); // 발급수량
				int couponCnt = this.ecouponService.onlineCouponIssueDetCount(commandMap); // 현재 발급 된 쿠폰 수

				String[] arrPRD_MEM_IDXs = (String[]) commandMap.get("arrPRD_MEM_IDXs");

				if (arrPRD_MEM_IDXs != null) {
					intMem = arrPRD_MEM_IDXs.length;
				}

				if (intCpnMstIsuCnt < couponCnt + intMem) {
					mv.addObject("alertMsg", "발급 가능수량은 " + intCpnMstIsuCnt + "개입니다.");
				} else {
					int result = this.ecouponService.insertOnlineCouponIssue((MultipartHttpServletRequest) request,
							commandMap);

					// view Page Info
					mv.addObject("alertMsg", result > 0 ? "등록 되었습니다." : "등록에 실패하였습니다.");
				}
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
						+ "/am/marketing/onlineCouponIssueList.do");
			} else {
				int result = this.ecouponService.insertOnlineCouponIssue((MultipartHttpServletRequest) request,
						commandMap);

				// view Page Info
				mv.addObject("alertMsg", result > 0 ? "등록 되었습니다." : "등록에 실패하였습니다.");
				mv.addObject("returnUrl", StringUtil.getString(request.getAttribute("serverDomain"), "")
						+ "/am/marketing/onlineCouponIssueList.do");
			}
		}

		mv.setViewName("/am/common/result");
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueRegist
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    :  관리자 > 마케팅 관리 > 온라인쿠폰생성
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueUploadPopup")
	public ModelAndView onlineCouponIssueUploadPopup(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("commandMap", commandMap);
		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponIssueRegist
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    :  관리자 > 마케팅 관리 > 온라인쿠폰생성
	 * 4. 작성자       : 
	 * 5. 작성일       :
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/am/marketing/onlineCouponIssueUploadPopupAjax")
	public JSON onlineCouponIssueUploadPopupAjax(HttpServletRequest request,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		int result = 0;

		String[] columName = new String[] { "MEMBER_ID", "MEMBER_NAME" };

		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		CommonsMultipartFile file = (CommonsMultipartFile) multiRequest.getFile("file");

		System.out.println("file.getOriginalFilename() : " + file.getOriginalFilename());

		// 엑셀 파일 read
		List<Map<String, Object>> memberList = ExcelUtil.excelRead(file, columName);

		System.out.println("memberList.size() : " + memberList.size());

		json.put("list", memberList);

//                 for(int i=0;i<memberList.size();i++)
//                 {
//                 	Map<String, Object> tempList = null;
//                 	tempList = memberList.get(i);
//                 	String t1 = (String)tempList.get("MEMBER_ID");
//                 	String t2 = (String)tempList.get("MEMBER_NAME");
//                 	
//                 	System.out.println("row : "+i+" t1 : "+t1);
//                 	System.out.println("row : "+i+" t2 : "+t2);
//                 	
//                 	
//                 }

		// mv.setViewName("/am/common/result");
		return json;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponPopup
	 * 2. ClassName  : EcouponController.java
	 * 3. Comment    : 관리자 > 온라인쿠폰목록 발급된쿠폰번호 팝업
	 * 4. 작성자       : khcho
	 * 5. 작성일       : 2015. 12. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/am/marketing/onlineCouponPopup")
	public ModelAndView onlineCouponPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap)
			throws Exception {
		ModelAndView mv = new ModelAndView();
		// 페이징
		int totalCount = 0;

		totalCount = this.ecouponService.selectOfflineCouponPopupCount(commandMap);

		Paging paging = new Paging(totalCount, commandMap);

		List<Map<String, Object>> list = null;
		if (totalCount > 0) {
			list = this.ecouponService.selectOfflineCouponPopupList(commandMap);
		}

		Map<String, Object> resultMap = this.ecouponService.selectOnlineCouponListInfo(commandMap);

		Map<String, Object> row = (Map<String, Object>) resultMap.get("row");

		mv.addObject("row", resultMap.get("row"));

		// RETURN OBJECT
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("commandMap", commandMap);

		return mv;
	}
	
	@RequestMapping(value = "/am/marketing/onlineCouponCodeCheckPopup")
	public ModelAndView onlineCouponCodeCheckPopup(HttpServletRequest request, @RequestParams() Map<String, Object> commandMap)
			throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		if (!"".equals(StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""))) {
			Map<String, Object> resultMap = this.ecouponService.selectOnlineCouponListInfo(commandMap);

			Map<String, Object> row = (Map<String, Object>) resultMap.get("row");
			mv.addObject("row", resultMap.get("row"));
		}
		
		// 페이징
		int totalCount = 0;

		totalCount = this.ecouponService.selectOfflineCouponPopupCount(commandMap);

		Paging paging = new Paging(totalCount, commandMap);

		List<Map<String, Object>> list = null;
		if (totalCount > 0) {
			list = this.ecouponService.selectOfflineCouponPopupList(commandMap);
		}

		Map<String, Object> resultMap = this.ecouponService.selectOnlineCouponListInfo(commandMap);

		Map<String, Object> row = (Map<String, Object>) resultMap.get("row");

		mv.addObject("row", resultMap.get("row"));

		// RETURN OBJECT
		mv.addObject("list", list);
		mv.addObject("paging", paging);
		mv.addObject("commandMap", commandMap);

		return mv;
	}

	/**
	 * <pre>
	 * 1. MethodName : onlineCouponExcelDownload
	 * 2. ClassName  : ecouponController.java
	 * 3. Comment    : 관리자 > 마케팅 관리 > 제휴쿠폰 엑셀 다운로드 
	 * 4. 작성자       : khcho
	 * 5. 작성일       : 2015. 12. 30.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/am/marketing/onlineCouponExcelDownloadPopup")
	public ModelAndView onlineCouponExcelDownloadPopup(HttpServletRequest request, HttpServletResponse response,
			@RequestParams Map<String, Object> commandMap) throws Exception {

		if (!"".equals(StringUtil.getString(commandMap.get("CPN_MST_IDX"), ""))) {

			// 이벤트 응모자 / 당첨자 목록
			List<Map<String, Object>> dataList = this.ecouponService.selectOfflineCouponPopupList(commandMap);

			String[] rowTitle = null;
			String[] cellSize = null;
			String[] dataName = null;
			String[] dataType = null;

			rowTitle = new String[] { "NO", "쿠폰명", "유효기간", "쿠폰번호" };
			cellSize = new String[] { "20", "80", "60", "60" };
			dataName = new String[] { "RNUM", "CPN_MST_TITLE", "CPN_MST_USE_DT", "CPN_PTN_SHP_NO" };
			dataType = new String[] { "String", "String", "String", "String" };

			String fileName = "offlineCoupon";

			// 당첨자 목록 엑셀 다운로드
			ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
		}
		return null;
	}
	
	
	@RequestMapping("/am/marketing/onlineCouponIsuDetExcelDownload")
	public ModelAndView onlineCouponIsuDetExcelDownload(HttpServletRequest request, HttpServletResponse response,
			@RequestParams Map<String, Object> commandMap) throws Exception {
		JSON json = new JSON();
		String cpnIdx = StringUtil.getString(commandMap.get("CPN_MST_IDX"), "");
		if (!"".equals(cpnIdx)) {

			// 목록 가져오기
			String[] MEM_IDX_ARR = StringUtil.getString(commandMap.get("MEM_IDX_ARR"), "").split(",");
			commandMap.put("MEM_IDX_ARR", MEM_IDX_ARR);
			List<Map<String, Object>> dataList = this.ecouponService.onlineCouponIssueDetDwnList(commandMap);
			
			json.put("result", dataList);
			
			String[] rowTitle = null;
			String[] cellSize = null;
			String[] dataName = null;
			String[] dataType = null;

			rowTitle = new String[] { "참여경로", "이름", "아이디", "회원등급", "주문건수", "후기등록수", "발급일" };
			cellSize = new String[] { "50", "80", "80", "40", "40", "40", "150" };
			dataName = new String[] { "CPN_MEM_ISU_CNL", "MEM_MST_MEM_NM", "CPN_MEM_ID", "MEM_GRD", "ORD_CNT", "REV_CNT", "CPN_MEM_ISU_DT" };
			dataType = new String[] { "String", "String", "String", "String", "int", "int", "Date" };

			String fileName = "CouponIsuDet_" + cpnIdx + "_" + new SimpleDateFormat("yyyyMMdd").format(new Date());

			// 당첨자 목록 엑셀 다운로드
			ExcelUtil.excelDownload(response, rowTitle, cellSize, dataList, dataName, dataType, fileName);
		}
		return null;
	}

}
