package marketA;

import static org.junit.Assert.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.am.board.service.OotdBoardService;
import com.market.mall.common.constants.params.PARAM_CONST;
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
public class OOTDBoardServiceTest {
    
    @Resource(name="ootdBoardService") private OotdBoardService ootdBoardService;
    
    //status 검색조건 성공
    @Test
    public void testSelectOOTDListByUserId() throws Exception {
//        Map<String, Object> commandMap = new HashMap<String, Object>();
//        
//        String searchStatus = "USE";
//        String searchID = "hyewon";
//        String searchTitle = "바쁜";
//        
//        commandMap.put(PARAM_CONST.SEARCH_KEYWORD, searchTitle);
//        commandMap.put(PARAM_CONST.SEARCH_ID, searchID);
//        
//        commandMap.put(PARAM_CONST.START_NUM, 1);
//        commandMap.put(PARAM_CONST.END_NUM, 20);
//        
//        List<Map<String, Object>> ootdList = ootdBoardService.selectOOTDBoardList(commandMap);
//    
//        for(int index=0; index < ootdList.size(); index++){
//            
//            String resultStatus = ootdList.get(index).get(OOTD_MODEL.CNT_OTD_STATUS).toString();
//            assertEquals(searchStatus, resultStatus);
//        }
    }
    



    


}
