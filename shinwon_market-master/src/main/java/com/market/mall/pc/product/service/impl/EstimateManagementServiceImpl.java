package com.market.mall.pc.product.service.impl;

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
import com.ibm.icu.math.BigDecimal;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.Code;
import com.market.mall.model.User;
import com.market.mall.pc.product.service.EstimateManagementService;

@Service("pcEstimateManagementService")
public class EstimateManagementServiceImpl implements EstimateManagementService{
	
	@Resource(name="defaultDAO") 
    private CommonDefaultDAO defaultDAO;

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public int selectMyEstimateKeepingListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEstimateManagement.selectMyEstimateKeepingListCount", commandMap);
	}

	public List selectMyEstimateKeepingList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEstimateManagement.selectMyEstimateKeepingList", commandMap);
	}

	public int selectMyEstimateCartListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEstimateManagement.selectMyEstimateCartListCount", commandMap);
	}

	public List selectMyEstimateCartList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEstimateManagement.selectMyEstimateCartList", commandMap);
	}

	public int selectMyEstimateCateListCount(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEstimateManagement.selectMyEstimateCateListCount", commandMap);
	}

	public List selectMyEstimateCateList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEstimateManagement.selectMyEstimateCateList", commandMap);
	}
	
	@SuppressWarnings("unchecked")
	public int insertEsmCart(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

		// prepare parameter for SQL
		User user 			= (User)commandMap.get("user");
		String remote_addr 	= StringUtil.getString(commandMap.get("remote_addr"),""); 
		String session_id 	= StringUtil.getString(commandMap.get("session_id"),""); 
		commandMap.put("MEM_MST_MEM_ID", user.getMEM_MST_MEM_ID());
		commandMap.put("MEM_CRT_REG_IP", remote_addr);
		
		
		// ????????????
		int MEM_CRT_DLV_GBN = StringUtil.getInt(commandMap.get("MEM_CRT_DLV_GBN"));
		
		// ?????? ?????? ??????
		List<String> OPT_DTL_IDXs = (List<String>) commandMap.get("OPT_DTL_IDXs");
		String MEM_CRT_UP_IDX = StringUtil.getString(commandMap.get("ESM_CRT_UP_IDX"),"");
		for(String OPT_DTL_IDX : OPT_DTL_IDXs){
			Map<String,Object> simplePrdInfo = this.defaultDAO.select("PcCart.selectSimplePrdInfo", commandMap);
			if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_GET_IT_NOW_CD){//??????????????? ??????
				String PRD_MST_O2O_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_O2O_YN"));
				if(!"Y".equals(PRD_MST_O2O_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] ???????????? ?????? ?????? ???????????? ???????????? ?????? ?????? ?????? ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_SERVICE_CD){//???????????? ??????
				String PRD_MST_IVB_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_IVB_YN"));
				if(!"Y".equals(PRD_MST_IVB_YN)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] ????????? ?????? ?????? ????????? ?????? ?????? ?????? ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}else if(MEM_CRT_DLV_GBN == Code.CART_DLV_GBN_LONG_INS_CD){//??????????????? ??????
				String LNG_DIV_MNT = "";
				String MEM_CRT_LNG_DIV = StringUtil.getString(commandMap.get("MEM_CRT_LNG_DIV"));
				if("24".equals(MEM_CRT_LNG_DIV)){//24????????? ??????
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT1"));
				}else if("36".equals(MEM_CRT_LNG_DIV)){//36????????? ??????
					LNG_DIV_MNT = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_MNT2"));
				}
				String PRD_MST_LNG_DIV_YN = StringUtil.getString(simplePrdInfo.get("PRD_MST_LNG_DIV_YN"));
				if(!"Y".equals(PRD_MST_LNG_DIV_YN) || !MEM_CRT_LNG_DIV.equals(LNG_DIV_MNT)){
					logger.error("##################### PRD_MST_CD ["+ StringUtil.getString(commandMap.get("PRD_MST_CD")) +"] ???????????? ?????? ?????? ???????????? ?????? ?????? ?????? ############################");
					result = -1;
					TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
					break;
				}
			}
			
			String PRD_OPT_EST_YN = "";
			String PRD_OPT_CNT_YN = "";
			
//			System.out.println("OPT_DTL_IDX::::>" + OPT_DTL_IDX);
			
			commandMap.put("OPT_DTL_IDX", OPT_DTL_IDX);
			
			if("0".equals(OPT_DTL_IDX)){
				PRD_OPT_EST_YN = "Y";
				PRD_OPT_CNT_YN = "Y";
			}else{
				//?????? ?????? ??????
				Map<String, Object> optionDetailInfo = this.defaultDAO.select("PcCart.selectOptionDetailInfo", commandMap);
				PRD_OPT_EST_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_EST_YN"));//?????? ?????? ??????
				PRD_OPT_CNT_YN = StringUtil.getString(optionDetailInfo.get("PRD_OPT_CNT_YN"));//?????? ?????? ??????
			}
			
			commandMap.put("MEM_CRT_SLT_YN", "Y".equals(PRD_OPT_EST_YN) ? "N" : "Y");
//			commandMap.put("ESM_CRT_UP_IDX", "N".equals(PRD_OPT_EST_YN) ? MEM_CRT_UP_IDX : "" ); //?????? ????????? ???????????? ????????????.
			commandMap.put("MEM_PRD_OPT_DTL_IDX", OPT_DTL_IDX);
			commandMap.put("MEM_PRD_MST_CD", StringUtil.getString(commandMap.get("PRD_MST_CD")));
			commandMap.put("MEM_CRT_CNT", "N".equals(PRD_OPT_CNT_YN) ? "1" : StringUtil.getString(commandMap.get("REQUEST_CNT_"+OPT_DTL_IDX),""));
			commandMap.put("MEM_CRT_LNG_DIV", StringUtil.getString(commandMap.get("MEM_CRT_LNG_DIV")));//???????????? ??????
			
//			System.out.println("commandMap:::::::::>" + commandMap);
			
			if("N".equals(PRD_OPT_EST_YN) && !"0".equals(OPT_DTL_IDX)){
				commandMap.put("ESM_CRT_UP_IDX", defaultDAO.selectStr("pcEstimateManagement.getEsmCrtupIdx", commandMap));
			}else{
				commandMap.put("ESM_CRT_UP_IDX", "");
			}
			
			result = this.defaultDAO.insert("pcEstimateManagement.insertEsmCart", commandMap);
			
			// ??????????????? ?????? ?????????????????? idx??? ????????????.
//			if("Y".equals(PRD_OPT_EST_YN)){
//				MEM_CRT_UP_IDX = String.valueOf(result);
//			}
		}
		
		if(result > 0){
			// ?????? ?????? ??????
			this.updateDupCart(commandMap);
		}
		
		return result;
	}
	

    @SuppressWarnings("unchecked")
	public void updateDupCart(Map<String, Object> commandMap) throws Exception {
//    	?????? ?????? ?????? ????????? ????????????
    	List<Map<String, Object>> dupCartOptionList = this.defaultDAO.selectList("pcEstimateManagement.selectEsmCartDupOptionList", commandMap);
    	
    	if(!dupCartOptionList.isEmpty()){
    		int PRE_MEM_CRT_UP_IDX_CNT = 0;
    		for(Map<String, Object> cart : dupCartOptionList){
    			int MEM_CRT_UP_IDX_CNT = StringUtil.getInt(cart.get("ESM_CRT_UP_IDX_CNT"));
    			if(PRE_MEM_CRT_UP_IDX_CNT != MEM_CRT_UP_IDX_CNT){//??? ?????? ?????? ???????????? ????????? ??????.
    				Map<String, Object> dupMap = new HashMap<String, Object>();
    				dupMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
    				dupMap.put("RECENT_ESM_CRT_IDX", cart.get("ESM_CRT_UP_IDX"));
    				
    				// ?????? ???????????? ????????? ????????????
    				List<Map<String, Object>> dupCartOptionSumList = this.defaultDAO.selectList("pcEstimateManagement.selectEsmCartTargetSumList", dupMap);
    				if(!dupCartOptionSumList.isEmpty()){
    					String ESM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("ESM_CRT_SHP_MST_IDX"));//???????????? ?????? idx
    					
    					List<String> delCrtIdxs = new ArrayList<String>();
    					for(Map<String, Object> option : dupCartOptionSumList){
    						dupMap.put("PARENT_SUM_ESM_CRT_IDX", option.get("ESM_CRT_UP_IDX"));//?????? ?????? ?????? ?????? idx
    						dupMap.put("SUM_ESM_CRT_IDX", option.get("ESM_CRT_IDX"));//?????? ?????? ?????? idx
    						
    						//?????? update ?????? ?????? ?????? & ???????????? ?????? ???????????? update
//    						if("Y".equals(option.get("PRD_OPT_CNT_YN")) && "".equals(ESM_CRT_SHP_MST_IDX)){
    						this.defaultDAO.update("pcEstimateManagement.updateDupEsmCartOptionCnt", dupMap);//?????? ????????????
//    						}
    						
    						delCrtIdxs.add(StringUtil.getString(option.get("ESM_CRT_IDX")));
    					}
    					
    					//?????? ?????? ?????? update
    					//?????? update ?????? ?????? ?????? & ???????????? ?????? ???????????? update
//						if("Y".equals(cart.get("PRD_OPT_CNT_YN")) && "".equals(ESM_CRT_SHP_MST_IDX)){
							this.defaultDAO.update("pcEstimateManagement.updateDupEsmCartUpOptionCnt", dupMap);//?????? ?????? ?????? ????????????
//						}
    					
    					delCrtIdxs.add(StringUtil.getString(dupCartOptionSumList.get(0).get("ESM_CRT_UP_IDX")));
    					dupMap.put("delCrtIdxs", delCrtIdxs);
    					// ???????????? ?????? ??????
    					this.defaultDAO.delete("pcEstimateManagement.deleteDupEsmCartOption", dupMap);
    				}
    			}
    			
    			PRE_MEM_CRT_UP_IDX_CNT = MEM_CRT_UP_IDX_CNT;
    		}
    	}
    	
    	//?????? ?????? ?????? ?????? ????????? ????????????
    	List<Map<String, Object>> dupCartNoOptionList = this.defaultDAO.selectList("pcEstimateManagement.selectEsmCartDupNoOptionList", commandMap);
    	
    	if(!dupCartNoOptionList.isEmpty()){
    		for(Map<String, Object> cart : dupCartNoOptionList){
    			String ESM_CRT_SHP_MST_IDX = StringUtil.getString(cart.get("ESM_CRT_SHP_MST_IDX"));//???????????? ?????? idx
    			int RECENT_ESM_CRT_IDX = StringUtil.getInt(dupCartNoOptionList.get(0).get("RECENT_ESM_CRT_IDX"));//?????? ???????????? IDX
    			if(RECENT_ESM_CRT_IDX == StringUtil.getInt(cart.get("ESM_CRT_IDX"))){//?????? ??????????????? ?????? ?????? UPDATE
//    				if("".equals(ESM_CRT_SHP_MST_IDX)){//???????????? ?????? ???????????? update
    					this.defaultDAO.update("pcEstimateManagement.updateDupEsmCartNoOptionCnt", cart);
//    				}
    			}else{//?????? ???????????? ?????? ?????? DELETE
    				this.defaultDAO.delete("pcEstimateManagement.deleteDupEsmCartNoOption", cart);
    			}
    		}
    	}
    	
    	//???????????? ?????? 30??? ?????? ?????? ????????? ???????????? ??????
    	List<Map<String, Object>> cartCntOverPrdList = this.defaultDAO.selectList("pcEstimateManagement.selectEsmCartCntOverPrdList", commandMap);
    	if(!cartCntOverPrdList.isEmpty()){
    		List<String> OLD_MEM_CRT_IDXs = new ArrayList<String>();
    		for(Map<String, Object> cart : cartCntOverPrdList){
    			OLD_MEM_CRT_IDXs.add(StringUtil.getString(cart.get("ESM_CRT_IDX")));
    		}
    		Map<String, Object> dataMap = new HashMap<String, Object>();
    		dataMap.put("MEM_MST_MEM_ID", commandMap.get("MEM_MST_MEM_ID"));
    		dataMap.put("ESM_CRT_IDXs", OLD_MEM_CRT_IDXs);
    		this.defaultDAO.delete("pcEstimateManagement.deleteEsmCart", dataMap);
    	}
    }
	
	public int selectEsmCartCnt(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectCount("pcEstimateManagement.selectEsmCartCnt",commandMap);
	}

	public List selectMyEstimateList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEstimateManagement.selectMyEstimateList", commandMap);
	}

	public int deleteMyEstimateDelAjax(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.delete("pcEstimateManagement.deleteMyEstimateDelAjax", commandMap);
	}

	public List selectEsmCartOptDetailList(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		return defaultDAO.selectList("pcEstimateManagement.selectEsmCartOptDetailList", commandMap);
	}

	public int insertMyEstimateProcess(Map<String, Object> commandMap) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		
		//???????????? ????????????
		String ESM_MST_CD = defaultDAO.selectStr("pcEstimateManagement.selectEstimateManagementMasterCd", commandMap);
		commandMap.put("ESM_MST_CD", 		ESM_MST_CD);
//		commandMap.put("ESM_MST_TYPE", 		"2289"); 			// ?????? ?????? '????????????'
		commandMap.put("ESM_MST_QST_TYPE", 	"1925");			// ???????????? '??????'
		commandMap.put("ESM_MST_ADV_TYPE", 	"1932");			// ?????????????????? '?????????'
		commandMap.put("ESM_MST_OPN_YN", 	"N");				// ???????????? 'N'
		
		result = defaultDAO.insert("pcEstimateManagement.insertMyEstimateProcess", commandMap);
		
		String [] arrPRD_MST_CD = (String[]) commandMap.get("PRD_MST_CDs");
		
//		System.out.println("::::::::>" + arrPRD_MST_CD.length);
		//???????????? ??????
    	if ( arrPRD_MST_CD != null ){
    		for( int i = 0; i < arrPRD_MST_CD.length; i++ ){
    			
    			commandMap.put("PRD_MST_CD", arrPRD_MST_CD[i]);
            	commandMap.put("ESM_PRD_PCH_IDX", -1);
            	commandMap.put("ESM_PRD_MST_IDX", commandMap.get("ESM_MST_IDX"));
        		commandMap.put("ESM_PRD_MST_CD", commandMap.get("ESM_MST_CD"));
        		
        		String ESM_PRD_UP_IDX	= "";
        		
        		// ?????? ????????????
        		List list	= defaultDAO.selectList("pcEstimateManagement.selectEstimateProduct", commandMap);
       		
//        		System.out.println("list.size():::::::>"+list.size());
        		for(int j=0; j < list.size(); j++){
        			HashMap row			=  (HashMap) list.get(j); 
        			
        			String MEM_PRD_MST_CD		= (String) row.get("MEM_PRD_MST_CD");
        			String PRD_OPT_EST_YN		= (String) row.get("PRD_OPT_EST_YN");
        			String GUBUN				= (String) row.get("GUBUN");
        			
        			String PRICE				= String.valueOf(row.get("PRICE"));
        			String MEM_PRD_OPT_DTL_IDX	= String.valueOf(row.get("MEM_PRD_OPT_DTL_IDX"));
        			String ESM_CRT_CNT			= String.valueOf(row.get("ESM_CRT_CNT"));
        			
        			commandMap.put("MEM_PRD_MST_CD", MEM_PRD_MST_CD);
        			commandMap.put("PRICE", PRICE);
        			commandMap.put("GUBUN", GUBUN);
        			commandMap.put("MEM_PRD_OPT_DTL_IDX", MEM_PRD_OPT_DTL_IDX);
        			commandMap.put("ESM_CRT_CNT", ESM_CRT_CNT);
        			commandMap.put("ESM_PRD_UP_IDX", "S".equals(GUBUN) ? ESM_PRD_UP_IDX : "" );

        			result						= defaultDAO.insert("pcEstimateManagement.insertEstimateProduct", commandMap);
        			
//        			System.out.println("result::::>" + result);
//        			System.out.println("GUBUN::::::>" + GUBUN);
        			// ?????? ??????????????? ????????? ?????? ?????? ?????? 
        			if("M".equals(GUBUN)){
        				ESM_PRD_UP_IDX			= String.valueOf(result);
        			}
        		}
        		
        		if(result > 0){
        			result	= defaultDAO.delete("pcEstimateManagement.deleteEstimateProduct", commandMap);
        		}
//            	result 		= defaultDAO.insert("pcEstimateManagement.insertEstimateProduct", commandMap);
            }
        }
    	
    	return result > 0 ? 1 : 0;
	}

}
