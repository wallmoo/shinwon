package marketA;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.common.constants.STATUS_CODE;
import com.market.mall.common.constants.schema.T_TAG_MST;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.pc.tag.service.TagService;
import com.market.mall.pc.tag.service.WishTagService;

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
public class TagServiceTest {
    
    @Autowired
    TagService tagService;

    //태그 등록 성공
    @Test
    public void testInsertTag() throws Exception {

        Map<String, Object> commandMap = new HashMap<String, Object>();

        String randomStr = "asdlka혜sdjhfd원ksjhfskajf짱oweds";

        commandMap.put(TAG_MODEL.TAG_MST_TITLE, randomStr);
        commandMap.put(TAG_MODEL.REG_ID, "busyhoney");
        commandMap.put(TAG_MODEL.TAG_MST_STATUS, STATUS_CODE.USE);
        
        String result = tagService.insertTag(commandMap);
       
        Map<String, Object> selectParam = new HashMap<String, Object>();
        selectParam.put(TAG_MODEL.TAG_MST_ID, result);
        
        Map<String,Object> selectResult = tagService.selectTagById(selectParam);
        String title = selectResult.get(TAG_MODEL.TAG_MST_TITLE)+"";
       
        Map<String, Object> deleteParam = new HashMap<String, Object>();
        deleteParam.put(TAG_MODEL.TAG_MST_ID, result);
        tagService.deleteTagById(deleteParam);
        
        assertEquals(title, randomStr);
    }
    
    @Test
    public void testSelectTagList() throws Exception {
        List<Map<String, Object>> result = tagService.selectTagList();
        for(int index = 0; index < result.size(); index++){
            String status = result.get(index).get(TAG_MODEL.TAG_MST_STATUS).toString();
            assertEquals(STATUS_CODE.USE.toString(), status);
        }
    }
    
    //태그 상태 변경 성공
    @Test
    public void testUpdateTagInfo() throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
        commandMap.put(TAG_MODEL.TAG_MST_ID, "de05963e-19bf-4357-b7f2-17dcbc53a6a4");
        commandMap.put(TAG_MODEL.TAG_MST_STATUS, STATUS_CODE.UNUSED);
        
        String result = tagService.updateTagInfo(commandMap);
        
        //assertEquals(1, result);
    }
    

}
