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
//import com.market.mall.pc.tag.data.TagData;
//import com.market.mall.pc.tag.service.TagService;
//
//public class TagServiceTest {
//    @Autowired
//    TagService service;
//    
//    @Test
//    public void testCreateTagContent() {
//        
//        Map<String,Object> testData = new HashMap<String, Object>();
//        
//        List<String> tagLists = new ArrayList<String>();
//        
//        tagLists.add("#one");
//        tagLists.add("#two");
//        tagLists.add("#three");
//
//        testData.put(TagData.PARAM_TAG_LIST, tagLists);
//        
//        String result = service.createTagContentList(testData);
//        
//        assertEquals("300", result);
//        
//    }
//
//}
