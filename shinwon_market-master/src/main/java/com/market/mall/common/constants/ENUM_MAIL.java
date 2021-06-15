package com.market.mall.common.constants;

public enum ENUM_MAIL {
    INQUIRY_ANSWER("SWPWSE15"), REFUND_COMPLETE("SWPWSE14"), DELIVERY_START("SWPWSE13")
    , JOINUS_COMPLETE("SWPWSE12"), MEMBER_GRADE_CHANGE("SWPWSE08"), RETURN_REQUEST("SWPWSE04")
    , EXCHANGE_REQUEST("SWPWSE03"), ORDER_CANCLE("SWPWSE02"), ORDER_COMPLETE("SWPWSE01");
     
    final private String value;
     
    public String getValue() {
        return value;
    }
 
    private ENUM_MAIL(String value){
        this.value = value;
    }
}
