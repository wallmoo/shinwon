package com.market.mall.pc.theme.category.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.epasscni.util.StringUtil;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.theme.category.service.CleanKingService;

@Service("pcCleanKingService")
public class CleanKingServiceImpl implements CleanKingService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public Map<String, Object> selectCleanKingMain(Map<String, Object> commandMap) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap		= new HashMap<String, Object>();
		
		// 테마가이드 카테고리 > 클린킹 카테고리
		commandMap.put("CMN_COM_UP_IDX", "2253");
		commandMap.put("DSP_MST_ENV", "P");
		
		// 웨딩가이드북 2Depth 리스트 
		resultMap.put("guide2DepList", defaultDAO.selectList("PcWedding.selectGuide2DepList", commandMap));
		resultMap.put("guide3DepList", defaultDAO.selectList("PcWedding.selectGuide3DepList", commandMap));
		
		commandMap.put("THUMBNAIL_SIZE", Code.THUMBNAIL_SIZE_PC_PRODUCT_LIST);
		
		// 클린 킹 추천 상품 
		commandMap.put("CMN_COM_IDX", "2360");
		resultMap.put("productList", defaultDAO.selectList("PcWedding.selectProductList", commandMap));
		
		// 뉴스 4개
		commandMap.put("searchMgzMstThmCtg1", "2253");
		commandMap.put("searchMgzMstThmCtg2", "2269");
		commandMap.put("searchMgzMstThmCtg3", "2273");
		commandMap.put("startNum", 1);
		commandMap.put("endNum", 4);
		resultMap.put("issueList", defaultDAO.selectList("PcWedding.selectThemeGuideContentsList", commandMap));
		
		// 클린 킹 동영상 컨테츠 4개
		commandMap.put("searchMgzMstThmCtg2", "");
		commandMap.put("searchMgzMstThmCtg3", "");
		commandMap.put("endNum", 4);
		commandMap.put("MGZ_MST_KID", "M");
		resultMap.put("movieList", defaultDAO.selectList("PcWedding.selectThemeGuideContentsList", commandMap));
				
				
		return resultMap;
	}

	public int insertDirectPurchase(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		
		int result = 0;
		// prepare parameter for SQL
		User user = (User)commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"),""); 
		String session_id = StringUtil.getString(commandMap.get("session_id"),""); 
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);
		
		// 배송유형
		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
		
		// 다중 상품 담기
		List<String> OPT_DTL_IDXs 	= (List<String>) commandMap.get("OPT_DTL_IDXs");
		List<String> memCrtIdxList 	= new ArrayList<String>();
		String MEM_CRT_UP_IDX 		= StringUtil.getString(commandMap.get("MEM_CRT_UP_IDX"));
		
		String LNG_DIV_MNT = ""; //장기할부 개월
		for(String OPT_DTL_IDX : OPT_DTL_IDXs){
			Map<String,Object> simplePrdInfo = this.defaultDAO.select("PcCart.selectSimplePrdInfo", commandMap);
			if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우
				String PRD_MST_O2O_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_O2O_YN"));
				if(!"Y".equals(PRD_MST_O2O_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 겟잇나우 불가 상품 겟잇나우 장바구니 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD){//클린킹인 경우
				String PRD_MST_IVB_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_IVB_YN"));
				if(!"Y".equals(PRD_MST_IVB_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 클린킹 불가 상품 겟잇나우 클린킹 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){//장기할부인 경우
				String MEM_CRT_LNG_DIV = StringUtil.getString(commandMap.get("MEM_CRT_LNG_DIV"));
				if("24".equals(MEM_CRT_LNG_DIV)){//24개월인 경우
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT1"));
				}else if("36".equals(MEM_CRT_LNG_DIV)){//36개월인 경우
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT2"));
				}
				String PRD_MST_LNG_DIV_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_YN"));
				if(!"Y".equals(PRD_MST_LNG_DIV_YN) || !MEM_CRT_LNG_DIV.equals(LNG_DIV_MNT)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 장기할부 불가 상품 장기할부 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}
			
			String PRD_OPT_EST_YN = "";
			String PRD_OPT_CNT_YN = "";
			commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
			if("0".equals(OPT_DTL_IDX)){
				PRD_OPT_EST_YN = "Y";
				PRD_OPT_CNT_YN = "Y";
			}else{
				//옵션 상세 정보
				Map<String, Object> optionDetailInfo = this.defaultDAO.select("PcCart.selectOptionDetailInfo", commandMap);
				PRD_OPT_EST_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_EST_YN"));//필수 옵션 여부
				PRD_OPT_CNT_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_CNT_YN"));//수량 선택 여부
			}
			
			commandMap.put("MEM_CRT_SLT_YN", "Y".equals(PRD_OPT_EST_YN) ? "N" : "Y");
			commandMap.put("MEM_CRT_UP_IDX", "N".equals(PRD_OPT_EST_YN) ? MEM_CRT_UP_IDX : "" ); //선택 옵션인 경우에만 들어간다.
			commandMap.put("MEM_PRD_OPT_DTL_IDX", OPT_DTL_IDX);
			commandMap.put("MEM_PRD_MST_CD", StringUtil.getString(commandMap.get("PRD_MST_CD")));
			commandMap.put("MEM_CRT_CNT", "N".equals(PRD_OPT_CNT_YN) ? "1" : StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
			commandMap.put("MEM_CRT_LNG_DIV", LNG_DIV_MNT);//장기할부 개월
			
			commandMap.put("PLN_MST_IDX", StringUtil.getString(commandMap.get("planIdx")));//기획전 idx (기획전에서 바로구매한 경우)
			
			commandMap.put("MEM_CRT_DRT_SAL_YN", "Y");
			result = this.defaultDAO.insert("PcCart.insertCart", commandMap);
			
			// 임시 주문 테이블에 바로 넣기 위해 MEM_CRT_IDX를 담아둔다.
//			memCrtIdxList.add(String.valueOf(result));
		}
		
		return result;
	}

	public int deleteDirectCart(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return this.defaultDAO.insert("PcCart.deleteDirectCart", commandMap); 
	}

	public String insertTempOrder(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		// prepare parameter for SQL
		User user = (User)commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"),""); 
		String session_id = StringUtil.getString(commandMap.get("session_id"),""); 
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);
		
		//  기존 임시 주문 정보 삭제
		List<Map<String, Object>> tmpOrdList = this.defaultDAO.selectList("PcCart.selectTempOrderInfoList", commandMap);
		if(!tmpOrdList.isEmpty()){
			for(Map<String, Object> tmpOrd : tmpOrdList){
				this.defaultDAO.delete("PcCart.deleteTempOrder", tmpOrd);
				this.defaultDAO.delete("PcCart.deleteTempOrderProduct", tmpOrd);
			}
		}
		
		// 주문번호 채번
		String ORD_MST_CD = this.selectOrderMstCd(commandMap);
		
		// 장바구니 목록
		List<Map<String,Object>> simpleCartList = this.defaultDAO.selectList("PcCart.selectSimpleCartList", commandMap);
		int MEM_CRT_DLV_GBN = StringUtil.getInt(simpleCartList.get(0).get("MEM_CRT_DLV_GBN"));
		
		//  임시 주문 데이터 생성
		Map<String, Object> tmp_ord = new HashMap<String, Object>();
		tmp_ord.put("ORD_TMP_MST_CD", ORD_MST_CD);
		tmp_ord.put("ORD_TMP_MEM_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_MST_MEM_ID")));
		tmp_ord.put("ORD_TMP_SES_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_SES_ID")));
		tmp_ord.put("ORD_TMP_DLV_GBN", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_DLV_GBN")));
		tmp_ord.put("ORD_TMP_REG_IP", StringUtil.getString(commandMap.get("remote_addr"),""));
		tmp_ord.put("ORD_TMP_REG_ID", StringUtil.getString(simpleCartList.get(0).get("MEM_MST_MEM_ID")));
		tmp_ord.put("PLN_MST_IDX", StringUtil.getString(simpleCartList.get(0).get("PLN_MST_IDX")));
		
		if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우에만 들어가는 데이터
			tmp_ord.put("ORD_TMP_SHP_MST_IDX", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_SHP_MST_IDX")));
			tmp_ord.put("ORD_TMP_GET_PKU_DT", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_GET_PKU_DT")));
			tmp_ord.put("ORD_TMP_GET_PKU_HH", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_GET_PKU_HH")));
		}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){//장기할부인 경우 개월수 들어가야한다.
			tmp_ord.put("ORD_TMP_LNG_DIV", StringUtil.getString(simpleCartList.get(0).get("MEM_CRT_LNG_DIV")));
		}
		
		defaultDAO.insert("PcCart.insertTempOrder", tmp_ord);
		
		//  임시 주문 상품 데이터 생성
		int ORD_TMP_UP_IDX = 0;
		for(Map<String,Object> cart : simpleCartList){
			String MEM_CRT_SLT_YN = StringUtil.getString(cart.get("MEM_CRT_SLT_YN"));//선택옵션 여부
			
			Map<String, Object> tmp_prd = new HashMap<String, Object>();
			tmp_prd.put("ORD_TMP_MST_CD", ORD_MST_CD);
			tmp_prd.put("PRD_TMP_MST_CD", StringUtil.getString(cart.get("MEM_PRD_MST_CD")));
			tmp_prd.put("PRD_TMP_OPT_DTL_IDX", StringUtil.getString(cart.get("MEM_PRD_OPT_DTL_IDX")));
			tmp_prd.put("PRD_TMP_CNT", StringUtil.getString(cart.get("MEM_CRT_CNT")));
			tmp_prd.put("PLN_MST_IDX", StringUtil.getString(cart.get("PLN_MST_IDX")));
			tmp_prd.put("MEM_CRT_IDX", StringUtil.getString(cart.get("MEM_CRT_UP_IDX")));//주문 후 장바구니 제거를 위한 IDX 값
			tmp_prd.put("ORD_TMP_UP_IDX", StringUtil.getString(cart.get("MEM_CRT_IDX")));
			tmp_prd.put("ORD_TMP_SLT_YN", MEM_CRT_SLT_YN);
			
			// 서브 옵션인 경우 부모값 넣어줘야 한다.
//			if("Y".equals(MEM_CRT_SLT_YN)){
//				tmp_prd.put("ORD_TMP_UP_IDX", ORD_TMP_UP_IDX);
//			}
			
			result = defaultDAO.insert("PcCart.insertTempOrderProduct", tmp_prd);
			
//			if("N".equals(MEM_CRT_SLT_YN)){//필수 옵션인 경우에만 저장해둔다.
//				ORD_TMP_UP_IDX = result;
//			}
		}
		
		// 입력된 데이터 없는 경우에는 주문번호 날린다.
		if(result == 0){
			ORD_MST_CD = "";
		}
		
		return ORD_MST_CD;
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
	public String selectOrderMstCd(Map<String, Object> commandMap) throws Exception{
		
		String ord_mst_cd = this.defaultDAO.selectStr("PcCart.selectOrderMstCd", commandMap);
		
		return ord_mst_cd;
	}

	public int insertCart(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

		// prepare parameter for SQL
		User user = (User)commandMap.get("user");
		String remote_addr = StringUtil.getString(commandMap.get("remote_addr"),"");
		String session_id = StringUtil.getString(commandMap.get("session_id"),"");
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		commandMap.put("MEM_CRT_SES_ID", session_id);
		
		// 배송유형
		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
		
		// 다중 옵션 담기
		List<String> OPT_DTL_IDXs = (List<String>) commandMap.get("OPT_DTL_IDXs");
		String MEM_CRT_UP_IDX = StringUtil.getString(commandMap.get("MEM_CRT_UP_IDX"));
		String LNG_DIV_MNT = "";//장기할부 개월
		for(String OPT_DTL_IDX : OPT_DTL_IDXs){
			Map<String,Object> simplePrdInfo = this.defaultDAO.select("PcCart.selectSimplePrdInfo", commandMap);
			if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//겟잇나우인 경우
				String PRD_MST_O2O_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_O2O_YN"));
				if(!"Y".equals(PRD_MST_O2O_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 겟잇나우 불가 상품 겟잇나우 장바구니 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD){//클린킹인 경우
				String PRD_MST_IVB_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_IVB_YN"));
				if(!"Y".equals(PRD_MST_IVB_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 클린킹 불가 상품 클린킹 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){//장기할부인 경우
				String MEM_CRT_LNG_DIV = StringUtil.getString(commandMap.get("MEM_CRT_LNG_DIV"));
				if("24".equals(MEM_CRT_LNG_DIV)){//24개월인 경우
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT1"));
				}else if("36".equals(MEM_CRT_LNG_DIV)){//36개월인 경우
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT2"));
				}
				String PRD_MST_LNG_DIV_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_YN"));
				if(!"Y".equals(PRD_MST_LNG_DIV_YN) || !MEM_CRT_LNG_DIV.equals(LNG_DIV_MNT)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] 장기할부 불가 상품 장기할부 담기 시도 에러 ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}
			
			String PRD_OPT_EST_YN = "";
			String PRD_OPT_CNT_YN = "";
			commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
			if("0".equals(OPT_DTL_IDX)){
				PRD_OPT_EST_YN = "Y";
				PRD_OPT_CNT_YN = "Y";
			}else{
				//옵션 상세 정보
				Map<String, Object> optionDetailInfo = this.defaultDAO.select("PcCart.selectOptionDetailInfo", commandMap);
				PRD_OPT_EST_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_EST_YN"));//필수 옵션 여부
				PRD_OPT_CNT_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_CNT_YN"));//수량 선택 여부
			}
			
			commandMap.put("MEM_CRT_SLT_YN", "Y".equals(PRD_OPT_EST_YN) ? "N" : "Y");
			commandMap.put("MEM_CRT_UP_IDX", "N".equals(PRD_OPT_EST_YN) ? MEM_CRT_UP_IDX : "" ); //선택 옵션인 경우에만 들어간다.
			commandMap.put("MEM_PRD_OPT_DTL_IDX", OPT_DTL_IDX);
			commandMap.put("MEM_PRD_MST_CD", StringUtil.getString(commandMap.get("PRD_MST_CD")));
			commandMap.put("MEM_CRT_CNT", "N".equals(PRD_OPT_CNT_YN) ? "1" : StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
			commandMap.put("MEM_CRT_LNG_DIV", LNG_DIV_MNT);//장기할부 개월
			
			result = this.defaultDAO.insert("PcCart.insertCart", commandMap);
			
		}
		
		if(result > 0){
			// 중복 상품 삭제
			this.updateDupCart(commandMap);
		}
		
		return result > 0 ? 1 : 0;
	}
	
	/**
    * <pre>
    * 1. MethodName : updateDupCart
    * 2. ClassName  : CartServiceImpl.java
    * 3. Comment    : 장바구니 중복 제거
    * 4. 작성자       : DEV_KANGHYUNKYU
    * 5. 작성일       : 2015. 12. 16.
    * </pre>
    *
    * @param commandMap
    * MEM_MST_MEM_ID
    * MEM_CRT_SES_ID
    * @throws Exception
    */
    @SuppressWarnings("unchecked")
	public void updateDupCart(Map<String, Object> commandMap) throws Exception {
    	//선택 옵션 중복 리스트 가져오기
    	List<Map<String, Object>> dupCartOptionList = this.defaultDAO.selectList("PcCart.selectCartDupOptionList", commandMap);
    	
    	if(!dupCartOptionList.isEmpty()){
    		int PRE_MEM_CRT_UP_IDX_CNT = 0;
    		for(Map<String, Object> cart : dupCartOptionList){
    			int MEM_CRT_UP_IDX_CNT = StringUtil.getInt(cart.get("MEM_CRT_UP_IDX_CNT"));
    			if(PRE_MEM_CRT_UP_IDX_CNT != MEM_CRT_UP_IDX_CNT){//각 중복 항목 첫번째만 돌리면 된다.
    				Map<String, Object> dupMap = new HashMap<String, Object>();
    				dupMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
    				dupMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
    				dupMap.put("RECENT_MEM_CRT_IDX", cart.get("MEM_CRT_UP_IDX"));
    				
    				// 수량 합쳐야할 리스트 가져오기
    				List<Map<String, Object>> dupCartOptionSumList = this.defaultDAO.selectList("PcCart.selectCartTargetSumList", dupMap);
    				if(!dupCartOptionSumList.isEmpty()){
    					String MEM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("MEM_CRT_SHP_MST_IDX"));//겟잇나우 상점 idx
    					
    					List<String> delCrtIdxs = new ArrayList<String>();
    					for(Map<String, Object> option : dupCartOptionSumList){
    						dupMap.put("PARENT_SUM_MEM_CRT_IDX", option.get("MEM_CRT_UP_IDX"));//수량 합칠 대상 부모 idx
    						dupMap.put("SUM_MEM_CRT_IDX", option.get("MEM_CRT_IDX"));//수량 합칠 대상 idx
    						
    						//수량 update 가능 여부 체크 & 겟잇나우 아닌 경우에만 update
    						if("Y".equals(option.get("PRD_OPT_CNT_YN")) && "".equals(MEM_CRT_SHP_MST_IDX)){
    							this.defaultDAO.update("PcCart.updateDupCartOptionCnt", dupMap);//수량 업데이트
    						}
    						
    						delCrtIdxs.add(StringUtil.getString(option.get("MEM_CRT_IDX")));
    					}
    					
    					//부모 상품 수량 update
    					//수량 update 가능 여부 체크 & 겟잇나우 아닌 경우에만 update
						if("Y".equals(cart.get("PRD_OPT_CNT_YN")) && "".equals(MEM_CRT_SHP_MST_IDX)){
							this.defaultDAO.update("PcCart.updateDupCartUpOptionCnt", dupMap);//부모 상품 수량 업데이트
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
    	
    	//옵션 없는 상품 중복 리스트 가져오기
    	List<Map<String, Object>> dupCartNoOptionList = this.defaultDAO.selectList("PcCart.selectCartDupNoOptionList", commandMap);
    	
    	if(!dupCartNoOptionList.isEmpty()){
    		for(Map<String, Object> cart : dupCartNoOptionList){
    			String MEM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("MEM_CRT_SHP_MST_IDX"));//겟잇나우 상점 idx
    			int RECENT_MEM_CRT_IDX = StringUtil.getInt(cart.get("RECENT_MEM_CRT_IDX"));//최근 장바구니 IDX
    			if(RECENT_MEM_CRT_IDX == StringUtil.getInt(cart.get("MEM_CRT_IDX"))){//최근 장바구니인 경우 수량 UPDATE
    				if("".equals(MEM_CRT_SHP_MST_IDX)){//겟잇나우 아닌 경우에만 update
    					this.defaultDAO.update("PcCart.updateDupCartNoOptionCnt", cart);
    				}
    			}else{//최근 장바구니 아닌 경우 DELETE
    				this.defaultDAO.delete("PcCart.deleteDupCartNoOption", cart);
    			}
    		}
    	}
    	
    	//장바구니 개수 30개 넘는 경우 오래된 상품부터 삭제
    	List<Map<String, Object>> cartCntOverPrdList = this.defaultDAO.selectList("PcCart.selectCartCntOverPrdList", commandMap);
    	if(!cartCntOverPrdList.isEmpty()){
    		List<String> OLD_MEM_CRT_IDXs = new ArrayList<String>();
    		for(Map<String, Object> cart : cartCntOverPrdList){
    			OLD_MEM_CRT_IDXs.add(StringUtil.getString(cart.get("MEM_CRT_IDX")));
    		}
    		Map<String, Object> dataMap = new HashMap<String, Object>();
    		dataMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
    		dataMap.put("MEM_CRT_SES_ID", commandMap.get("MEM_CRT_SES_ID"));
    		dataMap.put("MEM_CRT_IDXs", OLD_MEM_CRT_IDXs);
    		this.defaultDAO.delete("PcCart.deleteCart", dataMap);
    	}
    }
    
    
}
