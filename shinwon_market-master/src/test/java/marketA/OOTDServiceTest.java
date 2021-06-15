package marketA;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;

import java.util.HashMap;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.model.ootd.OOTD_MODEL;
import com.market.mall.pc.mypage.service.MyShoppingService;
import com.market.mall.pc.ootd.service.OOTDCommentService;
import com.market.mall.pc.ootd.service.OOTDService;

@ContextConfiguration(locations = { 
		"file:src/main/webapp/WEB-INF/config/dispatcher-servlet.xml",
		"file:src/main/resources/egovframework/spring/context-aspect.xml",
		"file:src/main/resources/egovframework/spring/context-common.xml",
		"file:src/main/resources/egovframework/spring/context-datasource.xml",
		"file:src/main/resources/egovframework/spring/context-properties.xml",
		"file:src/main/resources/egovframework/spring/context-sqlMap.xml",
		"file:src/main/resources/egovframework/spring/context-transaction.xml"
		})
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class OOTDServiceTest {
    
    @Autowired
    OOTDService ootdService;
    
    @Autowired
    MyShoppingService pcMyShoppingService;

    @Autowired
    OOTDCommentService ootdCommentService;
    
    @Test
    public void testInsertImageData() throws Exception {
        
    }
    //ootd 정보 등록 성공
    @Test
    public void testInsertOOTDData() throws Exception {
        
//        Map<String, Object> commandMap = new HashMap<String, Object>();
//        String title = "바쁜벌꿀벌";
//        commandMap.put(OOTD_MODEL.CNT_OTD_TITLE, title);
//        commandMap.put(OOTD_MODEL.CNT_OTD_CONTENT, "busyhoneybee");
//        commandMap.put(OOTD_MODEL.REG_ID, "hyewon");
//                
//        String id = ootdService.insertOOTDData(commandMap);
//        
//        commandMap.put(OOTD_MODEL.CNT_OTD_ID, id);
//        Map<String, Object> result = ootdService.selectOOTDData(commandMap);
//        
//        assertEquals(result.get(OOTD_MODEL.CNT_OTD_TITLE).toString(), title);
//        assertEquals(result.get(OOTD_MODEL.CNT_OTD_ID).toString(), id);
//        
//        ootdService.deletOOTDData(commandMap);
    }
    
    //ootd 정보 수정 성공
    @Test
    public void testUpdateMyOOTDData() throws Exception {
        
//        Map<String, Object> commandMap = new HashMap<String, Object>();
//        String title = "바쁜벌꿀벌";
//        commandMap.put(OOTD_MODEL.CNT_OTD_TITLE, title);
//        commandMap.put(OOTD_MODEL.CNT_OTD_CONTENT, "busyhoneybee");
//        commandMap.put(OOTD_MODEL.REG_ID, "hyewon");
//                
//        String id = ootdService.insertOOTDData(commandMap);
//        
//        Map<String, Object> selectParam = new HashMap<String, Object>();
//        selectParam.put(OOTD_MODEL.CNT_OTD_ID, id);
//        
//        Map<String, Object> old_result = ootdService.selectOOTDData(selectParam);
//        String oldTitle = old_result.get(OOTD_MODEL.CNT_OTD_TITLE)+"";
//        
//        assertEquals(title, oldTitle);
//        String newTitle = "혼자도망감";
//        
//        selectParam.put(OOTD_MODEL.CNT_OTD_STATUS, STATUS_CODE.UNUSED);
//        selectParam.put(OOTD_MODEL.CNT_OTD_TITLE, newTitle);
//        int result = ootdService.updateMyOOTDData(selectParam);
//        
//        Map<String, Object> newOOTDData = ootdService.selectOOTDData(selectParam);
//        
//        String selectedNewTitle = newOOTDData.get(OOTD_MODEL.CNT_OTD_TITLE)+"";
//        
//        assertEquals(newTitle, selectedNewTitle);

    }
    
    @Test
    public void testUpdateMyOOTDProduct() throws Exception {
//        Map<String, Object> commandMap = new HashMap<String, Object>();
//        commandMap.put(key, value)
//        int result = ootdService.updateMyOOTDProduct(commandMap);
    }
    
    @Test
    public void testSelectOOTDData() throws Exception {

    }
    
    @Test
    public void testSelectMyOOTDProductList() throws Exception {

    }
    
    @Test
    public void testSelectMyOOTDImageList() throws Exception {

    }
    
    @Test
    public void testSelectOOTDLikeCount() throws Exception {

    }
    

    


}
