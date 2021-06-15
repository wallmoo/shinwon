//package com.market.mall.pc.ootd.test;
//
//import static org.junit.Assert.*;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import com.market.mall.pc.ootd.data.OOTDContentData;
//import com.market.mall.pc.ootd.service.OOTDService;
//
//public class OOTDServiceTest {
//    @Autowired
//    OOTDService service;
//    
//    @Test
//    public void testCreateOOTDContent() {
//        
//        Map<String,Object> testData = new HashMap<String, Object>();
//        testData.put(OOTDContentData.PARAM_OOTD_TITLE, "타이틀 테스트");
//        testData.put(OOTDContentData.PARAM_OOTD_CONTENT, "내용 테스튼");
//        List<String> images = new ArrayList<String>();
//        images.add("i1");
//        images.add("i2");
//        images.add("i3");
//        testData.put(OOTDContentData.PARAM_OOTD_IMAGE_LIST, images);
//        testData.put(OOTDContentData.PARAM_OOTD_TAG_LIST, images);
//        testData.put(OOTDContentData.PARAM_OOTD_PRODUCT_LIST, images);
//        String result = service.createOOTDContent(testData);
//        
//        assertEquals("300", result);
//        
//    }
//
//}
