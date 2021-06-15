package marketA;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.common.constants.params.PARAM_WSH_TAG_CONST;
import com.market.mall.dao.CommonDefaultDAO;
import com.market.mall.model.tag.TAG_MODEL;
import com.market.mall.model.tag.WSH_TAG_MODEL;
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
public class WishTagServiceTest {
    
    @Autowired
    WishTagService wishTagService;
    
    @Resource(name="defaultDAO") private CommonDefaultDAO defaultDAO;
    
    @Test
    public void testInsertWishtTagData4Title() throws Exception {
        HashMap param = new HashMap<String,Object>();
        String testTitle = "#희망태그 테스트";
        param.put(WSH_TAG_MODEL.WSH_TAG_TITLE, testTitle);

        String id = wishTagService.insertWishTagData(param);
        
        HashMap selectParam = new HashMap<String, Object>();
        selectParam.put(WSH_TAG_MODEL.WSH_TAG_ID, id);
        Map<String, Object> result = wishTagService.selectWishTagDataById(selectParam);
        
        assertEquals(result.get(WSH_TAG_MODEL.WSH_TAG_TITLE).toString(), testTitle);
        
        defaultDAO.delete("WishTag.deleteWishTag",selectParam);
        
    }
    
    @Test
    public void testSelectWishTagList() throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
        
        String searchTitle = "비누향";
        commandMap.put("searchType", "S_TITLE");
        commandMap.put("searchKeyword", searchTitle);
        
        List<Map<String, Object>> result = wishTagService.selectWishTagList(commandMap);
        
        for(int index = 0; index < result.size(); index++){
            String testTitle = result.get(index).get("TAG_LIST").toString();
            assertTrue(testTitle.contains(searchTitle));
        }
    }
    
    //희망태그 리스트 등록 성공
    @Test
    public void testInsertWithTagList() throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
        Map<String, Object> expectedList = null;
        
        String reg_id = "hyewon";
        commandMap.put(WSH_TAG_MODEL.REG_ID, reg_id);
        List<String> testTitleList = new ArrayList<String>();
        testTitleList.add("희망한다");
        testTitleList.add("좋은 태그를");
        testTitleList.add("테스트가");
        testTitleList.add("잘되길");
        commandMap.put(PARAM_WSH_TAG_CONST.WSH_TAG_TITLE_LIST, testTitleList);
        
        List<String> testList = wishTagService.insertWithTagList(commandMap);
        
        for(int index = 0; index < testList.size(); index++){
            
            Map<String, Object> selectParam = new HashMap<String, Object>();
            
            String id = testList.get(index);
            selectParam.put(WSH_TAG_MODEL.WSH_TAG_ID, id);
            expectedList = wishTagService.selectWishTagDataById(selectParam);
            
            assertEquals(expectedList.get(WSH_TAG_MODEL.WSH_TAG_ID), id);
            
            defaultDAO.delete("WishTag.deleteWishTag",selectParam);
        }

    }

}
