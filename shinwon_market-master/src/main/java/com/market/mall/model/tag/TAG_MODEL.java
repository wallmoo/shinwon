package com.market.mall.model.tag;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.market.mall.common.constants.VALIDATE_CODE;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.COMMON_MODEL;

public class TAG_MODEL extends COMMON_MODEL {
    public final static String TAG_MST_ID = "TAG_MST_ID";
    public final static String TAG_MST_TITLE = "TAG_MST_TITLE";
    public final static String TAG_MST_STATUS = "TAG_MST_STATUS";
    
    public final static String TAG_GRP_ID ="TAG_GRP_ID";
    public final static String TAG_GRP_STATUS = "TAG_GRP_STATUS";
    
    public final static String TAG_BND_ID = "TAG_BND_ID";
    public final static String TAG_BND_REP = "TAG_BND_REP";
    public final static String TAG_BND_TYPE = "TAG_BND_TYPE";
    public final static String TAG_BND_STATUS = "TAG_BND_STATUS";
	public static final String TAG_ID_LIST = "TAG_ID_LIST";
    
    public static int insertValidate(Map<String, Object> param){
        if(param.get(TAG_MST_TITLE) == null || param.get(TAG_MST_TITLE).toString().isEmpty()){return VALIDATE_CODE.TAG_REQUIRE_TITLE;}
        return VALIDATE_CODE.SUCCESS;
    }
    
    public static List<String> parse(Map<String, Object> param){
        
        List<String> result = new ArrayList<String>();
        
       // String tagTitleList = param.get(PARAM_CONST.TAG_LIST).toString();
       // String[] parsedTitleList = tagTitleList.trim().split("#");
        
       // for(int index = 0; index < parsedTitleList.length; index++){
       //    if(parsedTitleList[index] != null && !parsedTitleList[index].isEmpty()){
       //         String title = "#"+parsedTitleList[index].trim();
       //         result.add(title);
       //     } 
       // }
        return result;
    }
}
