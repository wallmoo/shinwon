package marketA;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.am.member.service.OOTDMemberService;
import com.market.mall.common.constants.params.PARAM_CONST;
import com.market.mall.model.Paging;
import com.market.mall.model.ootd.OOTD_MODEL;

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
public class OOTDMemberServiceTest {
    
    @Autowired
    OOTDMemberService ootdMemberService; 
    
    @Test
    public void testSelectOOTDListByUserId() throws Exception {
        Map<String, Object> commandMap = new HashMap<String, Object>();
                
        //Paging paging = new Paging(totalCount, commandMap);
        
        Map<String, Object> param = new HashMap<String, Object>();
        
        String testTitle = "새우";
        String searchType = "S_OOTD_TITLE";
        
        param.put(PARAM_CONST.SEARCH_TYPE, searchType);
        param.put(PARAM_CONST.SEARCH_KEYWORD, testTitle);
        
        param.put(PARAM_CONST.START_NUM, 1);
        param.put(PARAM_CONST.END_NUM, 20);  
        List<Map<String, Object>> result = ootdMemberService.selectOOTDListByUserId(param);
        
        for(int index=0; index < result.size(); index++){
            String title = result.get(index).get(OOTD_MODEL.CNT_OTD_TITLE).toString();
            assertTrue(title.contains(testTitle));            
        }
    }
    



    


}
