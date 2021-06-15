package com.market.mall.pc.cart.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.tools.generic.NumberTool;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.epasscni.util.AesCrypto;
import com.epasscni.util.DateUtil;
import com.epasscni.util.FormatUtil;
import com.epasscni.util.StringUtil;
import com.erp.ErpRequest;
import com.market.mall.am.order.service.OrderService;
import com.market.mall.common.SessionsUser;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.ifcomm.email.Mail;
import com.market.mall.ifcomm.pg.service.PaymentService;
import com.market.mall.ifcomm.sms.Sms;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.model.User.ROLEUSER;
import com.market.mall.orderErpApi.erpApi.com.market.mall.pc.brand.service.OrderErpApiService;
import com.market.mall.pc.cart.service.CartService;
import com.market.mall.pc.common.service.CommonService;
import com.market.mall.pc.member.service.JoinMemberService;
import com.market.mall.pc.mypage.service.MyPointService;
import com.market.mall.pc.mypage.service.MyShoppingService;

import egovframework.rte.fdl.property.EgovPropertyService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Resource(name = "defaultDAO")
	private CommonDefaultDAO defaultDAO;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@Resource(name = "orderErpApiService")
	protected OrderErpApiService orderErpApiService;

	@Resource(name = "pcCommonService")
	private CommonService pcCommonService;

	@Resource(name = "pcJoinMemberService")
	private JoinMemberService joinMemberService;

	@Resource(name = "orderService")
	private OrderService orderService;

	@Resource
	protected Sms sms;

	// 메일 발송시 필요한 서비스 시작
	@Resource
	protected Mail mail;

	@Resource(name = "pcMyShoppingService")
	private MyShoppingService pcMyShoppingService;

	@Resource(name = "pcMyPointService")
	private MyPointService pcMyPointService;

	@Resource(name = "paymentService")
	PaymentService paymentService;

	@Resource(name = "velocityEngine")
	protected VelocityEngine velocityEngine;
	// 메일 발송시 필요한 서비스 끝

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	/**
	 * <pre>
	 * 1. MethodName : updateDupCart
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 장바구니 중복 제거
	 * 4. 작성자       : DEV_KANGHYUNKYU
	 * 5. 작성일       : 2015. 12. 16.
	 * </pre>
	 *
	 * @param commandMap MEM_MST_MEM_ID MEM_CRT_SES_ID
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void updateDupCart(Map<String, Object> commandMap) throws Exception {
		// 선택 옵션 중복 리스트 가져오기
		List<Map<String, Object>> dupCartOptionList = this.defaultDAO.selectList("PcCart.selectCartDupOptionList",
				commandMap);

		if (!dupCartOptionList.isEmpty()) {
			int PRE_MEM_CRT_UP_IDX_CNT = 0;
			for (Map<String, Object> cart : dupCartOptionList) {
				int MEM_CRT_UP_IDX_CNT = StringUtil.getInt(cart.get("MEM_CRT_UP_IDX_CNT"));
				if (PRE_MEM_CRT_UP_IDX_CNT != MEM_CRT_UP_IDX_CNT) {// 각 중복 항목 첫번째만 돌리면 된다.
					Map<String, Object> dupMap = new HashMap<String, Object>();
					dupMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
					dupMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
					dupMap.put("RECENT_MEM_CRT_IDX", cart.get("MEM_CRT_UP_IDX"));

					// 수량 합쳐야할 리스트 가져오기
					List<Map<String, Object>> dupCartOptionSumList = this.defaultDAO
							.selectList("PcCart.selectCartTargetSumList", dupMap);
					if (!dupCartOptionSumList.isEmpty()) {
						String MEM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("MEM_CRT_SHP_MST_IDX"));// 겟잇나우 상점
																											// idx

						List<String> delCrtIdxs = new ArrayList<String>();
						for (Map<String, Object> option : dupCartOptionSumList) {
							dupMap.put("PARENT_SUM_MEM_CRT_IDX", option.get("MEM_CRT_UP_IDX"));// 수량 합칠 대상 부모 idx
							dupMap.put("SUM_MEM_CRT_IDX", option.get("MEM_CRT_IDX"));// 수량 합칠 대상 idx

							// 수량 update 가능 여부 체크 & 겟잇나우 아닌 경우에만 update
							if ("Y".equals(option.get("PRD_OPT_CNT_YN")) && "".equals(MEM_CRT_SHP_MST_IDX)) {
								this.defaultDAO.update("PcCart.updateDupCartOptionCnt", dupMap);// 수량 업데이트
							}

							delCrtIdxs.add(StringUtil.getString(option.get("MEM_CRT_IDX")));
						}

						// 부모 상품 수량 update
						// 수량 update 가능 여부 체크 & 겟잇나우 아닌 경우에만 update
						if ("Y".equals(cart.get("PRD_OPT_CNT_YN")) && "".equals(MEM_CRT_SHP_MST_IDX)) {
							this.defaultDAO.update("PcCart.updateDupCartUpOptionCnt", dupMap);// 부모 상품 수량 업데이트
						}

						delCrtIdxs.add(StringUtil.getString(dupCartOptionSumList.get(0).get("MEM_CRT_UP_IDX")));
						dupMap.put("delCrtIdxs", delCrtIdxs);
						// 장바구니 상품 삭제
						this.defaultDAO.delete("PcCart.deleteDupCartOption", dupMap);
					}
				}

				PRE_MEM_CRT_UP_IDX_CNT = MEM_CRT_UP_IDX_CNT;
			}
		}

		// 옵션 없는 상품 중복 리스트 가져오기
		List<Map<String, Object>> dupCartNoOptionList = this.defaultDAO.selectList("PcCart.selectCartDupNoOptionList",
				commandMap);

		if (!dupCartNoOptionList.isEmpty()) {
			for (Map<String, Object> cart : dupCartNoOptionList) {
				String MEM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("MEM_CRT_SHP_MST_IDX"));// 겟잇나우 상점 idx
				int RECENT_MEM_CRT_IDX = StringUtil.getInt(cart.get("RECENT_MEM_CRT_IDX"));// 최근 장바구니 IDX
				if (RECENT_MEM_CRT_IDX == StringUtil.getInt(cart.get("MEM_CRT_IDX"))) {// 최근 장바구니인 경우 수량 UPDATE
					if ("".equals(MEM_CRT_SHP_MST_IDX)) {// 겟잇나우 아닌 경우에만 update
						this.defaultDAO.update("PcCart.updateDupCartNoOptionCnt", cart);
					}
				} else {// 최근 장바구니 아닌 경우 DELETE
					this.defaultDAO.delete("PcCart.deleteDupCartNoOption", cart);
				}
			}
		}

		// 장바구니 개수 30개 넘는 경우 오래된 상품부터 삭제
		List<Map<String, Object>> cartCntOverPrdList = this.defaultDAO.selectList("PcCart.selectCartCntOverPrdList",
				commandMap);
		if (!cartCntOverPrdList.isEmpty()) {
			List<String> OLD_MEM_CRT_IDXs = new ArrayList<String>();
			for (Map<String, Object> cart : cartCntOverPrdList) {
				OLD_MEM_CRT_IDXs.add(StringUtil.getString(cart.get("MEM_CRT_IDX")));
			}
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
			dataMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
			dataMap.put("MEM_CRT_IDXs", OLD_MEM_CRT_IDXs);
			this.defaultDAO.delete("PcCart.deleteCart", dataMap);
		}
	}

	/**
	 * <pre>
	 * 1. MethodName : checkGetItNowCart
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 겟잇나우 중복상품 장바구니 체크
	 * 4. 작성자       : DEV_KANGHYUNKYU
	 * 5. 작성일       : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> checkGetItNowCart(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 장바구니 담으려는 겟잇나우 상품 정보
		String MEM_MST_MEM_ID = StringUtil.getString(commandMap.get("MEM_MST_MEM_ID"));// 회원 id
		String MEM_CRT_SHP_MST_IDX = StringUtil.getString(commandMap.get("MEM_CRT_SHP_MST_IDX"));// 매장 idx
		String MEM_CRT_GET_PKU_DT = StringUtil.getString(commandMap.get("MEM_CRT_GET_PKU_DT"));// 방문일자
		String MEM_CRT_GET_PKU_HH = StringUtil.getString(commandMap.get("MEM_CRT_GET_PKU_HH"));// 방문시간

		if (!"".equals(MEM_CRT_SHP_MST_IDX) && !"".equals(MEM_CRT_GET_PKU_DT) && !"".equals(MEM_CRT_GET_PKU_HH)
				&& !"".equals(MEM_MST_MEM_ID)) {
			// 선택 옵션 중복 리스트 가져오기
			commandMap.put("CART_DLV_GBN_GET_IT_NOW_CD", Code.CART_DLV_GBN_GET_IT_NOW_CD);
			List<Map<String, Object>> getItNowCartInfoList = this.defaultDAO
					.selectList("PcCart.selectGetItNowCartInfoList", commandMap);

			if (!getItNowCartInfoList.isEmpty()) {// 기존에 겟잇나우 상품이 담겨있는 경우
				int TOT_SHP_MST_IDX = StringUtil.getInt(getItNowCartInfoList.get(0).get("TOT_SHP_MST_IDX"));// 전체 겟잇나우
																											// 매장 개수.
																											// 3개를 넘을 수
																											// 없다.

				String ORG_MEM_CRT_GET_PKU_DT = "";
				String ORG_MEM_CRT_GET_PKU_HH = "";

				boolean isExistSameShop = false;// 동일 매장 존재 여부
				for (Map<String, Object> getItNowCartInfo : getItNowCartInfoList) {
					// 담으려는 상품과 같은 매장이 있는지 체크한다.
					String ORG_MEM_CRT_SHP_MST_IDX = StringUtil.getString(getItNowCartInfo.get("MEM_CRT_SHP_MST_IDX"));
					ORG_MEM_CRT_GET_PKU_DT = StringUtil.getString(getItNowCartInfo.get("MEM_CRT_GET_PKU_DT"));
					ORG_MEM_CRT_GET_PKU_HH = StringUtil.getString(getItNowCartInfo.get("MEM_CRT_GET_PKU_HH"));

					logger.debug("MEM_CRT_SHP_MST_IDX====" + MEM_CRT_SHP_MST_IDX);
					logger.debug("ORG_MEM_CRT_SHP_MST_IDX====" + ORG_MEM_CRT_SHP_MST_IDX);

					if (MEM_CRT_SHP_MST_IDX.equals(ORG_MEM_CRT_SHP_MST_IDX)
							&& MEM_CRT_GET_PKU_DT.equals(ORG_MEM_CRT_GET_PKU_DT)
							&& MEM_CRT_GET_PKU_HH.equals(ORG_MEM_CRT_GET_PKU_HH)) {// 기존 장바구니에 같은 매장이 있음 / 날짜 시간까지 모두
																					// 동일해야 같은 매장으로 친다.
						isExistSameShop = true;
						break;
					}
				}

				if (isExistSameShop) {// 기존 장바구니에 같은 매장이 있음
					logger.debug("[겟잇나우] 매장, 시간 일치 : 장바구니 담기 가능");
					result = 1;
				} else {// 기존 장바구니에 같은 매장이 없음
					if (TOT_SHP_MST_IDX >= 3) {// 기존 장바구니 매장 개수가 3개 이상인 경우
						result = -3;
						resultMsg = "겟잇나우 장바구니 매장은 3개를 초과할 수 없습니다.";
					} else {
						logger.debug("[겟잇나우] 장바구니 매장 3개 이하 : 장바구니 담기 가능");
						result = 1;
					}
				}

			} else {// 기존에 겟잇나우 상품 담겨있지 않은 경우
				logger.debug("[겟잇나우] 장바구니 겟잇나우 상품 없음 : 장바구니 담기 가능");
				result = 1;
			}
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertCart
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 특정 상품의 대표상품코드 / 옵션코드를 기준으로하여 장바구니에 상품을 신규 등록한다.
	 * 단, 동일 상품코드/옵션이 존재하는 경우 수량을 추가
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return 1 : 장바구니 등록 성공 -1 : 판매불가 상품 (등록대기/미판매 등)
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int insertCart(Map<String, Object> commandMap) throws Exception {
		int result = 0;

		// 채널 코드 확인
		String chlCode = StringUtil.getString(commandMap.get("chlCode"));
		logger.debug("chlCode====================" + chlCode);
		commandMap.put("CHN_DTL_CD", chlCode);

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		// User user = TestLoginSession.getTestSession();
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		String productList = commandMap.get("PRODUCT").toString();
		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>() {
		};
		List<Map<String, Object>> productDataList = mapper.readValue(productList, typeRef);

		for (int i = 0; i < productDataList.size(); i++) {
			Map<String, Object> map = productDataList.get(i);
			List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
			list.add(map);
			commandMap.put("PRODUCT_LIST", list);
			commandMap.put("MEM_CRT_COLOR", StringUtil.getString(map.get("MEM_CRT_COLOR"), ""));
			commandMap.put("MEM_CRT_SIZE", StringUtil.getString(map.get("MEM_CRT_SIZE"), ""));
			commandMap.put("MEM_PRD_MST_CD", StringUtil.getString(map.get("MEM_PRD_MST_CD"), ""));
			commandMap.put("MEM_PRD_OPT_DTL_IDX", StringUtil.getString(map.get("MEM_PRD_OPT_DTL_IDX"), ""));
			commandMap.put("PRD_MST_TYPE", StringUtil.getString(map.get("PRD_MST_TYPE"), ""));
			commandMap.put("PRD_MST_CD", StringUtil.getString(map.get("PRD_MST_CD"), ""));
			Map<String, Object> dupcheckResult = defaultDAO.select("PcCart.selectCartDupCartProductIdx", commandMap);
			int dupCheckResult = 0;
			if (dupcheckResult != null && dupcheckResult.containsKey("MEM_CRT_IDX")) {
				commandMap.put("MEM_CRT_CNT", StringUtil.getString(map.get("MEM_CRT_CNT")));
				commandMap.put("MEM_CRT_IDX", dupcheckResult.get("MEM_CRT_IDX"));
				dupCheckResult = defaultDAO.update("PcCart.updateCartCount", commandMap);
			} else {
				dupCheckResult = defaultDAO.insert("PcCart.insertCart", commandMap);
			}
			if (dupCheckResult != 0) {
				result = dupCheckResult;
			}
		}
		return result;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertDirectPurchase
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 상품상세 -> 바로구매시 장바구니에 상품 등록 후 임시 주문 테이블 생성
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7.22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return 0 : 장바구니 등록 성공 -1 : 판매불가 상품 (등록대기/미판매 등)
	 * 
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int insertDirectPurchase(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		int result = 0;

		// 채널 코드 확인
		String chlCode = StringUtil.getString(commandMap.get("chlCode"));
		logger.debug("chlCode====================" + chlCode);
		commandMap.put("CHN_DTL_CD", chlCode);

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		this.defaultDAO.insert("PcCart.deleteDirectCart", commandMap); // 기존에 담겨져있던 바로구매 상품은 삭제한다.

		// 배송유형
		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));

		// 다중 상품 담기
		List<String> OPT_DTL_IDXs = (List<String>) commandMap.get("OPT_DTL_IDXs");
		List<String> memCrtIdxList = new ArrayList<String>();
		String MEM_CRT_UP_IDX = "";
		String LNG_DIV_MNT = ""; // 장기할부 개월
//
//		for(String OPT_DTL_IDX : OPT_DTL_IDXs){
//			Map<String,Object> simplePrdInfo = this.defaultDAO.select("PcCart.selectSimplePrdInfo", commandMap);
//			if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우
//				String PRD_MST_O2O_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_O2O_YN"));
//				if(!"Y".equals(PRD_MST_O2O_YN)){
//					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 겟잇나우 불가 상품 겟잇나우 장바구니 담기 시도 에러 ############################");
//					result = -1;
//					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//					break;
//				}
//			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD){//클린킹인 경우
//				String PRD_MST_IVB_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_IVB_YN"));
//				if(!"Y".equals(PRD_MST_IVB_YN)){
//					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 클린킹 불가 상품 겟잇나우 클린킹 담기 시도 에러 ############################");
//					result = -1;
//					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//					break;
//				}
//			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){//장기할부인 경우
//				String MEM_CRT_LNG_DIV = StringUtil.getString(commandMap.get("MEM_CRT_LNG_DIV"));
//				if("24".equals(MEM_CRT_LNG_DIV)){//24개월인 경우
//					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT1"));
//				}else if("36".equals(MEM_CRT_LNG_DIV)){//36개월인 경우
//					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT2"));
//				}
//				String PRD_MST_LNG_DIV_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_YN"));
//				if(!"Y".equals(PRD_MST_LNG_DIV_YN) || !MEM_CRT_LNG_DIV.equals(LNG_DIV_MNT)){
//					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 장기할부 불가 상품 장기할부 담기 시도 에러 ############################");
//					result = -1;
//					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//					break;
//				}
//			}
//			
//			String PRD_OPT_EST_YN = "";
//			String PRD_OPT_CNT_YN = "";
//			commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
//			if("0".equals(OPT_DTL_IDX)){
//				PRD_OPT_EST_YN = "Y";
//				PRD_OPT_CNT_YN = "Y";
//			}else{
//				//옵션 상세 정보
//				Map<String, Object> optionDetailInfo = this.defaultDAO.select("PcCart.selectOptionDetailInfo", commandMap);
//				PRD_OPT_EST_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_EST_YN"));//필수 옵션 여부
//				PRD_OPT_CNT_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_CNT_YN"));//수량 선택 여부
//			}
//			
//			commandMap.put("MEM_CRT_SLT_YN", "Y".equals(PRD_OPT_EST_YN) ? "N" : "Y");
//			commandMap.put("MEM_CRT_UP_IDX", "N".equals(PRD_OPT_EST_YN) ? MEM_CRT_UP_IDX : "" ); //선택 옵션인 경우에만 들어간다.
//			commandMap.put("MEM_PRD_OPT_DTL_IDX", OPT_DTL_IDX);
		commandMap.put("MEM_PRD_MST_CD", StringUtil.getString(commandMap.get("PRD_MST_CD")));
//			commandMap.put("MEM_CRT_CNT", "N".equals(PRD_OPT_CNT_YN) ? "1" : StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
		commandMap.put("MEM_CRT_LNG_DIV", LNG_DIV_MNT);// 장기할부 개월
//			
		commandMap.put("PLN_MST_IDX", StringUtil.getString(commandMap.get("planIdx")));// 기획전 idx (기획전에서 바로구매한 경우)
//			
		commandMap.put("MEM_CRT_DRT_SAL_YN", "Y");

		String productList = commandMap.get("PRODUCT").toString();
		ObjectMapper mapper = new ObjectMapper();
		TypeReference<List<HashMap<String, Object>>> typeRef = new TypeReference<List<HashMap<String, Object>>>() {
		};
		List<Map<String, Object>> productDataList = mapper.readValue(productList, typeRef);
		commandMap.put("PRODUCT_LIST", productDataList);

		result = this.defaultDAO.insert("PcCart.insertCart", commandMap);

//			
//			// 필수옵션인 경우 상위주문상품 idx로 담아둔다.
//			if("Y".equals(PRD_OPT_EST_YN)){
//				//MEM_CRT_UP_IDX = String.valueOf(result);
//			  MEM_CRT_UP_IDX = StringUtil.getString(commandMap.get("MEM_CRT_IDX"),"");
//			}
//			
//			// 임시 주문 테이블에 바로 넣기 위해 MEM_CRT_IDX를 담아둔다.
//			memCrtIdxList.add(MEM_CRT_UP_IDX);
//		}
//		
		if (result > 0) {
			// 임시 주문 생성
			commandMap.put("MEM_CRT_IDXs", memCrtIdxList);
			String ORD_MST_CD = this.insertTempOrder(commandMap);

			if (!"".equals(ORD_MST_CD)) {
				commandMap.put("ORD_MST_CD", ORD_MST_CD);
				result = 1;
			} else {
				result = -2;
			}
		}

		return result;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertRepayTempOrder
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 재결제 임시 주문 생성
	 * 4. 작성자       : DEV_KANGHYUNKYU
	 * 5. 작성일       : 2015. 12. 2.
	 * </pre>
	 *
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String insertRepayTempOrder(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		int result = 0;

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 기존 임시 주문 정보 삭제
		List<Map<String, Object>> tmpOrdList = this.defaultDAO.selectList("PcCart.selectTempOrderInfoList", commandMap);
		if (!tmpOrdList.isEmpty()) {
			for (Map<String, Object> tmpOrd : tmpOrdList) {
				this.defaultDAO.delete("PcCart.deleteTempOrder", tmpOrd);
				this.defaultDAO.delete("PcCart.deleteTempOrderProduct", tmpOrd);
			}
		}

		// 주문번호 채번
		String ORD_MST_CD = this.selectOrderMstCd(commandMap);

		// 재결제 주문 정보
		Map<String, Object> orderInfo = (Map<String, Object>) commandMap.get("orderInfo");

		// 재결제 주문 상품 목록
		List<Map<String, Object>> orderProductList = (List<Map<String, Object>>) commandMap.get("orderProductList");

		// 임시 주문 데이터 생성
		Map<String, Object> tmp_ord = new HashMap<String, Object>();
		tmp_ord.put("ORD_TMP_MST_CD", ORD_MST_CD);
		tmp_ord.put("ORD_TMP_MEM_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		tmp_ord.put("ORD_TMP_SES_ID", StringUtil.getString(commandMap.get("MEM_CRT_SES_ID")));
		// 겟잇나우는 교환/반품 신청이 없다.
		// tmp_ord.put("ORD_TMP_SHP_MST_IDX",
		// StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_SHP_MST_IDX")));
		tmp_ord.put("ORD_TMP_REG_IP", StringUtil.getString(commandMap.get("remote_addr"), ""));
		tmp_ord.put("ORD_TMP_REG_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
		tmp_ord.put("ORD_TMP_PRE_CD", StringUtil.getString(orderInfo.get("ORD_MST_CD"))); // 재결제 이전 원 주문 번호
		tmp_ord.put("ORD_TMP_DLV_GBN", StringUtil.getString(orderInfo.get("ORD_MST_DLV_GBN"))); // 재결제 이전 원 주문 배송유형

		defaultDAO.insert("PcCart.insertTempOrder", tmp_ord);

		// 임시 주문 상품 데이터 생성
		int ORD_TMP_UP_IDX = 0;
		for (Map<String, Object> ordPrd : orderProductList) {
			if (Code.OST_SEND_END == StringUtil.getInt(ordPrd.get("ORD_PRD_ORD_STATE"))
					|| Code.OST_FIX == StringUtil.getInt(ordPrd.get("ORD_PRD_ORD_STATE"))) {// 배송완료/구매확정 상품만 재결제 가능하다.
				String ORD_PRD_SLT_YN = StringUtil.getString(ordPrd.get("ORD_PRD_SLT_YN"));// 선택옵션 여부

				Map<String, Object> tmp_prd = new HashMap<String, Object>();
				tmp_prd.put("ORD_TMP_MST_CD", ORD_MST_CD);
				tmp_prd.put("PRD_TMP_MST_CD", StringUtil.getString(ordPrd.get("ORD_PRD_MST_CD")));
				tmp_prd.put("PRD_TMP_OPT_DTL_IDX", StringUtil.getString(ordPrd.get("ORD_PRD_OPT_DTL_IDX")));
				tmp_prd.put("PRD_TMP_CNT", StringUtil.getString(ordPrd.get("ORD_PRD_ORD_CNT")));
				// tmp_prd.put("PRD_TMP_DLV_ADD_CAG",
				// StringUtil.getInt(ordPrd.get("ORD_PRD_DLV_ADD_CAG"))); //기존 주문 추가배송비가 들어간다.
				tmp_prd.put("PRD_TMP_DLV_ADD_CAG", 0); // 0으로 셋팅후 주문서에서 재계산한다.
				tmp_prd.put("PLN_MST_IDX", StringUtil.getString(ordPrd.get("PLN_MST_IDX")));
				tmp_prd.put("ORD_TMP_SLT_YN", StringUtil.getString(ordPrd.get("ORD_PRD_SLT_YN")));
				// 서브 옵션인 경우 부모값 넣어줘야 한다.
				if ("Y".equals(ORD_PRD_SLT_YN)) {
					tmp_prd.put("ORD_TMP_UP_IDX", ORD_TMP_UP_IDX);
				}

				// 재결제시 ERP 원라인번호 넣어야한다...
				tmp_prd.put("ORD_TMP_ERP_SEQ", StringUtil.getString(ordPrd.get("ORD_PRD_SEQ")));

				result = defaultDAO.insert("PcCart.insertTempOrderProduct", tmp_prd);

				if ("N".equals(ORD_PRD_SLT_YN)) {// 필수 옵션인 경우에만 저장해둔다.
					ORD_TMP_UP_IDX = result;
				}
			}
		}

		// 입력된 데이터 없는 경우에는 주문번호 날린다.
		if (result == 0) {
			ORD_MST_CD = "";
		}

		return ORD_MST_CD;
	}

	/**
	 * <pre>
	 * 1. MethodName : insertEstimateTempOrder
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 견적 임시 주문 생성
	 * 4. 작성자       : DEV_KANGHYUNKYU
	 * 5. 작성일       : 2016. 2. 29.
	 * </pre>
	 *
	 * @param commandMap
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> insertEstimateTempOrder(Map<String, Object> commandMap, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 기존 임시 주문 정보 삭제
		List<Map<String, Object>> tmpOrdList = this.defaultDAO.selectList("PcCart.selectTempOrderInfoList", commandMap);
		if (!tmpOrdList.isEmpty()) {
			for (Map<String, Object> tmpOrd : tmpOrdList) {
				this.defaultDAO.delete("PcCart.deleteTempOrder", tmpOrd);
				this.defaultDAO.delete("PcCart.deleteTempOrderProduct", tmpOrd);
			}
		}

		// 주문번호 채번
		String ORD_MST_CD = this.selectOrderMstCd(commandMap);

		// 견적 상품 정보
		List<Map<String, Object>> estimatePrdList = this.defaultDAO.selectList("PcCart.selectEstimatePrdList",
				commandMap);

		if (!estimatePrdList.isEmpty()) {
			// 임시 주문 데이터 생성
			Map<String, Object> tmp_ord = new HashMap<String, Object>();
			tmp_ord.put("ORD_TMP_MST_CD", ORD_MST_CD);
			tmp_ord.put("ORD_TMP_MEM_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
			tmp_ord.put("ORD_TMP_REG_IP", StringUtil.getString(commandMap.get("remote_addr"), ""));
			tmp_ord.put("ORD_TMP_REG_ID", StringUtil.getString(commandMap.get("MEM_MST_MEM_ID")));
			tmp_ord.put("ORD_TMP_DLV_GBN", ""); // 배송유형

			defaultDAO.insert("PcCart.insertTempOrder", tmp_ord);

			// 임시 주문 상품 데이터 생성
			int ORD_TMP_UP_IDX = 0;
			for (Map<String, Object> ordPrd : estimatePrdList) {
				String ESM_PRD_UP_IDX = StringUtil.getString(ordPrd.get("ESM_PRD_UP_IDX"), "0");// 상위 견적상품 idx

				Map<String, Object> tmp_prd = new HashMap<String, Object>();
				tmp_prd.put("ORD_TMP_MST_CD", ORD_MST_CD);
				tmp_prd.put("PRD_TMP_MST_CD", StringUtil.getString(ordPrd.get("PRD_MST_CD")));
				tmp_prd.put("PRD_TMP_OPT_DTL_IDX", StringUtil.getString(ordPrd.get("OPT_DTL_IDX")));
				tmp_prd.put("PRD_TMP_CNT", StringUtil.getString(ordPrd.get("ESM_PRD_CNT")));
				tmp_prd.put("PRD_TMP_DLV_ADD_CAG", 0); // 0으로 셋팅후 주문서에서 재계산한다.
				tmp_prd.put("ORD_TMP_SLT_YN", !"0".equals(ESM_PRD_UP_IDX) ? "Y" : "N");
				// 서브 옵션인 경우 부모값 넣어줘야 한다.
				if (!"0".equals(ESM_PRD_UP_IDX)) {
					tmp_prd.put("ORD_TMP_UP_IDX", ORD_TMP_UP_IDX);
				}
				tmp_prd.put("ESM_PRD_IDX", StringUtil.getString(ordPrd.get("ESM_PRD_IDX")));// 견적상품 IDX

				result = defaultDAO.insert("PcCart.insertTempOrderProduct", tmp_prd);

				if ("0".equals(ESM_PRD_UP_IDX)) {// 필수 옵션인 경우에만 저장해둔다.
					ORD_TMP_UP_IDX = result;
				}
			}
		} else {
			resultMsg = "주문이 불가능한 견적입니다.";
		}

		// 입력된 데이터 없는 경우에는 주문번호 날린다.
		if (result == 0) {
			ORD_MST_CD = "";
		}

		resultMap.put("ORD_MST_CD", ORD_MST_CD);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("result", result);

		return resultMap;
	}

	/**
	 * <pre>
	* 1. MethodName : insertTempOrder
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 임시 주문 생성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 24.
	 * </pre>
	 *
	 * @param commandMap MEM_CRT_IDXs 대상 장바구니 idx
	 * 
	 * 
	 * 
	 * 
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public String insertTempOrder(Map<String, Object> commandMap) throws Exception {
		int result = 0;

		// 채널 코드 확인
		String chlCode = StringUtil.getString(commandMap.get("chlCode"));
		// logger.debug("insertTempOrder chlCode=================="+chlCode);

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 기존 임시 주문 정보 삭제
		List<Map<String, Object>> tmpOrdList = this.defaultDAO.selectList("PcCart.selectTempOrderInfoList", commandMap);
		if (!tmpOrdList.isEmpty()) {
			for (Map<String, Object> tmpOrd : tmpOrdList) {
				this.defaultDAO.delete("PcCart.deleteTempOrder", tmpOrd);
				this.defaultDAO.delete("PcCart.deleteTempOrderProduct", tmpOrd);
			}
		}

		// 주문번호 채번
		String ORD_MST_CD = this.selectOrderMstCd(commandMap);

		// 장바구니 목록
		List<Map<String, Object>> simpleCartList = this.defaultDAO.selectList("PcCart.selectSimpleSelectedCartList",
				commandMap);

		int MEM_CRT_DLV_GBN = 0;

		if (simpleCartList != null && simpleCartList.size() > 0) {
			MEM_CRT_DLV_GBN = StringUtil.getInt(simpleCartList.get(0).get("MEM_CRT_DLV_GBN"));
		}

		// 임시 주문 데이터 생성
		Map<String, Object> tmp_ord = new HashMap<String, Object>();
		tmp_ord.put("ORD_TMP_MST_CD", ORD_MST_CD);
		tmp_ord.put("ORD_TMP_MEM_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_MST_MEM_ID")));
		tmp_ord.put("ORD_TMP_SES_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_SES_ID")));
		tmp_ord.put("ORD_TMP_DLV_GBN", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_DLV_GBN")));
		tmp_ord.put("ORD_TMP_REG_IP", StringUtil.getString(commandMap.get("remote_addr"), ""));
		tmp_ord.put("ORD_TMP_REG_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_MST_MEM_ID")));
		tmp_ord.put("PLN_MST_IDX", StringUtil.getString(simpleCartList.get(0).get("PLN_MST_IDX")));

		if (MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {// 겟잇나우인 경우에만 들어가는 데이터
			tmp_ord.put("ORD_TMP_SHP_MST_IDX", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_SHP_MST_IDX")));
			tmp_ord.put("ORD_TMP_GET_PKU_DT", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_GET_PKU_DT")));
			tmp_ord.put("ORD_TMP_GET_PKU_HH", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_GET_PKU_HH")));
		} else if (MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD) {// 장기할부인 경우 개월수 들어가야한다.
			tmp_ord.put("ORD_TMP_LNG_DIV", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_LNG_DIV")));
		}

		defaultDAO.insert("PcCart.insertTempOrder", tmp_ord);

		// 임시 주문 상품 데이터 생성
		int ORD_TMP_UP_IDX = 0;
		// 2020.06.23 해당상품 개수만큼 주문서 INSERT
		for (Map<String, Object> cart : simpleCartList) {
			int cnt = Integer.valueOf(StringUtil.getString(cart.get("MEM_CRT_CNT")));
			for (int i = 0; i < cnt; i++) {
				String MEM_CRT_SLT_YN = StringUtil.getString(cart.get("MEM_CRT_SLT_YN"));// 선택옵션 여부

				Map<String, Object> tmp_prd = new HashMap<String, Object>();
				tmp_prd.put("ORD_TMP_MST_CD", ORD_MST_CD);
				tmp_prd.put("PRD_TMP_MST_CD", StringUtil.getString(cart.get("MEM_PRD_MST_CD")));
				tmp_prd.put("PRD_TMP_OPT_DTL_IDX", StringUtil.getString(cart.get("MEM_PRD_OPT_DTL_IDX")));
				tmp_prd.put("PRD_TMP_CNT", 1);
				tmp_prd.put("PLN_MST_IDX", StringUtil.getString(cart.get("PLN_MST_IDX")));
				tmp_prd.put("MEM_CRT_IDX", StringUtil.getString(cart.get("MEM_CRT_IDX")));// 주문 후 장바구니 제거를 위한 IDX 값
				tmp_prd.put("PRD_TMP_COLOR", StringUtil.getInt(cart.get("MEM_CRT_COLOR")));
				tmp_prd.put("PRD_TMP_SIZE", StringUtil.getString(cart.get("MEM_CRT_SIZE")));
				tmp_prd.put("ORD_TMP_SLT_YN", MEM_CRT_SLT_YN);

				tmp_prd.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD"))); // 채널 코드 있는 경우 넣어준다.

				// 서브 옵션인 경우 부모값 넣어줘야 한다.
				if ("Y".equals(MEM_CRT_SLT_YN)) {
					tmp_prd.put("ORD_TMP_UP_IDX", ORD_TMP_UP_IDX);
				}

				result = defaultDAO.insert("PcCart.insertTempOrderProduct", tmp_prd);

				if ("N".equals(MEM_CRT_SLT_YN)) {// 필수 옵션인 경우에만 저장해둔다.
					ORD_TMP_UP_IDX = result;
				}
			}
		}
		/*
		 * for(Map<String,Object> cart : simpleCartList){ String MEM_CRT_SLT_YN =
		 * StringUtil.getString(cart.get("MEM_CRT_SLT_YN"));//선택옵션 여부
		 * 
		 * Map<String, Object> tmp_prd = new HashMap<String, Object>();
		 * tmp_prd.put("ORD_TMP_MST_CD", ORD_MST_CD); tmp_prd.put("PRD_TMP_MST_CD",
		 * StringUtil.getString(cart.get("MEM_PRD_MST_CD")));
		 * tmp_prd.put("PRD_TMP_OPT_DTL_IDX",
		 * StringUtil.getString(cart.get("MEM_PRD_OPT_DTL_IDX")));
		 * tmp_prd.put("PRD_TMP_CNT", StringUtil.getString(cart.get("MEM_CRT_CNT")));
		 * tmp_prd.put("PLN_MST_IDX", StringUtil.getString(cart.get("PLN_MST_IDX")));
		 * tmp_prd.put("MEM_CRT_IDX",
		 * StringUtil.getString(cart.get("MEM_CRT_IDX")));//주문 후 장바구니 제거를 위한 IDX 값
		 * tmp_prd.put("PRD_TMP_COLOR", StringUtil.getInt(cart.get("MEM_CRT_COLOR")));
		 * tmp_prd.put("PRD_TMP_SIZE", StringUtil.getString(cart.get("MEM_CRT_SIZE")));
		 * tmp_prd.put("ORD_TMP_SLT_YN", MEM_CRT_SLT_YN);
		 * 
		 * tmp_prd.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD"))); //채널
		 * 코드 있는 경우 넣어준다.
		 * 
		 * // 서브 옵션인 경우 부모값 넣어줘야 한다. if("Y".equals(MEM_CRT_SLT_YN)){
		 * tmp_prd.put("ORD_TMP_UP_IDX", ORD_TMP_UP_IDX); }
		 * 
		 * result = defaultDAO.insert("PcCart.insertTempOrderProduct", tmp_prd);
		 * 
		 * if("N".equals(MEM_CRT_SLT_YN)){//필수 옵션인 경우에만 저장해둔다. ORD_TMP_UP_IDX = result;
		 * } }
		 */

		// 입력된 데이터 없는 경우에는 주문번호 날린다.
		if (result == 0) {
			ORD_MST_CD = "";
		}

		return ORD_MST_CD;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectPrdStock
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 상품상세 -> 장바구니 담기 or 바로구매시 재고확인 신원 ERP 연동
	 * 4. 작성자       : 서덕희
	 * 5. 작성일       : 2014. 9. 16.
	 * </pre>
	 *
	 * @param commandMap OPT_DTL_IDXs 옵션 리스트
	 * @return 구매가능수량 result 1 정상 result 0 이하는 판매불가
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked" })
	public Map<String, Object> selectPrdStock(Map<String, Object> commandMap, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// 겟잇나우만 ERP 재고체크
		// 나머지는 옵션 없는 상품인 경우 T_PRD_MST 의 PRD_MST_SEL_CNT 를 체크한다.
		// 옵션이 있으면 T_OPT_DTL의 OPT_DTL_STK_CNT를 체크한다.
		Map<String, Object> requestProductInfo = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";
		int requestCnt = 0;

		JSONArray jsonArray = new JSONArray(StringUtil.getString(commandMap.get("PRODUCT")));
		if (jsonArray.length() < 1) {
			return resultMap;
		}
		JSONObject jsonObject = jsonArray.getJSONObject(0);
		String COLOR_CODE = jsonObject.getString("PRD_COLOR_VAL");
		String SIZE_CODE = jsonObject.getString("PRD_SIZE_VAL");

		// 상품 정보
		requestProductInfo = this.defaultDAO.select("PcCart.selectProducStocktInfoShowwindow", commandMap);

		if (requestProductInfo != null
				&& Code.BND_MST_BRAND_TYPE_O.equals(StringUtil.getString("BND_MST_BRAND_TYPE"))) {
			// 상품 코드
			String PRD_MST_CD = StringUtil.getString(requestProductInfo.get("PRD_MST_CD"));
			// 상품 이름
			String PRD_MST_NM = StringUtil.getString(requestProductInfo.get("PRD_MST_NM"));
			// 옵션 이름
			String OPT_DTL_NM = StringUtil.getString(requestProductInfo.get("OPT_DTL_NM"));

			// 필수 여부
			String PRD_OPT_EST_YN = StringUtil.getString(requestProductInfo.get("PRD_OPT_EST_YN"));

			// 재고수량
			// 옵션 없는 경우 PRD_MST_SEL_CNT, 옵션 있는 경우 OPT_DTL_STK_CNT
			int stockCnt = Integer.valueOf(StringUtil.getString(requestProductInfo.get("STOCK_CNT"), "100"));

			// 품절
			if (stockCnt <= 0) {
				result = -3;
				resultMsg = "상품명 [" + PRD_MST_NM + "]/ 옵션 [" + OPT_DTL_NM + "]\n품절되었습니다.";
			}

			result = 1;
			resultMsg = "재고 가능";
		} else {
			// 상품 정보 없는 경우
			Map<String, Object> stockParam = new HashMap<String, Object>();
			stockParam.put("STYLE_NO", StringUtil.getString(requestProductInfo.get("PRD_MST_ERP_CD")));
			stockParam.put("SEASON_YEAR", StringUtil.getString(requestProductInfo.get("PRD_MST_YEAR")));
			stockParam.put("COLOR_CODE", COLOR_CODE);
			stockParam.put("SIZE_CODE", SIZE_CODE);
			List<Map<String, Object>> stockList = ErpRequest.requestStockInfo(stockParam);

			result = -3;
			resultMsg = "상품정보없음";
			if (stockList.size() > 0) {
				Map<String, Object> stock = stockList.get(0);
				result = StringUtil.getInt(stock.get("STOCK_QTY"));
				resultMsg = "재고 가능";
			}
		}

		logger.debug("#######재고 체크 : result " + result + " resultMsg " + resultMsg);
		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	@SuppressWarnings({ "unchecked" })
	public void selectPrdStockAll(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> requestProductInfo = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";
		int requestCnt = 0;
		String BND_MST_BRAND_TYPE = StringUtil.getString(commandMap.get("BND_MST_BRAND_TYPE"));
		String PRD_MST_ERP_CD = StringUtil.getString(commandMap.get("PRD_MST_ERP_CD"));
		if ("I".equals(BND_MST_BRAND_TYPE) && !PRD_MST_ERP_CD.isEmpty()) {
			List<Map<String, Object>> master = (List<Map<String, Object>>) (ErpRequest
					.requestProductMaster2(PRD_MST_ERP_CD)).get("masterList");
			Map<String, Object> defaultSizeList = (Map<String, Object>) commandMap.get("defaultSizeList");
			List<Map<String, Object>> defalutOptionList = (List<Map<String, Object>>) commandMap
					.get("defalutOptionList");
			if (master == null || master.size() <= 0) {
				return;
			}
			for (int i = 0; i < master.size(); i++) {
				Map<String, Object> masterItem = master.get(i);
				if (defalutOptionList == null || defalutOptionList.size() <= 0) {
					return;
				}
				for (int j = 0; j < defalutOptionList.size(); j++) {
					Map<String, Object> color = (Map<String, Object>) defalutOptionList.get(j);
					if (StringUtil.getString(masterItem.get("COLOR_CODE"))
							.equals(StringUtil.getString(color.get("COLOR_CODE")))) {
						String colorCode = StringUtil.getString(color.get("CMN_COM_IDX"));
						List<Map<String, Object>> sizeList = (List<Map<String, Object>>) defaultSizeList.get(colorCode);
						if (sizeList == null || sizeList.size() <= 0) {
							return;
						}
						for (int k = 0; k < sizeList.size(); k++) {
							Map<String, Object> size = sizeList.get(k);
							if (StringUtil.getString(masterItem.get("SIZE_CODE"))
									.equals(StringUtil.getString(size.get("SIZE_NM")))) {
								size.put("OPT_STK_CNT", masterItem.get("STOCK_QTY"));
							}
						}
					}
				}
			}
		}
	}

	/**
	 * <pre>
	* 1. MethodName : selectCrtStock
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니 -> 주문서 재고 확인
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return result 1 성공
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCrtStock(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_SES_ID", session_id);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";

		logger.info("[BEGIN] 장바구니->주문서 재고 체크");

		// 장바구니 목록
		List<Map<String, Object>> simpleCartList = this.defaultDAO.selectList("PcCart.selectSimpleCartList",
				commandMap);

		if (!simpleCartList.isEmpty()) {
			for (Map<String, Object> cart : simpleCartList) {

				if (Code.BND_MST_BRAND_TYPE_I.equals(cart.get("BND_MST_BRAND_TYPE"))) {
					if (true) {
						List<Map<String, Object>> stockList = ErpRequest
								.requestDetail(StringUtil.getString(cart.get("ERP_PRD_CD")));

					}
				} else {
					String MEM_PRD_OPT_DTL_IDX = StringUtil.getString(cart.get("MEM_PRD_OPT_DTL_IDX"));// 마스터 여부
					String MEM_CRT_SLT_YN = StringUtil.getString(cart.get("MEM_CRT_SLT_YN"));// 필수옵션 여부
					String AVAILABLE_OPT_DT_YN = StringUtil.getString(cart.get("AVAILABLE_OPT_DT_YN"));// 옵션인 경우 기간 가능
																										// 여부
					String OPT_DTL_USE_YN = StringUtil.getString(cart.get("OPT_DTL_USE_YN"));// 옵션인 경우 사용 여부

					// 상품 코드
					String PRD_MST_CD = StringUtil.getString(cart.get("MEM_PRD_MST_CD"));
					// 상품 이름
					String PRD_MST_NM = StringUtil.getString(cart.get("PRD_MST_NM"));
					// 옵션 코드
					String OPT_DTL_IDX = StringUtil.getString(cart.get("OPT_DTL_IDX"));
					// 옵션 이름
					String OPT_DTL_NM = StringUtil.getString(cart.get("OPT_DTL_NM"));

					int MEM_CRT_DLV_GBN = StringUtil.getInt(cart.get("MEM_CRT_DLV_GBN"));// 배송유형
					if (MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {// 겟잇나우 상품인 경우 erp 재고 체크
						String ERP_PRD_CD = StringUtil.getString(cart.get("ERP_PRD_CD"));
						String SHOP_CD = StringUtil.getString(cart.get("SHP_MST_ERP_CD"));
						String PRD_CNT = StringUtil.getString(cart.get("SUM_OPT_CNT"), "9999");// 같은 상품들 sum한 카운트로 재고
																								// 체크하도록 수정

						commandMap.put("ERP_PRD_CD", ERP_PRD_CD);
						commandMap.put("SHOP_CD", SHOP_CD);
						commandMap.put("PRD_CNT", PRD_CNT);

						String stockYn = "N";

						if (!"Y".equals(stockYn)) {// 재고 없는 경우
							logger.debug("겟잇나우 재고 없음. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "]");
							result = -1;
							resultMsg = "재고가 부족합니다.\n상품명 [" + PRD_MST_NM + "]";
							break;
						}

						result = 1;
						resultMsg = "재고 가능";
					} else {// 그외 몰 재고 체크
						if ("N".equals(MEM_CRT_SLT_YN)) {// 필수옵션 or 마스터 상품인 경우
							// 판매상태
							String selState = StringUtil.getString(cart.get("PRD_MST_SEL_STATE"), "");

							// 승인상태
							String apvState = StringUtil.getString(cart.get("PRD_MST_APV_STATE"), "");

							// 판매가능여부 확인
							// 판매상태(PRD_MST_SEL_STATE) 가 I이고 승인상태(PRD_MST_APV_STATE)가 A인 상태만 판매가능
							if (!Code.PRODUCT_SELL_STATE_ING.equals(selState) || !"A".equals(apvState)) {
								logger.debug("판매 불가 상품 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/"
										+ OPT_DTL_NM + " 옵션idx : " + OPT_DTL_IDX + "]");
								result = -1;
								resultMsg = "상품명 [" + PRD_MST_NM + "]\n판매 불가 상품이 포함되어 있습니다.";
								break;
							}
						}

						if (!"0".equals(MEM_PRD_OPT_DTL_IDX)) {// 마스터 상품(필수옵션 업이 상품만 or 상품+선택옵션만 담은 case) 아닌 경우 기간 체크 &
																// 옵션 사용 여부 체크 필요
							if ("N".equals(AVAILABLE_OPT_DT_YN) || "N".equals(OPT_DTL_USE_YN)) {
								logger.debug("판매 불가 옵션 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/"
										+ OPT_DTL_NM + " 옵션idx : " + OPT_DTL_IDX + "]");
								result = -1;
								resultMsg = "옵션명 [" + PRD_MST_NM + "/" + OPT_DTL_NM + "]\n판매 불가 옵션이 포함되어 있습니다.";
								break;
							}
						}

						int stockCnt = Integer.valueOf(StringUtil.getString(cart.get("STOCK_CNT"), "0"));// 재고수량
						int requestCnt = Integer.parseInt(StringUtil.getString(cart.get("SUM_OPT_CNT"), "9999"));// 요청수량(같은
																													// 옵션끼리
																													// SUM한
																													// 개수)

						// 품절
						if (stockCnt <= 0) {
							logger.debug("품절상품. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "]");
							result = -3;
							resultMsg = "상품명 [" + PRD_MST_NM + "]/ 옵션 [" + OPT_DTL_NM + "]\n품절되었습니다.";
							break;
						}

						// 재고 부족
						if (stockCnt < requestCnt) {
							logger.debug("재고부족. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "]");
							logger.debug("요청수량 : [" + requestCnt + "] / 잔여재고 [" + stockCnt + "] ");
							result = -2;
							resultMsg = "재고가 부족합니다.\n상품명 [" + PRD_MST_NM + "/" + OPT_DTL_NM + "]\n요청재고 : " + requestCnt
									+ " / 잔여재고 " + stockCnt;
							break;
						}

						result = 1;
						resultMsg = "재고 가능";
					}
				}

			}
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		logger.info("[END] 장바구니->주문서 재고 체크");

		return resultMap;
	}

	/**
	 * <pre>
	* 1. MethodName : deleteSoldOutCart
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니 품절상품 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 21.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void deleteSoldOutCart(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_SES_ID", session_id);

		int result = -1;

		logger.info("[BEGIN] 장바구니 품절상품 삭제");

		// 장바구니 목록
		List<Map<String, Object>> simpleCartList = this.defaultDAO.selectList("PcCart.selectSimpleCartList",
				commandMap);

		// 삭제할 장바구니 상품 목록
		List<String> toDelMemCrtIdxList = new ArrayList<String>();

		if (!simpleCartList.isEmpty()) {
			for (Map<String, Object> cart : simpleCartList) {
				String MEM_CRT_IDX = StringUtil.getString(cart.get("MEM_CRT_IDX"));// 장바구니 IDX
				String MEM_CRT_UP_IDX = StringUtil.getString(cart.get("MEM_CRT_UP_IDX"));// 장바구니 상위 IDX

				String MEM_PRD_OPT_DTL_IDX = StringUtil.getString(cart.get("MEM_PRD_OPT_DTL_IDX"));// 마스터 여부
				String MEM_CRT_SLT_YN = StringUtil.getString(cart.get("MEM_CRT_SLT_YN"));// 필수옵션 여부
				String AVAILABLE_OPT_DT_YN = StringUtil.getString(cart.get("AVAILABLE_OPT_DT_YN"));// 옵션인 경우 기간 가능 여부
				String OPT_DTL_USE_YN = StringUtil.getString(cart.get("OPT_DTL_USE_YN"));// 옵션인 경우 사용 여부

				// 상품 코드
				String PRD_MST_CD = StringUtil.getString(cart.get("MEM_PRD_MST_CD"));
				// 상품 이름
				String PRD_MST_NM = StringUtil.getString(cart.get("PRD_MST_NM"));
				// 옵션 코드
				String OPT_DTL_IDX = StringUtil.getString(cart.get("OPT_DTL_IDX"));
				// 옵션 이름
				String OPT_DTL_NM = StringUtil.getString(cart.get("OPT_DTL_NM"));

				int MEM_CRT_DLV_GBN = StringUtil.getInt(cart.get("MEM_CRT_DLV_GBN"));// 배송유형
				if (MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {// 겟잇나우 상품인 경우 erp 재고 체크
					String ERP_PRD_CD = StringUtil.getString(cart.get("ERP_PRD_CD"));
					String SHOP_CD = StringUtil.getString(cart.get("SHP_MST_ERP_CD"));
					String PRD_CNT = StringUtil.getString(cart.get("SUM_OPT_CNT"), "9999");// 같은 상품들 sum한 카운트로 재고 체크하도록
																							// 수정

					commandMap.put("ERP_PRD_CD", ERP_PRD_CD);
					commandMap.put("SHOP_CD", SHOP_CD);
					commandMap.put("PRD_CNT", PRD_CNT);

					String stockYn = "N";

					if (!"Y".equals(stockYn)) {// 재고 없는 경우
						logger.debug("겟잇나우 재고 없음. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
								+ " 옵션idx : " + OPT_DTL_IDX + "]");
						toDelMemCrtIdxList.add(MEM_CRT_IDX);
						if (!"".equals(MEM_CRT_UP_IDX)) {// 상위 IDX가 있는 경우 담는다.
							toDelMemCrtIdxList.add(MEM_CRT_UP_IDX);
						}
						continue;
					}
				} else {// 그외 몰 재고 체크
					if ("N".equals(MEM_CRT_SLT_YN)) {// 필수옵션 or 마스터 상품인 경우
						// 판매상태
						String selState = StringUtil.getString(cart.get("PRD_MST_SEL_STATE"), "");

						// 승인상태
						String apvState = StringUtil.getString(cart.get("PRD_MST_APV_STATE"), "");

						// 판매가능여부 확인
						// 판매상태(PRD_MST_SEL_STATE) 가 I이고 승인상태(PRD_MST_APV_STATE)가 A인 상태만 판매가능
						if (!Code.PRODUCT_SELL_STATE_ING.equals(selState) || !"A".equals(apvState)) {
							logger.debug("판매 불가 상품 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "] 장바구니 idx : " + MEM_CRT_IDX);
							toDelMemCrtIdxList.add(MEM_CRT_IDX);
							continue;
						}
					}

					if (!"0".equals(MEM_PRD_OPT_DTL_IDX)) {// 마스터 상품(필수옵션 없이 상품만 or 상품+선택옵션만 담은 case) 아닌 경우 기간 체크 & 옵션
															// 사용 여부 체크 필요
						if ("N".equals(AVAILABLE_OPT_DT_YN) || "N".equals(OPT_DTL_USE_YN)) {
							logger.debug("판매 불가 옵션 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "] 장바구니 idx : " + MEM_CRT_IDX);
							toDelMemCrtIdxList.add(MEM_CRT_IDX);
							if (!"".equals(MEM_CRT_UP_IDX)) {// 상위 IDX가 있는 경우 담는다.
								toDelMemCrtIdxList.add(MEM_CRT_UP_IDX);
							}
							continue;
						}
					}

					int stockCnt = Integer.valueOf(StringUtil.getString(cart.get("STOCK_CNT"), "0"));// 재고수량

					// 품절
					if (stockCnt <= 0) {
						logger.debug("품절상품. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
								+ " 옵션idx : " + OPT_DTL_IDX + "] 장바구니 idx : " + MEM_CRT_IDX);
						toDelMemCrtIdxList.add(MEM_CRT_IDX);
						if (!"".equals(MEM_CRT_UP_IDX)) {// 상위 IDX가 있는 경우 담는다.
							toDelMemCrtIdxList.add(MEM_CRT_UP_IDX);
						}
						continue;
					}
				}
			}
		}

		result = toDelMemCrtIdxList.size();

		if (result > 0) {
			commandMap.put("MEM_CRT_IDXs", toDelMemCrtIdxList);
			this.deleteCart(commandMap);
		}

		logger.info("[END] 장바구니 품절상품 삭제");
	}

	/**
	 * <pre>
	* 1. MethodName : selectTempOrderStock
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 -> 결제 재고 확인
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 17.
	 * </pre>
	 *
	 * @param commandMap ORD_MST_CD 주문번호
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectTempOrderStock(Map<String, Object> commandMap) throws Exception {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";

		logger.info("[BEGIN] 주문서 -> 결제 재고 체크");

		// 장바구니 목록
		List<Map<String, Object>> simpleCartList = this.defaultDAO.selectList("PcCart.selectSimpleTempOrderProductList",
				commandMap);

		if (!simpleCartList.isEmpty()) {
			for (Map<String, Object> cart : simpleCartList) {
				String PRD_TMP_OPT_DTL_IDX = StringUtil.getString(cart.get("PRD_TMP_OPT_DTL_IDX"));// 마스터 여부
				String ORD_TMP_SLT_YN = StringUtil.getString(cart.get("ORD_TMP_SLT_YN"));// 필수옵션 여부
				String AVAILABLE_OPT_DT_YN = StringUtil.getString(cart.get("AVAILABLE_OPT_DT_YN"));// 옵션인 경우 기간 가능 여부
				String OPT_DTL_USE_YN = StringUtil.getString(cart.get("OPT_DTL_USE_YN"));// 옵션인 경우 사용 여부

				// 상품 코드
				String PRD_MST_CD = StringUtil.getString(cart.get("MEM_PRD_MST_CD"));
				// 상품 이름
				String PRD_MST_NM = StringUtil.getString(cart.get("PRD_MST_NM"));
				// 옵션 코드
				String OPT_DTL_IDX = StringUtil.getString(cart.get("OPT_DTL_IDX"));
				// 옵션 이름
				String OPT_DTL_NM = StringUtil.getString(cart.get("OPT_DTL_NM"));

				int ORD_TMP_DLV_GBN = StringUtil.getInt(cart.get("ORD_TMP_DLV_GBN"));// 배송유형
				if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {// 겟잇나우 상품인 경우 erp 재고 체크
					String ERP_PRD_CD = StringUtil.getString(cart.get("ERP_PRD_CD"));
					String SHOP_CD = StringUtil.getString(cart.get("SHP_MST_ERP_CD"));
					String PRD_CNT = StringUtil.getString(cart.get("PRD_TMP_CNT"));

					commandMap.put("ERP_PRD_CD", ERP_PRD_CD);
					commandMap.put("SHOP_CD", SHOP_CD);
					commandMap.put("PRD_CNT", PRD_CNT);

					String stockYn = "N";

					if (!"Y".equals(stockYn)) {// 재고 없는 경우
						logger.debug("겟잇나우 재고 없음. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
								+ " 옵션idx : " + OPT_DTL_IDX + "]");
						result = -1;
						resultMsg = "재고가 부족합니다.\n상품명 [" + PRD_MST_NM + "]";
						break;
					}

					result = 1;
					resultMsg = "재고 가능";
				} else {// 그외 몰 재고 체크
					if ("N".equals(ORD_TMP_SLT_YN)) {// 필수옵션 or 마스터 상품인 경우
						// 판매상태
						String selState = StringUtil.getString(cart.get("PRD_MST_SEL_STATE"), "");

						// 승인상태
						String apvState = StringUtil.getString(cart.get("PRD_MST_APV_STATE"), "");

						// 판매가능여부 확인
						// 판매상태(PRD_MST_SEL_STATE) 가 I이고 승인상태(PRD_MST_APV_STATE)가 A인 상태만 판매가능
						if (!Code.PRODUCT_SELL_STATE_ING.equals(selState) || !"A".equals(apvState)) {
							logger.debug("판매 불가 상품 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "]");
							result = -1;
							resultMsg = "상품명 [" + PRD_MST_NM + "]\n판매 불가 상품이 포함되어 있습니다.";
							break;
						}
					}

					if (!"0".equals(PRD_TMP_OPT_DTL_IDX)) {// 마스터 상품(필수옵션 업이 상품만 or 상품+선택옵션만 담은 case) 아닌 경우 기간 체크 필요 &
															// 옵션 사용 여부 체크 필요
						if ("N".equals(AVAILABLE_OPT_DT_YN) || "N".equals(OPT_DTL_USE_YN)) {
							logger.debug("판매 불가 옵션 포함. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
									+ " 옵션idx : " + OPT_DTL_IDX + "]");
							result = -1;
							resultMsg = "옵션명 [" + PRD_MST_NM + "/" + OPT_DTL_NM + "]\n판매 불가 옵션이 포함되어 있습니다.";
							break;
						}
					}

					int stockCnt = Integer.valueOf(StringUtil.getString(cart.get("STOCK_CNT"), "0"));// 재고수량
					int requestCnt = Integer.parseInt(StringUtil.getString(cart.get("SUM_OPT_CNT"), "9999"));// 요청수량(같은
																												// 옵션끼리
																												// SUM한
																												// 개수)

					// 품절
					if (stockCnt <= 0) {
						logger.debug("품절상품. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
								+ " 옵션idx : " + OPT_DTL_IDX + "]");
						result = -3;
						resultMsg = "상품명 [" + PRD_MST_NM + "]/ 옵션 [" + OPT_DTL_NM + "]\n품절되었습니다.";
						break;
					}

					// 재고 부족
					if (stockCnt < requestCnt) {
						logger.debug("재고부족. 상품코드 [" + PRD_MST_CD + "] 이름 [" + PRD_MST_NM + "/" + OPT_DTL_NM
								+ " 옵션idx : " + OPT_DTL_IDX + "]");
						logger.debug("요청수량 : [" + requestCnt + "] / 잔여재고 [" + stockCnt + "] ");
						result = -2;
						resultMsg = "재고가 부족합니다.\n상품명 [" + PRD_MST_NM + "/" + OPT_DTL_NM + "]\n요청재고 : " + requestCnt
								+ " / 잔여재고 " + stockCnt;
						break;
					}

					result = 1;
					resultMsg = "재고 가능";
				}
			}
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		logger.info("[END] 주문서 -> 결제 재고 체크");

		return resultMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : updateCartOwner
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 로그인직후 호출되며, 미인증 상태에서 등록 했던 장바구니 상품 정보를 해당 회원에게 귀속. 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public void updateCartOwner(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}

		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 로그인시 상품정보 해당 회원에게로 소유권 이전
		this.defaultDAO.update("PcCart.updateCartOwner", commandMap);

		// 중복 상품 삭제
		this.updateDupCart(commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempOrderOwner
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 로그인직후 호출되며, 미인증 상태에서 등록 했던 임시 주문 정보를 해당 회원에게 귀속. 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public void updateTempOrderOwner(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("ORD_TMP_MEM_ID", user.getMEM_MST_MEM_ID());
		}

		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("ORD_TMP_SES_ID", session_id);

		// 로그인시 임시 주문정보 해당 회원에게로 소유권 이전
		this.defaultDAO.update("PcCart.updateTempOrderOwner", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectCartlist
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 장바구니 목록
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked" })
	public Map<String, Object> selectCartlist(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);

		List<Map<String, Object>> cartlist = this.defaultDAO.selectList("PcCart.selectCartlist", commandMap);

		// MarketPlant, 기타 입점업체 / 겟잇나우 / 무형 / 장기할부 장바구니 목록 분리
		List<Map<String, Object>> sysRetailCartList = new ArrayList<Map<String, Object>>();// MarketPlant 상품 리스트
		List<Map<String, Object>> vendorCartList = new ArrayList<Map<String, Object>>();// 업체배송 상품 리스트

		List<Map<String, Object>> getItNowCartList = new ArrayList<Map<String, Object>>();// 겟잇나우 TEMP 상품 리스트
		/*
		 * List<Map<String,Object>> getItNowCartList1 = new
		 * ArrayList<Map<String,Object>>(); List<Map<String,Object>> getItNowCartList2 =
		 * new ArrayList<Map<String,Object>>(); List<Map<String,Object>>
		 * getItNowCartList3 = new ArrayList<Map<String,Object>>();
		 */
		List<Map<String, Object>> serviceCartList = new ArrayList<Map<String, Object>>();// 무형 상품 리스트

		List<Map<String, Object>> tempLongInsCartList = new ArrayList<Map<String, Object>>();// 장기할부 TEMP 전체 상품 리스트
		List<Map<String, Object>> longInsCartList24 = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> longInsCartList36 = new ArrayList<Map<String, Object>>();

		// 상품 배송유형에 따라 분기 처리
		for (Map<String, Object> cart : cartlist) {
			String vdrYn = StringUtil.getString(cart.get("PRD_MST_VDR_YN"), ""); // 입점상품 여부
			int MEM_CRT_DLV_GBN = StringUtil.getInt(cart.get("MEM_CRT_DLV_GBN")); // 배송유형(겟잇나우,무형,장기할부)

			// logger.debug("MEM_CRT_DLV_GBN==============="+MEM_CRT_DLV_GBN);

			switch (MEM_CRT_DLV_GBN) {
			case Code.CART_DLV_GBN_NORMAL_CD:
				if ("N".equals(vdrYn)) {
					sysRetailCartList.add(cart);
				} else {
					vendorCartList.add(cart);
				}
			case Code.CART_DLV_GBN_GET_IT_NOW_CD:
				getItNowCartList.add(cart);
				break;
			case Code.CART_DLV_GBN_SERVICE_CD:
				serviceCartList.add(cart);
				break;
			case Code.CART_DLV_GBN_LONG_INS_CD:
				tempLongInsCartList.add(cart);
				break;
			}
		}

		// 겟잇나우 상품 분리(지점별, 최대 3곳만 장바구니 담기 가능)
		/*
		 * for(Map<String, Object> cart : tempGetItNowCartList){ int GET_IT_NOW_ROWNUM =
		 * StringUtil.getInt(cart.get("GET_IT_NOW_ROWNUM"));
		 * //logger.debug("GET_IT_NOW_ROWNUM==============="+GET_IT_NOW_ROWNUM);
		 * if(GET_IT_NOW_ROWNUM == 1){ getItNowCartList1.add(cart); }else
		 * if(GET_IT_NOW_ROWNUM == 2){ getItNowCartList2.add(cart); }else
		 * if(GET_IT_NOW_ROWNUM == 3){ getItNowCartList3.add(cart); } }
		 */

		// 장기할부 상품 분리(할부개월별)
		/*
		 * if(!tempLongInsCartList.isEmpty()){ for(Map<String, Object> cart :
		 * tempLongInsCartList){ int MEM_CRT_LNG_DIV =
		 * StringUtil.getInt(cart.get("MEM_CRT_LNG_DIV")); //할부개월
		 * 
		 * if(MEM_CRT_LNG_DIV == 24){ longInsCartList24.add(cart); }else
		 * if(MEM_CRT_LNG_DIV == 36){ longInsCartList36.add(cart); } } }
		 */
		commandMap.put("cartlist", cartlist);
		commandMap.put("sysRetailCartList", sysRetailCartList);
		commandMap.put("vendorCartList", vendorCartList);
		/*
		 * commandMap.put("getItNowCartList1", getItNowCartList1);
		 * commandMap.put("getItNowCartList2", getItNowCartList2);
		 * commandMap.put("getItNowCartList3", getItNowCartList3);
		 */
		commandMap.put("serviceCartList", serviceCartList);

		commandMap.put("longInsCartList24", longInsCartList24);
		commandMap.put("longInsCartList36", longInsCartList36);

		// 장바구니 결제금액/배송비 계산 분리
		commandMap.put("cartlistYn", "Y"); // 장바구니 여부
		this.calculateCartAmount(commandMap, cartlist, "");
		this.calculateCartAmount(commandMap, sysRetailCartList, "_sysRetail");
		this.calculateCartAmount(commandMap, vendorCartList, "_vendor");
		/*
		 * this.calculateCartAmount(commandMap, getItNowCartList1, "_get1");
		 * this.calculateCartAmount(commandMap, getItNowCartList2, "_get2");
		 * this.calculateCartAmount(commandMap, getItNowCartList3, "_get3");
		 */
		this.calculateCartAmount(commandMap, serviceCartList, "_service");

		this.calculateCartAmount(commandMap, longInsCartList24, "_long24");
		this.calculateCartAmount(commandMap, longInsCartList36, "_long36");

		return commandMap;
	}

	/**
	 * <pre>
	* 1. MethodName : selectTempOrderProductList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 상품 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectTempOrderProductList(Map<String, Object> commandMap) throws Exception {

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"), "");
		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);
		System.out.println("MEM_MST_MEM_ID=============>" + commandMap.get("MEM_MST_MEM_ID"));
		System.out.println("PRD_MST_CNL_PC_YN=============>" + commandMap.get("PRD_MST_CNL_PC_YN"));
		System.out.println("PRD_MST_CNL_MB_YN=============>" + commandMap.get("PRD_MST_CNL_MB_YN"));
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cartlist = this.defaultDAO.selectList("PcCart.selectTempOrderProductList",
				commandMap);

		// MarketPlant, 기타 입점업체 장바구니 목록 분리
		List<Map<String, Object>> sysRetailCartList = new ArrayList<Map<String, Object>>();// MarketPlant 상품 리스트
		List<Map<String, Object>> vendorCartList = new ArrayList<Map<String, Object>>();// 업체배송 상품 리스트

		// 상품유형에 따라 분기 처리
		for (Map<String, Object> cart : cartlist) {
			String vdrYn = StringUtil.getString(cart.get("PRD_MST_VDR_YN"), "");
			int ORD_TMP_DLV_GBN = StringUtil.getInt(cart.get("ORD_TMP_DLV_GBN")); // 배송유형(MarketPlant, 입점업체만 담는다. 나머지는
																					// 분리할 필요가 없기 때문에 그냥 cartlist로 담음)

			switch (ORD_TMP_DLV_GBN) {
			case Code.CART_DLV_GBN_NORMAL_CD:
				if ("N".equals(vdrYn)) {
					sysRetailCartList.add(cart);
				} else {
					vendorCartList.add(cart);
				}
			}
		}

		commandMap.put("cartlist", cartlist);
		commandMap.put("sysRetailCartList", sysRetailCartList);
		commandMap.put("vendorCartList", vendorCartList);

		// 장바구니 결제금액/배송비 계산 분리
		this.calculateCartAmount(commandMap, cartlist, ""); // 주문서에서는 주문 총 금액만 필요하기 때문에 cartlist만 보낸다.

		return commandMap;
	}

	/**
	 * <pre>
	* 1. MethodName : calculateCartAmount
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문금액/배송비 계산
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @param cartlist
	 * @param cartType
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> calculateCartAmount(Map<String, Object> commandMap, List<Map<String, Object>> cartlist,
			String cartType) throws Exception {

		// -- 주문합계금액
		long cart_amount = 0L; // 판매가 합계
		long cart_prd_amount = 0L; // 상품가 합계
		long cart_ist_cpn_prc = 0L; // 즉시할인가 합계
		long cart_delivery = 0L; // 총 배송비
		long cart_add_delivery = 0L; // 추가 배송비
		long cart_reserve_point = 0L; // 적립예정 포인트

		// 장기할부 개월
		int MEM_CRT_LNG_DIV = 0;

		// 장바구니 페이지 여부(장바구니에서는 추가배송비 계산하지 않는다)
		String cartlistYn = StringUtil.getString(commandMap.get("cartlistYn"), "N");

		boolean isPickup = false;

		// 총 주문금액 계산
		for (Map<String, Object> cart : cartlist) {

			int MEM_CRT_DLV_GBN = StringUtil.getInt(cart.get("MEM_CRT_DLV_GBN")); // 배송유형(겟잇나우,무형,장기할부)
			int ORD_TMP_DLV_GBN = StringUtil.getInt(cart.get("ORD_TMP_DLV_GBN")); // 배송유형(겟잇나우,무형,장기할부)
			// 픽업 상품인 경우
			if (Code.CART_DLV_GBN_GET_IT_NOW_CD == MEM_CRT_DLV_GBN
					|| Code.CART_DLV_GBN_GET_IT_NOW_CD == ORD_TMP_DLV_GBN) {
				isPickup = true;
			}

			if ("N".equals(cartlistYn)) {
				cart_add_delivery = Long.parseLong(StringUtil.getString(cart.get("SUM_FIN_DLV_ADD_CHARGE"))); // 총 추가배송비
			}

			// 배송비무료조건금액 이상인 경우 배송비 무료
			String FREE_DLV_CHARGE_YN = StringUtil.getString(cart.get("FREE_DLV_CHARGE_YN"));
			if ("Y".equals(FREE_DLV_CHARGE_YN)) {
				cart_delivery += 0;
			} else {
				cart_delivery += Long.parseLong(StringUtil.getString(cart.get("FIN_DLV_CHARGE")));
			}

			// 판매가*수량 + 서브옵션 총 합계 = 주문금액
			cart_amount += Long.parseLong(StringUtil.getString(cart.get("CUSTOMER_ORDER_PRICE")));

			// 상품가*수량 + 서브옵션 총 합계 = 주문상품금액
			cart_prd_amount += Long.parseLong(StringUtil.getString(cart.get("PRODUCT_ORDER_PRICE")));

			// 즉시할인가*수량 = 총즉시할인가
			cart_ist_cpn_prc += Long.parseLong(StringUtil.getString(cart.get("INSTANT_CPN_ORDER_PRICE")));

			// 적립예정 포인트
			cart_reserve_point += Long.parseLong(StringUtil.getString(cart.get("RESERVE_POINT")));

			// 장기할부인 경우
			MEM_CRT_LNG_DIV = StringUtil.getInt(cart.get("MEM_CRT_LNG_DIV")); // 할부개월
		}

		if (isPickup) {// 픽업 주문인 경우
			cart_delivery = 0;
		} else {
			cart_delivery = cart_delivery + cart_add_delivery; // 총 배송비 = 배송비 + 추가배송비
		}

		// 주문서에서만 필요한 금액
		int CART_PAYMENT_DC_MILEAGE = 0; // 총 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = 0; // 총 사용 캐쉬백
		int CART_PAYMENT_DC_COUPON = 0; // 총 사용 쿠폰금액
		int CART_PAYMENT_DC_POINT = 0; // 총 사용 포인트
		if (!cartlist.isEmpty() && "N".equals(cartlistYn)) {
			CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_MLG")); // 총 사용 마일리지
			CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_OCB")); // 총 사용 캐쉬백
			CART_PAYMENT_DC_COUPON = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_CPN")); // 총 사용 쿠폰금액
			CART_PAYMENT_DC_POINT = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DC_PIT")); // 총 사용 포인트금액
		}

		// 재주문인 경우 cart_delivery 재계산
		if (!cartlist.isEmpty()) {
			if (!"".equals(StringUtil.getString(cartlist.get(0).get("ORD_TMP_PRE_CD")))) {
				cart_delivery = Long.parseLong(StringUtil.getString(cartlist.get(0).get("SUM_FIN_DLV_CHARGE")));
			}
		}

		// 총 주문금액 계산
		long cart_total = cart_amount - CART_PAYMENT_DC_MILEAGE - CART_PAYMENT_DC_CASHBAG - CART_PAYMENT_DC_COUPON
				- CART_PAYMENT_DC_POINT + cart_delivery;

		// 장기할부인 경우 월 청구예상금액 계산
		int cart_expected_lng_prc = 0;
		if (MEM_CRT_LNG_DIV > 0) {
			cart_expected_lng_prc = (int) (cart_total / MEM_CRT_LNG_DIV);
		}

		commandMap.put("cart_amount" + cartType, cart_amount);
		commandMap.put("cart_prd_amount" + cartType, cart_prd_amount);
		commandMap.put("cart_ist_cpn_prc" + cartType, cart_ist_cpn_prc);
		commandMap.put("cart_reserve_point" + cartType, cart_reserve_point);
		commandMap.put("cart_delivery" + cartType, cart_delivery);
		commandMap.put("cart_add_delivery" + cartType, cart_add_delivery);
		commandMap.put("cart_total" + cartType, cart_total);
		commandMap.put("cart_expected_lng_prc" + cartType, cart_expected_lng_prc);

		return commandMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : deleteCart
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 장바구니 상품 개별/전체 삭제 
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public void deleteCart(Map<String, Object> commandMap) throws Exception {

		User user = (User) commandMap.get("user");

		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}

		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_CRT_SES_ID", session_id);

		this.defaultDAO.delete("PcCart.deleteCart", commandMap);
	}

	/**
	 * <pre>
	 * 1. MethodName : selectOrderMstCd
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 신규주문번호 생성 요청
	 * 4. 작성자       : 이상준
	 * 5. 작성일       : 2014. 7. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOrderMstCd(Map<String, Object> commandMap) throws Exception {

		String ord_mst_cd = this.defaultDAO.selectStr("PcCart.selectOrderMstCd", commandMap);

		return ord_mst_cd;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectOrderTmpMstCd
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 0원결제 시 TMP 테이블에서 주문번호 획득
	 * 4. 작성일       	 : 2020. 6. 20.
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public String selectOrderTmpMstCd(Map<String, Object> commandMap) throws Exception {
		String ord_mst_cd = this.defaultDAO.selectStr("PcCart.selectOrderTmpMstCd", commandMap);
		return ord_mst_cd;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectPitMstIdx
	 * 2. ClassName  : CartService.java
	 * 3. Comment    : 통합포인트  / 임직원포인트 테이블 INSERT 위한 IDX 채번
	 * 4. 작성일       	 : 2020. 6. 24
	 * </pre>
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectPitMstIdx(Map<String, Object> commandMap) throws Exception {

		int pit_mst_idx = this.defaultDAO.selectCount("PcCart.selectPitMstIdx", commandMap);

		return pit_mst_idx;
	}

	/**
	 * <pre>
	* 1. MethodName : updateProductOptionCnt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 옵션/수량 변경
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 7. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateProductOptionCnt(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = -1;
		String resultMsg = "에러가 발생했습니다.";

		User user = (User) commandMap.get("user");

		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}

		String session_id = StringUtil.getString(commandMap.get("session_id"), "");
		commandMap.put("MEM_CRT_SES_ID", session_id);

		// 겟잇나우 여부 체크. 겟잇나우 상품은 옵션/수량 변경 불가능
		Map<String, Object> cartInfo = defaultDAO.select("PcCart.selectCartInfo", commandMap);

		if (cartInfo != null) {
			int MEM_CRT_DLV_GBN = StringUtil.getInt(cartInfo.get("MEM_CRT_DLV_GBN"));
			if (MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {
				result = -1;
				resultMsg = "겟잇나우 주문상품 및 구매수량 변경은\n매장별 재고확인을 위해 상품상세에서만 가능합니다.";
			} else {
				int MEM_CRT_CNT = StringUtil.getInt(commandMap.get("MEM_CRT_CNT"));// 변경 수량
				int stockResult = 0;
				// 재고 체크해야 한다.
				String PRD_OPT_DTL_IDX = StringUtil.getString(commandMap.get("PRD_OPT_DTL_IDX"));// 옵션 idx
				if (!"".equals(PRD_OPT_DTL_IDX)) {// 옵션 변경하는 경우
					if (MEM_CRT_CNT > 0) {// 선택 옵션 변경하는 경우
						stockResult = this.defaultDAO.selectCount("PcCart.selectSubOptionCntCheck", commandMap);
					} else {// 필수 옵션 변경하는 경우
						stockResult = this.defaultDAO.selectCount("PcCart.selectOptionCntCheck", commandMap);
					}
				} else {// 필수옵션(OR 마스터)의 수량만 변경하는 경우
					String MEM_PRD_OPT_DTL_IDX = StringUtil.getString(cartInfo.get("MEM_PRD_OPT_DTL_IDX"));// 장바구니에 담긴
																											// 옵션 idx
					String MEM_PRD_MST_CD = StringUtil.getString(cartInfo.get("MEM_PRD_MST_CD"));// 장바구니에 담긴 상품 마스터 코드

					Map<String, Object> dataMap = new HashMap<String, Object>();

					/*
					 * if(MEM_PRD_OPT_DTL_IDX.equals("0")){//마스터 상품인 경우
					 * dataMap.put("PRD_MST_CD",MEM_PRD_MST_CD);
					 * dataMap.put("MEM_CRT_CNT",MEM_CRT_CNT); stockResult =
					 * this.defaultDAO.selectCount("PcCart.selectMasterCntCheck", dataMap);
					 * }else{//필수옵션 상품인 경우 dataMap.put("PRD_OPT_DTL_IDX",MEM_PRD_OPT_DTL_IDX);
					 * dataMap.put("MEM_CRT_CNT",MEM_CRT_CNT); stockResult =
					 * this.defaultDAO.selectCount("PcCart.selectMasterOptionCntCheck", dataMap); }
					 */
					// 상품 정보 없는 경우
					Map<String, Object> stockParam = new HashMap<String, Object>();
					stockParam.put("STYLE_NO", StringUtil.getString(cartInfo.get("ERP_NO")));
					stockParam.put("SEASON_YEAR", StringUtil.getString(cartInfo.get("ERP_YEAR")));
					stockParam.put("COLOR_CODE", StringUtil.getString(cartInfo.get("ERP_COLOR")));
					stockParam.put("SIZE_CODE", StringUtil.getString(cartInfo.get("ERP_SIZE")));
					List<Map<String, Object>> stockList = ErpRequest.requestStockInfo(stockParam);

					if (stockList.size() > 0) {
						Map<String, Object> stock = stockList.get(0);
						stockResult = StringUtil.getInt(stock.get("STOCK_QTY"));
					}
				}

				if (stockResult > 0) {
					result = defaultDAO.update("PcCart.updateProductOptionCnt", commandMap);

					// 옵션 변경인 경우 UPDATE 후 장바구니 중복 제거
					String OPTION_MODIFY_YN = StringUtil.getString(commandMap.get("OPTION_MODIFY_YN"));
					if ("Y".equals(OPTION_MODIFY_YN)) {
						// 중복 상품 삭제
						this.updateDupCart(commandMap);
					}
				} else {
					result = -1;
					resultMsg = "재고가 부족합니다.";
				}

				if (result <= 0) {
					result = -1;
					// resultMsg = "에러가 발생했습니다.";
				} else {
					resultMsg = "변경되었습니다.";
				}
			}
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);

		return resultMap;
	}

	/**
	 * <pre>
	* 1. MethodName : insertOrder
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 신규주문생성
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 28.
	 * </pre>
	 *
	 * @param request
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unchecked", "null" })
	public Map<String, Object> insertOrder(HttpServletRequest request, Map<String, Object> commandMap,
			HttpServletResponse response) throws Exception {

		logger.info("#######[START] 주문 DB 처리 [ORD_MST_CD : " + StringUtil.getString(commandMap.get("ORD_MST_CD"))
				+ "] ########");

		String orderDbResultcode = "0000"; // 수행결과, 정상
		String orderDbResultmessage = "정상처리되었습니다."; // 수행결과, 정상

		// 주문서 상품 목록
		List<Map<String, Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");

		// 결제수단에 따른 주문상태(초기) 설정
		// 무통장입금인 경우 결제대기 그 외에는 결제완료
		int paymentType = StringUtil.getInt(commandMap.get("radioPayment"));

		// 2020.06.23 , 무통장입금 paytype 으로 구분
		String LGD_PAYTYPE = StringUtil.getString(commandMap.get("LGD_PAYTYPE"));
		if (LGD_PAYTYPE.equals(Code.PG_PAY_METHOD_VIRTUAL)) {
			paymentType = Code.PAY_DEPOSIT;
		}

		int ORDER_STATE = paymentType == Code.PAY_DEPOSIT || paymentType == Code.PAY_ESCROW ? Code.OST_PAY_READY
				: Code.OST_PAY;
		String payDepositYn = ORDER_STATE == Code.OST_PAY_READY ? "Y" : "N";

		// 클린킹인 경우 다른 주문상태 필요!!!
		if (StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DLV_GBN")) == Code.CART_DLV_GBN_SERVICE_CD) {
			ORDER_STATE = Code.OST_CLEANKING_REQUEST;
		}

		// 주문번호
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));

		// 재결제시 이전 주문번호
		String ORD_TMP_PRE_CD = StringUtil.getString(cartlist.get(0).get("ORD_TMP_PRE_CD"));

		// 재결제인 경우 배송완료로 처리!
		if (!"".equals(ORD_TMP_PRE_CD)) {
			ORDER_STATE = Code.OST_SEND_END;
		}

		// 배송유형
		int ORD_TMP_DLV_GBN = StringUtil.getInt(cartlist.get(0).get("ORD_TMP_DLV_GBN"));

		String GENDER = ""; // 성별
		int MEM_MST_MEM_GBN = 0; // 회원구분
		User user = SessionsUser.getSessionUser(request);
		Map<String, Object> userInfo = null;
		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
			userInfo = defaultDAO.select("PcCart.selectUserInfo", commandMap);
			GENDER = StringUtil.getString(userInfo.get("MEM_MST_SEX"));
			MEM_MST_MEM_GBN = StringUtil.getInt(userInfo.get("MEM_MST_MEM_GBN"));
		}

		// [BEGIN]## Database 처리
		String ORDER_ID = "".equals(user.getMEM_MST_MEM_ID()) ? "_GUEST_" : user.getMEM_MST_MEM_ID();
		String MEMBER_NM = StringUtil.getString(commandMap.get("ORD_MST_ORD_NM"), "");
		String email = StringUtil.getString(commandMap.get("ORD_MST_MAIL"), "");

		int CART_PAYMENT_DC_COUPON = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_COUPON")); // 쿠폰 할인 금액
		int CART_PAYMENT_DC_MILEAGE = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_MILEAGE")); // 사용 마일리지
		int CART_PAYMENT_DC_CASHBAG = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_CASHBAG")); // 사용 캐쉬백
		int CART_PAYMENT_DC_POINT = StringUtil.getInt(commandMap.get("CART_PAYMENT_DC_POINT")); // 사용 포인트 (E포인트 + 임직원포인트
																								// + 통합포인트)

		// 해당 포인트 구분화
		int ORD_PRD_DC_PIT = StringUtil.getInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_EPN"))); // E포인트
		int ORD_PRD_DC_TOT_PIT = StringUtil.getInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_TPN"))); // 통합포인트
		int ORD_PRD_DC_SW_PIT = StringUtil.getInt(StringUtil.removeCommaChar((String) commandMap.get("ORD_USE_SW"))); // 임직원포인트

		int ORD_MST_ORD_PRC = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE")); // 총 주문금액(판매가*수량)
		int ORD_MST_DLV_CAG = StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE"))
				+ StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // 총 배송비 = 배송비 + 추가배송비
		int TOT_DLV_DC_CPN = StringUtil.getInt(cartlist.get(0).get("TOT_DLV_DC_CPN")); // 배송비 쿠폰 할인금액

		// 적립 마일리지, 적립 캐쉬백 구하기 위한 금액
		int ORD_PRC = StringUtil.getInt(commandMap.get("ORD_MST_PAY_PRC")) + TOT_DLV_DC_CPN - ORD_MST_DLV_CAG; // 최종결제금액-배송비+배송비무료쿠폰-추가배송비

		// logger.debug("적립금 계산 기준금액 ============="+ORD_PRC);

		// [DB] 1.주문마스터정보
		if ("0000".equals(orderDbResultcode)) {
			Map<String, Object> map_mst = new HashMap<String, Object>();

			// 일반 주문/재결제 공통
			map_mst.put("ORD_MST_CD", ORD_MST_CD); /* 주문_번호 */
			map_mst.put("ORD_MST_ORD_TYPE", commandMap.get("ORD_MST_ORD_TYPE")); /* 주문매체 */
			map_mst.put("ORD_MST_ORD_ID", ORDER_ID); /* 주문자_아이디 */
			map_mst.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE")); /* 결제방법 */
			map_mst.put("payDepositYn", payDepositYn); /* 무통장입금 비교 property */
			map_mst.put("ORD_MST_RFD_CD", commandMap.get("ORD_MST_RFD_CD")); /* 환불_은행_코드 */
			map_mst.put("ORD_MST_RFD_NM", commandMap.get("ORD_MST_RFD_NM")); /* 환불_은행_명 */
			map_mst.put("ORD_MST_RFD_ACT", commandMap.get("ORD_MST_RFD_ACT")); /* 환불_계좌번호 */
			map_mst.put("ORD_MST_RFD_HDR", commandMap.get("ORD_MST_RFD_HDR")); /* 환불_예금주명 */
			map_mst.put("ORD_MST_PCK_YN", commandMap.get("ORD_MST_PCK_YN")); /* 환불_예금주명 */
			map_mst.put("ORD_MST_ORD_PRC", ORD_MST_ORD_PRC); /* 총 주문금액(판매가*수량) */
			map_mst.put("ORD_MST_DC_MLG", CART_PAYMENT_DC_MILEAGE); /* 마일리지사용_합계 */
			map_mst.put("ORD_MST_DC_CPN", CART_PAYMENT_DC_COUPON); /* 쿠폰할인_합계 */
			map_mst.put("ORD_MST_DC_OCB_PIT", CART_PAYMENT_DC_CASHBAG); /* 캐쉬백사용_합계 */
			map_mst.put("ORD_MST_DC_PIT", CART_PAYMENT_DC_POINT); /* 포인트사용_합계 */
			map_mst.put("ORD_MST_PAY_PRC", commandMap.get("ORD_MST_PAY_PRC")); /* 결제금액_합계 */
			map_mst.put("ORD_MST_SEX", GENDER); /* 주문자_성별 */
			map_mst.put("ORD_MST_DLV_CAG", ORD_MST_DLV_CAG); /* 총 배송비 */
			map_mst.put("ORD_MST_DLV_GBN", ORD_TMP_DLV_GBN); /* 상품배송유형 */
			map_mst.put("ORD_MST_PRE_CD", ORD_TMP_PRE_CD); /* 재결제이전주문번호 */
			// map_mst.put("ORD_MST_PRE_CD", ORD_TMP_PRE_CD); /* 재결제이전주문번호 */
			// 재결제 주문인 경우 기존 주문정보 그대로 들어간다
			if (!"".equals(ORD_TMP_PRE_CD)) {
				Map<String, Object> orderInfo = new HashMap<String, Object>();
				orderInfo.put("ORD_MST_CD", ORD_TMP_PRE_CD);
				// 주문 정보
				orderInfo = defaultDAO.select("Order.selectOrderInfo", orderInfo);
				MEMBER_NM = (String) orderInfo.get("ORD_MST_ORD_NM");
				email = (String) orderInfo.get("ORD_MST_MAIL");
				commandMap.put("ORD_MST_HP1", (String) orderInfo.get("ORD_MST_HP1"));
				commandMap.put("ORD_MST_HP2", (String) orderInfo.get("ORD_MST_HP2"));
				commandMap.put("ORD_MST_HP3", (String) orderInfo.get("ORD_MST_HP3"));
				commandMap.put("ORD_MST_DPS_NM", (String) orderInfo.get("ORD_MST_DPS_NM"));

				// 원주문과 동일 마일리지 금액 사용했는지 체크한다. 다른 경우 에러
				int PRE_USED_MLG = StringUtil.getInt(orderInfo.get("ORD_MST_DC_MLG"));

				if (PRE_USED_MLG != CART_PAYMENT_DC_MILEAGE) {
					logger.error("##################### 재결제 마일리지 금액 불일치 / 기존주문[" + PRE_USED_MLG + "] 재주문["
							+ CART_PAYMENT_DC_MILEAGE + "]###########################");
					orderDbResultcode = "10";
					orderDbResultmessage = "재결제 마일리지 금액 불일치";
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}

			map_mst.put("ORD_MST_ORD_NM", MEMBER_NM); /* 주문자_명 */
			map_mst.put("ORD_MST_HP1", commandMap.get("ORD_MST_HP1")); /* 비회원_휴대전화1 */ // 2020.06.24 회원의 휴대전화번호도 입력하도록
																						// 수정함
			map_mst.put("ORD_MST_HP2", commandMap.get("ORD_MST_HP2")); /* 비회원_휴대전화2 */
			map_mst.put("ORD_MST_HP3", commandMap.get("ORD_MST_HP3")); /* 비회원_휴대전화3 */
			map_mst.put("ORD_MST_MAIL", email); /* 메일 주소 */
			map_mst.put("ORD_MST_DPS_NM", commandMap.get("ORD_MST_DPS_NM")); /* 가상계좌 입금자명 */

			String EP_cash_yn = StringUtil.getString(commandMap.get("EP_cash_yn"), "0"); // 현금영수증 신청 여부 0:미발행 1:발행
			map_mst.put("ORD_MST_CSH_RCP", "1".equals(EP_cash_yn) ? "Y" : "N"); /* 현금영수증 신청여부 */
			map_mst.put("ORD_MST_LNG_DIV", StringUtil.getString(cartlist.get(0).get("ORD_TMP_LNG_DIV"))); /* 장기할부 개월 */
			map_mst.put("ESM_MST_IDX", StringUtil.getString(cartlist.get(0).get("ESM_MST_IDX"))); /* 견적관리 IDX */

			map_mst.put("ORD_PRC", ORD_PRC); /* 적립금 계산 기준금액 */

			this.defaultDAO.insert("PcCart.insertOrdMst", map_mst);
		}

		List<String> MEM_CRT_IDXs = new ArrayList<String>();// 장바구니 제거용 idx

		// SMS 발송용 정보
		String prdNm = ""; // 상품명
		int prdCnt = cartlist.size(); // 상품 건수

		// [DB] 2.주문상품정보
		int TOT_ORD_TMP_PRD_SAL_PRC = 0;// 총 상품쿠폰 할인금액
		int TOT_ORD_TMP_DLV_SAL_PRC = 0;// 총 배송비쿠폰 할인금액
		if ("0000".equals(orderDbResultcode)) {
			// 주문상품
			Map<String, Object> map_prd = new HashMap<String, Object>();
			map_prd.put("ORD_ORD_MST_CD", ORD_MST_CD); /* 주문_번호 */
			map_prd.put("ORD_PRD_ORD_STATE", ORDER_STATE); /* 주문상태 */

			// 주문상품이력
			Map<String, Object> map_prd_his = new HashMap<String, Object>();
			map_prd_his.put("ORD_ORD_MST_CD", ORD_MST_CD); /* 주문_번호 */
			map_prd_his.put("ORD_PRD_REG_TYPE", Code.OPERATOR_TYPE_USER); /* 등록자_구분 */
			map_prd_his.put("ORD_PRD_ORD_STATE", ORDER_STATE); /* 주문상태 */
			map_prd_his.put("ORD_PRD_REG_ID", ORDER_ID); /* 최초_등록자_아이디 */
			map_prd_his.put("ORD_PRD_REG_IP", request.getRemoteAddr()); /* 최초_등록자_IP */

			// 각 상품별 주문상품정보, 쿠폰사용정보 등 등록
			String PRE_PRD_CPN_IDX = "0"; // 이전 상품 쿠폰 번호
			String PRE_DLV_CPN_IDX = "0"; // 이전 배송비 쿠폰 번호
			String PRD_CPN_MEM_IDX = ""; // 상품쿠폰 MEM_IDX
			String DLV_CPN_MEM_IDX = ""; // 배송비쿠폰 MEM_IDX

			// 사용포인트 T_ORD_PRD 비울로 분할 적용
			int PRODUCT_ORDER_PRICE = 0; // 상품 가격
			int DB_PAYMENT_PRICE = StringUtil.getInt(cartlist.get(0).get("SUM_TOT_ORDER_PRICE"))
					+ StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_CHARGE"))
					+ StringUtil.getInt(cartlist.get(0).get("SUM_FIN_DLV_ADD_CHARGE")); // DB 총 결제금액
			double OD_PRODUCT_ORDER_PRICE = 0;
			int PRODUCT_ORDER_PRICE_RATIO = 0;
			double DO_ORD_PRD_DC_PIT = 0; // 분할 포인트 -> E 포인트

			double DO_ORD_PRD_DC_TOT_PIT = 0; // 통합포인트
			double DO_ORD_PRD_DC_SW_PIT = 0; // 임직원포인트

			List<Map<String, Object>> MAP_ORD_PRD_DCs = new ArrayList<Map<String, Object>>();// 분할 포인트
			int SUM_ORD_PRD_DC_PIT = 0; // 분할 포인트 합 -> E 포인트 합

			int SUM_ORD_PRD_DC_TOT_PIT = 0;
			int SUM_ORD_PRD_DC_SW_PIT = 0;

			double DO_ORD_PRD_DC_OCB = 0; // 분할 캐쉬백
			int SUM_ORD_PRD_DC_OCB = 0; // 분할 캐쉬백 합
			/*
			 * double DO_ORD_PRD_DC_CPN = 0; //분할 쿠폰 int SUM_ORD_PRD_DC_CPN = 0; //분할 쿠폰 합
			 */
			for (int i = 0; i < cartlist.size(); i++) {
				Map<String, Object> MAP_ORD_PRD_DC = new HashMap<String, Object>(); // 분할 포인트

				PRODUCT_ORDER_PRICE = StringUtil.getInt(cartlist.get(i).get("PRODUCT_ORDER_PRICE"), 0); // 상품 가격
				OD_PRODUCT_ORDER_PRICE = Math.floor(((double) PRODUCT_ORDER_PRICE / (double) DB_PAYMENT_PRICE) * 100); // 계산된
																														// 분할
																														// 비율
				PRODUCT_ORDER_PRICE_RATIO = StringUtil.getInt(OD_PRODUCT_ORDER_PRICE, 0);
				// 비율별로 할인금액 담기
				if (i != cartlist.size() - 1) {

					/*
					 * //포인트 DO_ORD_PRD_DC_PIT = (CART_PAYMENT_DC_POINT *
					 * PRODUCT_ORDER_PRICE_RATIO)/100; MAP_ORD_PRD_DC.put("ORD_PRD_DC_PIT",
					 * StringUtil.getInt(DO_ORD_PRD_DC_PIT,0));
					 */

					// 해당 포인트 구분화
					// int ORD_PRD_DC_PIT = StringUtil.getInt(commandMap.get("ORD_USE_EPN")); //
					// E포인트
					// int ORD_PRD_DC_TOT_PIT = StringUtil.getInt(commandMap.get("ORD_USE_TPN"));
					// //통합포인트
					// int ORD_PRD_DC_SW_PIT = StringUtil.getInt(commandMap.get("ORD_USE_SW")); //
					// 임직원포인트

					// 2020.06.23 포인트 세분화
					// E 포인트
					DO_ORD_PRD_DC_PIT = (ORD_PRD_DC_PIT * PRODUCT_ORDER_PRICE_RATIO) / 100;
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_PIT", StringUtil.getInt(DO_ORD_PRD_DC_PIT, 0));
					// 통합포인트
					DO_ORD_PRD_DC_TOT_PIT = (ORD_PRD_DC_TOT_PIT * PRODUCT_ORDER_PRICE_RATIO) / 100;
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_TOT_PIT", StringUtil.getInt(DO_ORD_PRD_DC_TOT_PIT, 0));
					// 임직원
					DO_ORD_PRD_DC_SW_PIT = (ORD_PRD_DC_SW_PIT * PRODUCT_ORDER_PRICE_RATIO) / 100;
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_SW_PIT", StringUtil.getInt(DO_ORD_PRD_DC_SW_PIT, 0));
					// END 2020.06.23 포인트 세분화

					// 캐쉬백
					DO_ORD_PRD_DC_OCB = (CART_PAYMENT_DC_CASHBAG * PRODUCT_ORDER_PRICE_RATIO) / 100;
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_OCB", StringUtil.getInt(DO_ORD_PRD_DC_OCB, 0));
					// 쿠폰
					/*
					 * DO_ORD_PRD_DC_CPN = (CART_PAYMENT_DC_COUPON * PRODUCT_ORDER_PRICE_RATIO)/100;
					 * MAP_ORD_PRD_DC.put("ORD_PRD_DC_CPN", StringUtil.getInt(DO_ORD_PRD_DC_CPN,0));
					 */

					MAP_ORD_PRD_DCs.add(i, MAP_ORD_PRD_DC);

					SUM_ORD_PRD_DC_PIT = SUM_ORD_PRD_DC_PIT + StringUtil.getInt(DO_ORD_PRD_DC_PIT, 0);

					SUM_ORD_PRD_DC_TOT_PIT = SUM_ORD_PRD_DC_PIT + StringUtil.getInt(DO_ORD_PRD_DC_TOT_PIT, 0); // 통합포인트
																												// 합
					SUM_ORD_PRD_DC_SW_PIT = SUM_ORD_PRD_DC_PIT + StringUtil.getInt(DO_ORD_PRD_DC_SW_PIT, 0); // 임직원포인트 합

					SUM_ORD_PRD_DC_OCB = SUM_ORD_PRD_DC_OCB + StringUtil.getInt(DO_ORD_PRD_DC_OCB, 0);
					// SUM_ORD_PRD_DC_CPN = SUM_ORD_PRD_DC_CPN +
					// StringUtil.getInt(DO_ORD_PRD_DC_CPN,0);
				} else {
					// MAP_ORD_PRD_DC.put("ORD_PRD_DC_PIT", CART_PAYMENT_DC_POINT -
					// SUM_ORD_PRD_DC_PIT); // 사용 포인트 마지막 사용포인트 - 총분할 포인트
					// 2020.06.23 포인트 세분화
					// E 포인트
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_PIT", StringUtil.getInt(ORD_PRD_DC_PIT - SUM_ORD_PRD_DC_PIT, 0));
					// 통합포인트
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_TOT_PIT",
							StringUtil.getInt(ORD_PRD_DC_TOT_PIT - SUM_ORD_PRD_DC_TOT_PIT, 0));
					// 임직원포인트
					MAP_ORD_PRD_DC.put("ORD_PRD_DC_SW_PIT",
							StringUtil.getInt(ORD_PRD_DC_SW_PIT - SUM_ORD_PRD_DC_SW_PIT, 0));
					// END 2020.06.23 포인트 세분화

					MAP_ORD_PRD_DC.put("ORD_PRD_DC_OCB",
							StringUtil.getInt(CART_PAYMENT_DC_CASHBAG - SUM_ORD_PRD_DC_OCB, 0)); // 사용 캐쉬백 마지막 사용캐쉬백 -
																									// 총분할 캐쉬백
					// MAP_ORD_PRD_DC.put("ORD_PRD_DC_CPN", CART_PAYMENT_DC_COUPON -
					// SUM_ORD_PRD_DC_CPN); // 사용 쿠폰 마지막 사용쿠폰 - 총분할 쿠폰
					MAP_ORD_PRD_DCs.add(i, MAP_ORD_PRD_DC);
				}
			}

			int ORD_PRD_IDX = 0;
			int cartIndex = 0;
			
			for (Map<String, Object> cart : cartlist) {
				int PRD_TMP_CNT = Integer.valueOf(StringUtil.getString(cart.get("PRD_TMP_CNT"), "0"));
				// 주문수량이 0 이하인 경우 주문 불가
				if (PRD_TMP_CNT <= 0) {
					logger.error("##################### 주문수량 없음 ###########################");
					orderDbResultcode = "03";
					orderDbResultmessage = "주문수량 없음";
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}

				// SMS 발송용 정보
				if ("".equals(prdNm)) {
					prdNm = StringUtil.getString(cart.get("PRD_MST_NM"));
				}

				// 배송유형이 겟잇나우, 클린킹, 입점상품인 경우 T_ORD_PRD 배송구분에 바로 INSERT 한다.
				int ORD_PRD_DLV_TYPE = 0;
				if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_NORMAL_CD) {// MarketPlant/입점상푼 주문인 경우
					String PRD_MST_VDR_IDX = StringUtil.getString(cart.get("PRD_MST_VDR_IDX"));// 입점업체 idx -1은 기간계상품 / 그
																								// 외는 입점상품.

					if (!"-1".equals(PRD_MST_VDR_IDX) && !"".equals(PRD_MST_VDR_IDX)) {
						ORD_PRD_DLV_TYPE = Code.DLV_TYPE_PARTNER;
					}
				} else if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {// 겟잇나우인 경우
					ORD_PRD_DLV_TYPE = Code.DLV_TYPE_GET_IT_NOW;
				} else if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD) {// 무형배송(클린킹)인 경우
					ORD_PRD_DLV_TYPE = Code.DLV_TYPE_SERVICE;
				}

				if (ORD_PRD_DLV_TYPE > 0) {
					map_prd.put("ORD_PRD_DLV_TYPE", ORD_PRD_DLV_TYPE);
				}

				if (!"".equals(StringUtil.getString(cart.get("MEM_CRT_IDX")))) {
					MEM_CRT_IDXs.add(StringUtil.getString(cart.get("MEM_CRT_IDX")));
				}
				// [DB] 2.주문상품정보
				map_prd.put("ORD_PRD_MST_CD", cart.get("PRD_MST_CD")); // 상품 코드
				map_prd.put("ORD_PRD_OPT_DTL_IDX", cart.get("OPT_DTL_IDX")); // 상품 옵션 코드
				map_prd.put("ORD_PRD_PRD_PRC", cart.get("TMP_PRODUCT_PRICE")); // 상품가(회원/비회원:상품가 기업회원:기업등급가)(추가금 제외)
				map_prd.put("ORD_PRD_SAL_PRC", cart.get("TMP_CUSTOMER_PRICE")); // 판매가(회원:즉시할인가 비회원:상품가 기업회원:기업등급가)(추가금
																				// 포함)(즉시할인가 계산시 옵션추가금 붙여서 구하기 때문에 수정됨)
				map_prd.put("ORD_PRD_ORD_CNT", PRD_TMP_CNT); // 주문상품 개수
				map_prd.put("ORD_PRD_ORD_PRC", cart.get("TOT_CUSTOMER_PRICE")); // 주문금액((판매가+옵션추가금)*수량)
				map_prd.put("ORD_PRD_IST_CPN_PRC", cart.get("INSTANT_CPN_PRC")); // 즉시쿠폰할인금액
				map_prd.put("ORD_PRD_IST_CPN_UNT", cart.get("INSTANT_CPN_UNT")); // 즉시쿠폰할인 정액정율 구분

				map_prd.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD"))); /* 채널 코드 */

				// 묶음 배송 여부
				String DLV_BUNDLE_YN = "N";
				// 재주문인 경우
				if (!"".equals(ORD_TMP_PRE_CD)) {
					// 재주문인 경우 배송비 계산이 불가능하기 때문에 첫번재 상품에 몰아서 담는다.
					if (cartIndex == 0) {
						map_prd.put("ORD_PRD_DLV_CAG", cart.get("SUM_FIN_DLV_CHARGE")); // 개별배송비
					} else {
						map_prd.put("ORD_PRD_DLV_CAG", 0); // 개별배송비
					}
					map_prd.put("ORD_PRD_DLV_BND_CAG", 0); // 묶음배송비
					map_prd.put("ORD_PRD_DLV_ADD_CAG", 0); // 추가배송비
				} else {
					// 배송비(묶음/개별 컬럼 나눠서 넣는다)
					DLV_BUNDLE_YN = (String) cart.get("DLV_BUNDLE_YN"); // 묶음배송여부
					String FREE_DLV_CHARGE_YN = (String) cart.get("FREE_DLV_CHARGE_YN"); // 무료배송여부

					int ORD_PRD_DLV_CAG = 0; // 개별배송비
					int ORD_PRD_DLV_BND_CAG = 0; // 묶음배송비

					if ("Y".equals(DLV_BUNDLE_YN)) {// 묶음배송인 경우
						if ("N".equals(FREE_DLV_CHARGE_YN)) {// 무료배송이 아닌 경우
							ORD_PRD_DLV_BND_CAG = StringUtil.getInt(cart.get("DLV_CHARGE"));
						}
					} else {// 개별배송인 경우
						if ("N".equals(FREE_DLV_CHARGE_YN)) {// 무료배송이 아닌 경우
							ORD_PRD_DLV_CAG = StringUtil.getInt(cart.get("DLV_CHARGE"));
						}
					}

					map_prd.put("ORD_PRD_DLV_CAG", ORD_PRD_DLV_CAG); // 개별배송비
					map_prd.put("ORD_PRD_DLV_BND_CAG", ORD_PRD_DLV_BND_CAG); // 묶음배송비
					map_prd.put("ORD_PRD_DLV_ADD_CAG", cart.get("DLV_ADD_CHARGE")); // 추가배송비
				}

				map_prd.put("ORD_PRD_SIZE", cart.get("PRD_TMP_SIZE"));
				map_prd.put("ORD_PRD_COLOR", cart.get("PRD_TMP_COLOR"));

				map_prd.put("ORD_PRD_DLV_BND_YN", DLV_BUNDLE_YN); // 묶음배송여부
				map_prd.put("ORD_PRD_VDR_IDX", cart.get("PRD_MST_VDR_IDX")); // 입점업체IDX
				map_prd.put("ORD_PRD_OPT_ADD_PRC", cart.get("OPT_DTL_ADD_PRC")); // 옵션 추가금액

				map_prd.put("ORD_PRD_SAV_MIL", cart.get("RESERVE_MILEAGE")); // 적립예정 마일리지
				map_prd.put("ORD_PRD_SAV_OCB", cart.get("RESERVE_CASHBAG")); // 적립예정 캐쉬백

				// 사용 포인트 상품별 분할
				// map_prd.put("ORD_PRD_DC_PIT",
				// StringUtil.getInt(MAP_ORD_PRD_DCs.get(cartIndex).get("ORD_PRD_DC_PIT"),0));
				// // 사용 포인트 분할
				// 2020.06.23 포인트 세분화
				map_prd.put("ORD_PRD_DC_PIT", StringUtil.getInt(MAP_ORD_PRD_DCs.get(cartIndex).get("ORD_PRD_DC_PIT"), 0)); // 사용 E포인트 분할
				map_prd.put("ORD_PRD_DC_TOT_PIT", StringUtil.getInt(MAP_ORD_PRD_DCs.get(cartIndex).get("ORD_PRD_DC_TOT_PIT"), 0)); // 사용 통합포인트 분할
				map_prd.put("ORD_PRD_DC_SW_PIT", StringUtil.getInt(MAP_ORD_PRD_DCs.get(cartIndex).get("ORD_PRD_DC_SW_PIT"), 0)); // 사용 임직원포인트 분할

				// map_prd.put("ORD_PRD_DC_OCB",
				// StringUtil.getInt(MAP_ORD_PRD_DCs.get(cartIndex).get("ORD_PRD_DC_OCB"),0));
				// // 사용 캐쉬백 분할
				map_prd.put("ORD_PRD_DC_OCB", 0); // 2020.06.23 오케이캐시백 금액 임시0원처리
				
				//쿠폰데이터
				
				
				map_prd.put("ORD_PRD_DC_CPN", StringUtil.getInt(cart.get("ORD_TMP_PRD_SAL_PRC"), 0)); // 사용 쿠폰 할인금액

				map_prd.put("ORD_PRD_SLT_YN", "N"); // 선택상품여부
				map_prd.put("ORD_PRD_UP_IDX", ""); // 상위주문상품_IDX
				map_prd.put("ORD_PRD_BUY_PRC", cart.get("PRD_BUY_PRC")); // 매입원가
				map_prd.put("PRD_MST_ERP_CD", cart.get("PRD_ERP_CD")); // 기간계 상품코드

				String DLV_DUE_DT = StringUtil.getString(commandMap.get("DLV_DUE_DT_" + cart.get("PRD_TMP_IDX")));
				map_prd.put("ORD_PRD_DLV_DUE_DT", "".equals(DLV_DUE_DT) ? "" : DLV_DUE_DT.replaceAll("-", ""));// 배송지정일

				map_prd.put("PLN_MST_IDX", StringUtil.getString(cart.get("PLN_MST_IDX")));// 기획전 idx

				// 재결제시 ERP 원라인번호 넣어야한다...
				map_prd.put("ORD_PRD_ERP_SEQ", StringUtil.getString(cart.get("ORD_TMP_ERP_SEQ")));

				// 즉시쿠폰권한(S:MarketPlant, V:입점)
				map_prd.put("ORD_PRD_CPN_OWN", StringUtil.getString(cart.get("PRD_MST_CPN_OWN")));

				ORD_PRD_IDX = this.defaultDAO.insert("PcCart.insertOrdPrd", map_prd);
				
				ORD_PRD_IDX = StringUtil.getInt(map_prd.get("ORD_PRD_IDX"));
				//this.defaultDAO.insert("PcCart.insertOrdPrd", map_prd);
				
				//ORD_PRD_IDX = StringUtil.getInt(cart.get("PRD_MST_CD"));

				// [DB] 주문상품옵션정보 등록

				map_prd.put("ORD_PRD_IDX", StringUtil.getInt(map_prd.get("ORD_PRD_IDX"), 0));

				// [DB] 5.주문상품상태이력
				map_prd_his.put("ORD_PRD_MST_CD", map_prd.get("ORD_PRD_MST_CD"));
				//map_prd_his.put("ORD_PRD_IDX", ORD_PRD_IDX); // 주문상품_번호
				map_prd_his.put("ORD_PRD_IDX", map_prd.get("ORD_PRD_IDX")); // 주문상품_번호
				map_prd_his.put("ORD_PRD_SIZE", cart.get("PRD_TMP_SIZE"));
				map_prd_his.put("ORD_PRD_COLOR", cart.get("PRD_TMP_COLOR"));
				this.defaultDAO.insert("PcCart.insertOrdPrdHistory", map_prd_his);

				// [DB] 10.상품 재고 정보 갱신
				// 재결제시 미갱신
				if ("".equals(ORD_TMP_PRE_CD) && ORD_TMP_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD) {
					// 상품 주문 내역
					Map<String, Object> ordPrdMap = this.defaultDAO.select("PcCart.selectOrdPrdInfo", map_prd);
					int ORD_PRD_OPT_DTL_IDX = StringUtil.getInt(ordPrdMap.get("ORD_PRD_OPT_DTL_IDX"));
					if (ORD_PRD_OPT_DTL_IDX == 0) {// 옵션 없는 상품 - 마스터 재고 차감
						this.defaultDAO.update("PcCart.updatePrdMstStock", ordPrdMap);
					} else {// 옵션 있는 상품 - 옵션 재고 차감
						this.defaultDAO.update("PcCart.updatePrdOptStock", ordPrdMap);
					}
				}

				// 쿠폰 사용 이력 등록
				if (CART_PAYMENT_DC_COUPON > 0) {
					// 2020.06.30 쿠폰할인금액 추가
					int cpnDcAmt = 0;

					int ORD_TMP_PRD_SAL_PRC = StringUtil.getInt(cart.get("ORD_TMP_PRD_SAL_PRC"));// 상품쿠폰할인금액
					String ORD_TMP_PRD_CPN_IDX = StringUtil.getString(cart.get("ORD_TMP_PRD_CPN_IDX"), "0");// 상품쿠폰번호

					int ORD_TMP_DLV_SAL_PRC = StringUtil.getInt(cart.get("ORD_TMP_DLV_SAL_PRC"));// 배송비쿠폰할인금액
					String ORD_TMP_DLV_CPN_IDX = StringUtil.getString(cart.get("ORD_TMP_DLV_CPN_IDX"), "0");// 배송비쿠폰번호

					// 2020.06.30 쿠폰사용 추가
					Map<String, Object> selectMap = new HashMap<String, Object>();
					selectMap.put("CPN_MEM_ID", cart.get("ORD_TMP_MEM_ID"));
					selectMap.put("CPN_MEM_USE_DT", cart.get("PRD_TMP_IDX")); // 주문서번호
					selectMap.put("CPN_TGT_CD", cart.get("PRD_MST_CD")); // 상품번호
					List<Map<String, Object>> cpnSelectList = this.selectUseCpn(selectMap);

					// 중복 배제하고 우선 하나만 사용한다고 생각한 후 처리
					if (cpnSelectList != null && cpnSelectList.size() != 0) {
						// 해당 주문서에 쿠폰사용함
						for (Map<String, Object> cpnData : cpnSelectList) {
							cpnDcAmt = cpnDcAmt + StringUtil.getInt(cpnData.get("CPN_MST_SAL_GBN_PAY")); // 쿠폰할인금액 조회
							ORD_TMP_PRD_SAL_PRC = cpnDcAmt;
							ORD_TMP_PRD_CPN_IDX = StringUtil.getString(cpnData.get("CPN_MST_IDX"));							
						}
					}
					// END 2020.06.30 쿠폰사용 추가

					if (ORD_TMP_PRD_SAL_PRC > 0) {// 상품쿠폰 할인 적용한 경우
						if (!"0".equals(ORD_TMP_PRD_CPN_IDX)) {
							/*
							 * if(!"0".equals(PRE_PRD_CPN_IDX)){
							 * if(!(PRE_PRD_CPN_IDX).equals(ORD_TMP_PRD_CPN_IDX)){//이전 쿠폰 번호와 다른 경우 logger.
							 * error("##################### 상품 쿠폰 IDX 불일치 ###########################");
							 * orderDbResultcode = "06"; orderDbResultmessage = "상품 쿠폰 IDX 불일치";
							 * TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); break;
							 * } }
							 */
							PRE_PRD_CPN_IDX = ORD_TMP_PRD_CPN_IDX; // 쿠폰 번호 비교를 위해 저장. 한 주문에는 하나의 상품 쿠폰만 사용 가능.

							Map<String, Object> map_cpn = new HashMap<String, Object>();
							map_cpn.put("PRD_MST_CD", cart.get("PRD_MST_CD"));// 상품코드
							map_cpn.put("PRD_TMP_CNT", cart.get("PRD_TMP_CNT"));// 수량
							map_cpn.put("CART_PC_MOBILE_GUBUN", commandMap.get("CART_PC_MOBILE_GUBUN"));// pc mobile 구분
							map_cpn.put("MEM_MST_MEM_ID", ORDER_ID);
							map_cpn.put("CPN_MST_IDX", ORD_TMP_PRD_CPN_IDX);
							map_cpn.put("OPT_DTL_IDX", cart.get("OPT_DTL_IDX"));// 필수옵션 IDX
							map_cpn.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD")));// 채널코드

							map_cpn.put("CART_COUPON_TYPE", "prd");// 상품쿠폰
							List<Map<String, Object>> prdCpnList = this.selectCartCouponList(map_cpn);

							if (prdCpnList.isEmpty()) {
								logger.error("##################### 상품 쿠폰 미존재 ###########################");
								orderDbResultcode = "11";
								orderDbResultmessage = "상품 쿠폰 미존재";
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
								break;
							}

							// MEM_IDX 추가
							PRD_CPN_MEM_IDX = StringUtil.getString(prdCpnList.get(0).get("CPN_MEM_IDX"));

							// 할인금액 검증
							int DB_FIN_CPN_DC_PRICE = StringUtil.getInt(prdCpnList.get(0).get("FIN_CPN_DC_PRICE"));
							logger.debug("DB_FIN_CPN_DC_PRICE================" + DB_FIN_CPN_DC_PRICE);
							logger.debug("ORD_TMP_PRD_SAL_PRC================" + ORD_TMP_PRD_SAL_PRC);

							if (DB_FIN_CPN_DC_PRICE == ORD_TMP_PRD_SAL_PRC) {
								map_cpn.put("ORD_MST_CD", ORD_MST_CD);
								map_cpn.put("ORD_PRD_IDX", ORD_PRD_IDX);
								map_cpn.put("CPN_MST_IDX", ORD_TMP_PRD_CPN_IDX);
								map_cpn.put("ORD_CPN_DC_AMT", ORD_TMP_PRD_SAL_PRC);
								map_cpn.put("CPN_MEM_IDX", PRD_CPN_MEM_IDX);
								this.defaultDAO.insert("PcCart.insertOrdCpn", map_cpn);
								TOT_ORD_TMP_PRD_SAL_PRC += ORD_TMP_PRD_SAL_PRC;// 총 상품쿠폰 할인 금액

								// 회원 상품 쿠폰 사용 여부 update
								map_cpn.put("CPN_MEM_USE_YN", "Y");
								map_cpn.put("CPN_MEM_ID", ORDER_ID);
								map_cpn.put("CPN_MST_IDX", PRE_PRD_CPN_IDX);
								map_cpn.put("CPN_MEM_IDX", PRD_CPN_MEM_IDX);
								this.defaultDAO.update("Order.updateCpnUseYn", map_cpn);
							} else {
								logger.error("##################### 상품 쿠폰 할인 금액 불일치 FRONT[" + ORD_TMP_PRD_SAL_PRC
										+ "] DB[" + DB_FIN_CPN_DC_PRICE + "]###########################");
								orderDbResultcode = "05";
								orderDbResultmessage = "상품 쿠폰 할인 금액 불일치";
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
								break;
							}
						} else {
							logger.error("##################### 상품 쿠폰 IDX 미존재 ###########################");
							orderDbResultcode = "06";
							orderDbResultmessage = "상품 쿠폰 IDX 미존재";
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							break;
						}
					}

					if (ORD_TMP_DLV_SAL_PRC > 0) {// 배송비쿠폰 할인 적용한 경우
						if (!"0".equals(ORD_TMP_DLV_CPN_IDX)) {
							if (!"0".equals(PRE_DLV_CPN_IDX)) {
								// 배송비 쿠폰은 한주문당 하나의 상품(묶음인 경우 첫번째 상품)에만 적용이 가능하다.
								// PRE_DLV_CPN_IDX가 0이 아니라면 이미 배송비 쿠폰을 사용한 것이기 때문에 적용이 불가능하다.
								/* if(!(PRE_DLV_CPN_IDX).equals(ORD_TMP_DLV_CPN_IDX)){ */// 이전 쿠폰 번호와 다른 경우
								logger.error("##################### 배송비 쿠폰 중복 사용 ###########################");
								orderDbResultcode = "06";
								orderDbResultmessage = "배송비 쿠폰 중복 사용";
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
								break;
								/* } */
							}
							PRE_DLV_CPN_IDX = ORD_TMP_DLV_CPN_IDX; // 쿠폰 번호 비교를 위해 저장. 한 주문에는 하나의 배송비 쿠폰만 사용 가능.

							Map<String, Object> map_cpn = new HashMap<String, Object>();
							map_cpn.put("PRD_MST_CD", cart.get("PRD_MST_CD"));// 상품코드
							map_cpn.put("PRD_TMP_CNT", cart.get("PRD_TMP_CNT"));// 수량
							map_cpn.put("CART_PC_MOBILE_GUBUN", commandMap.get("CART_PC_MOBILE_GUBUN"));// pc mobile 구분
							map_cpn.put("MEM_MST_MEM_ID", ORDER_ID);
							map_cpn.put("CPN_MST_IDX", ORD_TMP_DLV_CPN_IDX);
							map_cpn.put("OPT_DTL_IDX", cart.get("OPT_DTL_IDX"));// 필수옵션 IDX
							map_cpn.put("CHN_DTL_CD", StringUtil.getString(cart.get("CHN_DTL_CD")));// 채널코드

							map_cpn.put("CART_COUPON_TYPE", "dlv");// 배송비쿠폰
							List<Map<String, Object>> dlvCpnList = this.selectCartCouponList(map_cpn);

							if (dlvCpnList.isEmpty()) {
								logger.error("##################### 배송비 쿠폰 미존재 ###########################");
								orderDbResultcode = "11";
								orderDbResultmessage = "배송비 쿠폰 미존재";
								TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
								break;
							}

							// MEM_IDX 추가
							DLV_CPN_MEM_IDX = StringUtil.getString(dlvCpnList.get(0).get("CPN_MEM_IDX"));

							map_cpn.put("ORD_MST_CD", ORD_MST_CD);
							map_cpn.put("ORD_PRD_IDX", ORD_PRD_IDX);
							map_cpn.put("CPN_MST_IDX", ORD_TMP_DLV_CPN_IDX);
							map_cpn.put("ORD_CPN_DC_AMT", ORD_TMP_DLV_SAL_PRC);
							map_cpn.put("CPN_MEM_IDX", DLV_CPN_MEM_IDX);
							this.defaultDAO.insert("PcCart.insertOrdCpn", map_cpn);
							TOT_ORD_TMP_DLV_SAL_PRC += ORD_TMP_DLV_SAL_PRC;// 총 배송비쿠폰 할인 금액

						} else {
							logger.error("##################### 배송비 쿠폰 IDX 미존재 ###########################");
							orderDbResultcode = "06";
							orderDbResultmessage = "배송비 쿠폰 IDX 미존재";
							TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
							break;
						}
					}
				}

				// 서브 옵션 상품 정보 등록
				// 서브 옵션 등록시 부모 IDX
				int ORD_PRD_UP_IDX = ORD_PRD_IDX;
				List<Map<String, Object>> subPrdList = (List<Map<String, Object>>) cart.get("subPrdList");
				if (subPrdList != null) {// 서브 옵션이 있는 경우만 등록
					for (Map<String, Object> subCart : subPrdList) {
						// [DB] 2.주문상품정보
						map_prd.put("ORD_PRD_MST_CD", cart.get("PRD_MST_CD")); // 상품 코드
						map_prd.put("ORD_PRD_OPT_DTL_IDX", subCart.get("PRD_TMP_OPT_DTL_IDX")); // 상품 옵션 코드
						map_prd.put("ORD_PRD_PRD_PRC", subCart.get("OPT_DTL_ADD_PRC")); // 상품가(옵션추가금)
						map_prd.put("ORD_PRD_SAL_PRC", subCart.get("OPT_DTL_ADD_PRC")); // 판매가(옵션추가금)
						map_prd.put("ORD_PRD_ORD_CNT", subCart.get("PRD_TMP_CNT")); // 주문상품 개수
						map_prd.put("ORD_PRD_ORD_PRC", subCart.get("ORDER_ADD_PRC")); // 주문금액(판매가*수량)
						map_prd.put("ORD_PRD_IST_CPN_PRC", 0); // 즉시쿠폰할인금액
						map_prd.put("ORD_PRD_IST_CPN_UNT", ""); // 즉시쿠폰할인 정액정율 구분

						map_prd.put("ORD_PRD_DLV_CAG", 0); // 개별배송비
						map_prd.put("ORD_PRD_DLV_BND_CAG", 0); // 묶음배송비
						map_prd.put("ORD_PRD_DLV_ADD_CAG", 0); // 추가배송비
						map_prd.put("ORD_PRD_DLV_BND_YN", DLV_BUNDLE_YN); // 묶음배송여부
						map_prd.put("ORD_PRD_VDR_IDX", cart.get("PRD_MST_VDR_IDX")); // 입점업체IDX
						map_prd.put("ORD_PRD_OPT_ADD_PRC", 0); // 옵션 추가금액

						map_prd.put("ORD_PRD_SAV_MIL", 0); // 적립예정 마일리지
						map_prd.put("ORD_PRD_SAV_OCB", 0); // 적립예정 캐쉬백

						map_prd.put("ORD_PRD_SLT_YN", "Y"); // 선택상품여부
						map_prd.put("ORD_PRD_UP_IDX", ORD_PRD_UP_IDX); // 상위주문상품_IDX
						map_prd.put("ORD_PRD_BUY_PRC", subCart.get("PRD_BUY_PRC")); // 매입원가
						map_prd.put("PRD_MST_ERP_CD", subCart.get("OPT_DTL_ERP_CD")); // 기간계 상품코드

						// 즉시쿠폰권한(S:MarketPlant, V:입점)
						map_prd.put("ORD_PRD_CPN_OWN", StringUtil.getString(cart.get("PRD_MST_CPN_OWN")));

						ORD_PRD_IDX = this.defaultDAO.insert("PcCart.insertOrdPrd", map_prd);
						map_prd.put("ORD_PRD_IDX", ORD_PRD_IDX);

						// [DB] 5.주문상품상태이력
						map_prd_his.put("ORD_PRD_MST_CD", map_prd.get("ORD_PRD_MST_CD"));
						map_prd_his.put("ORD_PRD_IDX", ORD_PRD_IDX); // 주문상품_번호
						this.defaultDAO.insert("PcCart.insertOrdPrdHistory", map_prd_his);

						// [DB] 10.상품 재고 정보 갱신
						// 재결제시 미갱신
						if ("".equals(ORD_TMP_PRE_CD) && ORD_TMP_DLV_GBN != Code.CART_DLV_GBN_GET_IT_NOW_CD) {
							// 상품 주문 내역
							Map<String, Object> ordPrdMap = this.defaultDAO.select("PcCart.selectOrdPrdInfo", map_prd);
							// 옵션 있는 상품 - 옵션 재고 차감
							this.defaultDAO.update("PcCart.updatePrdOptStock", ordPrdMap);
						}
					}
				}
				
				cartIndex++;
			}

			// 총 쿠폰할인 금액 검증
			// if("0000".equals(orderDbResultcode) && CART_PAYMENT_DC_COUPON !=
			// TOT_ORD_TMP_PRD_SAL_PRC + TOT_ORD_TMP_DLV_SAL_PRC){
			// 2020.07.01 쿠폰할인금액 추가
			// if("0000".equals(orderDbResultcode) && CART_PAYMENT_DC_COUPON !=
			// TOT_ORD_TMP_PRD_SAL_PRC + TOT_ORD_TMP_DLV_SAL_PRC + cpnDcAmt){
			if ("0000".equals(orderDbResultcode)
					&& CART_PAYMENT_DC_COUPON != TOT_ORD_TMP_PRD_SAL_PRC + TOT_ORD_TMP_DLV_SAL_PRC) {
				logger.error("##################### 총 쿠폰 할인 금액 불일치 TOT[" + CART_PAYMENT_DC_COUPON + "] PRD["
						+ TOT_ORD_TMP_PRD_SAL_PRC + "] DLV[" + TOT_ORD_TMP_DLV_SAL_PRC
						+ "]###########################");
				orderDbResultcode = "07";
				orderDbResultmessage = "총 쿠폰 할인 금액 불일치";
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			} else {
				/*
				 * if(!"0".equals(PRE_PRD_CPN_IDX)){ Map<String,Object> map_cpn = new
				 * HashMap<String,Object>(); // 회원 상품 쿠폰 사용 여부 update
				 * map_cpn.put("CPN_MEM_USE_YN", "Y"); map_cpn.put("CPN_MEM_ID", ORDER_ID);
				 * map_cpn.put("CPN_MST_IDX", PRE_PRD_CPN_IDX); map_cpn.put("CPN_MEM_IDX",
				 * PRD_CPN_MEM_IDX); this.defaultDAO.update("Order.updateCpnUseYn", map_cpn); }
				 */

				if (!"0".equals(PRE_DLV_CPN_IDX)) {
					Map<String, Object> map_cpn = new HashMap<String, Object>();
					// 회원 배송비 쿠폰 사용 여부 update
					map_cpn.put("CPN_MEM_USE_YN", "Y");
					map_cpn.put("CPN_MEM_ID", ORDER_ID);
					map_cpn.put("CPN_MST_IDX", PRE_DLV_CPN_IDX);
					map_cpn.put("CPN_MEM_IDX", DLV_CPN_MEM_IDX);
					this.defaultDAO.update("Order.updateCpnUseYn", map_cpn);
				}
			}

			// [DB] 6.EDI배송예약번호 갱신(교환시 정렬순서 위해 UPDATE)
			if ("0000".equals(orderDbResultcode)) {
				this.defaultDAO.update("PcCart.updateOrdPrdEdiNo", map_prd);
				// [DB] 7.라인번호 갱신
				this.defaultDAO.update("PcCart.updateOrdPrdSeq", map_prd);
			}
		}

		// [DB] 6.사은품 등록
		// 재결제시 미등록
		if ("".equals(ORD_TMP_PRE_CD)) {
			if ("0000".equals(orderDbResultcode)) {
				// 사은품 정보 가져오기
				String[] gftMstIdxs = request.getParameterValues("gftMstIdxs");
				if (gftMstIdxs != null && gftMstIdxs.length > 0) {
					for (String gftMstIdx : gftMstIdxs) {
						Map<String, Object> gftMstMap = new HashMap<String, Object>();
						gftMstMap.put("ORD_ORD_MST_CD", ORD_MST_CD);
						gftMstMap.put("GFT_MST_IDX", gftMstIdx);
						gftMstMap.put("GFT_REQ_REG_IP", request.getRemoteAddr());
						gftMstMap.put("GFT_REQ_REG_ID", ORDER_ID);

						// 사은품 등록
						this.defaultDAO.insert("PcCart.insertGftReq", gftMstMap);

						// 재고 차감
						this.defaultDAO.update("PcCart.updateGftStock", gftMstMap);
					}
				}
			}
		}

		// [DB] 7.주문배송정보
		// (픽업은 배송정보 등록하지 않음)
		if ("0000".equals(orderDbResultcode)) {
			Map<String, Object> map_prd_dlv = new HashMap<String, Object>();

			// 재결제 주문인 경우 기존 주문정보 그대로 들어간다
			if (!"".equals(ORD_TMP_PRE_CD)) {
				map_prd_dlv.put("ORD_ORD_MST_CD", ORD_MST_CD);// 주문번호
				map_prd_dlv.put("ORD_MST_CD", ORD_TMP_PRE_CD);// 원주문번호

				this.defaultDAO.insert("PcCart.insertRepayOrdDlv", map_prd_dlv);
			} else {
				// 겟잇나우 여부 체크
				if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {
					// 겟잇나우인 경우 T_ORD_GET 등록

					// 교환권 번호 발생
					String ORD_GET_TIK = this.defaultDAO.selectStr("Order.selectGetItNowTicketNo", null);
					String ORD_GET_GBN = StringUtil.getString(commandMap.get("ORD_GET_GBN"));

					Map<String, Object> map_ord_get = new HashMap<String, Object>();
					map_ord_get.put("ORD_MST_CD", ORD_MST_CD); // 주문_번호
					map_ord_get.put("ORD_GET_SHP_MST_IDX",
							StringUtil.getString(cartlist.get(0).get("ORD_TMP_SHP_MST_IDX"))); // 지점 idx
					map_ord_get.put("ORD_GET_TIK", ORD_GET_TIK); // 교환권
					map_ord_get.put("ORD_GET_TIK_YN", "N"); // 교환권승인여부
					map_ord_get.put("ORD_GET_SMS_CNT", 0); // 교환권발송횟수
					map_ord_get.put("ORD_GET_GBN", ORD_GET_GBN); // 수령구분
					if ("0".equals(ORD_GET_GBN)) {// 본인
						map_ord_get.put("ORD_GET_NM", MEMBER_NM); // 인수자명
						map_ord_get.put("ORD_GET_TEL1", commandMap.get("ORD_MST_HP1")); // 인수자휴대전화1
						map_ord_get.put("ORD_GET_TEL2", commandMap.get("ORD_MST_HP2")); // 인수자휴대전화2
						map_ord_get.put("ORD_GET_TEL3", commandMap.get("ORD_MST_HP3")); // 인수자휴대전화3
					} else {// 타인수령
						map_ord_get.put("ORD_GET_NM", StringUtil.getString(commandMap.get("ORD_GET_NM"))); // 인수자명
						map_ord_get.put("ORD_GET_RLT", StringUtil.getString(commandMap.get("ORD_GET_RLT"))); // 주문자와의관계
						map_ord_get.put("ORD_GET_TEL1", StringUtil.getString(commandMap.get("ORD_GET_TEL1"))); // 인수자휴대전화1
						map_ord_get.put("ORD_GET_TEL2", StringUtil.getString(commandMap.get("ORD_GET_TEL2"))); // 인수자휴대전화2
						map_ord_get.put("ORD_GET_TEL3", StringUtil.getString(commandMap.get("ORD_GET_TEL3"))); // 인수자휴대전화3
					}
					map_ord_get.put("ORD_GET_PKU_DT", StringUtil.getString(cartlist.get(0).get("ORD_TMP_GET_PKU_DT"))); // 방문예약일자
					map_ord_get.put("ORD_GET_PKU_HH", StringUtil.getString(cartlist.get(0).get("ORD_TMP_GET_PKU_HH"))); // 방문예약시간
					map_ord_get.put("ORD_GET_ADM_SMS_CNT", 0); // 교환권관리자발송횟수

					this.defaultDAO.insert("PcCart.insertOrdGet", map_ord_get);
				} else {
					map_prd_dlv.put("ORD_ORD_MST_CD", ORD_MST_CD); // 주문_번호
					map_prd_dlv.put("ORD_DLV_NM", commandMap.get("ORD_DLV_NM")); // 수령자_명
					map_prd_dlv.put("ORD_DLV_HP1", commandMap.get("ORD_DLV_HP1")); // 수령자_휴대전화1
					map_prd_dlv.put("ORD_DLV_HP2", commandMap.get("ORD_DLV_HP2")); // 수령자_휴대전화2
					map_prd_dlv.put("ORD_DLV_HP3", commandMap.get("ORD_DLV_HP3")); // 수령자_휴대전화3

					map_prd_dlv.put("ORD_DLV_TEL1", commandMap.get("ORD_DLV_TEL1")); // 수령자_전화1
					map_prd_dlv.put("ORD_DLV_TEL2", commandMap.get("ORD_DLV_TEL2")); // 수령자_전화2
					map_prd_dlv.put("ORD_DLV_TEL3", commandMap.get("ORD_DLV_TEL3")); // 수령자_전화3

					// map_prd_dlv.put("ORD_DLV_ZIP_CDE6",
					// commandMap.get("ORD_DLV_ZIP_CDE6_1")+""+commandMap.get("ORD_DLV_ZIP_CDE6_2"));
					// //우편번호
					map_prd_dlv.put("ORD_DLV_MSG", commandMap.get("ORD_DLV_MSG")); // 배송_메세지

					map_prd_dlv.put("ORD_DLV_JBN_ADR1", commandMap.get("ORD_DLV_JBN_ADR1")); // 주소1
					map_prd_dlv.put("ORD_DLV_JBN_ADR2", commandMap.get("ORD_DLV_JBN_ADR2")); // 주소2

					map_prd_dlv.put("ORD_DLV_ZIP_CDE5", commandMap.get("ORD_DLV_ZIP_CDE5")); // 신우편번호
					map_prd_dlv.put("ORD_DLV_DRO_ADR1", commandMap.get("ORD_DLV_DRO_ADR1")); // 신주소1
					map_prd_dlv.put("ORD_DLV_DRO_ADR2", commandMap.get("ORD_DLV_DRO_ADR2")); // 신주소2

					this.defaultDAO.insert("PcCart.insertOrdDlv", map_prd_dlv);
				}
			}
		}

//		int CHECK_IDX = this.selectPitMstIdx(commandMap);

		// [DB] 7.주문배송정보 2020.06.24
		// 통합포인트 및 임직원포인트 테이블 INSERT
		if ("0000".equals(orderDbResultcode)) {

			if (ORD_PRD_DC_TOT_PIT > 0) {

				// 2020.06.24 포인트테이블 IDX 채번
				int PIT_MST_IDX = this.selectPitMstIdx(commandMap);
				int MEM_PIT_TOT_PIT = pcMyPointService.selectMyTotPoint(ORDER_ID);
				Map<String, Object> insertPitMstTot = new HashMap<String, Object>();
				insertPitMstTot.put("PIT_MST_IDX", PIT_MST_IDX); // 포인트 IDX
				insertPitMstTot.put("PIT_MST_GBN", "M"); // 포인트구분(적립 P , 차감 M)
				insertPitMstTot.put("PIT_MST_BRK_DWN", Code.PRD_BUY_POINT_TYPE); // 포인트내역
				insertPitMstTot.put("PIT_MST_MEMO", ""); // 관리자 매모
				insertPitMstTot.put("PIT_MST_PIT", ORD_PRD_DC_TOT_PIT); // 포인트
				insertPitMstTot.put("PIT_MST_REG_DT", ""); // 최초등록일
				insertPitMstTot.put("PIT_MST_REG_IP", request.getRemoteAddr()); // 최초등록IP
				insertPitMstTot.put("PIT_MST_REG_ID", ORDER_ID); // 최초등록자아이디
				// insertPitMstTot.put("PIT_MST_UPD_DT",""); // 최종수정일
				// insertPitMstTot.put("PIT_MST_UPD_IP",""); // 최종수정IP
				// insertPitMstTot.put("PIT_MST_UPD_ID",""); // 최종수정자아이디
				// insertPitMstTot.put("PIT_MST_EXT_DT",""); // 포인트소멸일자

				this.defaultDAO.insert("PcMyPoint.insertPitMstTot", insertPitMstTot);

				Map<String, Object> insertMemPitTotMap = new HashMap<String, Object>();

				insertMemPitTotMap.put("MEM_PIT_IDX", PIT_MST_IDX); // 회원포인트IDX
				// insertMemPitTotMap.put("PIT_MST_IDX",""); // 포인트 IDX
				insertMemPitTotMap.put("MEM_PIT_MEM_ID", ORDER_ID); // 회원 ID
				insertMemPitTotMap.put("MEM_PIT_GBN", "M"); // 포인트구분 (적립 P / 차감 M)
				insertMemPitTotMap.put("MEM_PIT_BRK_DWN", Code.PRD_BUY_POINT_TYPE); // 포인트내역
				insertMemPitTotMap.put("MEM_PIT_PLS", "0"); // 적립
				insertMemPitTotMap.put("MEM_PIT_MNS", ORD_PRD_DC_TOT_PIT); // 차감
				insertMemPitTotMap.put("MEM_PIT_EXT", "0"); // 소멸
				insertMemPitTotMap.put("MEM_PIT_TOT_PIT", MEM_PIT_TOT_PIT); // 현재포인트 ( ERP 에서 데이터 받은 정보 적재)
				insertMemPitTotMap.put("MEM_PIT_REG_DT", ""); // 최초등록일
				insertMemPitTotMap.put("MEM_PIT_REG_IP", request.getRemoteAddr()); // 최초등록IP
				insertMemPitTotMap.put("MEM_PIT_REG_ID", ORDER_ID); // 최초등록자아이디
				// insertMemPitTotMap.put("MEM_PIT_UPD_DT",""); // 최종수정일
				// insertMemPitTotMap.put("MEM_PIT_UPD_IP",""); // 최종수정IP
				// insertMemPitTotMap.put("MEM_PIT_UPD_ID",""); // 최종수정자ID
				// insertMemPitTotMap.put("EVT_MST_IDX",""); // 이벤트관리 IDX
				insertMemPitTotMap.put("ORD_MST_CD", ORD_MST_CD); // 이벤트관리 IDX

				this.defaultDAO.insert("PcMyPoint.insertMemPitTot", insertMemPitTotMap);
			}

			if (ORD_PRD_DC_SW_PIT > 0) {

				// 2020.06.24 포인트테이블 IDX 채번
				int PIT_MST_IDX = this.selectPitMstIdx(commandMap);

				Map<String, Object> insertPitMstSw = new HashMap<String, Object>();
				insertPitMstSw.put("PIT_MST_IDX", PIT_MST_IDX); // 포인트 IDX
				insertPitMstSw.put("PIT_MST_GBN", "M"); // 포인트구분(적립 P , 차감 M)
				insertPitMstSw.put("PIT_MST_BRK_DWN", Code.PRD_BUY_POINT_TYPE); // 포인트내역
				insertPitMstSw.put("PIT_MST_MEMO", ""); // 관리자 매모
				insertPitMstSw.put("PIT_MST_PIT", ORD_PRD_DC_SW_PIT); // 포인트
				insertPitMstSw.put("PIT_MST_REG_DT", ""); // 최초등록일
				insertPitMstSw.put("PIT_MST_REG_IP", request.getRemoteAddr()); // 최초등록IP
				insertPitMstSw.put("PIT_MST_REG_ID", ORDER_ID); // 최초등록자아이디
				// insertPitMstSw.put("PIT_MST_UPD_DT",""); // 최종수정일
				// insertPitMstSw.put("PIT_MST_UPD_IP",""); // 최종수정IP
				// insertPitMstSw.put("PIT_MST_UPD_ID",""); // 최종수정자아이디
				// insertPitMstSw.put("PIT_MST_EXT_DT",""); // 포인트소멸일자
				this.defaultDAO.insert("PcMyPoint.insertPitMstSw", insertPitMstSw);

				Map<String, Object> insertMemPitSwMap = new HashMap<String, Object>();

				insertMemPitSwMap.put("MEM_PIT_IDX", PIT_MST_IDX); // 회원포인트IDX
				// insertMemPitSwMap.put("PIT_MST_IDX",""); // 포인트 IDX
				insertMemPitSwMap.put("MEM_PIT_MEM_ID", ORDER_ID); // 회원 ID
				insertMemPitSwMap.put("MEM_PIT_GBN", "M"); // 포인트구분 (적립 P / 차감 M)
				insertMemPitSwMap.put("MEM_PIT_BRK_DWN", Code.PRD_BUY_POINT_TYPE); // 포인트내역
				insertMemPitSwMap.put("MEM_PIT_PLS", "0"); // 적립
				insertMemPitSwMap.put("MEM_PIT_MNS", ORD_PRD_DC_SW_PIT); // 차감
				insertMemPitSwMap.put("MEM_PIT_EXT", "0"); // 소멸
				insertMemPitSwMap.put("MEM_PIT_TOT_PIT", ""); // 현재포인트 // 임직원포인트 조회해서 INSERT 해야함
				insertMemPitSwMap.put("MEM_PIT_REG_DT", ""); // 최초등록일
				insertMemPitSwMap.put("MEM_PIT_REG_ID", ORDER_ID); // 최초등록자아이디
				insertMemPitSwMap.put("MEM_PIT_REG_IP", request.getRemoteAddr()); // 최초등록IP
				// insertMemPitSwMap.put("MEM_PIT_UPD_DT",""); // 최종수정일
				// insertMemPitSwMap.put("MEM_PIT_UPD_IP",""); // 최종수정IP
				// insertMemPitSwMap.put("MEM_PIT_UPD_ID",""); // 최종수정자ID
				// insertMemPitSwMap.put("EVT_MST_IDX",""); // 이벤트관리 IDX
				insertMemPitSwMap.put("ORD_MST_CD", ORD_MST_CD); // 주문번호

				this.defaultDAO.insert("PcMyPoint.insertMemPitSw", insertMemPitSwMap);
			}
		}

		// [END]## Database 처리

		// [BEGIN] ERP 작업

		// 간편회원인 경우에만 호출
		if ("0000".equals(orderDbResultcode) && MEM_MST_MEM_GBN == Code.MEMBER_TYPE_SIMPLE) {
			// 주문 COUNT
			// 첫주문인 경우에만 erp 등록 필요!
			int orderCnt = this.defaultDAO.selectCount("PcCart.selectOrderCount", commandMap);
			if (orderCnt == 1) {
				// 간편회원 erp 주문 등록
				// Map<String,Object> returnMap =
				// joinMemberService.insertOrderSimpleMemErp(request, commandMap);
				// 결과값

			}
		}

		// 쿠폰 사용 금액 있는 경우 ERP 등록(상품쿠폰만 해당. 배송비쿠폰 금액은 안들어간다)
		// 안하는 걸로 변경됨
		/*
		 * if("0000".equals(orderDbResultcode) && TOT_ORD_TMP_PRD_SAL_PRC > 0){
		 * Map<String,Object> erp_cpn = new HashMap<String,Object>(); String
		 * MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));
		 * 
		 * erp_cpn.put("P9AN8", MEM_MST_ERP_ID); erp_cpn.put("P9AA",
		 * TOT_ORD_TMP_PRD_SAL_PRC*100); erp_cpn.put("P9E1SMON", ORD_MST_CD);
		 * erp_cpn.put("P9URAT", commandMap.get("ORD_MST_PAY_PRC")*100);
		 * erp_cpn.put("P9ET1FLG0", "U");
		 * 
		 * int erpResult = this.erpDAO.insert("OrderErp.insertPreErpCoupon", erp_cpn);
		 * 
		 * if(erpResult == 0){ logger.
		 * error("##################### ERP 사용 쿠폰 등록 실패 ###########################");
		 * orderDbResultcode = "18"; orderDbResultmessage = "ERP 사용 쿠폰 등록 실패";
		 * TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); } }
		 */

		// 재결제 아닌 경우 마일리지 정보 등록
		if ("".equals(ORD_TMP_PRE_CD)) {
			// 마일리지 사용시 ERP 등록
			if ("0000".equals(orderDbResultcode) && CART_PAYMENT_DC_MILEAGE > 0) {
				Map<String, Object> erp_mlg = new HashMap<String, Object>();
				String MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));

				erp_mlg.put("P9AN8", MEM_MST_ERP_ID);
				erp_mlg.put("P9AA", CART_PAYMENT_DC_MILEAGE * 100);
				erp_mlg.put("P9E1SMON", ORD_MST_CD);
				erp_mlg.put("P9URAT", StringUtil.getInt(commandMap.get("ORD_MST_PAY_PRC")) * 100);
				erp_mlg.put("P9ET1FLG0", "U");

				int erpResult = 0;

				if (erpResult == 0) {
					logger.error("##################### ERP 사용 마일리지 등록 실패 ###########################");
					orderDbResultcode = "12";
					orderDbResultmessage = "ERP 사용 마일리지 등록 실패";
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}

			/**
			 * 일반주문에는 FSMSYNC Table에 적립A 넣지 말기 바랍니다. // 마일리지 적립예정금액 있는 경우 ERP 등록(재결제는 등록 안함)
			 * if("0000".equals(orderDbResultcode) &&
			 * Integer.valueOf(String.valueOf(cartlist.get(0).get("SUM_RESERVE_MILEAGE"))) >
			 * 0){ Map<String,Object> erp_mlg = new HashMap<String,Object>(); String
			 * MEM_MST_ERP_ID = StringUtil.getString(userInfo.get("MEM_MST_ERP_ID"));
			 * 
			 * erp_mlg.put("P9AN8", MEM_MST_ERP_ID); erp_mlg.put("P9AA",
			 * Integer.valueOf(String.valueOf(cartlist.get(0).get("SUM_RESERVE_MILEAGE")))*100);
			 * erp_mlg.put("P9E1SMON", ORD_MST_CD); erp_mlg.put("P9URAT",
			 * commandMap.get("ORD_MST_PAY_PRC")*100); erp_mlg.put("P9ET1FLG0", "A");
			 * 
			 * int erpResult = this.erpDAO.insert("OrderErp.insertPreErpMileage", erp_mlg);
			 * 
			 * if(erpResult == 0){ logger.error("##################### ERP 적립예정 마일리지 등록 실패
			 * ###########################"); orderDbResultcode = "17"; orderDbResultmessage
			 * = "ERP 적립예정 마일리지 등록 실패";
			 * TransactionAspectSupport.currentTransactionStatus().setRollbackOnly(); } }
			 */
		}

		// 겟잇나우인 경우 ERP 중간테이블 INSERT
		if ("0000".equals(orderDbResultcode) && ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {
			Map<String, Object> map_erp = new HashMap<String, Object>();
			map_erp.put("ORD_MST_CD", ORD_MST_CD);
			map_erp = null;

			int erpResult = Integer.valueOf(String.valueOf(map_erp.get("result")));
			String erpResultMsg = StringUtil.getString(map_erp.get("resultMsg"));

			if (erpResult < 0) {
				logger.error("##################### ERP 겟잇나우 주문 등록 실패 ###########################");
				orderDbResultcode = "13";
				orderDbResultmessage = erpResultMsg;
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			} else {
				// ERP UPDATE
				Map<String, Object> erpMap = new HashMap<String, Object>();
				erpMap.put("ORD_MST_CD", ORD_MST_CD);
				Map<String, Object> getItNowShopInfo = this.selectOrderGetItNowShopInfo(erpMap);
				erpMap.put("P1DL01", StringUtil.getString(getItNowShopInfo.get("ORD_GET_NM")));
				erpMap.put("P1E1URCD2", StringUtil.getString(getItNowShopInfo.get("ORD_GET_RLT")));
				erpMap.put("P1AR12", StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL1")));
				erpMap.put("P1ET1TELM", StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL2"))
						+ StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL3")));
				erpMap.put("P1E1SDOCO", StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD")));
				erpResult = 0;

				if (erpResult > 0) {
					erpMap.put("P1DL02", StringUtil.getString(getItNowShopInfo.get("ORD_GET_TIK")));
					erpResult = 0;

					// 교환권 발송
					String ORD_GET_TEL1 = StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL1"));
					String ORD_GET_TEL2 = StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL2"));
					String ORD_GET_TEL3 = StringUtil.getString(getItNowShopInfo.get("ORD_GET_TEL3"));
					String ORD_GET_NM = StringUtil.getString(getItNowShopInfo.get("ORD_GET_NM"));

					String PRD_NM = StringUtil.getString(getItNowShopInfo.get("PRD_NM"));
					int PRD_CNT = StringUtil.getInt(getItNowShopInfo.get("PRD_CNT"));
					String ORD_MST_ORD_NM = StringUtil.getString(getItNowShopInfo.get("ORD_MST_ORD_NM"));
					String ORD_DT_STR = StringUtil.getString(getItNowShopInfo.get("ORD_DT_STR"));
					String SHP_MST_NM = StringUtil.getString(getItNowShopInfo.get("SHP_MST_NM"));
					String SHP_MST_TEL = StringUtil.getString(getItNowShopInfo.get("SHP_MST_TEL"));

					String PRD_NM_STR = PRD_NM;
					if (PRD_CNT > 1) {
						PRD_NM_STR += PRD_NM_STR + " 외 " + (PRD_CNT - 1) + "건";
					}

					// 문자 내용
					StringBuffer sb = new StringBuffer();
					sb.append("상품명 : " + PRD_NM_STR);
					sb.append("\n주문번호 : " + ORD_MST_CD);
					sb.append("\n주문자 : " + ORD_MST_ORD_NM);
					sb.append("\n주문일시 : " + ORD_DT_STR);
					sb.append("\n주문매장 : " + SHP_MST_NM);
					sb.append("\n전화번호 : " + SHP_MST_TEL);
					sb.append("\n교환코드 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TIK")));
					sb.append("\n\n");
					sb.append("<유의사항>\n\n");
					sb.append("상품준비가 완료되면 별도 알람 문자를 고객님께 발송합니다. 문자를 확인하신 후 매장에 방문해 주십시오.\n");
					sb.append("픽업일로부터 2일이 경과된 시점까지 상품을 수령하지 않으실 경우 주문하신 상품은 자동으로 취소됩니다.\n");
					sb.append("신분증, 결제신용카드, 교환권 문자를 꼭 가지고 매장에 방문해 주십시오.\n");
					sb.append("\n\n");
					sb.append("MarketPlant 쇼핑몰 고객센터 : ");

					logger.debug("########### [" + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TIK"))
							+ "] 교환권 발송!!!! #############");

					// sms 발송용 맵
					Map<String, Object> smsMap = new HashMap<String, Object>();

					smsMap.put("TR_PHONE", ORD_GET_TEL1 + ORD_GET_TEL2 + ORD_GET_TEL3);
					smsMap.put("TR_NAME", ORD_GET_NM);
					smsMap.put("TR_MSG", sb.toString());

					smsMap = this.sms.sendLongMessage(smsMap);

					String smsResultCode = StringUtil.getString(smsMap.get("resultCode"), "");
					String smsResultMsg = StringUtil.getString(smsMap.get("resultMsg"), "");

					// sms 발송 성공시 겟잇나우 지점장에게 sms 전송...!
					if ("0".equals(smsResultCode)) {
						// 지점장에게 상품준비요청 문자 발송
						String SHP_MST_MNG_HP = StringUtil.getString(getItNowShopInfo.get("SHP_MST_MNG_HP"));// 지점장 번호
						String SHP_MST_MNG_NM = StringUtil.getString(getItNowShopInfo.get("SHP_MST_MNG_NM"));// 지점장명

						// 문자 내용
						StringBuffer sb2 = new StringBuffer();
						sb2.append("[겟잇나우 상품준비요청]");
						sb2.append("\n교환권번호 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TIK")));
						sb2.append("\n주문번호 : " + StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD")));
						sb2.append("\n주문시간 : " + StringUtil.getString(getItNowShopInfo.get("ORD_DT_STR")));
						sb2.append("\n상품명/수량(개) : " + PRD_NM_STR);
						sb2.append("\n가격 : " + StringUtil.getString(getItNowShopInfo.get("ORD_MST_ORD_PRC")));
						sb2.append("\n방문지점 : " + StringUtil.getString(getItNowShopInfo.get("SHP_MST_NM")));
						sb2.append("\n방문예정일 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_PKU_DT_MAIL")));
						sb2.append("\n방문예정시간 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_PKU_HH")));
						sb2.append("\n고객명 : " + StringUtil.getString(getItNowShopInfo.get("ORD_GET_NM")));
						sb2.append("\n고객연락처 : " + ORD_GET_TEL1 + ORD_GET_TEL2 + ORD_GET_TEL3);
						sb2.append("\n\n");
						sb2.append("30분 이내로 재고 확인 부탁드립니다.");
						sb2.append("상품준비가 완료되면 고객한테 LMS 발송해 주십시오.");

						logger.debug("########### 겟잇나우 지점장 문자 발송!!!! #############");

						// sms 발송용 맵
						Map<String, Object> smsMap2 = new HashMap<String, Object>();

						smsMap2.put("TR_PHONE", SHP_MST_MNG_HP);
						smsMap2.put("TR_NAME", SHP_MST_MNG_NM);
						smsMap2.put("TR_MSG", sb2.toString());

						smsMap2 = this.sms.sendLongMessage(smsMap2);

					} else {
						logger.error(
								"##################### [" + StringUtil.getString(getItNowShopInfo.get("ORD_GET_TIK"))
										+ "] 교환권 발송 실패 ###########################");
						orderDbResultcode = "04";
						orderDbResultmessage = "교환권 발송 실패 msg : " + smsResultMsg;
						TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					}
				}

				if (erpResult == 0) {
					logger.error("##################### 겟잇나우 주문 ERP UPDATE 실패 ###########################");
					orderDbResultcode = "16";
					orderDbResultmessage = "겟잇나우 주문 ERP UPDATE 실패";
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}
		}

		// 재주문인 경우 원주문 환불처리 & ERP 중간 테이블 INSERT 필요
		if ("0000".equals(orderDbResultcode) && !"".equals(ORD_TMP_PRE_CD)) {
			Map<String, Object> pre_ord = new HashMap<String, Object>();
			pre_ord.put("ORD_MST_CD", ORD_MST_CD);
			// ERP 결제정보만 INSERT
			pre_ord = null;

			int erpResult = Integer.valueOf(String.valueOf(pre_ord.get("result")));
			String erpResultMsg = StringUtil.getString(pre_ord.get("resultMsg"));

			if (erpResult < 0) {
				logger.error("##################### ERP 재주문 등록 실패 ###########################");
				orderDbResultcode = "14";
				orderDbResultmessage = erpResultMsg;
				TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			} else {
				// 원주문 환불 처리
				pre_ord.put("ORD_MST_CD", ORD_TMP_PRE_CD);// 원주문번호 넣는다.
				pre_ord.put("ORD_PRD_ORD_STATE", Code.OST_BACK_END);
				pre_ord.put("ORIGINAL_ORDER_CANCEL_YN", "Y");// 재결제 원주문 반품완료 처리 여부
				pre_ord = this.orderService.updateOrderState(pre_ord, request);

				int orderResult = Integer.valueOf(String.valueOf(pre_ord.get("result")));
				String orderResultMsg = StringUtil.getString(pre_ord.get("resultMsg"));

				if (orderResult == 0) {
					logger.error("##################### 재주문 결제 후 원주문 환불처리 실패 ###########################");
					orderDbResultcode = "15";
					orderDbResultmessage = orderResultMsg;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				}
			}
		}

		// [END] ERP 작업

		// 비회원인 경우 비회원 로그인 한다. (배송지 수정시 유효성 체크를 위해)
		if ("0000".equals(orderDbResultcode) && !(ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			logger.debug("################ [START] 비회원 세션 정보 생성 ###################");

			Map<String, Object> order_guest_map = new HashMap<String, Object>();

			order_guest_map.put("ORD_MST_CD", ORD_MST_CD);
			order_guest_map.put("ORD_MST_ORD_NM", MEMBER_NM);
			order_guest_map.put("ROLE_USER", ROLEUSER.order_guest);

			/** STEP 2-5-2-1-1. 비회원 주문자 정보 Session에 저장 */
			SessionsUser.setSessionUser(request, order_guest_map);

			// session정보 쿠키 생성
			Map<String, Object> userMap = SessionsUser.getSessionUserMap(request);
			String strUserInfo = "";

			// 현재 시간
			String todayTime = StringUtil.getString(DateUtil.getToday() + DateUtil.getTime().substring(0, 4), "0");

			// session 값을 받아와서 cookie 생성
			Iterator sessionKeys = userMap.keySet().iterator();
			while (sessionKeys.hasNext()) {
				String cookieName = (String) sessionKeys.next();
				strUserInfo = strUserInfo + cookieName + "="
						+ AesCrypto.encrypt(StringUtil.getString(userMap.get(cookieName))) + "#";
			}

			strUserInfo = strUserInfo + "LAST_TIME=" + AesCrypto.encrypt(todayTime);

			// login 정보를 cookie 저장
			Cookie front_user_cookie = new Cookie("front_user_cookie", strUserInfo);
			front_user_cookie.setPath("/");
			response.addCookie(front_user_cookie);

			logger.debug("################ [END] 비회원 세션 정보 생성 ###################");
		}

		// [BEGIN] 장바구니 정보 삭제
		if ("0000".equals(orderDbResultcode) && MEM_CRT_IDXs.size() > 0) {
			Map<String, Object> dataMap = new HashMap<String, Object>();

			dataMap.put("user", user);// user
			dataMap.put("session_id",
					(String) (("").equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id")))
							? request.getSession().getId()
							: request.getSession().getAttribute("seesion_cookie_id")));// 세션 id
			dataMap.put("MEM_CRT_IDXs", MEM_CRT_IDXs);

			// 장바구니 삭제
			this.deleteCart(dataMap);
		}
		// [END] 장바구니 정보 삭제

		// [BEGIN] 주문완료 메일 발송
		try {
			if ("0000".equals(orderDbResultcode) && !"".equals(email)) {
				logger.info("############################# [BEGIN] 메일 & SMS 발송##########################");

				if (paymentType != Code.PAY_DEPOSIT && paymentType != Code.PAY_ESCROW) {// 무통장/에스크로 아닌 경우에만 발송
					// sms 발송용 맵
					Map<String, Object> smsMap = new HashMap<String, Object>();

					smsMap.put("TR_PHONE",
							StringUtil.getString(commandMap.get("ORD_MST_HP1"), "")
									+ StringUtil.getString(commandMap.get("ORD_MST_HP2"), "")
									+ StringUtil.getString(commandMap.get("ORD_MST_HP3"), ""));
					smsMap.put("TR_NAME", MEMBER_NM);

					String prdNmStr = prdNm;
					if (prdCnt > 1) {
						prdNmStr += prdNmStr + " 외 " + (prdCnt - 1) + "건";
					}

					// 문자 내용
					StringBuffer sb = new StringBuffer();

					// 겟잇나우는 문자 내용 다름
					if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {
						sb.append(pcCommonService.getAppName() + " 주문완료");
						sb.append("\n");
						sb.append("상품명 : " + prdNmStr);
						sb.append("\n");
						sb.append("주문하신 상품은 교환권 발급이 필요합니다.");
						sb.append("\n");
						sb.append("교환권은 결제와 동시에 인수자 휴대폰으로 발송되며, [홈페이지>MY LAND>주문/배송내역]에서 재발송 할 수 있습니다.");
					} else if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD) {// 클린킹인 경우
						sb.append(pcCommonService.getAppName() + " 클린킹 서비스 예약완료");
						sb.append("\n\n상품명 : " + prdNmStr);
						sb.append("\n주문번호 : " + ORD_MST_CD);
						sb.append("\n\n담당 서비스 직원이 연락을 드립니다.");
					} else {
						sb.append(pcCommonService.getAppName() + " " + MEMBER_NM + "님, 주문이 완료되었습니다. 상품명 : " + prdNmStr
								+ " " + pcCommonService.getAppName() + "을 이용해 주셔서 감사드립니다.");
					}

					smsMap.put("TR_MSG", sb.toString());

					smsMap = this.sms.sendLongMessage(smsMap);
				}

				// 메일 발송시 필요한 정보 가져오기 시작...

				// 주문상품 목록
				commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_ITEM_SMALL);
				List<Map<String, Object>> orderProductList = this.pcMyShoppingService
						.selectOrderProductList(commandMap);// 공통 사용 가능

				// 상품 옵션 가져오기
				for (Map<String, Object> ordPrd : orderProductList) {
					int PRD_OPT_IDX = StringUtil.getInt(ordPrd.get("PRD_OPT_IDX"));// 필수옵션값
					if (PRD_OPT_IDX > 0) {// 옵션 있는 상품인 경우에만 가져온다.
						List<Map<String, Object>> optionList = this.selectCartOptionDetailList(ordPrd);// 공통 사용 가능
						ordPrd.put("optionList", optionList);// 해당 상품 필수옵션 리스트
					}

					// 서브 옵션 리스트
					List<Map<String, Object>> subPrdList = new ArrayList<Map<String, Object>>();
					int SUB_OPTION_CNT = StringUtil.getInt(ordPrd.get("SUB_OPTION_CNT"));
					if (SUB_OPTION_CNT > 0) {// 서브 옵션 있는 경우
						subPrdList = this.pcMyShoppingService.selectOrderSubPrdList(ordPrd);// 공통 사용 가능
						ordPrd.put("subPrdList", subPrdList);// 해당 상품 서브 상품 리스트
					}
				}

				// 사은품 정보
				List<Map<String, Object>> requestedGiftList = this.pcMyShoppingService
						.selectRequestedGiftList(commandMap);// 공통 사용 가능

				// 배송정보
				Map<String, Object> orderDeliveryInfo = this.pcMyShoppingService.selectOrderDeliveryInfo(commandMap);// 공통
																														// 사용
																														// 가능

				// 할인/결제정보
				Map<String, Object> orderPayInfo = this.pcMyShoppingService.selectOrderPayInfo(commandMap);// 공통 사용 가능

				// 로그인한 경우 적립예정 캐쉬백 카드 번호 보여주기.
				// 캐쉬백 사용한 경우 사용 카드에 적립해주고 사용 안 한 경우에는 회원 기본 캐쉬백 카드 번호 가져온다.
				String DEFAULT_CASHBAG_CARD_NO = "";
				Map<String, Object> getItNowShopInfo = null;
				String ORD_MST_ORD_ID = StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_ID"));
				if (!"_GUEST_".equals(ORD_MST_ORD_ID)) {// 회원인 경우
					commandMap.put("trStatus", "U");// 사용 이력
					Map<String, Object> cashbagSavedInfo = this.paymentService.selectOrderCashbagInfo(commandMap);// 공통
																													// 사용
																													// 가능

					if (cashbagSavedInfo != null) {
						DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(cashbagSavedInfo.get("PAY_MST_KICC_CARD_NO"));
					} else {
						// 캐쉬백 카드번호
						commandMap.put("MEM_MST_MEM_ID", ORD_MST_ORD_ID);
						Map<String, Object> memberCashbagInfo = this.selectMemberCashbagInfo(commandMap);// 공통 사용 가능

						if (memberCashbagInfo != null) {// 회원 캐쉬백 카드 있는 경우
							DEFAULT_CASHBAG_CARD_NO = StringUtil.getString(memberCashbagInfo.get("MEM_MST_OCB_NO"));
						}
					}

					// 겟잇나우 주문인 경우 지점 정보 가져오기
					int ORD_MST_DLV_GBN = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_GBN"));
					if (ORD_MST_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD) {
						getItNowShopInfo = this.selectOrderGetItNowShopInfo(commandMap);// 공통 사용 가능
					}
				}

				// 메일 contents 맵
				Map<String, Object> mailContentsMap = new HashMap<String, Object>();
				mailContentsMap.put("orderDeliveryInfo", orderDeliveryInfo);// 배송지정보
				mailContentsMap.put("orderProductList", orderProductList);// 주문상품리스트
				mailContentsMap.put("requestedGiftList", requestedGiftList);// 사은품리스트
				mailContentsMap.put("orderPayInfo", orderPayInfo);// 주문결제정보
				mailContentsMap.put("getItNowShopInfo", getItNowShopInfo);// 겟잇나우정보
				mailContentsMap.put("userInfo", userInfo);// 회원정보

				if (!"".equals(DEFAULT_CASHBAG_CARD_NO) && DEFAULT_CASHBAG_CARD_NO.length() >= 8) {
					mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO1", DEFAULT_CASHBAG_CARD_NO.substring(0, 4));
					mailContentsMap.put("DEFAULT_CASHBAG_CARD_NO2", DEFAULT_CASHBAG_CARD_NO.substring(4, 8));
				}

				// 주문일
				Calendar calendar = Calendar.getInstance();
				SimpleDateFormat dateformat_text = new SimpleDateFormat("yyyy년 MM월 dd일");
				String today = dateformat_text.format(calendar.getTime());
				mailContentsMap.put("today", today);

				mailContentsMap.put("MEMBER_NAME",
						FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))); // 수신자 이름
				mailContentsMap.put("ORD_MST_CD", StringUtil.getString(orderPayInfo.get("ORD_MST_CD")));// 주문 번호
				mailContentsMap.put("ORD_MST_PAY_TYPE", commandMap.get("ORD_MST_PAY_TYPE"));// 결제방법

				mailContentsMap.put("SMS_HP",
						StringUtil.getString(commandMap.get("ORD_MST_HP1"), "")
								+ StringUtil.getString(commandMap.get("ORD_MST_HP2"), "")
								+ StringUtil.getString(commandMap.get("ORD_MST_HP3"), ""));// SMS 발신용 휴대폰 번호
				mailContentsMap.put("PAY_MST_FINANCENAME",
						StringUtil.getString(commandMap.get("PAY_MST_FINANCENAME"), ""));// 입금은행
				mailContentsMap.put("PAY_MST_ACCOUNTNUM",
						StringUtil.getString(commandMap.get("PAY_MST_ACCOUNTNUM"), ""));// 입금계좌

				int dlvCagTmp = StringUtil.getInt(orderPayInfo.get("ORD_MST_DLV_CAG"));
				int addCag = StringUtil.getInt(orderProductList.get(0).get("SUM_DLV_ADD_CHARGE"));
				int dlvCag = dlvCagTmp - addCag;

				mailContentsMap.put("dlvCag", dlvCag);
				mailContentsMap.put("cdnDomain", "http://" + this.propertiesService.getString("cdn.domain"));
				mailContentsMap.put("frontDomain", this.propertiesService.getString("front.domain"));
				mailContentsMap.put("serverSslDomain", this.propertiesService.getString("server.ssl.domain"));
				mailContentsMap.put("number", new NumberTool());

				// -- 메일본문 정리
				String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/MAIL-HEADER.vm", "utf-8",
						mailContentsMap);
				body += VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/MAIL-ORDER-FINISH.vm", "utf-8",
						mailContentsMap);
				body += VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "/MAIL-FOOTER.vm", "utf-8",
						mailContentsMap);

				// 메일 발송용 맵
				Map<String, Object> mailMap = new HashMap<String, Object>();

				String titleComment = "완료";
				String mailCode = "9"; // 주문완료

				int ORD_MST_PAY_TYPE = StringUtil.getInt(orderPayInfo.get("ORD_MST_PAY_TYPE"));
				if (ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT || ORD_MST_PAY_TYPE == Code.PAY_ESCROW) {
					titleComment = " 접수";
					mailCode = "10"; // 주문접수
				}

				String orderTypeStr = "주문";
				if (ORD_TMP_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD) {// 클린킹인 경우
					orderTypeStr = "상담예약";
				}

				mailMap.put("MAIL_CODE", mailCode); // 이메일 코드
				mailMap.put("MEMBER_EMAIL", email); // 수신자 이메일
				mailMap.put("MEMBER_NAME",
						FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))); // 수신자 이름
				mailMap.put("EMAIL_TITLE",
						StringUtil.getString(propertiesService.getString("app.name"), "")
								+ FormatUtil.markingName(StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM")))
								+ "님의 " + orderTypeStr + "이 " + titleComment + "되었습니다."); // 메일 제목
				mailMap.put("EMAIL_CONTENTS", body); // 메일 내용

				this.mail.mailSend(mailMap);

				// 담당 MD 문자 발송
				Calendar calendar2 = Calendar.getInstance();
				SimpleDateFormat dateformat_text2 = new SimpleDateFormat("yyyyMMdd");
				int hour = Calendar.HOUR_OF_DAY;
				// logger.debug("hour==========="+hour);
				String sendDate = "";
				if (hour < 7 || hour == 23) {// 23시~오전7시에는 예약전송으로 보낸다.
					// 23~0시 사이면 다음날 오전 7시에 보낸다. 0~7시 사이면 당일 오전 7시에 보낸다.
					if (hour == 23) {
						calendar2.add(Calendar.DATE, 1);
					}

					sendDate = dateformat_text2.format(calendar2.getTime());
					sendDate = sendDate + "070000";
				}
				logger.debug("sendDate===========" + sendDate);

				for (Map<String, Object> ordPrd : orderProductList) {
					String ORD_PRD_VDR_IDX = StringUtil.getString(ordPrd.get("ORD_PRD_VDR_IDX"));// 입점업체 idx
					String PRD_GBN = "MarketPlant";
					if ("-1".equals(ORD_PRD_VDR_IDX)) {
						PRD_GBN = "입점상품";
					}
					String PRD_MST_ERP_CD = StringUtil.getString(ordPrd.get("PRD_MST_ERP_CD"));// 상품 erp 코드
					int SUM_PRD_ORD_PRC = StringUtil.getInt(ordPrd.get("SUM_PRD_ORD_PRC"));// 상품 주문금액
					String SUM_PRD_ORD_PRC_STR = String.format("%,d", SUM_PRD_ORD_PRC);

					String PAY_GBN = "";
					if (ORD_MST_PAY_TYPE == Code.PAY_CARD || ORD_MST_PAY_TYPE == Code.PAY_FOREIGN_CARD) {
						PAY_GBN = "신용카드";
					} else if (ORD_MST_PAY_TYPE == Code.PAY_ACCOUNT) {
						PAY_GBN = "실시간계좌이체";
					} else if (ORD_MST_PAY_TYPE == Code.PAY_DEPOSIT) {
						PAY_GBN = "가상계좌";
					} else if (ORD_MST_PAY_TYPE == Code.PAY_ESCROW) {
						PAY_GBN = "가상계좌(에스크로)";
					} else if (ORD_MST_PAY_TYPE == Code.PAY_MILEAGE) {
						PAY_GBN = "포인트";
					} else if (ORD_MST_PAY_TYPE == Code.PAY_KAKAOPAY) {
						PAY_GBN = "카카오페이";
					}

					String ORD_NM = StringUtil.getString(orderPayInfo.get("ORD_MST_ORD_NM"));// 주문자명
					String MD_HP = StringUtil.getString(ordPrd.get("MD_HP"));// MD 번호
					String MD_NM = StringUtil.getString(ordPrd.get("MD_NM"), "MD");// MD 이름

					// sms 발송용 맵
					Map<String, Object> smsMap = new HashMap<String, Object>();

					smsMap.put("TR_PHONE", MD_HP);
					smsMap.put("TR_NAME", MD_NM);

					smsMap.put("sendDate", sendDate);// 발송희망시간

					// 문자 내용
					StringBuffer sb = new StringBuffer();
					sb.append("[" + PRD_GBN + "] " + PRD_MST_ERP_CD + "/ 금액 " + SUM_PRD_ORD_PRC_STR + "원 / " + PAY_GBN
							+ " / " + ORD_NM);
					smsMap.put("TR_MSG", sb.toString());

					smsMap = this.sms.sendLongMessage(smsMap);
				}

				logger.info("############################# [END] 메일 & SMS 발송##########################");
			}
		} catch (Exception e) {
			logger.error("####### SMS, EMAIL 발송 중 예외 발생 #######");
			e.printStackTrace();
		}
		// [END] 주문완료 메일 발송

		// ## 끝;;

		logger.debug("orderDbResultcode===============" + orderDbResultcode);
		logger.debug("orderDbResultmessage===============" + orderDbResultmessage);

		commandMap.put("orderDbResultcode", orderDbResultcode);
		commandMap.put("orderDbResultmessage", orderDbResultmessage);

		logger.info("#######[END] 주문 DB 처리 [ORD_MST_CD : " + StringUtil.getString(commandMap.get("ORD_MST_CD"))
				+ "] ########");

		return commandMap;
	}

	/**
	 * <pre>
	 * 1. MethodName : selectCartCnt
	 * 2. ClassName  : CartServiceImpl.java
	 * 3. Comment    : 화면 상단 장바구니 상품 수량
	 * 4. 작성자       : 이미정
	 * 5. 작성일       : 2014. 7. 28.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCartCnt(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcCart.selectCartCnt", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectBannerDisplayList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 배너 리스트
	* 4. 작성자       : kanghk
	* 5. 작성일       : 2014. 8. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBannerDisplayList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectBannerDisplayList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartMemberInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니에서 필요한 회원 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 5. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCartMemberInfo(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		Map<String, Object> memberInfoMap = new HashMap<String, Object>();

		String serverCompCd = StringUtil.getString(request.getAttribute("serverCompCd"));

		if (!"".equals(StringUtil.getString(SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"), ""))) {
			memberInfoMap.put("MEM_MST_MEM_ID", SessionsUser.getSessionUserValue("MEM_MST_MEM_ID"));
			memberInfoMap.put("serverCompCd", serverCompCd);
			memberInfoMap = this.defaultDAO.select("PcCart.selectCartMemberInfo", memberInfoMap);
		}

		return memberInfoMap;
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartPrdInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니 상품 정보 가져오기
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCartPrdInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcCart.selectCartPrdInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectGiftList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 사은품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 4.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGiftList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcCart.selectGiftList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartForCouponList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 쿠폰 할인금액 계산용 주문상품 리스트 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 6. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartForCouponList(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectList("PcCart.selectCartForCouponList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartAmtReset
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 초기화
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateTempCartAmtReset(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.update("PcCart.updateTempCartAmtReset", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartPrdAmtReset
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 초기화
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateTempCartPrdAmtReset(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.update("PcCart.updateTempCartPrdAmtReset", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 변경
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateTempCartAmt(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.update("PcCart.updateTempCartAmt", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartPrdAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 변경
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 26.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int updateTempCartPrdAmt(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.update("PcCart.updateTempCartPrdAmt", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartPrdCpnAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 변경(상품쿠폰 금액)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int updateTempCartPrdCpnAmt(Map<String, Object> commandMap) throws Exception {
		int TOT_ORD_TMP_PRD_SAL_PRC = 0;
		List<Map<String, Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		for (Map<String, Object> cart : cartlist) {
			String PRD_TMP_IDX = StringUtil.getString(cart.get("PRD_TMP_IDX"));
			Map<String, Object> couponMap = new HashMap<String, Object>();
			int ORD_TMP_PRD_SAL_PRC = StringUtil.getInt(commandMap.get("PRD_CPN_PRC_" + PRD_TMP_IDX), 0);// 상품쿠폰 할인 금액
			String ORD_TMP_PRD_CPN_IDX = StringUtil.getString(commandMap.get("PRD_CPN_NO_" + PRD_TMP_IDX), "0");// 상품쿠폰
																												// idx
			String ORD_TMP_PRD_CPN_MEM_IDX = StringUtil.getString(commandMap.get("PRD_CPN_MEM_IDX_" + PRD_TMP_IDX),
					"0");// 상품쿠폰 회원 idx

			couponMap.put("ORD_MST_CD", ORD_MST_CD);
			couponMap.put("ORD_TMP_PRD_SAL_PRC", ORD_TMP_PRD_SAL_PRC);
			couponMap.put("ORD_TMP_PRD_CPN_IDX", ORD_TMP_PRD_CPN_IDX);
			couponMap.put("ORD_TMP_PRD_CPN_MEM_IDX", ORD_TMP_PRD_CPN_MEM_IDX);
			couponMap.put("PRD_TMP_IDX", PRD_TMP_IDX);

			this.defaultDAO.update("PcCart.updateTempCartPrdAmt", couponMap);

			TOT_ORD_TMP_PRD_SAL_PRC += ORD_TMP_PRD_SAL_PRC;// 총 상품쿠폰 금액
		}

		return TOT_ORD_TMP_PRD_SAL_PRC;
	}

	/**
	 * <pre>
	* 1. MethodName : updateTempCartDlvCpnAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 임시 주문금액 변경(배송비쿠폰 금액)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 7.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public int updateTempCartDlvCpnAmt(Map<String, Object> commandMap) throws Exception {
		int TOT_ORD_TMP_DLV_SAL_PRC = 0;
		List<Map<String, Object>> cartlist = (List<Map<String, Object>>) commandMap.get("cartlist");
		String ORD_MST_CD = StringUtil.getString(commandMap.get("ORD_MST_CD"));
		for (Map<String, Object> cart : cartlist) {
			String PRD_TMP_IDX = StringUtil.getString(cart.get("PRD_TMP_IDX"));
			Map<String, Object> couponMap = new HashMap<String, Object>();
			int ORD_TMP_DLV_SAL_PRC = 0;// 배송비쿠폰 할인 금액
			String ORD_TMP_DLV_CPN_IDX = StringUtil.getString(commandMap.get("DLV_CPN_NO_" + PRD_TMP_IDX), "0");// 배송비쿠폰
																												// idx

			if (!"0".equals(ORD_TMP_DLV_CPN_IDX)) {// 선택한 배송비 쿠폰이 있는 경우
				int FIN_DLV_CHARGE = StringUtil.getInt(cart.get("FIN_DLV_CHARGE"));// 해당 상품의 배송비가 배송비 쿠폰할인금액이 된다.
				ORD_TMP_DLV_SAL_PRC = FIN_DLV_CHARGE;
			}

			couponMap.put("ORD_MST_CD", ORD_MST_CD);
			couponMap.put("ORD_TMP_DLV_SAL_PRC", ORD_TMP_DLV_SAL_PRC);
			couponMap.put("ORD_TMP_DLV_CPN_IDX", ORD_TMP_DLV_CPN_IDX);
			couponMap.put("PRD_TMP_IDX", PRD_TMP_IDX);

			this.defaultDAO.update("PcCart.updateTempCartPrdAmt", couponMap);

			TOT_ORD_TMP_DLV_SAL_PRC += ORD_TMP_DLV_SAL_PRC;// 총 배송비쿠폰 금액
		}

		return TOT_ORD_TMP_DLV_SAL_PRC;
	}

	/**
	 * <pre>
	* 1. MethodName : selectPaymentAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문금액 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 3.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPaymentAmt(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {

		// -- 사용자정보 전달
		User user = SessionsUser.getSessionUser(request);
		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		} else {
			// -- 세션정보 (비회원으로 장바구니에 넣으면 session_id로 저장되고, 로그인 시 session_id가 MEM_CRT_SES_ID =
			// ''로 update 하고 MEM_MST_MEM_ID = '회원아이디' 로 update
			String session_id = (String) (("")
					.equals(StringUtil.getString(request.getSession().getAttribute("seesion_cookie_id")))
							? request.getSession().getId()
							: request.getSession().getAttribute("seesion_cookie_id"));
			commandMap.put("MEM_CRT_SES_ID", session_id);
		}

		return this.defaultDAO.select("PcCart.selectPaymentAmt", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : insertCartTempInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 모바일 주문 임시 정보 등록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertCartTempInfo(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.insert("PcCart.insertCartTempInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : deleteCartTempInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 모바일 주문 임시 정보 삭제
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	 * </pre>
	 *
	 * @param commandMap
	 * @throws Exception
	 */
	public void deleteCartTempInfo(Map<String, Object> commandMap) throws Exception {
		this.defaultDAO.delete("PcCart.deleteCartTempInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartTempInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 모바일 주문 임시 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 8. 8.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCartTempInfo(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.select("PcCart.selectCartTempInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectUserInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 유저 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectUserInfo(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.select("PcCart.selectUserInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCodeList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 공통코드 하위 리스트 조회
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCodeList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCodeList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectKiccCardList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    :  kicc 카드 리스트 조회
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 10. 19.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectKiccCardList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectKiccCardList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartOptionDetailList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니 상품 옵션 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartOptionDetailList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCartOptionDetailList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectGetItNowShopTimeInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 겟잇나우 매장 방문 가능 시간 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 14.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGetItNowShopTimeInfo(Map<String, Object> commandMap) throws Exception {
		// 겟잇나우 매장 정보
		Map<String, Object> shopInfo = this.defaultDAO.select("PcCart.selectGetItNowShopInfo", commandMap);

		if (shopInfo != null) {
			// 겟잇나우 시작 시간
			String SHP_MST_O2O_ST_HH_STR = StringUtil.getString(shopInfo.get("SHP_MST_O2O_ST_HH"), "00");
			String SHP_MST_O2O_ST_MM_STR = StringUtil.getString(shopInfo.get("SHP_MST_O2O_ST_MM"), "00");

			// 겟잇나우 종료 시간
			String SHP_MST_O2O_ED_HH_STR = StringUtil.getString(shopInfo.get("SHP_MST_O2O_ED_HH"), "23");
			String SHP_MST_O2O_ED_MM_STR = StringUtil.getString(shopInfo.get("SHP_MST_O2O_ED_MM"), "59");

			int SHP_MST_O2O_ST_HH = Integer.valueOf(SHP_MST_O2O_ST_HH_STR);
			int SHP_MST_O2O_ED_HH = Integer.valueOf(SHP_MST_O2O_ED_HH_STR);

			List<String> timeList = new ArrayList<String>();
			for (int time = SHP_MST_O2O_ST_HH; time < SHP_MST_O2O_ED_HH; time++) {
				String visitHour1 = String.format("%02d", time); // 시작시간1
				String visitHour2 = String.format("%02d", time + 1); // 시작시간2
				String visitMinute = SHP_MST_O2O_ST_MM_STR; // 시작분
				String visitMinute2 = SHP_MST_O2O_ST_MM_STR; // 시작분

				// 방문가능시간 마지막은 종료시간 분을 가져와야 한다.
				if (time + 1 == SHP_MST_O2O_ED_HH) {
					visitMinute2 = SHP_MST_O2O_ED_MM_STR;
				}

				String timeStr = visitHour1 + ":" + visitMinute + "~" + visitHour2 + ":" + visitMinute2;

				// logger.debug(timeStr);

				timeList.add(timeStr);
			}

			commandMap.put("timeList", timeList);
		}

		return commandMap;
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartSubPrdList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장바구니 서브 상품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 16.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartSubPrdList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCartSubPrdList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectTempOrderSubPrdList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 서브 상품 리스트
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 17.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectTempOrderSubPrdList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectTempOrderSubPrdList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectRecentDlvList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문서 최근 배송지 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 22.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRecentDlvList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectRecentDlvList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCardInstallmentList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 카드 할부 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCardInstallmentList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCardInstallmentList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCardLongInstallmentList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장기할부인 경우 사용가능 카드사 코드 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 25.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCardLongInstallmentList(Map<String, Object> commandMap) throws Exception {
		commandMap.put("CARD_DIV_TYPE_FREE_INTEREST", Code.CARD_DIV_TYPE_FREE_INTEREST);// 무이자 할부만 가져온다.
		return this.defaultDAO.selectList("PcCart.selectCardLongInstallmentList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCardLongInstallmentMinimumPrc
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 장기할부인 경우 최소구매가능금액
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 27.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectCardLongInstallmentMinimumPrc(Map<String, Object> commandMap) throws Exception {
		commandMap.put("CARD_DIV_TYPE_FREE_INTEREST", Code.CARD_DIV_TYPE_FREE_INTEREST);// 무이자 할부만 가져온다.
		return this.defaultDAO.selectCount("PcCart.selectCardLongInstallmentMinimumPrc", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCardEventFreeList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 카드 무이자 할부 행사 목록
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 23.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCardEventFreeList(Map<String, Object> commandMap) throws Exception {
		commandMap.put("DIV_INF_GBN", Code.CARD_DIV_TYPE_NORMAL_INTEREST); // 무이자 할부 행사만 가져온다.
		List<Map<String, Object>> cardEventFreeList = this.defaultDAO.selectList("PcCart.selectCardEventFreeList",
				commandMap);
		return cardEventFreeList;
	}

	/**
	 * <pre>
	* 1. MethodName : selectCardPromotionList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 카드 행사 목록 가져오기
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 12. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCardPromotionList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCardPromotionList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectProductInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : carttest 상품 옵션 가져오기(임시 - 상품쪽 쿼리 쓸 예정...)
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2015. 11. 20.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectProductInfo(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		// prepare parameter for SQL
		User user = (User) commandMap.get("user");

		if ((ROLEUSER.user.toString()).equals(user.getROLE_USER().toString())) {
			commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		}

		// 겟잇나우 정보
		resultMap.put("getItNowShopList", defaultDAO.selectList("PcCart.selectShpMstList", commandMap));

		resultMap.put("productInfo", defaultDAO.select("PcCart.selectBasicOnlineProductInfo", commandMap));
		resultMap.put("optionList", defaultDAO.selectList("PcCart.selectBasicOnlineProductOptionList", commandMap));
		resultMap.put("optionDetailList",
				defaultDAO.selectList("PcCart.selectBasicOnlineProductOptionDetailList", commandMap));
		return resultMap;
	}

	/**
	 * <pre>
	* 1. MethodName : selectInterestProductCheckCount
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 중복 체크
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectInterestProductCheckCount(HttpServletRequest request, Map<String, Object> commandMap)
			throws Exception {
		User user = SessionsUser.getSessionUser(request);

		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());

		return defaultDAO.selectCount("PcCart.selectInterestProductCheckCount", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : insertInterestProduct
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 프론트 > 장바구니 > 관심상품 등록 
	* 4. 작성자       : DEV_KIMSOYOUNG
	* 5. 작성일       : 2015. 12. 24.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int insertInterestProduct(HttpServletRequest request, Map<String, Object> commandMap) throws Exception {
		User user = SessionsUser.getSessionUser(request);

		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_KEP_REG_IP", request.getRemoteAddr());

		return defaultDAO.insert("PcCart.insertInterestProduct", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectMemberCashbagInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 회원 캐쉬백 카드번호
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberCashbagInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcCart.selectMemberCashbagInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectPreOrderCashbagInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 이전 주문 캐쉬백 사용 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPreOrderCashbagInfo(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.select("PcCart.selectPreOrderCashbagInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectCartCouponList
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 쿠폰 리스트 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 5.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartCouponList(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectList("PcCart.selectCartCouponList", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectTotCouponDcAmt
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 총 쿠폰 할인 금액 
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 6.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectTotCouponDcAmt(Map<String, Object> commandMap) throws Exception {
		return defaultDAO.selectCount("PcCart.selectTotCouponDcAmt", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectGetItNowShopInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 겟잇나우 지점 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 11.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectGetItNowShopInfo(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.select("PcCart.selectGetItNowShopInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : selectOrderGetItNowShopInfo
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 주문 후 겟잇나우 지점 정보
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderGetItNowShopInfo(Map<String, Object> commandMap) throws Exception {
		// 지점명 셋팅을 위한 파라미터
		commandMap.put("COMMON_INFOSITE_BRANCH_GB_PRICEKING", Code.COMMON_INFOSITE_BRANCH_GB_PRICEKING);
		commandMap.put("COMMON_INFOSITE_BRANCH_GB_COOK", Code.COMMON_INFOSITE_BRANCH_GB_COOK);
		return this.defaultDAO.select("PcCart.selectOrderGetItNowShopInfo", commandMap);
	}

	/**
	 * <pre>
	* 1. MethodName : updateGetItNowTicketSend
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 겟잇나우 교환권 발송
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 1. 12.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Map<String, Object> updateGetItNowTicketSend(Map<String, Object> commandMap) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String resultMsg = "에러가 발생했습니다.";

		int ORD_GET_SMS_CNT = 0;

		try {
			// 발송 횟수 체크
			Map<String, Object> orderInfo = this.defaultDAO.select("Order.selectOrderInfo", commandMap);

			if (orderInfo != null) {
				ORD_GET_SMS_CNT = StringUtil.getInt(orderInfo.get("ORD_GET_SMS_CNT"));

				if (ORD_GET_SMS_CNT >= 2) {// 발송 횟수 2회 제한
					result = -1;
					resultMsg = "발송 횟수를 초과하여 발송이 불가능합니다.";
				} else {
					// 교환권 번호 발생
					String ORD_GET_TIK = this.defaultDAO.selectStr("Order.selectGetItNowTicketNo", null);
					commandMap.put("ORD_GET_TIK", ORD_GET_TIK);

					Map<String, Object> getItNowShopInfo = this.selectOrderGetItNowShopInfo(commandMap);

					// 교환권 발송
					String ORD_GET_TEL1 = StringUtil.getString(commandMap.get("ORD_GET_TEL1"));
					String ORD_GET_TEL2 = StringUtil.getString(commandMap.get("ORD_GET_TEL2"));
					String ORD_GET_TEL3 = StringUtil.getString(commandMap.get("ORD_GET_TEL3"));
					String ORD_GET_NM = StringUtil.getString(commandMap.get("ORD_GET_NM"));

					String PRD_NM = StringUtil.getString(getItNowShopInfo.get("PRD_NM"));
					int PRD_CNT = StringUtil.getInt(getItNowShopInfo.get("PRD_CNT"));
					String ORD_MST_CD = StringUtil.getString(getItNowShopInfo.get("ORD_MST_CD"));
					String ORD_MST_ORD_NM = StringUtil.getString(getItNowShopInfo.get("ORD_MST_ORD_NM"));
					String ORD_DT_STR = StringUtil.getString(getItNowShopInfo.get("ORD_DT_STR"));
					String SHP_MST_NM = StringUtil.getString(getItNowShopInfo.get("SHP_MST_NM"));
					String SHP_MST_TEL = StringUtil.getString(getItNowShopInfo.get("SHP_MST_TEL"));

					String PRD_NM_STR = PRD_NM;
					if (PRD_CNT > 1) {
						PRD_NM_STR += PRD_NM_STR + " 외 " + (PRD_CNT - 1) + "건";
					}

					// 문자 내용
					StringBuffer sb = new StringBuffer();
					sb.append("상품명 : " + PRD_NM_STR);
					sb.append("\n주문번호 : " + ORD_MST_CD);
					sb.append("\n주문자 : " + ORD_MST_ORD_NM);
					sb.append("\n주문일시 : " + ORD_DT_STR);
					sb.append("\n주문매장 : " + SHP_MST_NM);
					sb.append("\n전화번호 : " + SHP_MST_TEL);
					sb.append("\n교환코드 : " + ORD_GET_TIK);
					sb.append("\n\n");
					sb.append("<유의사항>\n\n");
					sb.append("상품준비가 완료되면 별도 알람 문자를 고객님께 발송합니다. 문자를 확인하신 후 매장에 방문해 주십시오.\n");
					sb.append("픽업일로부터 2일이 경과된 시점까지 상품을 수령하지 않으실 경우 주문하신 상품은 자동으로 취소됩니다.\n");
					sb.append("신분증, 결제신용카드, 교환권 문자를 꼭 가지고 매장에 방문해 주십시오.\n");
					sb.append("\n\n");
					sb.append("MarketPlant 쇼핑몰 고객센터 : ");

					// sms 발송용 맵
					Map<String, Object> smsMap = new HashMap<String, Object>();

					smsMap.put("TR_PHONE", ORD_GET_TEL1 + ORD_GET_TEL2 + ORD_GET_TEL3);
					smsMap.put("TR_NAME", ORD_GET_NM);
					smsMap.put("TR_MSG", sb.toString());

					smsMap = this.sms.sendLongMessage(smsMap);

					String smsResultCode = StringUtil.getString(smsMap.get("resultCode"), "");
					String smsResultMsg = StringUtil.getString(smsMap.get("resultMsg"), "");

					// sms 발송 성공시에만...!
					if ("0".equals(smsResultCode)) {
						// 수령자 정보 수정
						String ORD_GET_GBN = StringUtil.getString(commandMap.get("ORD_GET_GBN"));// 수령자구분
						if ("0".equals(ORD_GET_GBN)) {// 본인수령인 경우
							commandMap.put("ORD_GET_RLT", "");
						}
						result = this.defaultDAO.update("PcCart.updateOrdGet", commandMap);

						// ERP UPDATE
						Map<String, Object> getItNowShopInfo2 = this.selectOrderGetItNowShopInfo(commandMap);
						Map<String, Object> erpMap = new HashMap<String, Object>();
						erpMap.put("P1DL01", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_NM")));
						erpMap.put("P1E1URCD2", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_RLT")));
						erpMap.put("P1AR12", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL1")));
						erpMap.put("P1ET1TELM", StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL2"))
								+ StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL3")));
						erpMap.put("P1E1SDOCO", StringUtil.getString(getItNowShopInfo2.get("ORD_MST_CD")));
						result = 0;

						erpMap.put("P1DL02", ORD_GET_TIK);
						result = 0;

						if (result > 0) {
							resultMsg = "발송되었습니다.";
							ORD_GET_SMS_CNT = ORD_GET_SMS_CNT + 1;

							// 지점장에게 상품준비요청 문자 발송
							String SHP_MST_MNG_HP = StringUtil.getString(getItNowShopInfo2.get("SHP_MST_MNG_HP"));// 지점장
																													// 번호
							String SHP_MST_MNG_NM = StringUtil.getString(getItNowShopInfo2.get("SHP_MST_MNG_NM"));// 지점장명

							// 문자 내용
							StringBuffer sb2 = new StringBuffer();
							sb2.append("[겟잇나우 상품준비요청]");
							sb2.append("\n교환권번호 : " + ORD_GET_TIK);
							sb2.append("\n주문번호 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_MST_CD")));
							sb2.append("\n주문시간 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_DT_STR")));
							sb2.append("\n상품명/수량(개) : " + PRD_NM_STR);
							sb2.append("\n가격 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_MST_ORD_PRC")));
							sb2.append("\n방문지점 : " + StringUtil.getString(getItNowShopInfo2.get("SHP_MST_NM")));
							sb2.append(
									"\n방문예정일 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_PKU_DT_MAIL")));
							sb2.append("\n방문예정시간 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_PKU_HH")));
							sb2.append("\n고객명 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_NM")));
							sb2.append("\n고객연락처 : " + StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL1"))
									+ StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL2"))
									+ StringUtil.getString(getItNowShopInfo2.get("ORD_GET_TEL3")));
							sb2.append("\n\n");
							sb2.append("30분 이내로 재고 확인 부탁드립니다.");
							sb2.append("상품준비가 완료되면 고객한테 LMS 발송해 주십시오.");

							logger.debug("########### 겟잇나우 지점장 문자 발송!!!! #############");

							// sms 발송용 맵
							Map<String, Object> smsMap2 = new HashMap<String, Object>();

							smsMap2.put("TR_PHONE", SHP_MST_MNG_HP);
							smsMap2.put("TR_NAME", SHP_MST_MNG_NM);
							smsMap2.put("TR_MSG", sb2.toString());

							smsMap2 = this.sms.sendLongMessage(smsMap2);
						}
					} else {
						resultMsg = smsResultMsg;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		resultMap.put("result", result);
		resultMap.put("resultMsg", resultMsg);
		resultMap.put("ORD_GET_SMS_CNT", ORD_GET_SMS_CNT);

		return resultMap;
	}

	/**
	 * <pre>
	* 1. MethodName : selectReservePrice
	* 2. ClassName  : CartServiceImpl.java
	* 3. Comment    : 적립금 계산
	* 4. 작성자       : DEV_KANGHYUNKYU
	* 5. 작성일       : 2016. 4. 18.
	 * </pre>
	 *
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	public int selectReservePrice(Map<String, Object> commandMap) throws Exception {
		return this.defaultDAO.selectCount("PcCart.selectReservePrice", commandMap);
	}

	/**
	 * 2020.06.25 테스트 카드리스트 PG 매핑데이터
	 * 
	 */
	@SuppressWarnings({ "unchecked" })
	public List<Map<String, Object>> selectTempCardList() throws Exception {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = this.defaultDAO.select("PcCart.selectTempCardList", commandMap);
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if (tempMap != null) {
			Iterator<Map.Entry<String, Object>> entries = tempMap.entrySet().iterator();
			while (entries.hasNext()) {
				Entry<String, Object> entry = (Entry<String, Object>) entries.next();
				Map<String, Object> innerMap = new HashMap<String, Object>();
				String date[] = ((String) entry.getValue()).split("@@");
				innerMap.put("name", date[0]);
				innerMap.put("value", date[1]);
				list.add(innerMap);
			}
		}
		return list;
	}

	/**
	 * 2020.06.29
	 * 
	 * 프론트 -> 주문서 -> 쿠폰사용 시 금액검증 및 계산
	 * 
	 * @param commandMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> calcIniPayment(Map<String, Object> commandMap) throws Exception {

		List<Map<String, Object>> list = this.defaultDAO.selectList("PcCart.selectTempOrderProductList", commandMap);

		return list;

	}

	/**
	 * 
	 * 2020.06.30
	 * 
	 * 프론트 -> 주문서 -> 결제 시 쿠폰사용조회 후 금액계산
	 * 
	 * @param selectMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectUseCpn(Map<String, Object> selectMap) throws Exception {
		return this.defaultDAO.selectList("PcMyCoupon.selectProdCpnProcAjax", selectMap);
	}
}
