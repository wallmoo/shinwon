package com.market.mall.model.ootd;

import java.util.Map;

import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.model.COMMON_MODEL;

public class OOTD_MODEL extends COMMON_MODEL{
    
    public final static String CNT_OTD_ID = "CNT_OTD_ID";
    public final static String CNT_OTD_TITLE = "CNT_OTD_TITLE";//max 50자
    public final static String CNT_OTD_CONTENT = "CNT_OTD_CONTENT";//max 200자
    public final static String CNT_OTD_STATUS = "CNT_OTD_STATUS";
    
    public static int insertValidate(Map<String, Object> param){
        
        String title = param.get(CNT_OTD_TITLE).toString();
        String contents = param.get(CNT_OTD_CONTENT).toString();
        
        if(title == null || contents == null || title.isEmpty() || contents.isEmpty() || title.length() > 50 || contents.length() > 200){
            return VALIDATE_CODE.FAIL;
        }
        return VALIDATE_CODE.SUCCESS;
    }
    
    public static int insertImageValidate(Map<String, Object> param){
        return VALIDATE_CODE.SUCCESS;
    }

    public static int insertOOTDProduct(Map<String, Object> param){
        return VALIDATE_CODE.SUCCESS;
    }
    
}
