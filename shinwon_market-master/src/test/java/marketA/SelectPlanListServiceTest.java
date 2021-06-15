package marketA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import static org.junit.Assert.*;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.market.mall.pc.event.service.PlanService;

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
public class SelectPlanListServiceTest {
    
    @Resource(name="pcPlanService")
    PlanService pcPlanService;

    //태그 등록 성공
    @Test
    public void testSelectPlanList() throws Exception {

//        Map<String, Object> commandMap = new HashMap<String, Object>();
//        
//        commandMap.put("searchPlnMstShopType", "Y");        //PC용 기획전
//        commandMap.put("CMM_FLE_TB_NM", "T_PLN_MST");       //PC용 이미지
//        commandMap.put("CMM_FLE_TB_TYPE", "P");             //PC용 이미지
//        commandMap.put("CMM_FLE_SORT", "1");
//        
//        commandMap.put("searchPlnMstStatus", "ing");
//        commandMap.put("cPage", 1);
//        commandMap.put("searchPlnMstCtg", "");
//        
//        List<Map<String, Object>> list = pcPlanService.selectPlanList(commandMap);
//        boolean result = (list != null && list.size()>0); 
//        assertTrue(result);
    }    

}
