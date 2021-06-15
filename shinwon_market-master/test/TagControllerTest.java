//package com.market.mall.pc.ootd.test;
//
//import static org.junit.Assert.*;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.UUID;
//
//import org.junit.Test;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.web.servlet.MockMvc;
//
//import com.market.mall.pc.ootd.data.OOTDContentData;
//import com.market.mall.pc.ootd.service.OOTDService;
//import com.market.mall.pc.tag.controller.TagController;
//import com.market.mall.pc.tag.data.TagData;
//import com.market.mall.pc.tag.service.TagService;
//import com.market.mall.common.SessionsUser;
//import com.market.mall.model.User;
//
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration(locations = {
//        "file:src/main/resources/egovframework/spring/context-*.xml"
//})
//@WebAppConfiguration
//public class TagControllerTest {
//    
//    @Mock
//    private TagService tagSerivce;
//    
//    @InjectMocks
//    private TagController tagController;
//
//    private Logger logger = LoggerFactory.getLogger(this.getClass());
//    
//    private MockMvc mockmvc;
//    private Map<String, Object> commandMap;
//    public MockHttpSession session;
//    public MockHttpServletRequest request;
//    
//    @Before
//    public void setup() throws Exception {
//        request = new MockHttpServletRequest();
//        commandMap = new HashMap<String, Object>();
//        
//        mockmvc = MockMvcBuilders.standaloneSetup(tagController).build();
//        logger.debug("setup TagController mockMvc...");
//    }
//    
//    public void testRegistTagAjax() {
//
//        @Test
//        public void testRegistTagAjaxCorrectCase() throws Exception {
//            //Correct Case
//            commandMap.clear();
//            commandMap.put("id", UUID.randomUUID().toString());
//            commandMap.put("tag", "태그");
//            
//            given(this.tagController.registTagAjax(request, commandMap))
//                .willReturn("tagId");
//            
//            this.mockmvc.perform(post("/pc/tag/registAjax.do")
//                .andExcept(status().isOk())
//                .andDo(print());
//        }
//        @Test
//        public void testRegistTagAjaxIncorrectCaseWithOutTag() throws Exception {
//            //Correct Case
//            commandMap.clear();
//            commandMap.put("id", UUID.randomUUID().toString());
//            
//            given(this.tagController.registTagAjax(request, commandMap))
//                .willReturn("tagId");
//            
//            this.mockmvc.perform(post("/pc/tag/registAjax.do")
//                .andExcept(status()=="틀린Status")
//                .andDo(print());
//        }
//        @Test
//        public void testsetTagRepresentationAjax() throws Exception {
//            JSON result = new JSON();
//            result = this.tagController.setTagRepresentationAjax(request, commandMap);
//            assertEquals("200", result);
//        }
//        
//        @Test
//        public void testSetTagStatusAjax() throws Exception {
//            JSON result = new JSON();
//            result = this.tagController.setTagStatusAjax(request, commandMap);
//            assertEquals("200", result);
//        }
//    }
//    
//}
